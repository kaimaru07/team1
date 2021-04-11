<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/write" method="post">
		<div>
			<label for="id_title">제목</label>
			<input type="text" id="id_title" name="title" maxlength="100" placeholder="제목을 입력해주세요." required>
		</div>
		<div>
			<label for="id_btype">구분</label>
			<select id="id_btype" name="btype">
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
			<label for="id_author">작성자</label>
			<input class="form-control"	type="text" id="id_author" name="author" maxlength="20" required>
		</div>
		<div>
			<label for="id_post_context">내용</label>
			<textarea id="id_post_context" name="post_context" rows="20" maxlength="2000"
			placeholder="내용을 입력해주세요." required></textarea>
		</div>
		<div>
			<button type="submit">작성 완료</button>
		</div>
	</form>
</body>
</html>