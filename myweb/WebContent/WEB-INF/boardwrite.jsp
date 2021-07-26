<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String btype_check = request.getAttribute("btype_check").toString(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/boardwrite.css">
</head>
<body>
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
	<form action="<%=request.getContextPath()%>/write" method="post">
		<div class="title">
			<input type="text" id="id_title" name="title" maxlength="100" placeholder="제목을 입력해주세요." required>
		</div>
		<div>
		<% if(btype_check.equals("free")) { %>
			<select id="id_btype" name="btype">
				<option value="free" selected>자유게시판</option>
				<option value="postscript">강의후기</option>
				<option value="menu">학식메뉴</option>
				<option value="trade">장터게시판</option>
				<option value="student">학생게시판</option>
				<option value="staff">교직원게시판</option>
				<option value="friend">친구</option>
			</select>
		<% } else if(btype_check.equals("postscript")) { %>
			<select id="id_btype" name="btype">
				<option value="free">자유게시판</option>
				<option value="postscript" selected>강의후기</option>
				<option value="menu">학식메뉴</option>
				<option value="trade">장터게시판</option>
				<option value="student">학생게시판</option>
				<option value="staff">교직원게시판</option>
				<option value="friend">친구</option>
			</select>
		<% } else if(btype_check.equals("menu")) { %>
			<select id="id_btype" name="btype">
				<option value="free">자유게시판</option>
				<option value="postscript">강의후기</option>
				<option value="menu" selected>학식메뉴</option>
				<option value="trade">장터게시판</option>
				<option value="student">학생게시판</option>
				<option value="staff">교직원게시판</option>
				<option value="friend">친구</option>
			</select>
		<% } else if(btype_check.equals("trade")) { %>
			<select id="id_btype" name="btype">
				<option value="free">자유게시판</option>
				<option value="postscript">강의후기</option>
				<option value="menu">학식메뉴</option>
				<option value="trade" selected>장터게시판</option>
				<option value="student">학생게시판</option>
				<option value="staff">교직원게시판</option>
				<option value="friend">친구</option>
			</select>
		<% } else if(btype_check.equals("student")) { %>
			<select id="id_btype" name="btype">
				<option value="free">자유게시판</option>
				<option value="postscript">강의후기</option>
				<option value="menu">학식메뉴</option>
				<option value="trade">장터게시판</option>
				<option value="student" selected>학생게시판</option>
				<option value="staff">교직원게시판</option>
				<option value="friend">친구</option>
			</select>
		<% } else if(btype_check.equals("staff")) { %>
			<select id="id_btype" name="btype">
				<option value="free">자유게시판</option>
				<option value="postscript">강의후기</option>
				<option value="menu">학식메뉴</option>
				<option value="trade">장터게시판</option>
				<option value="student">학생게시판</option>
				<option value="staff" selected>교직원게시판</option>
				<option value="friend">친구</option>
			</select>
		<% } else if(btype_check.equals("friend")) { %>
			<select id="id_btype" name="btype">
				<option value="free">자유게시판</option>
				<option value="postscript">강의후기</option>
				<option value="menu">학식메뉴</option>
				<option value="trade">장터게시판</option>
				<option value="student">학생게시판</option>
				<option value="staff">교직원게시판</option>
				<option value="friend" selected>친구</option>
			</select>
		<% } %>
		</div>
		<div>
			<input class="form-control"	type="hidden" id="id_author" name="author" maxlength="20" value="<%=request.getParameter("memberID")%>" required readonly>
		</div>
		<div>
			<textarea class="context" id="id_post_context" name="post_context" rows="20" maxlength="2000"
			placeholder="내용을 입력해주세요." required></textarea>
		</div>
		<div>
			<button class="commit" type="submit">작성 완료</button>
		</div>
	</form>
</body>
</html>