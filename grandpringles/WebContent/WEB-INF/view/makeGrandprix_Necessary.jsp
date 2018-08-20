<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

                <%@ taglib prefix = "c"
uri="http://java.sun.com/jsp/jstl/core_1_1"
 %>
 <!-- fmt JSTL -->
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <c:if test="${loginUser==null }">
 	<script >
		alert("로그인이 안되었습니다.")
		location.href="/session";
	
	</script>
 </c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>대회만들기-필수사항</title>
    <%@include file="/WEB-INF/template/link.jsp" %>
    
    <link rel="stylesheet" href="/css/competition_common.css"/>
    <style>

        /*
            박민호 CSS 순서

            < CSS 순서 >
            - 요소크기
                너비
                높이
                배경색
            - 폰트 설정
                글자크기
                글자굵기
                글자색
            - 정렬
                폰트정렬 (수직)
                폰트정렬 (수평)

            - 효과
                요소 기본 효과
                border or outline

            - 기타
                float (떠 있게 하는거)
                position
                상대적위치표현(top,right,bottom,left)
                margin
                padding

            < 변수명 >
            id - 낙타표기법
            class - 언더바 표기법
            * 변수명에 관련된 용어는 최대한 사전적 의미의 검색 후 풀 스펠링 기입
            변수명에 요소가 들어가는 경우
            id - 요소명이 뒤에 위치 ex) loginBtn
            class - 요소명이 앞에 위치 ex) btn_login

        */

        /* < 대회(competition) 만들기(Make) 탭(Tab) > */
        #competitionMakeTab {
            /* 강사님이 이 이상 크게 만들지말라고 함 */
            width: 1200px;
            height: 100px;
            background: red;
            margin: auto;
        }
        /* #competitionMakeTab 안에 있는 a와 i의 공통요소 CSS */
        #competitionMakeTab>button, #competitionMakeTab>i, #competitionMakeTab>a {
            height: 100px;                              /*높이*/
            background: #212121;                        /*배경색*/
            font-size: 30px;                            /*글자크기*/
            color: #FFF176;                             /*글자색상*/
            line-height: 100px;                         /*폰트수직정렬*/
            text-align: center;                         /*폰트수평정렬*/
            float: left;                                /*떠 있음*/
            text-decoration: none;
            border:none;
        }
        /* #competitionMakeTab 안에 있는 a요소 CSS */
        #competitionMakeTab>a{
            width: 200px;                               /*너비*/
            font-weight: 500;                           /*글자굵기*/
            text-decoration: none;                      /*요소기본효과제거*/
        }
        /* #competitionMakeTab 안에 있는 a요소 CSS */
        #competitionMakeTab>button{
            width: 200px;                               /*너비*/
            font-weight: 500;                           /*글자굵기*/
            text-decoration: none;                      /*요소기본효과제거*/
        }
        /* #competitionMakeTab 안에 있는 i요소 CSS */
        #competitionMakeTab>i {
            width: 50px;                                /*너비*/
            font-weight: 700;                           /*글자굵기*/
        }
        /* 기본정보 페이지에 해당하므로 CSS 재 정의 */
        #competitionMakeTab #basicInformation {
            background: rgb(247,247,247);                        /*배경색*/
            font-weight: 700;                           /*글자굵기*/
            color: #000;                                /*글자색상*/
        }
        /* 기본정보 탭과 그 다음 요소 '>>'에 대한 공통:hover */
        #competitionMakeTab #basicInformation:hover+.fa-angle-double-right, #competitionMakeTab #basicInformation:hover {
            background:  #FFF176;                       /*배경색*/
            color: #000;                                /*글자색상*/
            transition: .3s ease;                       /*0.3초에 거친 효과적용*/
        }


        /* < 다단설정 > */
        /* 한 페이지에 보다 깔끔한 배열을 위해 다단을 도입 다단이 2개일 경우 총 3공간으로 분열 */
        /* 모든 단의 공통 요소 */
        #firstDan, #secondDan, #thirdDan {
            height: 800px;                              /*높이*/
            background: rgb(247,247,247);                        /*배경색*/
            float: left;                                /*떠 있음*/
            position: relative;                         /*모든 자식들의 absolute에 대한 포지셔닝컨테스팅*/

        }
        /* 첫번째 단과 두번째 단의 공통요소 */
        #firstDan, #secondDan {
            border-right: 5px solid rgb(200,200,200);            /*오른쪽만 border 5px*/
        }
        /* 첫번째 단 */
        #firstDan {
            width: 450px;                               /*너비*/
        }
        /*두번째 단*/
        #secondDan {
            width: 430px;                               /*너비*/
        }
        /*세번째 단*/
        #thirdDan {
            width: 310px;                                /*너비*/
        }




        /* < 대회(competition) 이름(Name) 담는 틀(Box) > */
        /* #competitionNameBox 안에 있는 label요소 CSS */
        #competitionNameBox>label{
            /* 위치 설정 */
            left: 20px;
            top: 10px;
        }

        /* #competitionNameBox 안에 있는 lnput요소 CSS */
        #competitionNameBox>input {
            width: 290px;                               /*너비*/
            /* 위치 설정 */
            left: 20px;
            top: 45px;
        }

        #channelIdBox>label{
            /* 위치 설정 */
            left: 20px;
            top: 90px;
        }

        /* #competitionNameBox 안에 있는 lnput요소 CSS */
        #channelIdBox>input {
            width: 290px;                               /*너비*/
            /* 위치 설정 */
            left: 20px;
            top: 125px;
        }

        /* < 대회(competition) 공개(Show)여부 정보를 담는 틀(Box) > */
        /* #competitionShowBox 안에 있는 label요소 CSS */
        #competitionShowBox>label {
            /* 위치 설정 */
            left: 20px;
            top: 165px;
        }

        /* #competitionShow CSS */
        #competitionShow {
            /* 위치 설정 */
            left: 20px;
            top: 194px;
        }


        /* < 대회(competition) 이미지(Image) 담는 틀(Box) > */
        /* #competitionImageBox 안에 있는 label요소 CSS */
        #competitionImageBox>label {
            /* 위치 설정 */
            left: 20px;
            top: 220px;
        }
        /* #competitionImageBox 안에 있는 canvas요소 CSS */
        #competitionImageBox canvas {
            border: 3px solid #424242;
            position: absolute;                         /*상대적위치적용*/
            /* 위치 설정 */
            top: 260px;
            right:20px;
        }
        /* 파일업로드(#profile) 숨김 */
        #profile {
            display: none;
        }
        /* 파일업로드 버튼 이미지 */
        #competitionUpload {
            font-size: 40px;                            /*글자크기*/
            color: #000;                                /*글자색*/
            border: none;                               /*border*/
            cursor: pointer;                            /*커서모양*/
            position: absolute;                         /*상대적위치적용*/
            /* 위치 설정 */
            bottom: 90px;
            right: 30px;
        }
        /* 파일업로드 버튼:hover */
        #competitionUpload:hover {
            color: red;
        }


        /* < 참가(participation) 유형(Type) 담는 틀(Box) > */
        /* #participationTypeBox 안에 있는 label요소 CSS */
        #participationTypeBox>label {
            /* 위치 설정 */
            left: 20px;
            top: 20px;
        }
        /* #participationType CSS */
        #participationType {
            /* 위치 설정 */
            left: 20px;
            top: 60px;
        }


        /* < 진행(progress) 인원(Person) 담는 틀(Box) */
        /* 참가유형에서 팀전 check시 나타남 */
        #progressPersonBox {
            display: none;
        }
        /* #progressPersonBox 안에 있는 label요소 CSS */
        #progressPersonBox>label {
            height: 33px;                               /*높이 재정의(10% 늘림)*/
            line-height: 33px;                          /*폰트수직정령 재정의(높이에 맞춰서 변화)*/
            /* 위치 설정 */
            left: 20px;
            top: 120px;
        }
        /* #progressPersonBox 안에 있는 input요소 CSS */
        #progressPersonBox>input {
            height: 33px;                               /*높이 재정의(10% 늘림)*/
            width: 140px;                               /*너비*/
            /* 위치 설정 */
            right: 50px;
            top: 120px;
        }
        /* #progressPersonBox 안에 있는 input:hover */
        #progressPersonBox>input:hover {
            transform: none;                            /*버튼때문에 transform 초기화하여 재정의*/
        }
        /* #progressPersonBox 안에 있는 up 버튼 CSS */
        #progressPersonBox .up {
            top: 123px;
        }
        /* #progressPersonBox 안에 있는 down 버튼 CSS */
        #progressPersonBox .down {
            top: 138px;
        }


        /* < 최대(max) 참가(participation) 인원(Person) 담는 틀(Box) */
        /* #maxParticipationPersonBox 안에 있는 label요소 CSS */
        #maxParticipationPersonBox>label {
            height: 33px;                               /*높이 재정의(10% 늘림)*/
            line-height: 33px;                          /*폰트수직정령 재정의(높이에 맞춰서 변화)*/
            /* 위치 설정 */
            left: 20px;
            top: 180px;
        }
        /* #maxParticipationPersonBox 안에 있는 input요소 CSS */
        #maxParticipationPersonBox>input {
            height: 33px;                               /*높이 재정의(10% 늘림)*/
            width: 140px;                               /*너비*/
            /* 위치 설정 */
            right: 50px;
            top: 180px;
        }
        /* #progressPersonBox 안에 있는 input:hover */
        #maxParticipationPersonBox>input:hover {
            transform: none;                            /*버튼때문에 transform 초기화하여 재정의*/
        }
        /* #maxPersonBox 안에 있는 up 버튼 CSS */
        #maxParticipationPersonBox .up {
            top: 183px;
        }
        /* #maxPersonBox 안에 있는 down 버튼 CSS  */
        #maxParticipationPersonBox .down {
            top: 198px;
        }


        /* < 대기(wait) 인원(Person) 담는 틀(Box) */
        /* #waitPersonBox 안에 있는 label요소 CSS */
        #waitPersonBox>label {
            height: 33px;                               /*높이 재정의(10% 늘림)*/
            line-height: 33px;                          /*폰트수직정령 재정의(높이에 맞춰서 변화)*/
            /* 위치 설정 */
            left: 20px;
            top: 240px;
        }
        /* #waitPersonBox 안에 있는 lnput요소 CSS */
        #waitPersonBox>input {
            height: 33px;                               /*높이 재정의(10% 늘림)*/
            width: 140px;                               /*너비*/
            /* 위치 설정 */
            right: 50px;
            top: 240px;
        }
        /* #waitPersonBox 안에 있는 input:hover */
        #waitPersonBox>input:hover {
            transform: none;                            /*버튼때문에 transform 초기화하여 재정의*/
        }
        /* #waitPersonBox 안에 있는 up 버튼 CSS */
        #waitPersonBox .up {
            top: 243px;
        }
        /* #waitPersonBox 안에 있는 down 버튼 CSS */
        #waitPersonBox .down {
            top: 258px;
        }

        /* < 추가(add) 관리자(Manager)설정 담는 틀(Box) */
        /* #addManagerBox 안에 있는 label요소 CSS */
        #addManagerBox>label {
            width: 360px;                               /*너비*/
            border-radius: 0px;                         /*둥근보더 삭제(재정의)*/
            /* 위치 설정 */
            left: 30px;
            top: 310px;
        }
        /* #addManagerBox 안에 있는 input요소 CSS */
        #addManagerBox>input {
            width: 350px;                               /*너비*/
            /* 위치 설정 */
            left: 30px;
            top: 346px;
            border-top: 0px;                            /*border-top 삭제(재정의)*/
        }
        /* #addManagerBox 안에 있는 #insertBtn(유일한 버튼 요소이므로 id값 부여) CSS */
        #addManagerBox #insertBtn {
            width: 30px;                                /*너비*/
            height: 30px;                               /*높이*/
            background: #fff;                    /*배경색*/
            box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24);
            border: none;
            cursor: pointer;
            border-radius: 30px;
            position: absolute;
            left: 360px;
            top: 347px;
        }
        
        #addManagerUl {
            height: 400px;
		    position: absolute;
		    background: #fff;
		    left: 30px;
		    z-index: 2;
		    top: 380px;
		    width: 360px;       
        }
        
        /* #addManagerUl 안에 있는 li_header CSS */
        #addManagerUl>.li_header {
            /* 위치 설정 */
            top: 0px;
            left: -3px;
            width: 360px;
            height: 30px;
            font-weight: 700;
            border: 3px solid #fff;
            border-top: none;
        }
        /* #addManagerUl 안에 있는 li_content CSS */
        #addManagerUl .li_content {
            /* 위치 설정 */
            top: 67px;
            left: -3px;
        }
        /* #addManagerUl>.li_header 안의 모든 li 요소  */
        #addManagerUl>.li_header>li  {
            background: #E0E0E0;
            color: #424242;
            font-size: 20px;
            height: 30px;
            position: absolute;
            top: 0;
        }
        /* #addManagerUl>.li_header 안의 로고 li 요소  */
        #addManagerUl>.li_header>.li_profile{
            width: 75px;
            left:7px;
            top:5px;
            border: 1px solid #424242;
        }
        /*  #addManagerUl>.li_header 안의 사용자 닉네임 요소  */
        #addManagerUl>.li_header>.li_nickname{
            width: 192px;
            left: 84px;
            top:5px;
            border-top: 1px solid #424242;
            border-bottom: 1px solid #424242;
        }
        /*  #addManagerUl>.li_header 안의 사용자 추가 버튼 요소  */
        #addManagerUl>.li_header>.li_button{
            width: 76px;
		    top: 5px;
		    left: 276px;
		    border: 1px solid #424242;
        }

        /* .li_content>.li_profile 안의 공통 CSS 요소  */
        .li_content>.li_profile {
            width: 75px;
            background-image: url("/img/batboy.jpg");            
     		border: 1px solid #424242;
            background-size: cover;
        }
        /* .li_content>.li_nickname 안의 공통 CSS 요소  */
        .li_content>.li_nickname {
		    width: 192px;
		    line-height: 80px;
		    font-size: 25px;
		    background: rgb(235,235,235);
		    left: 87px;
		    border-top: 1px solid #424242;
            border-bottom: 1px solid #424242;
        }
        /* .li_content>.li_button 안의 공통 CSS 요소  */
        .li_content>.li_button {    
		    border: 1px solid #424242;
            text-align: center;
        }

        /* #addManagerUl>.li_content 안의 모든 li 요소  */
        #addManagerUl>.li_content>li  {
            position: absolute;
            height: 70px;
        }
        /* #addManagerUl>.li_content 안의 사용자 프로필 사진 */
        #addManagerUl>.li_content>.li_profile {
            top: -26px;
            left: 10px;
        }
        /* #addManagerUl>.li_content 안의 사용자 닉네임 */
        #addManagerUl>.li_content>.li_nickname {
            top: -26px;
        }
        /* #addManagerUl>.li_content 안의  사용자 추가 버튼*/
        #addManagerUl>.li_content>.li_button {
            width: 75px;
		    height: 70px;
		    line-height: 80px;
		    font-size: 40px;
		    background: #E0E0E0;
		    top: -26px;
		    left: 280px;
		    cursor: pointer;
        }

        /* < 추가된(added) 관리자(Manager)리스트를 담는 틀(Box) */
        /* #addedManagerUl 안에 있는 label요소 CSS */
        #addedManagerUl>label {
            width: 360px;                               /*너비*/
            border-radius: 0px;                         /*둥근보더 삭제(재정의)*/
            left: 30px;
            top: 495px;
        }
        /* #addedManagerUl>.li_content 안의 모든 li 요소  */
        #addedManagerUl>.li_content>li  {
            position: absolute;
            height: 80px;
        }
        /* #addedManagerUl>.li_content 안의 사용자 프로필 사진 */
        #addedManagerUl>.li_content>.li_profile {
            top: 531px;
            left: 5px;
        }
        /* #addedManagerUl>.li_content 안의 사용자 닉네임 */
        #addedManagerUl>.li_content>.li_nickname {
            top: 531px;
            left: 82px;
        }
        /* #addedManagerUl>.li_content 안의  사용자 추가 버튼*/
        #addedManagerUl>.li_content>.li_button {
          
            width: 75px;
		    height: 80px;
		    line-height: 80px;
		    font-size: 40px;
		    background: #E0E0E0;
		    top: 531px;
		    left: 274px;
		    cursor: pointer;
        }

		
        /* < 안내(add) 창(Window) 담는 틀(Box) */
        /* #guideWindowBox 안에 있는 label요소 CSS */
        #guideWindowBox>label {
            position: fixed;
            left: 1320px;
            top: 255px;
        }
        /* < 안내(add)창 내용(Content)을 담는 틀(Box) */
        /* #guideContent CSS */
        #guideContent {
            width: 250px;
            height: 600px;
            background: #E1F5FE;
            text-align: center;
            line-height: 100px;
            position: fixed;
            left: 1273px;
            top: 295px;
            font-size: 20px;
        }
        /* #guideContentImage CSS */
        #guideContentImage {
            margin: auto;
            width: 200px;
            height: 180px;
            background-image: url("img/team_logo.jpg");
            background-size: cover;
        }
		#guideWindowBox{
			display:none;
		}
		#addManagerUl{
			display:none;
		}
		
		#addManagerUl.on{
			display:block;
		}

		.li_content .li_button{
			cursor:pointer;
		}
		
		.li_content.on{
			display:block;
		}
    </style>

