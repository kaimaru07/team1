package main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;

@WebServlet("")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    	
    public MainServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/login.jsp");
		dp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String memberID = request.getParameter("memberID");
		String memberPW = request.getParameter("memberPW");
		String remember = request.getParameter("remember");
		
		Cookie[] cookies = request.getCookies();
		
		// 기억하기 체크 박스가 체크되어 있는 경우 아이디 정보를 저장하는 쿠키 생성
		if (remember != null) {
			Cookie cookie = new Cookie("memberID", memberID);
			cookie.setMaxAge(60 * 60 * 24); // 만료시간 24 시간으로 설정
			response.addCookie(cookie);
		} else { // 기억하기 체크 박스가 해제되어 있는 경우 기존 아이디 정보를 저장한 쿠키 만료시간을 0 으로 설정
			for (Cookie c : cookies) {
				if (c.getName().equals("memberID")) {
					c.setMaxAge(0);
					response.addCookie(c);
					break;
				}
			}
		}	
		
		MemberDAO mdao = new MemberDAO();
		int result = mdao.login(memberID, memberPW);
		if (result == 1) { // 로그인 성공
			session.setAttribute("memberID", memberID); // 로그인 성공 시 세션 부여 코드
			out.println("<script>");
			out.println("alert('로그인 성공'); location.href='./freeboard'");
			out.println("</script>");
		} else if (result == 0) { // 비밀번호가 틀림
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다.'); history.back()");
			out.println("</script>");
		} else if (result == -1) { // 아이디 없음
			out.println("<script>");
			out.println("alert('아이디를 확인하세요.'); history.back()");
			out.println("</script>");
		} else if (result == -2) { // 기타 오류
			out.println("<script>");
			out.println("alert('DB 오류'); history.back()");
			out.println("</script>");
		}
		out.close();
		
	}

}
