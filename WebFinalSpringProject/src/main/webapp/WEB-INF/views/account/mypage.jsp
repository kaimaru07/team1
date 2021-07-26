<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/mypage.css">
</head>
<body>
	<div class="width">
		<%@ include file="/WEB-INF/views/main/header.jsp" %>
		<br>

		<section class="main">
			<div>
				<h2>MY PAGE</h2><hr>
				<br>
				<c:url var="chatlist" value="/chatting/chatroom" />
				<!--  <button class="chat" type="button" onclick="location.href='${chatlist }'">채팅창</button>-->
			</div>
			<section>
				<div class="myinfo">
					<c:url var="memberupdate" value="/account/memberupdate" />
					<h2>
						<a id="line" href="${memberupdate }">${data.getNickname() }님</a>
					</h2>
					<p>(${data.getEmail() })</p>
					<p>총 게시글 수 <strong> ${fn:length(writelist)}</strong>개</p>
					
				</div>
			</section>
			<br>
			<section>
				<div class="list">
					<div class="write">
						<span class="top">내가 쓴 글</span><br><br>
						<table class="table">
							<thead>
								<tr>
									<th>제목</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:url var="detail" value="/board/detail" />
								<c:forEach var="writeitem" items="${requestScope.writelist }">
									<tr>
										<td><a href="${detail }?bid=${writeitem.getBid() }">${writeitem.getTitle() }</a></td>
										<td>${writeitem.getCdate() }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<br>
					<br>
					<div class="zzim">
						<span class="top">찜 목록</span><br><br>
						<table class="table">
							<thead>
								<tr>
									<th>제목</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:url var="detail" value="/board/detail" />
								<c:forEach var="zzimitem" items="${requestScope.zzimlist }">
									<tr>
										<td><a href="${detail }?bid=${zzimitem.getBid() }">${zzimitem.getTitle() }</a></td>
										<td>${zzimitem.getCdate() }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</section>
		</section>
		<br>
		<footer class="adver">
			<p>2조 final project</p>
		</footer>
	</div>
</body>
</html>