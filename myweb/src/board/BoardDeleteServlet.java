package board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/delete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 삭제버튼 클릭 시 수행
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String memberID = (String)session.getAttribute("memberID");
		String post_id = request.getParameter("post_id");
		String author = request.getParameter("author");
		
		System.out.print("삭제할 게시글의 post_id 값 : " + post_id + "  /  ");
		System.out.print("삭제할 게시글의 author 값 : " + author + "  /  ");
		System.out.println("접속중인 유저 : " + memberID);
		
		// 삭제할 게시글의 author와 현재 접속중인 유저의 memberID를 비교하여 삭제 진행
		if (!author.equals(memberID)) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('본인이 작성한 게시글만 삭제할 수 있습니다.');");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		} else {
			BoardDAO bdao = new BoardDAO();
			bdao.delete(Integer.parseInt(post_id), memberID);

			response.sendRedirect(request.getContextPath() + "/freeboard");
		}
		
	}

}
