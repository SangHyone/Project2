<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%-- 부트스트랩을 사용하기 위한 준비 시작 --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel='stylesheet' type="text/css"
	href="${pageContext.request.contextPath}/login/css/insertForm.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>
<%-- 다음 우편번호 API --%>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function() {
		$("#birth").datepicker({
			format : "yyyy-mm-dd", // 달력에서 클릭시 표시할 값 형식
			language : "kr", // 언어(js 추가가 필요하다.)
			startDate : "-30y",
		});
		// 아이디 입력시 Ajax를 호출하여 아이디 중복확인하기	
		$("#id").keyup(function() {
			var value = $(this).val();
			if (value != null && value.length >= 4) {
				// alert(value);
				$.ajax("idCheck.jsp", {
					type : "GET",
					data : {
						"id" : value
					},
					success : function(data) {
						//alert(typeof(data) + "\n" + data )
						if (data * 1 == 0) {
							$("#msg").html("사용가능").css('color', 'blue');
						} else {
							$("#msg").html("사용불가능").css('color', 'red');
						}
					},
					error : function() {
						alert('에러다!!!!')
					}
				});
			} else {
				$("#msg").html("").css('color', 'black');
			}
		});
	});

	function daumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = ''; // 주소 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postCode').value = data.zonecode;
				document.getElementById("addr1").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("addr2").focus();
			}
		}).open();
	}

	// 폼검증하는 자바스크립트 함수
	function formCheck() {
		var value = $("#id").val();
		if (value == null || value.trim().length == 0) {
			alert('아이디는 반드시 입력해야 합니다.');
			$("#id").val("");
			$("#id").focus();
			return false;
		}
		if ($("#msg").html() != "사용가능") {
			alert('사용 불가능한 아이디입니다.');
			$("#userid").val("");
			$("#msg").text("");
			$("#userid").focus();
			return false;
		}
		var value = $("#password").val();
		if (value == null || value.trim().length == 0) {
			alert('사용자 비빌번호는 반드시 입력해야 합니다.');
			$("#password").val("");
			$("#password").focus();
			return false;
		}
		var value = $("#name").val();
		if (value == null || value.trim().length == 0) {
			alert('사용자 이름은 반드시 입력해야 합니다.');
			$("#name").val("");
			$("#name").focus();
			return false;
		}
		var value = $("#email").val();
		if (value == null || value.trim().length == 0) {
			alert('이메일 주소는 반드시 입력해야 합니다.');
			$("#email").val("");
			$("#email").focus();
			return false;
		}
		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		if (!regEmail.test(value)) {
			alert('이메일 주소 형식이 잘못되었습니다.');
			$("#email").val("");
			$("#email").focus();
			return false;
		}
		var value = $("#birth").val();
		if (value == null || value.trim().length == 0) {
			alert('생년월일은 반드시 입력해야 합니다.');
			$("#birth").val("");
			$("#birth").focus();
			return false;
		}
		var value = $("#phone").val();
		if (value == null || value.trim().length == 0) {
			alert('전화번호는 반드시 입력해야 합니다.');
			$("#phone").val("");
			$("#phone").focus();
			return false;
		}
		var value = $("#postCode").val();
		if (value == null || value.trim().length == 0) {
			alert('우편번호는 반드시 입력해야 합니다.');
			$("#postCode").val("");
			$("#postCode").focus();
			return false;
		}
		var value = $("#addr2").val();
		if (value == null || value.trim().length == 0) {
			alert('상세 주소는 반드시 입력해야 합니다.');
			$("#addr2").val("");
			$("#addr2").focus();
			return false;
		}
	}
</script>

</head>
<body>
	<form action="insertOk.jsp" method="post"
		onsubmit="return formCheck();">
		<div class="join_all">
			<div class="join">
				<div>
					<h1 id="joinid" class="form-label">회원가입</h1>
					<br>
				</div>
				<!-- 아이디 -->
				<label for="basic-url" class="form-label">아이디*</label>
				<div class="input-group mb-3">
					<input type="text" name="id" id="id" class='form-control'
						placeholder="영문,숫자 5자 이상 입력해주세요.">
					<!-- 아이디 중복확인 -->
					<div id="msg"></div>
				</div>

				<!-- 비밀번호 -->
				<label for="basic-url" class="form-label">비밀번호*</label>
				<div class="input-group mb-3">
					<input type="password" name="password" class='form-control'
						id="password" placeholder="6자 이상 입력해주세요.">
				</div>

				<!-- 이름 -->
				<label for="basic-url" class="form-label">이름*</label>
				<div class="input-group mb-3">
					<input type="text" name="name" id="name" class='form-control'>
				</div>

				<!-- 생년월일 -->
				<label for="basic-url" class="form-label">생년월일*</label>
				<div class="input-group mb-3">
					<input type="date" name="birth" id="birth" class='form-control'>
				</div>

				<!-- 성별 -->
				<div class="gender">
					<label for="basic-url" class="form-label">성별</label> <label><input
						type="radio" name="gender" id="gender1" value="M"> 남자</label> <label><input
						type="radio" name="gender" id="gender2" value="F"> 여자</label>
				</div>
				<br>

				<!-- 이메일 -->
				<label for="basic-url" class="form-label">이메일*</label>
				<div class="input-group mb-3">
					<input type="text" name="email" id="email" class='form-control'>
				</div>

				<!-- 휴대폰번호 -->
				<label for="basic-url" class="form-label">휴대폰 번호*</label>
				<div class="input-group mb-3">
					<input type="tel" name="phone" class='form-control' id="phone">
				</div>

				<!-- 우편번호 -->
				<div style="display: inline;" class="Postal_code">
					<label for="basic-url" class="form-label">우편번호</label>
					<div class="input-group mb-2">
						<div class="input-group mb-3">
							<div class="col-sm-7">
								<input type="button" class="form-control " name="postCode"
									id="postCode" required onclick="daumPostcode();">
							</div>
							<div id="blank"></div>
							<div class="col-sm-4">
								<input type="button" id="zipCodebtn" onclick="daumPostcode();"
									class='form-control' value="우편번호찾기">
							</div>
						</div>
					</div>

					<!-- 주소 -->
					<label for="basic-url" class="form-label">주소</label>
					<div class="input-group mb-3">
						<input type="button" class='form-control' name="addr1" id="addr1"
							 required onclick="daumPostcode();">
					</div>
					<label for="basic-url" class="form-label">상세주소</label>
					<div class="input-group mb-3">
						<input type="text" class="form-control" type="text" name="addr2"
							id="addr2" required>
					</div>

					<input class="joinbutton" type="submit" value="회원가입">

				</div>
				<!-- join class End-->
			</div>
			<!-- join_all calss End-->
		</div>
	</form>
</body>
</html>