</head>
<body>
<h1 class="screen_out">그랑프링글스</h1>
<h2 class="screen_out">대회만들기</h2>

<%@include file="/WEB-INF/template/header.jsp" %><!--header-->

<div id="content">
    <!--대회만들기탭-->
    <form action="/make/participations" method="post"  enctype="multipart/form-data">
    
    <div id="competitionMakeTab">
        <!-- 해당 탭들은 유일하므로 id값 부여 -->
        <a id="basicInformation" href="makeGrandprix_Necessary.jsp">기본정보</a><i class="fas fa-angle-double-right"></i>
        <button id="participant">참가자</button><i class="fas fa-angle-double-right"></i>
        <a id="clauseEstablish" href="makeGrandprix_Terms.jsp">약관설정</a><i class="fas fa-angle-double-right"></i>
        <a id="competitionMethod" href="makeGrandprix_Method.jsp">대회방식</a><i class="fas fa-angle-double-right"></i>
        <a id="confirm" href="makeGrandprix_Complete.jsp">완료</a>

    </div><!--#competitionMakeTab end-->

    <!--모든 폼의 input 값들을 넘겨주기 위한 단을 감싸는 가장 큰 틀-->
    <div id="wrap">

            <!--첫번째 단-->
            <div id="firstDan">
                <!--대회 제목-->
                <div id="competitionNameBox">
                    <label class="label_css">대회 제목</label>
                    <input class="input_css" type="text" id="competitionName" name="title" placeholder="대회제목을 입력해주세요" title="대회제목을 입력해주세요."/>
   
                </div><!--#competitionNameBox end-->
                
                
                <div id= "channelIdBox">
                    <label class="label_css">Channel ID</label>
                    <input class="input_css" type="text" id="channelId" name="channelId" placeholder="채널 ID를 입력해주세요" title="채널 ID를 입력해주세요"/>
                
                </div>

                <!--대회 공개 여부-->
                <div id="competitionShowBox">
                    <label class="label_css">대회 공개여부</label>
                    <!-- 대회 공개 여부에 관한 라디오 박스를 담은 틀 해당 id와 radio의 name을 맞춰준다. -->
                    <span id="competitionShow" class="radio_css">
                         <label for="open" class="open radio_label_left">공개
                             <input name="isShow" value="T" type="radio" checked="checked" id="open" class="radio_input_left"/>
                         </label>
                         <label for="close" class="close radio_label_right">비공개
                             <input name="isShow" value="F" type="radio" id="close" class="radio_input_right"/>
                         </label>
                    </span><!--#competitionShow end-->
                </div><!--#competitionShowBox end-->

                <!--대회 이미지-->
                <div id="competitionImageBox">
                    <label class="label_css">대회 이미지</label>
                    <!--대회 이미지와 업로드 버튼을 담은 틀-->
                    <span id="competitionImage">
                        <canvas id="canvas" width="400" height="400"></canvas>
                            <!-- 유일한 라벨들 이므로 id 부여-->
                            <label id="competitionUpload" class="fas fa-upload">
                            <input id="profile" name = "upload" type="file" multiple/>
                            </label>
                    </span><!--.competitionImage end-->
                </div><!--#competitionImageBox end-->
            </div><!--#firstDan end-->

            <div id="secondDan">
                <!--참가유형-->
                <div id="participationTypeBox">
                    <label class="label_css">참가유형</label>
                    <span id="participationType" class="radio_css" >
                        <label for="solo" class="solo radio_label_left">개인전
                             <input id="solo" name="partType" type="radio" checked="checked" value="P" class="radio_input_left"/>
                        </label>
                        <label for="team" class="team radio_label_right" >팀전
                             <input id= "team" name="partType" type="radio"  value="T" class="radio_input_right"/>
                        </label>
                    </span><!--#participationType end-->
                </div><!--#participationTypeBox end-->

                <!--진행인원-->
                <div id="progressPersonBox">
                    <label class="label_css" for="progressPerson">진행인원</label>
                    <button class="button_css up"><i class="far fa-caret-square-up"></i></button>
                    <button class="button_css down"><i class="far fa-caret-square-down"></i></button>
                    <input class="input_css" type="text" autofocus required id="progressPerson" name = "membersPerTeam" value="1" />
                </div><!--#progressPersonBox end-->

                <!--최대참가인원-->
                <div id="maxParticipationPersonBox">
                    <label class="label_css" for="maxPerson">최대참가인원</label>
                    <button class="button_css up"><i class="far fa-caret-square-up"></i></button>
                    <button class="button_css down"><i class="far fa-caret-square-down"></i></button>
                    <input class="input_css" type="text" autofocus required id="maxPerson" value="명/팀"  name = "maxParticipant"/>
                </div><!--#maxPersonBox end-->

                <!--대기인원-->
                <div id="waitPersonBox">
                    <label class="label_css" for="WaitPerson">대기인원</label>
                    <button class="button_css up"><i class="far fa-caret-square-up"></i></button>
                    <button class="button_css down"><i class="far fa-caret-square-down"></i></button>
                    <input class="input_css" type="text" autofocus required id="WaitPerson"value="명" name ="waitParticipant"/>
                </div><!--#maxPersonBox end-->

                <!--추가 관리자 설정-->
                <div id="addManagerBox">
                    <label class="label_css"for="WaitPerson">추가 관리자 설정</label>
                    <input class="input_css"type="text"   id="addManager"
                     placeholder="닉네임을 적어주세요" title="닉네임을 적어주세요."/>
                    <button type = "button" id="insertBtn"><i class="fas fa-search"></i></button>
                </div><!--#addManagerBox end-->

                <!--추가 관리자 리스트-->
                <div id="addManagerUl">
                    <ul class="li_Box_css li_header list_Manager">
                        <li class="li_profile">로고</li>
                        <li class="li_nickname">사용자 닉네임</li>
                        <li class="li_button">버튼</li>
                    </ul>


                </div>
                <!--추가된 관리자 리스트-->
                <div id="addedManagerUl">
                    <label class="label_css">추가된 관리자 리스트</label>

                </div>
            </div><!--#secondeDan end-->

            <div id="thirdDan">
                <div id="guideWindowBox">
                    <label class="label_css">안내창</label>
                    <div id="guideContent">
                        <p>
                            대회만들기 - 기본정보
                        </p>
                        <div id="guideContentImage">
                        </div>
                        <p>
                            해당 절차에 대한 일을 그림과 설명을 통해 나타냅니다.
                        </p>

                    </div><!--#guideContent end-->
                </div><!--#guideWindowBox end-->

            </div><!--#thirdDan end-->
            <input type= "hidden" name ="no" value="${grnd.grndNo}">
            <input type= "hidden" name ="grndNo" value="${grnd.grndNo}">
    		<input type= "hidden" name ="num" value="${grnd.num}">
            </form>
    </div><!--#wrap end-->
