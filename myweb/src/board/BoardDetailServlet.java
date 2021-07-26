package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import reply.ReplyDAO;
import reply.ReplyVO;
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
		
		// viewflag : 댓글 작성 or 좋아요/싫어요 클릭 시 무분별하게 조회수가 증가하는 현상을 해소하기 위한 flag
		String viewflag = request.getParameter("viewflag");
		if (viewflag == null) {
			viewflag = "0";
		}
		
		int num = Integer.parseInt(viewflag);
		System.out.println("viewflag : " + viewflag);
		if (num == 1) {
			// viewflag = 1 -> 조회수 1 증가(updateview())
			bdao.updateview(Integer.parseInt(post_id));
		} else if (num == 3) {
			// viewflag = 3 -> 조회수 1 감소(deleteview())
			bdao.deleteview(Integer.parseInt(post_id));
		}
		
		ArrayList<BoardVO> datas = bdao.selectID(Integer.parseInt(post_id));
		String btype_check = datas.get(0).getBtype();
		request.setAttribute("btype_check", btype_check);
		
		ReplyDAO rdao = new ReplyDAO();
		ArrayList<ReplyVO> rdatas = rdao.getAll(Integer.parseInt(post_id));
		
		request.setAttribute("datas", datas);
		request.setAttribute("rdatas", rdatas);
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/boarddetail.jsp");
		dp.forward(request, response);
	}

}
