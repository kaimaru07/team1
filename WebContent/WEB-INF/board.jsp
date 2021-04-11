<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardVO, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
</head>
<body>
    <div class="width">
        <header>
            <section class="headersection1">
                <span class="middle"><a href="./board"><img class="logo" src="<%=request.getContextPath() + "/image/everytimelogo.png" %>" alt="경로확인"></a></span>
                <span class="active middle"><a href="#">자유게시판</a></span>
                <span class="middle"><a href="#">강의후기</a></span>
                <span class="middle"><a href="#">학식메뉴</a></span>
                <span class="middle"><a href="#">장터게시판</a></span>
                <span class="middle"><a href="#">학생게시판</a></span>
                <span class="middle"><a href="#">교직원게시판</a></span>
                <span class="middle"><a href="#">친구</a></span>
            </section>
            <section class="headersection2">
                <span class="middle"><a href="./logout">로그아웃</a></span>
            </section>
        </header>
        
        <section class="main">
            <div class="write">
                <p>새로운 글을 작성해주세요!</p>
                <a href="./write"><img class="write" src="<%=request.getContextPath() + "/image/write.png" %>" alt="경로확인"></a>
            </div>
            <%
            	ArrayList<BoardVO> datas = (ArrayList<BoardVO>)request.getAttribute("datas");
            	for(BoardVO data: datas) {
            %>
            <article class="list">
                <a class="article" href="./detail?post_id=<%=data.getPost_id()%>">
                    <div class="title">
                        <h2><%=data.getTitle() %></h2>
                    </div>
                    <div class="context">
                        <p><%=data.getPost_context() %></p>
                    </div>
                </a>
                    <div class="inf">
                        <p>작성일 : <%=data.getCreate_date() %>
                        수정일 : <%=data.getUpdate_date() %>
                        작성자 : <%=data.getAuthor() %></p>
                    </div>
                    <div class="status">
                       <p>조회수<%=data.getView_cnt()%> 댓글<%=data.getReply_cnt() %> 좋아요<%=data.getLike_cnt() %> 싫어요<%=data.getDislike_cnt() %></p>  
                    </div>
            </article>
            <%
            	}
            %>
        </section>
    </div>
</body>
</html>