</div><!--#content end-->



                    <script type = "text/template" id ="serchManagerTmp">

		

                    <ul class="li_Box_css li_content manaer">
                        <li class="li_profile"></li>
                        <li class="li_nickname"><@=list.nickname@></li>
                        <li class="li_button"><i class="fas fa-plus-circle"></i></li>
                    </ul>




					</script>

                    <script type = "text/template" id ="addManagerTmp">


                    <ul class="li_Box_css li_content manaer_No">	
                        <li class="li_profile"></li>
                        <li class="li_nickname user_No" ><input type="hidden" name="adminNo" value ="<@=list.no@>"><@=list.nickname@></li>
                        <li class="li_button"><i class="fas fa-minus-circle"></i></li>
                    </ul>


					</script>



<%@include file="/WEB-INF/template/footer.jsp" %><!--footer-->

<%@include file="/WEB-INF/template/js.jsp" %>

<!-- header 템플릿에 관한 script -->
<script>


_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@(.+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
};



</script>

<!-- 참가유형에서 팀전을 클릭 할 때만 진행인원이 뜨도록 설정하는 script -->
<script>
    $("#team").on("click",function () {
        $("#progressPersonBox").css("display","block");
    });
    $("#solo").on("click",function () {
        $("#progressPersonBox").css("display","none");
    });
