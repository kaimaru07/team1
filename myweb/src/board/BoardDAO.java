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
	
	// 자유 게시판 글을 불러오는 메서드
	public ArrayList<BoardVO> getFreeAll() {
		ArrayList<BoardVO> records = new ArrayList<BoardVO>();

		String sql = "";
		sql += "SELECT * FROM board_t WHERE btype='free' ORDER BY post_id DESC";

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
	
	// 강의후기 게시판 글을 불러오는 메서드
	public ArrayList<BoardVO> getPostscriptAll() {
		ArrayList<BoardVO> records = new ArrayList<BoardVO>();

		String sql = "";
		sql += "SELECT * FROM board_t WHERE btype='postscript' ORDER BY post_id DESC";

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
	
	// 학식메뉴 게시판 글을 불러오는 메서드
	public ArrayList<BoardVO> getMenuAll() {
		ArrayList<BoardVO> records = new ArrayList<BoardVO>();

		String sql = "";
		sql += "SELECT * FROM board_t WHERE btype='menu' ORDER BY post_id DESC";

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
	
	// 장터 게시판 글을 불러오는 메서드
	public ArrayList<BoardVO> getTradeAll() {
		ArrayList<BoardVO> records = new ArrayList<BoardVO>();

		String sql = "";
		sql += "SELECT * FROM board_t WHERE btype='trade' ORDER BY post_id DESC";

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
	
	// 학생 게시판 글을 불러오는 메서드
	public ArrayList<BoardVO> getStudentAll() {
		ArrayList<BoardVO> records = new ArrayList<BoardVO>();

		String sql = "";
		sql += "SELECT * FROM board_t WHERE btype='student' ORDER BY post_id DESC";

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
	
	// 교직원 게시판 글을 불러오는 메서드
	public ArrayList<BoardVO> getStaffAll() {
		ArrayList<BoardVO> records = new ArrayList<BoardVO>();

		String sql = "";
		sql += "SELECT * FROM board_t WHERE btype='staff' ORDER BY post_id DESC";

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
	
	// 친구 게시판 글을 불러오는 메서드
	public ArrayList<BoardVO> getFriendAll() {
		ArrayList<BoardVO> records = new ArrayList<BoardVO>();

		String sql = "";
		sql += "SELECT * FROM board_t WHERE btype='friend' ORDER BY post_id DESC";

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
	
	// 게시판에 글을 작성하는 메서드
	public void saveData(BoardVO bvo) {
		String sql = "";
		sql += "INSERT INTO board_t (post_id, btype, author, title, post_context, create_date, update_date, reply_cnt, view_cnt, like_cnt, dislike_cnt)";
		sql += "	VALUES (board_seq.NEXTVAL, ?, ?, ?, ?, TO_CHAR(SYSDATE + 9/24, 'MM/DD HH24:MI'), TO_CHAR(SYSDATE + 9/24, 'MM/DD HH24:MI'), 0, 0, 0, 0)";
		
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
	
	// 특정 게시글 한 개의 정보를 가져오는 메서드
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
	
	// 게시글 수정 메서드
	public void update(int post_id, String post_context) {
		String sql = "";
		sql += "UPDATE board_t SET post_context=?, update_date=TO_CHAR(SYSDATE + 9/24, 'MM/DD HH24:MI') WHERE post_id=?";

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
	
	// 조회수 증가 메서드
	public void updateview(int post_id) {
		String sql = "UPDATE board_t SET view_cnt = (view_cnt + 1) WHERE post_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_id);
			res = pstmt.executeQuery();
			res.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	// 조회수 감소 메서드
	public void deleteview(int post_id) {
		String sql = "UPDATE board_t SET view_cnt = (view_cnt - 1) WHERE post_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_id);
			res = pstmt.executeQuery();
			res.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	// 댓글 수 증가 메서드
	public void updatereplycnt(int post_id) {
		String sql = "UPDATE board_t SET reply_cnt = (reply_cnt + 1) WHERE post_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_id);
			res = pstmt.executeQuery();
			res.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 좋아요 수 증가 메서드
	public int updatelikecnt(int post_id, String memberID) {
		String sql1 = "INSERT INTO like_t VALUES(?, ?)";
		String sql2 = "UPDATE board_t SET like_cnt = (like_cnt + 1) WHERE post_id=?";

		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, post_id);
			pstmt.setString(2, memberID);
			res = pstmt.executeQuery();

			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, post_id);
			res = pstmt.executeQuery();

			res.close();
			return 1; // 좋아요 성공
		} catch (SQLException e) {
			return 2; // 중복키 오류 발생
		}
	}
	
	// 싫어요 수 증가 메서드
	public int updatedislikecnt(int post_id, String memberID) {
		String sql1 = "INSERT INTO like_t VALUES(?, ?)";
		String sql2 = "UPDATE board_t SET dislike_cnt = (dislike_cnt + 1) WHERE post_id=?";

		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, post_id);
			pstmt.setString(2, memberID);
			res = pstmt.executeQuery();

			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, post_id);
			res = pstmt.executeQuery();

			res.close();
			return 1; // 싫어요 성공
		} catch (SQLException e) {
			return 2; // 중복키 오류 발생
		}
	}

	// 게시글 삭제 메서드
	public void delete(int post_id, String memberID) {
		String sql1 = "DELETE FROM like_t WHERE post_id=?";
		String sql2 = "DELETE FROM reply_t WHERE post_id=?";
		String sql3 = "DELETE FROM board_t WHERE post_id=?";

		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, post_id);
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
