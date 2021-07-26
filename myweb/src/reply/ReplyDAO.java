package reply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReplyDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet res;
	
	// 기본 생성자에 공통 실행 기능 작성
	public ReplyDAO() {
		try {
			// JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.print("JDBC 드라이버 로딩 완료! ");

			// 접속 정보 작성
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "web_admin";
			String password = "admin";

			// DB 접속 객체 생성 및 접속 시도
			this.conn = DriverManager.getConnection(url, user, password);
			System.out.println("Oracle DB 접속 완료!");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 작성된 댓글을 DB에 저장하는 메서드
	public void saveData(ReplyVO rvo) {
		String sql = "";
		sql += "INSERT INTO reply_t (reply_id, post_id, reply_author, reply_context, reply_date, real_author)";
		sql += "	VALUES (reply_seq.NEXTVAL, ?, ?, ?, SYSDATE, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rvo.getPost_id());
			pstmt.setString(2, rvo.getReply_author());
			pstmt.setString(3, rvo.getReply_context());
			pstmt.setString(4, rvo.getReal_author());
			res = pstmt.executeQuery();
			res.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 특정 게시글에 작성된 댓글들을 DB에서 불러오기 위한 메서드
	public ArrayList<ReplyVO> getAll(int post_id) {
		ArrayList<ReplyVO> records = new ArrayList<ReplyVO>();
		
		String sql = "SELECT * FROM reply_t WHERE post_id=? ORDER BY reply_id DESC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_id);
			res = pstmt.executeQuery();
			while(res.next()) {
				ReplyVO data = new ReplyVO();
				data.setRecord(res);
				records.add(data);
			}
			res.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return records;
	}
	
	// 댓글을 삭제하는 메서드
	public void deletereply(int post_id, int reply_id) {
		String sql1 = "DELETE FROM reply_t WHERE post_id=? AND reply_id=?";
		String sql2 = "UPDATE board_t SET reply_cnt = (reply_cnt - 1) WHERE post_id=?";
		String sql3 = "UPDATE board_t SET view_cnt = (view_cnt -1) WHERE post_id=?";

		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, post_id);
			pstmt.setInt(2, reply_id);
			res = pstmt.executeQuery();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, post_id);
			res = pstmt.executeQuery();
			
			pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, post_id);
			res = pstmt.executeQuery();
			
			res.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
