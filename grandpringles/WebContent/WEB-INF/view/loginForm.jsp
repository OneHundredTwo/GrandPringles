<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>로그인화면</title>
    <%@include file="/WEB-INF/template/noTmplLink.jsp" %>
    <link rel="icon" href="img/favicon.ico">
    <style>

        html {
            height: 100%;

        }

        body {
            height: 100%;
            font-family:'Noto Sans KR',sans-serif;
        }

        #content {
            height: 100%;
        }

        #logoBox {
            margin: auto;
            width: 500px;
            height: 200px;
            position: absolute;
            left: 50%;
            top: 60%;
            margin: -400px 0 0 -250px;
            background-image: url("img/logo.png");
            background-size:contain;
            background-repeat: no-repeat;
            background-position: center;
        }
        #intro {
            width: 100%;
            height: 100%;
            position: fixed;
            left: 0;
            top: 0px;
            transition: .5s cubic-bezier(1,.01,.8,1.16) .3s;
        }
        #loginBox {
            width: 1200px;
            height: 420px;
            position: absolute;
            left: 50%;
            top: 60%;
            margin: -200px 0 0 -600px;
            z-index: 1;
            text-align: center;

        }
        #loginBox>h1 {
            font-weight:700;
            font-size:50px;
            color:#fff;
            margin-bottom:20px;
        }

        #loginBox input, #loginBtn {
            width: 450px;
            height: 50px;
            padding: 5px 10px;
            border: 1px solid #424242;
            font: 300 20px/50px "Noto Sans KR", sans-serif;
            margin: 4px auto;
            background: rgba(255,255,255,.1);
            color: #000;
            transition: .2s ease;
            position: relative;
            display: block;
        }
        #loginBox input:focus {
            background: rgba(255,255,255,.9);

        }
        #loginBtn {
            width: 210px;
            cursor: pointer;
            display: inline-block;
            box-sizing: content-box;
            background: rgba(255,255,255,.5);
            box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24);
            color: #444;
            position: absolute;
            top: 225px;
            left: 365px;

        }

        #loginBtn:hover {
            background: rgba(255,255, 255,1);
            color: #000;
            font-weight: bold;
        }

        #joinLink {
            width: 210px;
            height: 50px;
            padding: 5px 10px;
            font: 300 20px/50px "Noto Sans KR", sans-serif;
            margin: 4px auto;
            background: rgba(255,255,255,.5);
            color: #444;
            transition: .2s ease;
            position: relative;
            display: block;
            text-decoration: none;
            border: 1px solid #424242;
            box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24);
            position: absolute;
            top: 225px;
            right: 365px;

        }
        #joinLink:hover {
            background: rgba(255,255, 255,1);
            font-weight: bold;
            color:#000;
        }

        #videoContainer {
            width: 100%;
            height: 110%;
            position: absolute;
            left: 0;
            top:-50px;
            overflow: hidden;
            opacity: 0.5;

        }
        #videoContainer::after {
            content: "";
            width: 100%;
            height: 100%;
            display: block;
            position: absolute;
            left: 0;
            top: 0px;
            background: rgba(0,0,0,.5);
        }
        #videoContainer > video {
            min-width: 100%;
            min-height: 100%;
        }

        /* 메세지 출력*/
        #msgBox {
            margin:10px;
            position: absolute;
            text-align: center;
            color:#000;
            font-size:21px;
            font-weight: 500;
            display: none;
            top: 195px;
            left: 430px;
        }

    </style>
  <!-- 로그인 안될때 메시지 뿌려야함 -->

</head>
<body>
<div id="content">
    <div id="intro">
        <div id="logoBox">


        </div>
        <div id="loginBox">
            <h1>로그인이 필요합니다.</h1>
            <form action="/session" method="post">
                <fieldset>
                    <legend class="screen_out">로그인폼</legend>
                    <label for="email" class="screen_out">아이디</label>
                    <input type="text" autofocus required
                           id="email" name="email" placeholder="이메일" title="이메일을 입력해주세요."/>
                    <label for="pwd" class="screen_out">비밀번호</label>
                    <input type="password" required
                           id="pwd" name="password" placeholder="비밀번호" title="비밀번호를 입력해주세요."/>
                    <!-- 메세지 출력 박스 -->
                    <div id="msgBox">아이디나 비밀번호가 잘못되었습니다.</div>
                    <button id="loginBtn" title="로그인버튼">로그인</button>
                </fieldset>
            </form>
            <a id="joinLink" href="signUp.jsp">회원가입</a>
        </div>
        <div id="videoContainer">
            <video autoplay loop id="video">
                <source src="/video/loop.mp4"/>
            </video>
        </div>
    </div>
</div>
<script src="js/jquery.js"></script>



</body>
</html>
 
			
			