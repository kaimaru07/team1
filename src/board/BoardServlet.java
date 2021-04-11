package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. BoardDAO를 사용하여 전체 데이터 조회를 위한 객체 생성
		BoardDAO bdao = new BoardDAO();
		
		// 2. ArrayList<BoardVO> 에 전체 조회 데이터 정보를 저장
		ArrayList<BoardVO> datas = bdao.getAll();
		
		// 3. request.setAttribute() 이용하여 웹 페이지에 조회한 데이터를
		// 원하는 구조로 만들 수 있는 JSP에 데이터 전달할 객체 생성
		request.setAttribute("datas", datas);
		
		// 4. RequestDispatcher를 사용하여 3에서 전달할 JSP에 포워드 수행
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/board.jsp");
		dp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
