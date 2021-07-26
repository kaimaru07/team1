<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Everytime</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
	<%
	String remember = (String)request.getAttribute("remember");
	if(remember == null){
		remember="";
	}
	%>
	<div class="width">
	<form method="post" action="">
		<section>
			<div>
				<img class="logo" src="<%=request.getContextPath() + "/image/everytimelogo.png" %>" alt="경로확인" width="50px">
				&nbsp&nbsp&nbsp&nbsp&nbsp<p>지금</p>&nbsp<p class="bold">에브리타임</p><p>을 시작하세요!</p>
			</div>
			<div>
				<input class="text" type="text" name="memberID" placeholder="아이디" value="<%=remember%>">
			</div>
			<div>
				<input class="text" type="password" name="memberPW" placeholder="비밀번호">
			</div>
			<div>
				<button type="submit">로그인</button>
			</div>
			<div class="left">
				<input type="checkbox" name="remember" id="">&nbsp기억하기
			</div>
		</section>
	</form>
			<div class="bottom">
				에브리타임에 처음이신가요?
				<a href="./join">회원가입</a>
			</div>
	</div>
</body>
</html>