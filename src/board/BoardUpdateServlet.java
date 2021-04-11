package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/update")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String post_id = request.getParameter("post_id");
		System.out.println("수정할 게시글의 post_id 값 : " + post_id);
		
		BoardDAO bdao = new BoardDAO();
		ArrayList<BoardVO> datas = bdao.selectID(Integer.parseInt(post_id));
		
		request.setAttribute("datas", datas);
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/boardupdate.jsp");
		dp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// post_context를 업데이트 시킬거고, id값이 필요함.
		// UPDATE board_t SET post_context=? WHERE post_id=?;
		String post_id = request.getParameter("post_id"); 
		String post_context = request.getParameter("post_context");
		
		BoardDAO bdao = new BoardDAO();
		bdao.update(Integer.parseInt(post_id), post_context);
		
		response.sendRedirect(request.getContextPath() + "/board");
	}

}
