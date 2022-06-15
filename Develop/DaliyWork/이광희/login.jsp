<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/3c36eed32b.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/login/css/login.css" />
</head>

<body>
	<div id="mainWrapper">
		<div class="login-container">
			<div class="login-card">
				<div class="login-form">
					<form
						action="${pageContext.request.contextPath }/login/loginOk.jsp"
						method="post" class="form-horizontal">
						<%-- 로그인 실패시 에러메세지 출력 --%>
						<c:if test="${not empty error }">
							<div style="color: red; font-size: 15pt;">${error }</div>
						</c:if>
						<%-- 로그아웃시 메세지 출력 --%>
						<c:if test="${not empty msg }">
							<div style="color: green; font-size: 15pt;">${msg }</div>
						</c:if>

			
	<!-- ------------------------------------form-control은 부트스트랩 class이므라 건들지 큰일납니다 ----------------------------------------------->
						
						<div id="login_form">
							<div class="mainfont">로고 같은 누르면 main페이지로 이동하는것</div>

							<div class="idfont">아이디</div>
							<!-- 아이디 데이터를 받아오는 input -->
							<div class="idpw">
								<input type="text" class="form-control" id="id" name="id"
									placeholder="5글자 이상 입력해주세요" required>
							</div>

							<div class="pwfont">비밀번호</div>
							<!-- 비밀번호 데이터를 받아오는 input -->
							<div class="idpw">
								<input type="password" class="form-control" id="password"
									name="password" placeholder="비밀번호" required>
							</div>

							<!-- 로그인 실패시 입력되는 텍스트 자리 -->
							<div id="answer"></div>
							<div>
								<input class="loginbutton" type="submit" value="로그인"><br>

								<input class="join" type="button" value="회원가입"
									onClick="location.href='insertForm.jsp'"><br>
								<a href="findUserid.jsp" class="find_id">아이디 찾기 |</a> <a
									href="findPassword.jsp" class="find_pw">비밀번호 찾기</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>