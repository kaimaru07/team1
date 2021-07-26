<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardVO, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/boardupdate.css">
</head>
<%
	ArrayList<BoardVO> datas = (ArrayList<BoardVO>)request.getAttribute("datas");
	for(BoardVO data: datas) {
%>
<body>
	<header>
		<% if(data.getBtype().equals("free")) { %>
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
        <% } else if(data.getBtype().equals("postscript")) { %>
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
        <% } else if(data.getBtype().equals("menu")) { %>
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
        <% } else if(data.getBtype().equals("trade")) { %>
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
        <% } else if(data.getBtype().equals("student")) { %>
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
        <% } else if(data.getBtype().equals("staff")) { %>
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
        <% } else if(data.getBtype().equals("friend")) { %>
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
	<form action="<%=request.getContextPath()%>/update" method="post">
		<input type="hidden" name="post_id" value="<%=data.getPost_id()%>">
		<div>
			<input type="text" id="id_title" name="title" maxlength="100" value="<%=data.getTitle() %>" required readonly>
		</div>
		<% if(data.getBtype().equals("free")) { %>
		<div>
			<select id="id_btype" name="btype" disabled="disabled">
				<option value="free" selected>자유게시판</option>
				<option value="postscript">강의후기</option>
				<option value="menu">학식메뉴</option>
				<option value="trade">장터게시판</option>
				<option value="student">학생게시판</option>
				<option value="staff">교직원게시판</option>
				<option value="friend">친구</option>
			</select>
		</div>
		<div>
			<input class="form-control"	type="hidden" id="id_author" name="author" maxlength="20" value="익명" required readonly>
		</div>
		<% } else if(data.getBtype().equals("postscript")) { %>
		<div>
			<select id="id_btype" name="btype" disabled="disabled">
				<option value="free">자유게시판</option>
				<option value="postscript" selected>강의후기</option>
				<option value="menu">학식메뉴</option>
				<option value="trade">장터게시판</option>
				<option value="student">학생게시판</option>
				<option value="staff">교직원게시판</option>
				<option value="friend">친구</option>
			</select>
		</div>
		<div>
			<input class="form-control"	type="hidden" id="id_author" name="author" maxlength="20" value="<%=data.getAuthor() %>" required readonly>
		</div>
		<% } else if(data.getBtype().equals("menu")) { %>
		<div>
			<select id="id_btype" name="btype" disabled="disabled">
				<option value="free">자유게시판</option>
				<option value="postscript">강의후기</option>
				<option value="menu" selected>학식메뉴</option>
				<option value="trade">장터게시판</option>
				<option value="student">학생게시판</option>
				<option value="staff">교직원게시판</option>
				<option value="friend">친구</option>
			</select>
		</div>
		<div>
			<input class="form-control"	type="hidden" id="id_author" name="author" maxlength="20" value="<%=data.getAuthor() %>" required readonly>
		</div>
		<% } else if(data.getBtype().equals("trade")) { %>
		<div>
			<select id="id_btype" name="btype" disabled="disabled">
				<option value="free">자유게시판</option>
				<option value="postscript">강의후기</option>
				<option value="menu">학식메뉴</option>
				<option value="trade" selected>장터게시판</option>
				<option value="student">학생게시판</option>
				<option value="staff">교직원게시판</option>
				<option value="friend">친구</option>
			</select>
		</div>
		<div>
			<input class="form-control"	type="hidden" id="id_author" name="author" maxlength="20" value="<%=data.getAuthor() %>" required readonly>
		</div>
		<% } else if(data.getBtype().equals("student")) { %>
		<div>
			<select id="id_btype" name="btype" disabled="disabled">
				<option value="free">자유게시판</option>
				<option value="postscript">강의후기</option>
				<option value="menu">학식메뉴</option>
				<option value="trade">장터게시판</option>
				<option value="student" selected>학생게시판</option>
				<option value="staff">교직원게시판</option>
				<option value="friend">친구</option>
			</select>
		</div>
		<div>
			<input class="form-control"	type="hidden" id="id_author" name="author" maxlength="20" value="<%=data.getAuthor() %>" required readonly>
		</div>
		<% } else if(data.getBtype().equals("staff")) { %>
		<div>
			<select id="id_btype" name="btype" disabled="disabled">
				<option value="free">자유게시판</option>
				<option value="postscript">강의후기</option>
				<option value="menu">학식메뉴</option>
				<option value="trade">장터게시판</option>
				<option value="student">학생게시판</option>
				<option value="staff" selected>교직원게시판</option>
				<option value="friend">친구</option>
			</select>
		</div>
		<div>
			<input class="form-control"	type="hidden" id="id_author" name="author" maxlength="20" value="<%=data.getAuthor() %>" required readonly>
		</div>
		<% } else if(data.getBtype().equals("friend")) { %>
		<div>
			<select id="id_btype" name="btype" disabled="disabled">
				<option value="free">자유게시판</option>
				<option value="postscript">강의후기</option>
				<option value="menu">학식메뉴</option>
				<option value="trade">장터게시판</option>
				<option value="student">학생게시판</option>
				<option value="staff">교직원게시판</option>
				<option value="friend" selected>친구</option>
			</select>
		</div>
		<div>
			<input class="form-control"	type="hidden" id="id_author" name="author" maxlength="20" value="<%=data.getAuthor() %>" required readonly>
		</div>
		<% } %>
		<div>
			<textarea class="context" id="id_post_context" name="post_context" rows="20" maxlength="2000"
			required><%=data.getPost_context() %></textarea>
		</div>
		<div>
			<button type="submit" class="commit">수정 완료</button>
		</div>
	</form>
</body>
<%
	}
%>
</html>