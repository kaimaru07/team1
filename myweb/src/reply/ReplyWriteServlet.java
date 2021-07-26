package reply;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;

@WebServlet("/replywrite")
public class ReplyWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReplyWriteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String post_id = request.getParameter("post_id");
		String reply_author = request.getParameter("reply_author");
		String reply_context = request.getParameter("reply_context");
		String viewflag = request.getParameter("viewflag");
		String real_author = request.getParameter("real_author");
		if (viewflag == null) {
			viewflag = "0";
		}
		int num = Integer.parseInt(viewflag);
		
		ReplyDAO rdao = new ReplyDAO();
		ReplyVO rvo = new ReplyVO(Integer.parseInt(post_id), reply_author, reply_context, real_author);
		
		// reply_t에 현재까지 저장된 ReplyVO rvo의 정보를 입력 (INSERT)
		rdao.saveData(rvo);
		// 해당 post에 댓글이 1개 증가했으므로, reply_cnt를 1 증가 시켜준다.
		BoardDAO bdao = new BoardDAO();
		bdao.updatereplycnt(Integer.parseInt(post_id));
		
		System.out.println("replywrite viewflag : " + num);
		// 댓글 제출 시 새로고침으로 인해 필연적으로 view_cnt가 1 증가해버린다.
		// 따라서 댓글 제출 시 viewflag를 3으로 설정하고,
		// viewflag가 3일 때, view_cnt를 1 낮춰주는 메서드를 만들어 해결한다.
		request.setAttribute("viewflag", num); 
		RequestDispatcher dp = request.getRequestDispatcher("./detail");
		dp.forward(request, response);
	}

}
