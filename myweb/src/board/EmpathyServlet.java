package board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/empathy")
public class EmpathyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EmpathyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 좋아요/싫어요 공감 처리를 담당하는 서블릿
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		String post_id = request.getParameter("post_id");
		String memberID = request.getParameter("memberID");
		String flag = request.getParameter("flag");
		String viewflag = request.getParameter("viewflag");
		if (viewflag == null) {
			viewflag = "0";
		}
		
		BoardDAO bdao = new BoardDAO();
		
		int num = Integer.parseInt(viewflag);
		System.out.println("viewflag : " + viewflag);
		if (num == 3) {
			bdao.deleteview(Integer.parseInt(post_id)); // view_cnt를 1감소시키기 위한 메서드
		}
		
		// 전달받은 flag가 like or dislike냐에 따라 좋아요 or 싫어요 개수 1 증가
		if (flag.equals("like")) {
			System.out.println("flag = like");
			int res = 0;
			res = bdao.updatelikecnt(Integer.parseInt(post_id), memberID);
			
			if (res == 2) {
				out.println("<script>");
				out.println("alert('공감은 게시글 당 한번만 할 수 있습니다.')");
				out.println("</script>");
			}

		} else if (flag.equals("dislike")) {
			System.out.println("flag = dislike");
			int res = 0;
			res = bdao.updatedislikecnt(Integer.parseInt(post_id), memberID);
			
			if (res == 2) {
				out.println("<script>");
				out.println("alert('공감은 게시글 당 한번만 할 수 있습니다.')");
				out.println("</script>");
			}
		}
		
		out.println("<script>");
		out.println("window.location=document.referrer"); // 이전 창으로 돌아가 새로고침
		out.println("</script>");
		out.close();
	}

}
