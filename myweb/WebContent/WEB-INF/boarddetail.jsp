<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardVO, reply.ReplyVO, java.util.ArrayList" %>
<% String btype_check = request.getAttribute("btype_check").toString(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 조회</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/detail.css">
</head>
<body>
    <div class="width">
        <header>
        <% if(btype_check.equals("free")) { %>
            <section class="headersection1">
                <span class="middle"><a href="./freeboard"><img class="logo" src="<%=request.getContextPath() + "/image/everytimelogo.png" %>" alt="경로확인"></a></span>
                <span class="active middle"><a href="<%=request.getContextPath() %>/freeboard">자유게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/postscriptboard">강의후기</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/menuboard">학식메뉴</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/tradeboard">장터게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/studentboard">학생게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/staffboard">교직원게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/friendboard">친구</a></span>
            </section>
        <% } else if(btype_check.equals("postscript")) { %>
        	<section class="headersection1">
                <span class="middle"><a href="./freeboard"><img class="logo" src="<%=request.getContextPath() + "/image/everytimelogo.png" %>" alt="경로확인"></a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/freeboard">자유게시판</a></span>
                <span class="active middle"><a href="<%=request.getContextPath() %>/postscriptboard">강의후기</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/menuboard">학식메뉴</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/tradeboard">장터게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/studentboard">학생게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/staffboard">교직원게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/friendboard">친구</a></span>
            </section>
        <% } else if(btype_check.equals("menu")) { %>
        	<section class="headersection1">
                <span class="middle"><a href="./freeboard"><img class="logo" src="<%=request.getContextPath() + "/image/everytimelogo.png" %>" alt="경로확인"></a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/freeboard">자유게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/postscriptboard">강의후기</a></span>
                <span class="active middle"><a href="<%=request.getContextPath() %>/menuboard">학식메뉴</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/tradeboard">장터게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/studentboard">학생게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/staffboard">교직원게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/friendboard">친구</a></span>
            </section>
        <% } else if(btype_check.equals("trade")) { %>
        	<section class="headersection1">
                <span class="middle"><a href="./freeboard"><img class="logo" src="<%=request.getContextPath() + "/image/everytimelogo.png" %>" alt="경로확인"></a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/freeboard">자유게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/postscriptboard">강의후기</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/menuboard">학식메뉴</a></span>
                <span class="active middle"><a href="<%=request.getContextPath() %>/tradeboard">장터게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/studentboard">학생게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/staffboard">교직원게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/friendboard">친구</a></span>
            </section>
        <% } else if(btype_check.equals("student")) { %>
        	<section class="headersection1">
                <span class="middle"><a href="./freeboard"><img class="logo" src="<%=request.getContextPath() + "/image/everytimelogo.png" %>" alt="경로확인"></a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/freeboard">자유게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/postscriptboard">강의후기</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/menuboard">학식메뉴</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/tradeboard">장터게시판</a></span>
                <span class="active middle"><a href="<%=request.getContextPath() %>/studentboard">학생게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/staffboard">교직원게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/friendboard">친구</a></span>
            </section>
        <% } else if(btype_check.equals("staff")) { %>
        	<section class="headersection1">
                <span class="middle"><a href="./freeboard"><img class="logo" src="<%=request.getContextPath() + "/image/everytimelogo.png" %>" alt="경로확인"></a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/freeboard">자유게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/postscriptboard">강의후기</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/menuboard">학식메뉴</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/tradeboard">장터게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/studentboard">학생게시판</a></span>
                <span class="active middle"><a href="<%=request.getContextPath() %>/staffboard">교직원게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/friendboard">친구</a></span>
            </section>
        <% } else if(btype_check.equals("friend")) { %>
        	<section class="headersection1">
                <span class="middle"><a href="./freeboard"><img class="logo" src="<%=request.getContextPath() + "/image/everytimelogo.png" %>" alt="경로확인"></a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/freeboard">자유게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/postscriptboard">강의후기</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/menuboard">학식메뉴</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/tradeboard">장터게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/studentboard">학생게시판</a></span>
                <span class="middle"><a href="<%=request.getContextPath() %>/staffboard">교직원게시판</a></span>
                <span class="active middle"><a href="<%=request.getContextPath() %>/friendboard">친구</a></span>
            </section>
        <% } %>
            <section class="headersection2">
                <span class="middle"><a href="./logout">로그아웃</a></span>
            </section>
        </header>
        <%
        	ArrayList<BoardVO> datas = (ArrayList<BoardVO>)request.getAttribute("datas");
        	for(BoardVO data: datas) {
        %>
        <section class="main">
            <!-- 게시글 전문 -->
            <article class="title">
                <div class="title">
                    <h2><%=data.getTitle() %></h2>
                </div>
                <% if(data.getBtype().equals("free")) { %>
                <div class="inf">
                    <p>등록 : <%=data.getCreate_date() %>
                    수정 : <%=data.getUpdate_date() %>
                    작성자 : 익명</p>
                </div>
                <% } else { %>
                <div class="inf">
                    <p>등록 : <%=data.getCreate_date() %>
                    수정 : <%=data.getUpdate_date() %>
                    작성자 : <%=data.getAuthor() %></p>
                </div>
                <% } %>
            </article>
            <article class="context">
                <div class="context">
                    <p><%=data.getPost_context() %></p>
                </div>
                
            </article>
            <article>
                <div class="status">
                    <p>
                    조회수<%=data.getView_cnt() %> 댓글<%=data.getReply_cnt() %>
                    <a href="./empathy?post_id=<%=data.getPost_id()%>&memberID=<%=session.getAttribute("memberID")%>&flag=like&viewflag=3">좋아요<%=data.getLike_cnt() %></a>
                    <a href="./empathy?post_id=<%=data.getPost_id()%>&memberID=<%=session.getAttribute("memberID")%>&flag=dislike&viewflag=3">싫어요<%=data.getDislike_cnt() %></a>
                    </p>  
                </div>
            </article>
		<%
        	}
		%>
		
        	<%
          		for(BoardVO data: datas) {
         	%> 	
           	<a class="hover" onclick="window.open('./reply?post_id=<%=data.getPost_id()%>&viewflag=2'
           	,'댓글입력','width=400, height=400,');">새로운 댓글을 작성해주세요!<img class="write" src="<%=request.getContextPath() + "/image/write.png" %>" alt="경로확인"></a>
           	<%
        		}
        	%>
        	<%
        		ArrayList<ReplyVO> rdatas = (ArrayList<ReplyVO>)request.getAttribute("rdatas");
        		for(ReplyVO rdata: rdatas) {
        	%>
           	<!-- 이 위치에 생성된 댓글 배치 -->
           	<div class="reply_re">
           		<p class="reply_content"><%=rdata.getReply_context() %></p>
           		<p class="reply_by">작성자 : <%=rdata.getReply_author() %> 작성일 : <%=rdata.getReply_date() %></p>
           		<div class="delete_right">
           			<a href="./replydelete?post_id=<%=rdata.getPost_id()%>&reply_id=<%=rdata.getReply_id()%>&reply_author=<%=rdata.getReply_author()%>&real_author=<%=rdata.getReal_author()%>&viewflag=3">삭제</a>
           		</div>
           	</div>
        	<%
        		}
        	%>
        	
           	<%
          		for(BoardVO data: datas) {
         	%> 
           	<!-- 게시글 수정/삭제버튼 -->
            <article class="button">
                <button type="button" onclick="location.href='./update?post_id=<%=data.getPost_id()%>&author=<%=data.getAuthor()%>'">수정</button>
                <button type="button" onclick="location.href='./delete?post_id=<%=data.getPost_id()%>&author=<%=data.getAuthor()%>'">삭제</button>
            </article>
        </section>
       		<%
        		}
        	%>
    </div>
</body>
<script type="text/javascript">
	window.opener.location.reload();
	window.close();
</script>
</html>