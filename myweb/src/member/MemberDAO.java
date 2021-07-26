package member;

import java.sql.*;

public class MemberDAO {
	private Connection conn = null; // java와 데이터베이스 연결
	private PreparedStatement pstmt = null;
	private ResultSet res;

	// 기본 생성자에 공통 실행 기능 작성
	public MemberDAO() {
		try {
			// JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.print("JDBC 드라이버 로딩 완료!");

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
	
	// 회원ID, PW를 매개변수로 받아 로그인 동작을 수행하는 메서드
	public int login(String memberID, String memberPW) {
		String sql = "";
		sql += "SELECT memberPW FROM member_t WHERE memberID=?";

		try {
			pstmt = conn.prepareStatement(sql); // sql 쿼리문 대기
			pstmt.setString(1, memberID); // 첫번째 ?에 매개변수로 받은 memberID를 대입
			res = pstmt.executeQuery(); // 쿼리실행 결과를 res에 저장

			if (res.next()) {
				if (res.getString(1).equals(memberPW)) {
					return 1; // 로그인 성공
				} else {
					return 0; // 비밀번호가 틀림
				}
			}
			res.close();
			pstmt.close();
			conn.close();
			return -1; // 아이디 없음
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -2; // 기타 오류
	}
	
	// 회원정보 객체를 매개변수로 받아 회원가입을 진행하는 메서드
	public int join(MemberVO m) {
		String sql = "INSERT INTO member_t values(?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberID());
			pstmt.setString(2, m.getMemberPW());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
