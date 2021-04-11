<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/join.css">
</head>
<body>
	<div class="width">
	<form action="./join" method="post">
		<div class="left">
			<h3>에브리타임 회원가입</h3>
			<p>에브리타임 계정으로 <span>자유게시판</span> 등 <br>다양한 대학생 서비스를 모두 이용하실 수 있습니다.</p>
		</div>
		<div>
			<input type="text" name="memberID" placeholder="아이디를 입력해주세요" required>
		</div>
		<div>
			<input type="password" name="memberPW" placeholder="비밀번호를 입력해주세요" required>
		</div>
		<div>
			<button type="submit">회원가입</button>
		</div>
	</form>
	</div>
</body>
</html>