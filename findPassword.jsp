<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/3c36eed32b.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/findUserid.css" />
 
</head>
<body>
	<div class="outerDiv" id="">
		<div>
			<button class="bt_id" type="button" onclick="location.href='findUserid.jsp' ">아이디찾기</button>
			<button  class="bt_pw"  type="button" onclick="location.href='findPassword.jsp' ">비밀번호찾기</button>
		</div>
		<div>
			<h4>
				회원가입시 입력한 정보를 <br>기입해 주세요.
			</h4>
		</div>

		<div class="card-body">
			<form action="${pageContext.request.contextPath }/findPasswordOk.jsp"  method="post" class="form-horizontal">
				<%-- 비번찾기 실패시 에러메세지 출력 --%>
				<c:if test="${not empty error }">
					<div style="color: red; font-size: 13pt;">${error }</div>
				</c:if>
				<div>
					<input type="text" class="form-control" id="userid" name="userid"  placeholder="아이디입력" required>
				</div>
				<div>
					<input type="tel" class="form-control" id="phone" name="phone" placeholder="이메일" required>
				</div>
				
				<div>
					<input type="submit" class="form-actions" value="비밀번호 찾기">
				</div>
				<div class="links" >
					<a href="${pageContext.request.contextPath }/login.jsp">로그인하기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath }">홈으로</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
