<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 작성</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/reply.css">
</head>
<body>
	<legend>댓글을 남겨주세요.
	<form action="./replywrite">
		<input type="hidden" name="post_id" value="<%=request.getAttribute("post_id") %>">
		<input type="hidden" name="viewflag" value=3>
		<input type="hidden" name="real_author" value="<%=session.getAttribute("memberID")%>">
		<input type="text" id="name" name="reply_author" placeholder=" 이름을 입력해주세요." required><br>
		<textarea name="reply_context" id="text" placeholder=" 내용을 작성해주세요." required></textarea><br>
		<button class="commit" type="submit">작성 완료</button>
	</form>
	</legend>
</body>
</html>