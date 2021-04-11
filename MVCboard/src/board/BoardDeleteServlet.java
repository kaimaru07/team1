package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/delete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// DELETE FROM board_t WHERE post_id=?
		String post_id = request.getParameter("post_id");
		System.out.println("삭제할 게시글의 post_id 값 : " + post_id);
		
		BoardDAO bdao = new BoardDAO();
		bdao.delete(Integer.parseInt(post_id));
		
		response.sendRedirect(request.getContextPath() + "/board");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
