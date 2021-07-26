<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/join.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<c:url var="email_check" value="/ajax/account/email" />
<c:url var="nickname_check" value="/ajax/account/nickname" />
<script type="text/javascript">
	function emailCheck() {
		var email = document.getElementById("id_email").value;
		if(email == "" || email == undefined) {
			alert("이메일 주소를 입력하세요.");
			document.getElementById("id_email").focus();
			return;
		}
		$.ajax({
			url: "${email_check }",
			type: "get",
			datatype: "json",
			data: {
				email: document.getElementById("id_email").value
			},
			success: function(data) {
				if(data.result == false) {
					document.getElementById("email_check_res").innerText = "사용 가능!";
				} else {
					document.getElementById("email_check_res").innerText = "이미 사용중인 이메일 주소";
				}
			}
		});
	}
	
	function nicknameCheck() {
		var nickname = document.getElementById("id_nickname").value;
		if(nickname == "" || nickname == undefined) {
			alert("닉네임을 입력하세요.");
			document.getElementById("id_nickname").focus();
			return;
		}
		$.ajax({
			url: "${nickname_check }",
			type: "get",
			datatype: "json",
			data: {
				nickname: document.getElementById("id_nickname").value
			},
			success: function(data) {
				if(data.result == false) {
					document.getElementById("nickname_check_res").innerText = "사용 가능!";
				} else {
					document.getElementById("nickname_check_res").innerText = "이미 사용중인 닉네임";
				}
			}
		});
	}
	
	
	function send() {
		var username = document.getElementById("id_name");
		if(username.value == "" || username.value == undefined) {
			alert("이름을 입력하세요.")
			username.focus();
			return false;
		}

		var nickname_check = document.getElementById("nickname_check_res").innerText;
		if(nickname_check == "" || nickname_check == undefined) {
			alert("닉네임을 입력하세요.");
			document.getElementById("id_nickname").focus();
			return false;
		} else if(nickname_check != "사용 가능!") {
			alert("해당 닉네임으로는 가입을 할 수 없습니다.");
			document.getElementById("id_nickname").focus();
			return false;
		}
		
		var email_check = document.getElementById("email_check_res").innerText;
		if(email_check == "" || email_check == undefined) {
			alert("이메일 중복확인을 먼저 진행하세요.");
			document.getElementById("id_email").focus();
			return false;
		} else if(email_check != "사용 가능!") {
			alert("해당 이메일 주소로는 가입을 할 수 없습니다.");
			document.getElementById("id_email").focus();
			return false;
		}
		
		var password = document.getElementById("id_password");
		if(password.value == "" || password.value == undefined) {
			alert("패스워드를 입력하세요.")
			password.focus();
			return false;
		}
		
		document.getElementById('account_form').submit();
	}
</script>
</head>
<c:url var="join" value="/account/join" />
<body>
	<div class="width">
		<form id="account_form" action="${join }" method="post">
			<section>
				<div>
					<a href="./login"><img class="logo" src="<%=request.getContextPath() + "/resources/image/khlogo.png" %>" alt="로고" ></a>
				</div>
				<div>
					<input class="text" id="id_name" type="text" name="name" placeholder="이름" required>
				</div>
				<div >
					<input class="dup_text" id="id_nickname" type="text" name="nickname" placeholder="닉네임" required>
					<button class="dupok1" type="button" onclick="nicknameCheck();">중복확인</button>
					<label id="nickname_check_res"></label>
				</div>
				<div>
					<input class="dup_text" id="id_email" type="email" name="email" placeholder="이메일" required>
					<button class="dupok2" type="button" onclick="emailCheck();">중복확인</button>
					<label id="email_check_res"></label>
				</div>
				<div>
					<input class="text" id="id_password" type="password" name="pwd" placeholder="패스워드" required>
				</div>
				<div>
					<button class="ok" type="button" onclick="send();">가입</button>
					<c:url var="login" value="/account/login" />
					<button class="ok2" type="button" onclick="location.href='${login }'">로그인</button>
				</div>
			</section>
		</form>
	</div>
</body>
</html>