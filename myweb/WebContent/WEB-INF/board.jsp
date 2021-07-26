<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardVO, java.util.ArrayList" %>
<% ArrayList<BoardVO> datas = (ArrayList<BoardVO>)request.getAttribute("datas"); %>
<% String btype_check = request.getAttribute("btype_check").toString(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리타임</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
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
        <section class="main">
        <% if(btype_check.equals("free")) { %>
            <div class="write">
                <p>새로운 글을 작성해주세요!</p>
                <a href="./write?btype=free&memberID=<%=session.getAttribute("memberID")%>"><img class="write" src="<%=request.getContextPath() + "/image/write.png" %>" alt="경로확인"></a>
            </div>
        <% } else if(btype_check.equals("postscript")) { %>
        	<div class="write">
                <p>새로운 글을 작성해주세요!</p>
                <a href="./write?btype=postscript&memberID=<%=session.getAttribute("memberID")%>"><img class="write" src="<%=request.getContextPath() + "/image/write.png" %>" alt="경로확인"></a>
            </div>
        <% } else if(btype_check.equals("menu")) { %>
        	<div class="write">
                <p>새로운 글을 작성해주세요!</p>
                <a href="./write?btype=menu&memberID=<%=session.getAttribute("memberID")%>"><img class="write" src="<%=request.getContextPath() + "/image/write.png" %>" alt="경로확인"></a>
            </div>
        <% } else if(btype_check.equals("trade")) { %>
        	<div class="write">
                <p>새로운 글을 작성해주세요!</p>
                <a href="./write?btype=trade&memberID=<%=session.getAttribute("memberID")%>"><img class="write" src="<%=request.getContextPath() + "/image/write.png" %>" alt="경로확인"></a>
            </div>
        <% } else if(btype_check.equals("student")) { %>
        	<div class="write">
                <p>새로운 글을 작성해주세요!</p>
                <a href="./write?btype=student&memberID=<%=session.getAttribute("memberID")%>"><img class="write" src="<%=request.getContextPath() + "/image/write.png" %>" alt="경로확인"></a>
            </div>
        <% } else if(btype_check.equals("staff")) { %>
        	<div class="write">
                <p>새로운 글을 작성해주세요!</p>
                <a href="./write?btype=staff&memberID=<%=session.getAttribute("memberID")%>"><img class="write" src="<%=request.getContextPath() + "/image/write.png" %>" alt="경로확인"></a>
            </div>
        <% } else if(btype_check.equals("friend")) { %>
        	<div class="write">
                <p>새로운 글을 작성해주세요!</p>
                <a href="./write?btype=friend&memberID=<%=session.getAttribute("memberID")%>"><img class="write" src="<%=request.getContextPath() + "/image/write.png" %>" alt="경로확인"></a>
            </div>
        <% } %>
            <%
            	for(BoardVO data: datas) {
            %>
            <article class="list">
                <a class="article" href="./detail?post_id=<%=data.getPost_id()%>&viewflag=1">
                    <div class="title">
                        <h2><%=data.getTitle() %></h2>
                    </div>
                    <div class="context">
                        <p><%=data.getPost_context() %></p>
                    </div>
                </a>
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
                    <div class="status">
                       <p>
                       조회수<%=data.getView_cnt()%> 댓글<%=data.getReply_cnt() %>
                       <a href="./empathy?post_id=<%=data.getPost_id()%>&memberID=<%=session.getAttribute("memberID")%>&flag=like">좋아요<%=data.getLike_cnt() %></a>
                       <a href="./empathy?post_id=<%=data.getPost_id()%>&memberID=<%=session.getAttribute("memberID")%>&flag=dislike">싫어요<%=data.getDislike_cnt() %></a>
                       </p>  
                    </div>
            </article>
            <%
            	}
            %>
        </section>
    </div>
</body>
</html>