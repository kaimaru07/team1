package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/detail")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String post_id = request.getParameter("post_id");
		System.out.println("post_id 값 : " + post_id);
		
		BoardDAO bdao = new BoardDAO();
		ArrayList<BoardVO> datas = bdao.selectID(Integer.parseInt(post_id));
		
		request.setAttribute("datas", datas);
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/boarddetail.jsp");
		dp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
