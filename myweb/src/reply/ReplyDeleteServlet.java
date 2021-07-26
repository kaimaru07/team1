package reply;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/replydelete")
public class ReplyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReplyDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 어떤 댓글의 삭제 버튼을 클릭 시 동작
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String post_id = request.getParameter("post_id");
		String reply_id = request.getParameter("reply_id");
		String reply_author = request.getParameter("reply_author");
		String real_author = request.getParameter("real_author");
		String memberID = (String)session.getAttribute("memberID");
		
		System.out.print("삭제할 댓글의 post_id : " + post_id + "  /  ");
		System.out.print("reply_id : " + reply_id + "  /  ");
		System.out.print("reply_author : " + reply_author + "  /  ");
		System.out.print("real_author : " + real_author + "  /  ");
		System.out.println("접속중인 유저 : " + memberID);
		
		// 삭제할 댓글의 '닉네임'이 아닌 '실제 작성자(real_author)'와 현재 접속중인 계정을 비교해 삭제 진행
		if (!real_author.equals(memberID)) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('본인이 작성한 댓글만 삭제할 수 있습니다.');");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		} else {
			ReplyDAO rdao = new ReplyDAO();
			rdao.deletereply(Integer.parseInt(post_id), Integer.parseInt(reply_id));
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("window.location=document.referrer");
			out.println("</script>");
			out.close();
		}
	}

}
