package board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/freeboard")
public class FreeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FreeBoardServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		// 로그인 하지 않은 상태로 게시판에 주소를 입력해 접근할 때 방지
		// 현재 세션 상태를 체크한다
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("memberID"));
		String memberID = null;
		if (session.getAttribute("memberID") != null) {
			memberID = (String) session.getAttribute("memberID");
		}
		// 로그인 되지 않았을경우(memberID == null) 로그인 페이지로 이동
		PrintWriter out = response.getWriter();
		
		if (memberID == null) {
			out.println("<script>");
			out.println("alert('로그인 후 이용할 수 있습니다.');");
			out.println("location.href='./'");
			out.println("</script>");
			out.close();
		} else {
			// ------------ 이 아래로 게시글 목록 기능 ------------
			// 1. BoardDAO를 사용하여 전체 데이터 조회를 위한 객체 생성
			BoardDAO bdao = new BoardDAO();
			
			// 2. ArrayList<BoardVO> 에 전체 조회 데이터 정보를 저장
			ArrayList<BoardVO> datas = bdao.getFreeAll();
			
			// 3. request.setAttribute() 이용하여 웹 페이지에 조회한 데이터를
			// 원하는 구조로 만들 수 있는 JSP에 데이터 전달할 객체 생성
			String btype_check = "free";
			request.setAttribute("btype_check", btype_check);
			request.setAttribute("datas", datas);
			
			// 4. RequestDispatcher를 사용하여 3에서 전달할 JSP에 포워드 수행
			RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/board.jsp");
			dp.forward(request, response);
			
		}
	}

}
