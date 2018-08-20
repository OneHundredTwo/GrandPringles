<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.firedogs.grandpringles.dao.UsersDAO"%>
<%@page import="com.firedogs.grandpringles.vo.User"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<%@include file="/WEB-INF/template/noTmplLink.jsp"%>

<style>
body {
	margin: auto;
	background: rgba(196, 196, 196, 0.6)
}

#wrap {
	width: 600px;
	height: 1000px;
	position: fixed;
	right: 50%;
	margin-right: -300px;
	background: #E0E0E0;
}

#logoBox {
	width: 300px;
	height: 150px;
	position: absolute;
	background-size: cover;
	background-image: url("img/template_header_logo.png");
	top: 20px;
	left: 50%;
	margin-left: -150px;
}

#inputBox {
	width: 480px;
	height: 700px;
	position: absolute;
	top: 200px;
	left: 50%;
	margin-left: -240px;
	outline: 3px solid #fff;
}

/* 각 요소을 감싸는 BOX */
#inputBox .box_small {
	width: 478px;
	height: 50px;
	padding: 7px 0px 5px 0px;
	position: absolute;
	border: #BDBDBD 1px solid;
	background: #EEEEEE;
}

/* 각 요소의 공통 input CSS */
#inputBox .input_position {
	position: absolute;
	left: 10px;
	font-size: 15px;
	width: 330px;
	height: 40px;
	background: rgb(230, 230, 230);
	color: #616161;
	border: none;
	border-bottom: 1px solid #BDBDBD;
	line-height: 40px;
	padding-left: 10px;
}

/* 각 요소의 공통 버튼 CSS */
#inputBox .btn_position {
	width: 110px;
	height: 43px;
	position: absolute;
	background: transparent;
	border: 1px solid #BDBDBD;
	right: 10px;
}

#inputBox>#pwdBox {
	top: 60px;
}

#inputBox>#pwdConfirmBox {
	top: 120px;
}

#inputBox>#nicknameBox {
	top: 180px;
}

#inputBox>#imgBox {
	height: 150px;
	top: 240px;
}

#inputBox>#genderBox {
	top: 400px;
}

#inputBox>#phoneBox {
	top: 460px;
}

#inputBox>#lolNicknameBox {
	top: 520px;
}

#inputBox>#lolTierBox {
	top: 580px;
}

#inputBox>.box_confirm {
	position: absolute;
	width: 478px;
	height: 48px;
	top: 640px;
	background: #EEEEEE;
	border-top: 1px solid #BDBDBD;
	border-bottom: 1px solid #BDBDBD;
	padding: 7px 0px 5px 0px;
}

#inputBox #signUpBtn {
	width: 225px;
	position: absolute;
	left: 10px;
	font-size: 15px;
}

#inputBox #cancelBtn {
	width: 225px;
	position: absolute;
	right: 10px;
	font-size: 15px;
}

#inputBox>.box_confirm button:hover {
	background-color: #9E9E9E;
	color: #fff;
	font-weight: bold;
}

#inputBox .btn2 {
	width: 70px;
	height: 30px;
	background: rgb(230, 230, 230);
	border: 1px solid #424242;
	color: #424242;
	line-height: 40px;
	font-size: 15px;
	margin-top: 7px;
	padding: 0px;
}

#inputBox .btn_position:hover {
	cursor: pointer;
}

#imgBox img {
	border-radius: 15px;
}

#emailPop {
	position: absolute;
	width: 250px;
	height: 80px;
	background: #EEEEEE;
	color: #fff;
	top: 200px;
	right: -220px;
	/*text-align:center;*/
	border: 3px solid #fff;
	display: none;
}

#emailPop input {
	position: absolute;
	left: 10px;
	top: 5px;
	font-size: 15px;
	width: 120px;
	height: 30px;
	background: transparent;
	color: #616161;
	border: none;
	border-bottom: 1px solid #BDBDBD;
	line-height: 40px;
	padding-left: 10px;
}

#emailConfirm {
	height: 33px;
	position: absolute;
	right: 10px;
	top: 5px;
	border: 1px solid #BDBDBD;
}

