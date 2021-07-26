package reply;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/reply")
public class ReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReplyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 댓글달기 태그를 클릭 시 /reply로 연결되며 post_id를 가져온다
		String post_id = request.getParameter("post_id");
		
		// post_id속성에 전달받은 post_id를 넣어주고 replywrite.jsp로 forward
		request.setAttribute("post_id", post_id);
		
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/replywrite.jsp");
		dp.forward(request, response);
	}

}