</script>

<!-- canvas 이미지 그리기를 위한 script -->
<script>
    // image/인지 알아내는 정규식 표현 객체
    var reg = /^image\//;
    $canvas = $("#canvas"), // canvas 제이쿼리 개체
        canvas = $canvas.get(0),    // canvas 객체
        ctx = canvas.getContext("2d"); //
    reader = new FileReader(); //

    $("#profile").on("change",function () {
        //input type=file요소는 files배열을 가지고 있음
        //각 번지에는 File객체가 들어가 있음

        var file = this.files[0];

        //1) 재대로된 파일인지 확인
        if(file.size<=0) {
            alert("재대로 된 파일을 선택하세요");
            return;
        }//if end


        if(!reg.test(file.type)) {
            alert("이미지를 선택해주세요!");
        }

        reader.readAsDataURL(file);

        // 다 읽어 로딩 되면
        reader.onload = function (ev) {

            // 다 읽은 결과물(base64인코딩)을 얻음
            var result = reader.result;


            //console.log(result);

            // 이미지 객체 생성
            var img = new Image();

            // 이미지 객체의 src속성에 대입
            img.src = result;

            // 이미지가 로딩되면
            img.onload = function () {
                // img요소로 붙이는거
                //$("body").append(img);

                // 캔버스에 그림을 그림
                // 뒷쪽이 4개가 캔버스가 그려진 영역 0,0 ~ 400,400까지
                ctx.drawImage(img,0,0,img.width,img.height,0,0,400,400);
            }//load이미지처리

        }// onload 이벤트핸들러

    });//change() end
    
    

    
    $("#addedManagerUl .li_content .li_button").on("click",function(){
    	$("#addedManagerUl .li_content").addClass("on");
    	$(this).parent().removeClass("on");
    });
    
    $("#insertBtn").on("click",function(){
    	$("#addManagerUl").addClass("on");
    	$("#addManagerUl .li_content").addClass("on");
    });
    
    $(".button_css.up").on("click",function(){
    	var inputval = $(this).parent().find(".input_css");
    	if(inputval.val()=="명/팀"||inputval.val()=="명"){
    		inputval.val(0);
    	}
    	inputval.val(parseInt(inputval.val())+1);
    });
    $(".button_css.down").on("click",function(){
    	var inputval = $(this).parent().find(".input_css");
    	if(inputval.val()=="명/팀"||inputval.val()=="명"){
    		inputval.val(0);
    	}
    	if(inputval.val()==0){
    		return;
    	}
    	inputval.val(parseInt(inputval.val())-1);
    });
    
    // 참가자 누를때 값 다보내는구문








	//검색구문
	var serchManagerTmp = _.template($("#serchManagerTmp").html());
	var addManagerTmp = _.template($("#addManagerTmp").html());
	var $addManager = $("#addManager");
	var code ="";
	var addcode="";
	function ManagerSearch() {
		$(".manaer").remove();
		var nickname = $addManager.val();
		$.ajax({
			url:"/ajax/selectSearchManager.json?nickname="+nickname,
			dateType :"json",
			error:function() {
				alert("에러")
			},
			success:function(json) {
			    $("#addManagerUl .li_content .li_button").on("click",function(){
			    	$("#addedManagerUl .li_content").addClass("on");
			    	$(this).parent().parent().removeClass("on");
			    });
			    
				code = serchManagerTmp({"list":json})
				addcode = addManagerTmp({"list":json})

				//$("#addManagerUl").empty();
				$("#addManagerUl").append(code);
				
			},
		});

	}
	$("#insertBtn").click(ManagerSearch)
	$("#addManagerUl").on("click",".li_button",function () {
    	$("#addManagerUl").removeClass("on");
		$("#addedManagerUl").append(addcode);
	})
	
		$("#addedManagerUl").on("click",".li_button",function () {
		var idx = $(".manaer_No").index();
		$(".manaer_No").remove();
	})

	</script>

</body>
</html>