/* 이메일 전송 버튼*/
#emailsendBtn {
	height: 33px;
	position: absolute;
	right: 10px;
	top: 40px;
	border: 1px solid #BDBDBD;
}

/* 이메일 적는 input */
.box_email {
	width: 200px;
	height: 40px;
	/*background:red; */
	position: absolute;
	top: 37px;
}

#emailPopClose {
	width: 50px;
	position: absolute;
	bottom: 0px;
	right: 10px;
}

#emailResend {
	position: absolute;
	bottom: 3px;
	left: 10px;
}

.btn_small_button {
	display: inline-block;
	width: 110px; /* 너비 */
	height: 25px; /* 높이 */
	line-height: 19px; /* 글자의 수직 정렬 */
	text-align: center; /* 글자의 수평 정렬 */
	font-weight: 600; /* 글자 굵기 */
	font-size: 14px; /* 글자 크기 */
	color: #424242; /* 글자색 */
	background: transparent; /* 배경색 */
	cursor: pointer; /* 커서 모양 */
	padding: 0px;
	border: none;
}

/* 이메일 전송 버튼*/
.btn_send_button {
	display: inline-block;
	width: 130px; /* 너비 */
	height: 25px; /* 높이 */
	line-height: 19px; /* 글자의 수직 정렬 */
	text-align: center; /* 글자의 수평 정렬 */
	font-weight: 600; /* 글자 굵기 */
	font-size: 14px; /* 글자 크기 */
	color: #424242; /* 글자색 */
	background: transparent; /* 배경색 */
	cursor: pointer; /* 커서 모양 */
	padding: 0px;
	border: none;
}

/* 이메일 input*/
#email1 {
	position: absolute;
	top: 40px;
}

#emailPop.on {
	display: block;
}

.Box_sex {
	width: 200px;
	height: 50px;
	margin-left: 25px;
	display: inline-block;
	position: relative;
}

.Box_sex input {
	position: absolute;
	width: 200px;
	height: 50px;
	display: table;
	border-radius: 4px;
	border: 1px solid black;
	box-sizing: border-box;
	display: none;
}

.Box_sex label {
	display: inline-block;
	width: 200px;
	height: 40px;
	color: #424242;
	vertical-align: middle;
	text-align: center;
	line-height: 40px;
	background: rgb(230, 230, 230);
	cursor: pointer;
	font-size: 18px;
	border: 1px white solid;
}

input[type="radio"]:checked+label {
	background-color: #9E9E9E;
	color: #fff;
}

#lolTierBox {
	position: relative;
}

#lolTierBox img {
	width: 50px;
	height: 50px;
	margin-left: 30px;
}

#lolTierBox div {
	/*background: red;*/
	width: 80px;
	height: 50px;
	line-height: 50px;
	display: inline-block;
	position: absolute;
	font-size: 20px;
	font-weight: bold;
	color: #424242;
}
/*pwdBox*/
#pwdBox {
	position: relative;
}

#pwdBox span {
	width: 150px;
	position: absolute;
	top: 25px;
	color: #424242;
	font-size: 15px;
}

#pwdBox i {
	color: #424242;
}

#pwdConfirmBox {
	position: relative;
}

#pwdConfirmBox span {
	width: 150px;
	position: absolute;
	top: 25px;
	color: #424242;
	font-size: 15px;
}

#pwdConfirmBox i {
	color: #424242;
}

.msg.bad {
	color: #E91E63;
	display: none;
}

.msg.good {
	color: #2196F3;
	display: none;
}

/* 비밀번호 */
#pwdBox.good .good {
	position: absolute;
	right: -120px;
	display: inline;
}

#pwdBox.bad .bad {
	display: inline;
	position: absolute;
	right: -28px;
}

/* 비밀번호 확인 */
#pwdConfirmBox.good .good {
	position: absolute;
	right: -120px;
	display: inline;
}

#pwdConfirmBox.bad .bad {
	display: inline;
	position: absolute;
	right: -120px;
}

#profile {
	display: none;
}

#competitionUpload {
	position: absolute;
	bottom: 20px;
	left: 20px;
	text-align: center;
	font-size: 30px;
	color: #424242;
}

