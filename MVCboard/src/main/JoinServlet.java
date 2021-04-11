package main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;
import member.MemberVO;

@WebServlet("/join")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 현재 세션 상태를 체크한다
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("memberID"));
		String memberID = null;
		if (session.getAttribute("memberID") != null) {
			memberID = (String) session.getAttribute("memberID");
		}
		// 이미 로그인했으면 회원가입을 할 수 없게 한다
		if (memberID != null) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('접속중인 계정이 있습니다. 세션 만료 후 진행됩니다.'); location.href=''");
			out.println("</script>");
			session.invalidate();
		} else {
			RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/join.jsp");
			dp.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String memberID = request.getParameter("memberID");
		String memberPW = request.getParameter("memberPW");
		
		MemberDAO mdao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		mvo.setMemberID(memberID);
		mvo.setMemberPW(memberPW);
		System.out.println(mvo.getMemberID());
		System.out.println(mvo.getMemberPW());
		
		int result = mdao.join(mvo);
		if(result == -1) {
			out.println("<script>");
			out.println("alert('이미 존재하는 아이디입니다');");
			out.println("history.back()");
			out.println("</script>");
		}else {
			session.setAttribute("memberID", mvo.getMemberID());
			out.println("<script>");
			out.println("alert('회원가입 성공');");
			out.println("location.href='./board'");
			out.println("</script>");
		}
	}

}
