package board;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/write")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardWriteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 여기로 get 요청 오면 글작성 jsp로 연결시켜준다.
		// 작성된 내용을 post 받고 저장 처리해준다(saveData)
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/boardwrite.jsp");
		String btype_check = request.getParameter("btype");
		request.setAttribute("btype_check", btype_check);
		dp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String btype = request.getParameter("btype");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String post_context = request.getParameter("post_context");
		
		BoardDAO bdao = new BoardDAO();
		BoardVO bvo = new BoardVO(btype, title, author, post_context);
		
		// 새 글 작성
		bdao.saveData(bvo);
		if(btype.equals("free")) {
			response.sendRedirect(request.getContextPath() + "/freeboard");
		} else if(btype.equals("postscript")) {
			response.sendRedirect(request.getContextPath() + "/postscriptboard");
		} else if(btype.equals("menu")) {
			response.sendRedirect(request.getContextPath() + "/menuboard");
		} else if(btype.equals("trade")) {
			response.sendRedirect(request.getContextPath() + "/tradeboard");
		} else if(btype.equals("student")) {
			response.sendRedirect(request.getContextPath() + "/studentboard");
		} else if(btype.equals("staff")) {
			response.sendRedirect(request.getContextPath() + "/staffboard");
		} else if(btype.equals("friend")) {
			response.sendRedirect(request.getContextPath() + "/friendboard");
		}
	}

}