#competitionUpload:hover {
	cursor: pointer;
}

#TextUpload {
	position: absolute;
	left: 15px;
	top: 10px;
	color: #424242;
	font-size: 15px;
	background: rgb(230, 230, 230);
}

canvas {
	position: absolute;
	border: 1px solid #BDBDBD;
	background-size: contain;
	background-repeat: no-repeat;
	right: 10px;
	top: 4px;
}

#phoneBox label {
	position: absolute;
	font-size: 15px;
	left: 15px;
	line-height: 40px;
}

#phoneBox #phoneNumber input {
	height: 28px;
}

#phoneNumber {
	position: absolute;
	left: 90px;
}

#signUpBtn {
	position: absolute;
	left: 0px;
}
</style>

</head>
<body>
	<!--  <h1 class="screen_out">그랑프링글스</h1> -->


	<div id="content" >
		<div id="wrap">
			<!-- 로고 이미지 -->
			<div id="logoBox"></div>
			<!--#logoBox end-->
			<form action="/join" method="post" enctype="multipart/form-data">
				<div id="inputBox">
					<div id="emailBox" class="box_small">
						<label> <input id="email" name="email" type="text"
							placeholder="이메일" class="input_position">
						</label>
						<button id="authenEmail" class="btn_position email" type="button">
							인증하기<a href="#emailPop"></a>
						</button>
					</div>
					<!--emailBox-->
					<div id="pwdBox" class="box_small">
						<label> <input name="password" type="password"
							placeholder="비밀번호" class="input_position" id="pwd"> <span
							class="msg good id"><i class="fas fa-lock"></i> </span> <span
							class="msg bad id"> 영어 6~15자 <i class="fas fa-lock-open"></i></span>
						</label>
					</div>
					<!--pwdBox-->
					<div id="pwdConfirmBox" class="box_small">
						<label> <input type="password" placeholder="비밀번호확인"
							class="input_position " id="pwdConfirm"> <span
							class="msg good id"><i class="fas fa-lock"></i> </span> <span
							class="msg bad id"> <i class="fas fa-lock-open"></i></span>
						</label>
					</div>
					<!--pwdConfirmBox-->
					<div id="nicknameBox" class="box_small">
						<label> <input id="nickname" name="nickname" type="text"
							placeholder="닉네임 " class="input_position ">
						</label>
						<button id=overlapBtn class="btn_position nickname" type="button">중복검사</button>
					</div>
					<!--nicknameBox-->
					<div id="imgBox" class="box_small">
						<div id="competitionImageBox">
							<span id="competitionImage">
								<div for="profile" id="TextUpload">이미지업로드</div>
								<canvas id="canvas" width="150" height="150"></canvas> <label
								id="competitionUpload" class="fas fa-upload"> <input
									name="upload" id="profile" type="file" multiple />
							</label>
							</span>
							<!--.competitionImage end-->
						</div>
						<!--#competitionImageBox end-->
					</div>
					<!--imgBox-->
					<div id="genderBox" class="box_small">
						<span class="Box_sex"> <input type="radio" name="sex"
							value="M" class=male id="r1"><label for="r1">남자</label>
						</span> <span class="Box_sex"> <input type="radio" name="sex"
							value="F" checked="checked" class="female" id="r2"><label
							for="r2">여자</label>
						</span>
					</div>
					<!--sexBox-->
					<div id="phoneBox" class="box_small">
						<label>전화번호</label>
						<div id="phoneNumber">
							<select name="phone1" class=" btn2">
								<option id="Phone1" value="010">010</option>
								<option value="011">011</option>
							</select> - <input id="PhoneNum2" name="phone2" type="text" size="4"
								class="btn2"> - <input id="PhoneNum3" name="phone3"
								type="text" size="4" class="btn2">
						</div>
						<button id=PhoneBtn class="btn_position phone" type="button">
							중복검사</button>

					</div>
					<!--phoneBox-->
					<div id="lolNicknameBox" class="box_small">
						<div>
							<label> <input id="gameNickname" name="gameNickname"
								id="lolInput" type="text" placeholder="롤닉네임 "
								class="input_position btn">
							</label>
							<button type="button" id="lolBtn" class="btn_position">확인</button>
						</div>
					</div>
					<!--lolNicknameBox-->
					<div id="lolTierBox" class="box_small">

						<img src="/img/silver_3.png" alt="">
						<div id="lolTier">
							<input id="gameTier" name="gameTier" readOnly
								class="input_position btn" />
						</div>

					</div>
					<!--lolTierBox-->
					<div class="box_confirm ">
						<button disabled="disabled" id="signUpBtn" type="submit" class="btn_position confirm">가입하기</button>
						<button id="cancelBtn" type="reset" class="btn_position cancel">취소하기</button>
					</div>
				</div>
				<!--inputBox-->

			</form>


			<div id="emailPop" class="">
				<button id="emailResend" class="btn_small_button">인증번호 재발송</button>
				<input id="inpAuthenCode" name="emailResend" class="input_position"
					type="text" placeholder="인증번호">
				<button id="emailConfirm" class="btn_middle_button">확인</button>
				<div id="emailPopClose" class="btn_small_button">CLOSE</div>
			</div>

		</div>
		<!--wrap-->
	</div>
	<!--content-->

	<script src="/js/jquery.js"></script>


	<script>
		var
		//이메일 보내기
		$emailSend = $(".email_send"), $emailPopClose = $('#emailPopClose'), $email = $(".email"), $nickname = $(".nickname"), $phone = $(".phone"), $emailPop = $("#emailPop"), $pwd = $("#pwd"), $pwdConfirm = $("#pwdConfirm"), $pwdBox = $("#pwdBox"), $pwdConfirmBox = $("#pwdConfirmBox"),

		regPwd = /^[\w|\-]{6,20}$/;

		$(document).ready(function() {
			$emailPopClose.click(function() {
				$emailPop.removeClass("on")
			});
		});
		$email.click(function() {
			$emailPop.addClass("on")
		})
		$emailSend.click(function() {
			alert("이메일이 발송되었습니다.")
		})
		// $nickname.click(function () {
		//     alert("가능")
		// })
		// $phone.click(function () {
		//    alert("가능")
		// })

		function validatePwd() {

			var val = $pwd.val();

			if (regPwd.test(val)) {
				$pwdBox.removeClass("bad");
				$pwdBox.addClass("good");
				return true;
			} else if (val == "") {
				$pwdBox.removeClass("good");
				$pwdBox.removeClass("bad");
			} else {
				$pwdBox.removeClass("good");
				$pwdBox.addClass("bad");
				return false;
			}//if~else end

		}//validatePwd() end
		function confirmPwd() {

			var pwdval = $pwd.val();
			var pwdConfirmVal = $pwdConfirm.val();

			if (pwdval == pwdConfirmVal) {
				$pwdConfirmBox.removeClass("bad");
				$pwdConfirmBox.addClass("good");
				return true;
			} else if (pwdConfirmVal == "") {
				$pwdConfirmBox.removeClass("good");
				$pwdConfirmBox.removeClass("bad");
			} else {
				$pwdConfirmBox.removeClass("good");
				$pwdConfirmBox.addClass("bad");
				return false;
			}//if~else end

		}//validatePwd() end

		$pwd.keyup(validatePwd);
		$pwdConfirm.keyup(confirmPwd);

		// image/인지 알아내는 정규식 표현 객체
		var reg = /^image\//;
		$canvas = $("#canvas"), // canvas 제이쿼리 개체
		canvas = $canvas.get(0), // canvas 객체
		ctx = canvas.getContext("2d"); //
		reader = new FileReader(); //

		$("#profile").on(
				"change",
				function() {
					//input type=file요소는 files배열을 가지고 있음
					//각 번지에는 File객체가 들어가 있음

					var file = this.files[0];

					//1) 재대로된 파일인지 확인
					if (file.size <= 0) {
						alert("제대로 된 파일을 선택하세요");
						return;
					}//if end

					if (!reg.test(file.type)) {
						alert("이미지를 선택해주세요!");
					}

					reader.readAsDataURL(file);

					// 다 읽어 로딩 되면
					reader.onload = function(ev) {

						// 다 읽은 결과물(base64인코딩)을 얻음
						var result = reader.result;

						//console.log(result);

						// 이미지 객체 생성
						var img = new Image();

						// 이미지 객체의 src속성에 대입
						img.src = result;

						// 이미지가 로딩되면
						img.onload = function() {
							// img요소로 붙이는거
							//$("body").append(img);

							// 캔버스에 그림을 그림
							// 뒷쪽이 4개가 캔버스가 그려진 영역 0,0 ~ 400,400까지
							ctx.drawImage(img, 0, 0, img.width, img.height, 0,
									0, 150, 150);
						}//load이미지처리

					}// onload 이벤트핸들러

				});//change() end

		//롤 티어 ajax
		function rolltier() {
			var name = $("#lolInput").val();
			alert(name);
			$.ajax({

				url : "ajax/rolltier.jsp?name=" + name,
				error : function(xhr, error, code) {

					alert(error);

				}, //error() end

				success : function(data) {

					$("#lolTier").text(data.gameTier)
				}

			});

		}
		$("#lolBtn").click(function() {
			$("#gameTier").val("SILVERIII");
		})

		//닉네임 중복검사

		function nickNameFind() {
			var nickname = $("#nickname").val();
			$.ajax({
				url : "ajax/userNickname.jsp",
				error : function(xhr, error, code) {

					alert("사용가능한 닉네임 입니다");
				},
				success : function(data) {

					$(data).each(function() {

						//alert(this.nickname);

						if (this.nickname == nickname) {
							alert("사용가능한 닉네임 입니다");
							return false;

						} else {
							alert("사용가능한 아이디 입니다");
							return false;
						}

					});

				}
			});

		}
		$("#overlapBtn").click(nickNameFind);

		//핸드폰 번호

		function phoneFind() {

			var phone1 = $("#Phone1").val();
			phone2 = $("#PhoneNum2").val();
			phone3 = $("#PhoneNum3").val();

			var phone = phone1 + phone2 + phone3;

			$.ajax({
				url : "ajax/userPhone.jsp",
				error : function(xhr, error, code) {

					alert(error);

				},
				success : function(data) {

					$(data).each(function() {

						//alert(this.phone);

						if (this.phone == phone) {
							alert("중복입니다");
							return false;

						} else {
							alert("사용가능한 번호 입니다");
							return false;
						}

					});

				}
			});

		}
		$("#PhoneBtn").click(function() {
			alert("사용가능한 번호 입니다.")
		});

		var $listPopupDots = $("#listPopupDots");
		//dots 버튼 클릭시 하위메뉴 보이기, 보이지않기
		$(".dots").on("click", function(e) {
			//문제 3. 이것좀 세련되게 보이기.
			$listPopupDots.slideToggle();
			return false;

		});

		$("body").on("click", function() {
			$listPopupDots.slideUp();
		})

		
		
		
		var emailKey;
		//이메일 인증 코드를 받는 ajax   
		$("#authenEmail").on("click", function() {
			$.ajax({
				url : "/sendMail/auth.grnd",
				data : {
					email : $("#email").val()
				},
				dataType : "json",
				type : "post",
				success : function(json) {

					emailKey = json.key;
				},
				error : function(xhr, error, code) {

					alert("이메일 형식이 잘못되었습니다. 다시 확인해주세요.");
				}
			})

		});

		var code = "";
		function mailCheck() {
			$.ajax({
				url : "/ajax/mail.grnd",
				type:"post",
				dataType : "json",
				data :{
					code : $("#inpAuthenCode").val()
				},
				error : function(xhr, error, code) {

					
					alert("인증번호가 틀렸습니다! 다시 정확하게 입력하세요!");

					
					
					
				},
				success : function(json) {
					
					alert("이메일 인증에 성공하였습니다!");
					$("#emailPop").removeClass();
					
					$("#signUpBtn").attr('disabled',false);
					
					
				}
			});

		}//mailCheck end
		

		
		$("#emailConfirm").click(function () {
			mailCheck();
			
		});
		
	</script>



</body>
</html>