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

@WebServlet("/update")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 수정버튼 클릭 시 수행
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String post_id = request.getParameter("post_id");
		String author = request.getParameter("author");
		String memberID = (String)session.getAttribute("memberID");
		System.out.print("수정할 게시글의 post_id 값 : " + post_id + "  /  ");
		System.out.print("수정할 게시글의 author 값 : " + author + "  /  ");
		System.out.println("접속중인 유저 : " + memberID);
		
		// 삭제할 게시글의 author와 현재 접속중인 유저의 memberID를 비교하여 수정 진행
		if (!author.equals(memberID)) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('본인이 작성한 게시글만 수정할 수 있습니다.');");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		} else {
			System.out.println("작성자와 현재 접속중인 계정이 동일함");

			BoardDAO bdao = new BoardDAO();
			ArrayList<BoardVO> datas = bdao.selectID(Integer.parseInt(post_id));

			request.setAttribute("datas", datas);
			RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/boardupdate.jsp");
			dp.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String post_id = request.getParameter("post_id"); 
		String post_context = request.getParameter("post_context");
		
		BoardDAO bdao = new BoardDAO();
		ArrayList<BoardVO> datas = bdao.selectID(Integer.parseInt(post_id));
		bdao.update(Integer.parseInt(post_id), post_context);
		
    	for(BoardVO data: datas) {
    		if(data.getBtype().equals("free")) {
    			response.sendRedirect(request.getContextPath() + "/freeboard");
    		} else if(data.getBtype().equals("postscript")) {
    			response.sendRedirect(request.getContextPath() + "/postscriptboard");
    		} else if(data.getBtype().equals("menu")) {
    			response.sendRedirect(request.getContextPath() + "/menuboard");
    		} else if(data.getBtype().equals("trade")) {
    			response.sendRedirect(request.getContextPath() + "/tradeboard");
    		} else if(data.getBtype().equals("student")) {
    			response.sendRedirect(request.getContextPath() + "/studentboard");
    		} else if(data.getBtype().equals("staff")) {
    			response.sendRedirect(request.getContextPath() + "/staffboard");
    		} else if(data.getBtype().equals("friend")) {
    			response.sendRedirect(request.getContextPath() + "/friendboard");
    		}
    	}
    	
	}

}
