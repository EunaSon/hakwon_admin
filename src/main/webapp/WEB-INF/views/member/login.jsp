<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Noto Sans KR", sans-serif;
}

a {
	text-decoration: none;
	color: black;
}

li {
	list-style: none;
}

.wrapper {
	width: 100%;
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	background: rgba(0, 0, 0, 0.1);
}

.wrap {
	width: 30%;
	height: 600px;
	background: white;
	border-radius: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.login_form {
	width: 30%;
	height: 600px;
	background: white;
	border-radius: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

h2 {
	color: tomato;
	font-size: 2em;
}

.id_wrap {
	margin-top: 20px;
	width: 80%;
}

.id_input_box {
	margin-top: 1px;
	width: 120%;
}

.id_input_box input {
	width: 100%;
	height: 50px;
	border-radius: 30px;
	margin-top: 10px;
	padding: 0px 20px;
	border: 1px solid lightgray;
	outline: none;
}

.pw_wrap {
	margin-top: 20px;
	width: 80%;
}

.pw_input_box {
	margin-top: 1px;
	width: 120%;
}

.pw_input_box input {
	width: 100%;
	height: 50px;
	border-radius: 30px;
	margin-top: 10px;
	padding: 0px 20px;
	border: 1px solid lightgray;
	outline: none;
}

.login_etc {
	margin-top: 3px;
	font-size: 14px;
	display: flex;
	align-items: left;
}

.login_etc2 {
	margin-top: -2px;
	margin-bottom: -5px;
	padding: 5px;
	width: 80%;
	font-size: 14px;
	display: flex;
	justify-content: space-between;
	align-items: right;
	font-weight: bold;
}

.login_etc3 {
	margin-top: -10px;
	padding: 5px;
	width: 80%;
	font-size: 14px;
	display: flex;
	justify-content: space-between;
	align-items: right;
	font-weight: bold;
}

.login_button_wrap input {
	width: 100%;
	height: 50px;
	border: 0;
	outline: none;
	border-radius: 40px;
	background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
	color: white;
	font-size: 1.2em;
	letter-spacing: 2px;
}
.login_warn{
    margin-top: 10px;
    margin-bottom: 10px;
    text-align: center;
    color : red;
}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<div class="wrapper">

		<div class="wrap">
			<form id="login_form" method="post">
				<div class="logo_wrap">
					<h2>XX학원 Member Login</h2>
				</div>

				<div class="id_wrap">
					<h6>아이디</h6>
					<div class="id_input_box">
						<input class="id_input" name="admin_id" placeholder="ID">
					</div>
				</div>
				<div class="pw_wrap">
					<h6>비밀번호</h6>
					<div class="pw_input_box">
						<input type = "password" class="pw_iput" name="PWD" placeholder="PassWord">
					</div>
				</div>

				<c:if test="${result == 0 }">
					<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
				</c:if>

				<%-- 아이디 저장
				<div class="login_etc">
					<input type="checkbox" ${empty cookie.id.value ? "":"checked" } name="rememberId">아이디 저장
				</div>
				--%>
				<div class="login_etc2">
					<div class="join">
						<a href="join">회원가입</a>
					</div>
				</div>
				<div class="login_etc3">
					<div class="forgot_pw">
						<a href="">ID/PW찾기</a>
					</div>
				</div>
				<br> <br>
				<div class="login_button_wrap">
					<input type="button" class="login_button" value="로그인">
				</div>
			</form>

		</div>

	</div>
	<script>
		/* 로그인 버튼 클릭 메서드 */
		$(".login_button").click(function() {

			/* 로그인 메서드 서버 요청 */
			$("#login_form").attr("action", "/member/login.do");
			$("#login_form").submit();

		});
	</script>
</body>
</html>