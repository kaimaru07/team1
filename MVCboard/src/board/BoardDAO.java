package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
	private Connection conn = null; // java와 데이터베이스 연결
	private PreparedStatement pstmt = null;
	private ResultSet res;

	// 기본 생성자에 공통 실행 기능 작성
	public BoardDAO() {
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

	public ArrayList<BoardVO> getAll() {
		ArrayList<BoardVO> records = new ArrayList<BoardVO>();

		String sql = "";
		sql += "SELECT * FROM board_t ORDER BY post_id DESC";

		try {
			pstmt = conn.prepareStatement(sql);
			res = pstmt.executeQuery();
			while (res.next()) {
				BoardVO data = new BoardVO();
				data.setRecord(res);
				records.add(data);
			}
			res.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return records;
	}
	
	public void saveData(BoardVO bvo) {
		String sql = "";
		sql += "INSERT INTO board_t (post_id, btype, author, title, post_context, create_date, update_date, reply_cnt, view_cnt, like_cnt, dislike_cnt)";
		sql += "	VALUES (board_seq.NEXTVAL, ?, ?, ?, ?, SYSDATE, SYSDATE, 0, 0, 0, 0)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getBtype());
			pstmt.setString(2, bvo.getAuthor());
			pstmt.setString(3, bvo.getTitle());
			pstmt.setString(4, bvo.getPost_context());
			res = pstmt.executeQuery();
			res.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<BoardVO> selectID(int post_id) {
		ArrayList<BoardVO> result = new ArrayList<BoardVO>();
		
		String sql = "SELECT * FROM board_t WHERE post_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_id);
			res = pstmt.executeQuery();
			while (res.next()) {
				BoardVO data = new BoardVO();
				data.setRecord(res);
				result.add(data);
			}
			res.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public void update(int post_id, String post_context) {
		String sql = "";
		sql += "UPDATE board_t SET post_context=? WHERE post_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, post_context);
			pstmt.setInt(2, post_id);
			res = pstmt.executeQuery();
			res.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(int post_id) {
		String sql = "";
		sql += "DELETE FROM board_t WHERE post_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_id);
			res = pstmt.executeQuery();
			res.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
