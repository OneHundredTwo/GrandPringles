<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>대회만들기-참가자입력사항</title>
    <%@include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/competition_common.css"/>
    <!-- 달력 CSS -->
    <link rel="stylesheet" href="/css/tui-date-picker.css">
    <link rel="stylesheet" href="/css/tui-time-picker.css"/>
    <!-- editor CSS -->
    <link rel="stylesheet" href="/css/codemirror.css">
    <link rel="stylesheet" href="/css/github.css">
    <link rel="stylesheet" href="/css/tui-editor.min.css">
    <link rel="stylesheet" href="/css/tui-editor-contents.min.css">
      <style>

        /* < 대회(competition) 만들기(Make) 탭(Tab) > */
        #competitionMakeTab {
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
        #competitionMakeTab #participant {
            background: rgb(247,247,247);                        /*배경색*/
            font-weight: 700;                           /*글자굵기*/
            color: #000;                                /*글자색상*/
        }
        /* 기본정보 탭과 그 다음 요소 '>>'에 대한 공통:hover */
        #competitionMakeTab #participant:hover+.fa-angle-double-right, #competitionMakeTab #participant:hover {
            background:  #FFF176;                       /*배경색*/
            color: #000;                                /*글자색상*/
            transition: .3s ease;                       /*0.3초에 거친 효과적용*/
        }


        /* < 다단설정 > */
        /* 모든 단의 공통 요소 */
        #firstDan, #secondDan, #thirdDan {
            height: 800px;                              /*높이*/
            background: rgb(247,247,247);                        /*배경색*/
            float: left;                                /*떠 있음*/
            position: relative;                         /*모든 자식들의 absolute에 대한 포지셔닝컨테스팅*/
        }
        /* 첫번째 단과 두번째 단의 공통요소 */
        #firstDan, #secondDan {
            border-right: 5px solid rgb(200,200,200);           /*오른쪽만 border 5px*/
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


        /* < 참가자(participants) 공개(Show)여부를 담는 틀(Box) > */
        /* #participantsShowBox 안에 있는 label요소 CSS */
        #participantsShowBox>label{
            /* 위치 설정 */
            left: 20px;
            top: 20px;
        }
        #participantsShow {
            /* 위치 설정 */
            left: 20px;
            top: 60px;
        }


        /* < 참가자(participantsBox) 모집(Recruitment)여부를 담는 틀(Box) > */
        /* #participantsRecruitmentBox 안에 있는 label요소 CSS */
        #participantsRecruitmentBox>label {
            /* 위치 설정 */
            left: 20px;
            top: 120px;
        }
        #participantsRecruitment {
            /* 위치 설정 */
            left: 20px;
            top: 160px;
        }


        /* < 참가자(participants) 접수(Receipt)여부를 담는 틀(Box) > */
        /* #participantsReceiptBox 안에 있는 label요소 CSS */
        /* 참가자 접수 여부 label */
        #participantsReceiptBox>label {
            /* 위치 설정 */
            left: 20px;
            top: 220px;
        }
        /* 참가자 접수 여부 label */
        #participantsReceipt {
            /* 위치 설정 */
            left: 20px;
            top: 260px;
        }


        /* < 참가자(participants) 접수(Receipt) 설정(Setting)을 담는 틀(Box) > */
        /* 참가 접수 설정 초기 설정은 none을 설정*/
        /* 참가자 접수 여부 label */
        #participantsReceiptSettingBox {
            display: none;        }
        /* #participantsReceiptSettingBox 안에 있는 label요소 CSS */
        #participantsReceiptSettingBox>label {
            /* 위치 설정 */
            left: 20px;
            top: 320px;
        }

        /* 여기는 공통되는 부분이 아니라서 id값으로 때려박음*/
        /* 참가 접수 설정 입력 폼의 위치 이동*/
        #participantsReceiptQuestionFormBox {
            position: absolute;
            left: 20px;
            top: 360px;
            border: 3px solid #fff;
            padding: 10px;
        }
        /* 개최자가 사용자에게 받는 질문이 올라가는 곳 */
        #participantsReceiptQuestionBox {
            width: 390px;
            height: 310px;
            position: absolute;
            left: 20px;
            top: 485px;
            font-size: 15px;
            color: #424242;
            line-height: 15px;
            overflow-y: auto;
        }
        /* 입력 받을 정보를 기입하는 폼의 안의 label */
        #participantsReceiptQuestionFormBox>label {
            height: 50px;
            border: none;
            border-radius: 0px;
            font-size: 15px;
            line-height: 30px;
        }
        /* 개최자는 참가자들에게 묻는 input 요소 */
        #participantsReceiptQuestion{
            height: 30px;
            width: 370px;
            background: transparent;
            padding-left: 10px;
            color: #424242;
        }
        /* 질문을 추가하기 위한 버튼 */
        #participantsReceiptQuestionFormBox #QuestionInsertBtn {
            height: 30px;
            width: 30px;
            position: absolute;
            right: 5px;
            bottom: 5px;
            border-radius: 30px;
            background: #fff;
            border: 3px solid #fff;
            cursor: pointer;
        }

        /* 언더템플릿 css 설정 */
        #participationItem li {
            text-decoration: none;
        }
        #participationItem {
            position: relative;
            border: 3px solid #fff;
            padding: 10px;
            margin-bottom: 10px;
        }
        #participationItem a{
            text-decoration: none;
            position: absolute;
            font-size: 20px;
            top: 10px;
            right: 10px;
            color: #424242;
        }
        #participationItem p {
            margin-bottom: 10px;
        }

        /* < 참가자(participants) 공지(Notice)을 담는 틀(Box) > */
        /* 참가자 공지사항 label */
        #participantsNoticeBox>label {
            /* 위치 설정 */
            left: 20px;
            top: 20px;
        }
        /* 참가자 공지사항 입력란 */
        #participantsNoticeBox .editor {
            width: 390px;
            position: absolute;
            left: 20px;
            top: 60px;
        }

        /* < 참가자(participants) 공지(Notice)을 담는 틀(Box) > */
        /* 대회 기간 label */
        #competitionPeriodBox>label {
            left: 20px;
            top: 220px;
        }

        /* 대회 기간 input 들의 공통 요소 */
        #competitionPeriodStart, #competitionPeriodEnd {
            position: absolute;
            top: 260px;
            background: #fff;
            z-index: 5;
        }

        /* 대회 기간 시작 input */
        #competitionPeriodStart {
            left: 20px;
        }
        /* 대기 기간 사이의 ~ */
        #waveIcon {
            position: absolute;
            top: 265px;
            left: 210px;
            font-size: 20px;
            font-weight: bold;
        }
        /* 대회 기간 끝 input */
        #competitionPeriodEnd{
            left: 240px;
        }


        /* 시작시간 label */
        #startTimeBox>label{
            left: 20px;
            top: 320px;
        }
        /* #timepickerWrapper 가장 바깥쪽의 timepicker 틀 */
        #timepickerWrapper {
            position: absolute;
            left: 20px;
            top: 360px;
            width: 230px;
        }

        /* 시계 정보를 담는 틀*/
        .tui-timepicker-row {
            position: absolute;
            top: 5px;
            left: 0px;
        }
        /* 시간 안에 들어있는 background 틀*/
        .tui-timepicker {
            height: 40px;
        }

        /* 접수마감일 label */
        #receptionDeadlineBox>label {
            left: 20px;
            top: 480px;
        }
        /* 접수마감일 안의 달력 input */
        #receptionDeadline {
            position: absolute;
            background: #fff;
            z-index: 4;
            left: 20px;
            top: 520px;
        }


        /* < 추가(add) 상품(Item)을 담는 틀(Box) > */
        /* 상품 추가 label */
        #addItemBox>label {
            left: 20px;
            top: 20px;
        }
        /* 상품 추가 세부 내용 큰 틀*/
        #addItemCategoryBox {
            width: 280px;
            height: 315px;
            border: 3px solid #fff;
            background: #F5F5F5;
            position: relative;
            top: 60px;
            left: 0px;
            margin: auto;
        }
        /* 상품 추가 공통 input 요소 */
        #addItemCategoryBox>div{
            position: absolute;
        }
        /*누구에게*/
        .whoCategory {
            top: 10px;
        }
        /*~을 (상품내용)*/
        .itemCategory {
            top: 70px;
        }
        /*url*/
        .urlCategory {
            top: 130px;
        }
        /* canvas */
        .itemImage>canvas {
            border: 1px solid #424242;
            position: absolute;
            top: 200px;
            left: 20px;
        }
        .itemImage>#uploadImage {
            width: 100px;
            height: 30px;
            position: absolute;
            top: 210px;
            left: 150px;
            font-size: 15px;
            border-radius: 0px;
            line-height: 30px;
            text-align: center;
            background: #FAFAFA;
        }
        #prixImage {
            display: none;
        }
        .itemImage>#addItemBtn {
            width: 106px;
            height: 30px;
            position: relative;
            top: 260px;
            left: 150px;
            border: 3px solid #fff;
            background: #FAFAFA;
            font-family:'Noto Sans KR',sans-serif;
        }

        /* < 추가된 상품을 보여주는 공간 > */
        /* 공간 크기 및 스크롤 */
        #ItemUlBox {
            position: absolute;
            top: 390px;
            left: 15px;
            width: 280px;
            height: 515px;
            overflow-y: auto;
        }
        /* 언더스코어 li 요소 */
        #addGoods {
            position: relative;
        }
        /* 언더스코어 모든 내용을 담고 있는 div */
        #ItemUlList {
            width: 250px;
            height: 310px;
            padding: 10px;
            border: 3px solid #fff;
            margin-bottom: 10px;
        }

        #addGoods>li>div{
            position: absolute;
        }

        #itemDelete {
            bottom: 10px;
            right: 10px;
        }



        #addGoods .itemCategory>label {
            top: 70px;
        }

        #addGoods .urlCategory>label {
            top: 130px;
        }

        #addedItemImage {
            position: absolute;
            width: 100px;
            height: 100px;
            border: 1px solid #000;
            background-image: url("img/team_logo.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            top: 225px;
            left: 10px;
        }

        #addGoods p {
            position: absolute;
            line-height: 20px;
            margin-left: 5px;
        }

        .whoCategory>p {
            top: 40px;
        }

        .itemCategory>p {
            top: 100px;
        }

        .urlCategory>p {
            top: 160px;

        }



        /* < 안내(add) 창(Window) 담는 틀(Box) */
        /* #guideWindowBox 안에 있는 label요소 CSS */
        #guideWindowBox {
            display: block;
        }
        #guideWindowBox>label {
            position: fixed;
            left: 1620px;
            top: 155px;
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
            left: 1573px;
            top: 195px;
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
    </style>

</head>
<body>
<h1 class="screen_out">그랑프링글스</h1>

<%@include file="/WEB-INF/template/header.jsp" %><!--header-->

<div id="content">
    <!--대회만들기탭-->
        <form action="/make/terms" method="post" >
    <div id="competitionMakeTab">
        <!-- 해당 탭들은 유일하므로 id값 부여 -->
        <a id="basicInformation" href="makeGrandprix_Necessary.jsp">기본정보</a><i class="fas fa-angle-double-right"></i>
        <a id="participant" href="makeGrandprix_Participations.jsp">참가자</a><i class="fas fa-angle-double-right"></i>
        <button id="clauseEstablish">약관설정</button><i class="fas fa-angle-double-right"></i>
        <a id="competitionMethod" href="makeGrandprix_Method.jsp">대회방식</a><i class="fas fa-angle-double-right"></i>
        <a id="confirm" href="makeGrandprix_Complete.jsp">완료</a>
    </div><!--#competitionMakeTab end-->

    <!--모든 폼의 input 값들을 넘겨주기 위한 단을 감싸는 가장 큰 틀-->
    <div id="wrap">

            <!--첫번째 단-->
            <div id="firstDan">

                <!--참가자 공개 여부-->
                <div id="participantsShowBox">
                    <label class="label_css">참가자 공개 여부</label>
                    <span id="participantsShow" class="radio_css" >
                        <label for="participantsShowOpen" class="open radio_label_left">공개
                             <input name="isShowParticipant" type="radio" checked="checked" id="participantsShowOpen" class="radio_input_left" value ="T"/>
                        </label>
                        <label for="participantsShowClose" class="close radio_label_right" >비공개
                             <input name="isShowParticipant" type="radio" id="participantsShowClose" class="radio_input_right" value ="F"/>
                        </label>
                    </span><!--#participantsShow end-->
                </div><!--#participantsShowBox end-->

                <!--참가자 모집 여부-->
                <div id="participantsRecruitmentBox">
                    <label class="label_css">참가자 모집 여부</label>
                    <span id="participantsRecruitment" class="radio_css" >
                        <label for="recruitmentOpen" class="open radio_label_left">공개
                             <input name="isWantedParticipant" type="radio" checked="checked" id="recruitmentOpen" class="radio_input_left" value ="T"/>
                        </label>
                        <label for="recruitmentClose" class="close radio_label_right" >비공개
                             <input name="isWantedParticipant" type="radio" id="recruitmentClose" class="radio_input_right" value ="F"/>
                        </label>
                    </span><!--#participantsRecruitment end-->
                </div><!--#participantsRecruitmentBox end-->

                <!--참가자 접수 여부-->
                <div id="participantsReceiptBox">
                    <label class="label_css">참가 접수 여부</label>
                    <span id="participantsReceipt" class="radio_css" >
                        <label for="receiptOpen" class="open radio_label_left">공개
                             <input name="isApplication" type="radio" id="receiptOpen" class="radio_input_left" value="T"/>
                        </label>
                        <label for="receiptClose" class="close radio_label_right" >비공개
                             <input name="isApplication" type="radio" checked="checked"  id="receiptClose" class="radio_input_right" value="F"/>
                        </label>
                    </span><!--#participantsReceipt end-->
                </div><!--#participantsReceiptBox end-->


                <!--참가 접수 설정 -->
                <div id="participantsReceiptSettingBox">
                    <label class="label_css">참가 접수 설정</label>
                    <!-- 입력 받을 정보를 기입하는 폼 -->
                    <div id="participantsReceiptQuestionFormBox">
                        <label>입력 받을 정보</label>
                        <input type="text" id="participantsReceiptQuestion" placeholder="참가자에게 요구할 정보를 입력해주세요">
                        <label><input type="checkbox" class="mustQuestion">필수입력사항</label>
                        <!--띄어쓰기--> &nbsp
                        <label><input type="checkbox" class="checkImage">참가자 이미지 정보</label>
                        <button id="QuestionInsertBtn"><i class="fas fa-plus-circle"></i></button>
                    </div>
                </div><!--#participantsReceiptSettingBox end-->

                <!-- 입력 받을 정보가 들어가는 공간 -->
                <ul id="participantsReceiptQuestionBox">
                </ul><!--#participantsReceiptQuestionBox end-->
            </div><!--#firstDan end-->

            <!--두번째 단-->
            <div id="secondDan">
                <!--참가 공지 사항 -->
                <div id="participantsNoticeBox">
                    <label class="label_css">참가자 공지사항</label>
                    <div id="participantsNotice">
                        <div class="editor"></div>
                    </div><!--#participantsShow end-->
                </div><!--#participantsNoticeBox end-->

                <!-- 대회 기간 설정 -->
                <div id="competitionPeriodBox">
                    <label class="label_css">대회기간</label>
                    <!--대회 기간 시작 -->
                    <span id="competitionPeriodStart">
                            <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                                <input class="input_calendar_css" type="text" id="datepickerStartInput" aria-label="Date-Time">
                                <span class="tui-ico-date"></span>
                            </div>
                            <div id="wrapper1" style="margin-top: -1px;"></div>
                        </span><!--#competitionPeriodStart end-->
                    <!-- 시간 사이에 물결 표시 넣어주기 위한 span -->
                    <span id="waveIcon"> ~ </span>
                    <!--대회 기간 끝 -->
                    <span id="competitionPeriodEnd">
                            <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                                <input class="input_calendar_css" type="text" id="datepickerEndInput" aria-label="Date-Time">
                                <span class="tui-ico-date"></span>
                            </div>
                            <div id="wrapper2" style="margin-top: -1px;"></div>
                    </span><!--#competitionPeriodEnd end-->
                </div><!--#competitionPeriodBox end-->

                <!-- 시작 시간 설정 -->
                <div id="startTimeBox">
                    <label class="label_css">시작시간</label>
                    <div id="timepickerWrapper"></div>
                    <div id="wrapper" style="margin-top: -1px;"></div>
                </div><!--#startTimeBox end-->

                <!-- 접수 마감일 -->
                <div id="receptionDeadlineBox">
                    <label class="label_css">접수마감일</label>
                    <!--캘린터 모양-->
                    <span id="receptionDeadline">
                        <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                            <input class="input_calendar_css"  type="text" id="datepickerDeadlineInput" aria-label="Date-Time">
                            <span class="tui-ico-date"></span>
                        </div>
                        <div id="wrapper3" style="margin-top: -1px;"></div>
                    </span><!--#receptionDeadline end-->
                </div><!--#receptionDeadlineBox end-->
            </div><!--#secondeDan end-->

            <!--세번째 단-->
            <div id="thirdDan">
                <!--참가 공지 사항 -->
                <div id="addItemBox">
                    <label class="label_css">상품 추가</label>
                    <div id="addItemCategoryBox">
                        <div class="whoCategory">
                            <label class="item_label_css">누구에게</label><input id="whoQuestion" class="item_input_css" type="text" placeholder="내용을 입력해주세요">
                        </div>
                        <div class="itemCategory">
                            <label  class="item_label_css">상품내용</label> <input id="itemQuestion" class="item_input_css" type="text"  placeholder="내용을 입력해주세요">
                        </div>
                        <div class="urlCategory">
                            <label class="item_label_css">URL</label> <input id="urlQuestion" class="item_input_css" type="text" placeholder="내용을 입력해주세요">
                        </div>
                        <span class="itemImage">
                        <canvas id="canvas" width="100" height="100"></canvas>
                            <label id="uploadImage"> 이미지 업로드
                            <input id="prixImage" type="file"/>
                            </label>
                            <button id="addItemBtn">추가</button>
                        </span><!--#itemImage end-->
                    </div><!--#addItemCategoryBox end-->
                </div><!--#addItemBox end-->



                <!-- 리스트 형식으로 상품 추가가 되는 공간 -->
                <ul id="ItemUlBox">

                </ul><!--#ItemUlBox end-->

                <div id="guideWindowBox">
                    <label class="label_css">안내창</label>
                    <div id="guideContent">
                        <p>
                            대회만들기 - 참가자
                        </p>
                        <div id="guideContentImage">
                        </div>
                        <p>
                            해당 절차에 대한 일을 그림과 설명을 통해 나타냅니다.
                        </p>

                    </div><!--#guideContent end-->
                </div><!--#guideWindowBox end-->

            </div><!--#thirdDan end-->
            
            
            		<!--대회회차, 번호, 참가자 공지사항, 대회기간, 시작시간, 접수마감일 보내기-->
            <input type= "hidden" name ="grndNo" value="${grnd.grndNo}">
    		<input type= "hidden" name ="num" value="${grnd.num}">
    		<input type= "hidden" name ="ownerNo" value="${loginUser.no}">
			<input type="hidden" name= "participantAnnounce" value="" id = "participantAnnounce">
			<input type="hidden" name= "startDate" value="" id = "startDate">
			<input type="hidden" name= "endDate" value="" id = "endDate">
			<input type="hidden" name= "endDateApplication" value="" id = "endDateApplication">
            

        </form>
    </div><!--#wrap end-->
</div><!--#content end-->


			
<%@include file="/WEB-INF/template/footer.jsp" %><!--footer-->

<!-- 언더스코어 탬플릿 -->
<script type="text/template" id="settingItem">
    <li id="participationItem">
        <a class="li_delete" href=""><i class="fas fa-times"></i></a>
        <p>	<@=question@><input type="hidden" name= "title" value="<@=question@>"></p>
        <div>
            <@ if(checkMust) {@>
            <i class="far fa-check-square"></i>
				<input type="hidden" name= "isNecessary" value="<@=mustchck@>">
            <@}else {@>
            <i class="far fa-square"></i>
				<input type="hidden" name= "isNecessary" value="<@=mustchck@>">
            <@}@>
            필수 입력사항
            <!--띄어쓰기--> &nbsp
            <@ if(checkImage) {@>
            <i class="far fa-check-square"></i>
				<input type="hidden" name= "isImage" value="<@=imgchck@>">
            <@}else {@>
            <i class="far fa-square"></i>
				<input type="hidden" name= "isImage" value="<@=mustchck@>">
            <@}@>
            참가자 이미지 정보
        </div>
    </li>
</script>

<!-- 언더스코어 탬플릿 -->
<script type="text/template" id="settingGoods">
    <li id="addGoods">
        <div id="ItemUlList">
            <div class="whoCategory">
                <label class="item_label_css">누구에게</label>
				<input type="hidden" name= "toUser" value="<@=who@>">
                <p><@=who@></p>
            </div>
            <div class="itemCategory">
                <label  class="item_label_css">상품내용</label>
				<input type="hidden" name= "content" value="<@=item@>">
                <p><@=item@></p>
            </div>
            <div class="urlCategory">
                <label class="item_label_css">URL</label>
				<input type="hidden" name= "url" value="<@=url@>">
                <p><@=url@></p>
            </div>
            <span>
                <div id="addedItemImage">
					<img alt="" src="/img/grndLogo/<@=image@>" width="100" height="100">
					<input type="hidden" name= "image" value="<@=image@>">
				</div>
                <button id="itemDelete" class="button_clause_css"><i class="fas fa-times"></i></button>
            </span>
        </div><!--#ItemUlBox end-->
    </li>
</script>


<%@include file="/WEB-INF/template/js.jsp" %>

<script src="/js/tui-code-snippet.min.js"></script>

<script src="/js/tui-time-picker.min.js"></script>
<script src="/js/tui-date-picker.min.js"></script>

<script src='/js/markdown-it.js'></script>
<script src="/js/to-mark.min.js"></script>
<script src="/js/codemirror.js"></script>
<script src="/js/highlight.js"></script>
<script src="/js/squire-raw.js"></script>
<script src="/js/tui-editor-Editor.js"></script>

<!-- editor을 위한 script -->
<script>
    $('.editor').tuiEditor({
        initialEditType: 'wysiwyg',
        previewStyle: 'vertical',
        height: 150
    });

</script>

<!-- header 템플릿에 관한 script -->
<script>
    var $listPopupDots = $("#listPopupDots");
    //dots 버튼 클릭시 하위메뉴 보이기, 보이지않기
    $(".dots").on("click",function(e){
        //문제 3. 이것좀 세련되게 보이기.
        $listPopupDots.slideToggle();
        return false;

    });

    $("body").on("click", function(){
        $listPopupDots.slideUp();
    })
</script>

<!-- 참가 접수 여부에 관해 참가 접수 설정이 나타나도록 하는 script -->
<script>
    /* 참가 접수 여부에서 공개를 눌러야 참가 접수 설정이 나온다. */
    $("#receiptOpen").on("click",function () {
        $("#participantsReceiptSettingBox").css("display","block");
    });

    $("#receiptClose").on("click",function () {
        $("#participantsReceiptSettingBox").css("display","none");
        $("#participantsReceiptQuestionBox").empty();
    });
</script>

<!-- 참가 접수 설정에 관한 script -->
<script>
    /* 참가 접수 설정 */
    //#QuestionInsertBtn 클릭했을때
    $("#QuestionInsertBtn").click(function (e) {

        e.preventDefault();

        // 해당 input요소의 글자(값)를 얻어온 후 변수 question에 대입
        var question = $("#participantsReceiptQuestion").val();
        // 필수체크박스의 체크 유무 확인 (true, false)
        var checkMust = $(".mustQuestion").prop("checked");
        console.log(checkMust)
        var mustchck ='';
        if(checkMust) {
        	mustchck='T';
        }else {
        	mustchck='F';
        }
        console.log(mustchck)
        // 이미지 받기의 체크 유무 확인 (true, false)
        var checkImage = $(".checkImage").prop("checked");
        console.log(checkImage)
        var imgchck ='';
        if(checkImage) {
        	imgchck='T';
        }else {
        	imgchck='F';
        }
        console.log(imgchck)
        var tmp = _.template($("#settingItem").html());
        var markup = tmp({question:question,checkMust:checkMust,checkImage:checkImage,mustchck:mustchck,imgchck:imgchck});
        // 질문 정보가 들어갈 공간
        $("#participantsReceiptQuestionBox").append(markup);

    });//#insertBtn click end

    $("#participantsReceiptQuestionBox").on("click",".li_delete",function (e) {
        // 브라우저가 가진 css 제거
        e.preventDefault();
        // x 버튼을 누르면 해당 li를 삭제
        $(this).parent().remove();
    });
</script>


<script>
var image="";
	//파일 업로드 함수
	var $prixImage = $("#prixImage");
	
	$prixImage.change(uploadProfile);
	
	function uploadProfile() {

	    var data = new FormData();
	     
	    var file =  $prixImage.get(0).files[0];
	     
	    data.append('upload', file);
	   	data.append('folder','grndLogo');
	   	data.append('size',100);
	    
	    
	     $.ajax({
	         url: '/ajax/upload',
	         type: "post",
	         dataType: "json",
	         data: data,
	         processData: false,
	         contentType: false,
	         success: function(json) {
	        	 
	        	 console.log(json.image);
				image=json.image;
	        	 
	         }, error: function(jqXHR, textStatus, errorThrown) {
	        	 
	        	 alert(textStatus);
	         }
	     });
	    
	
	}
 

</script>


<!-- 상품 추가 설정에 관한 script -->
<script>
    /* 상품 추가 설정 */
    //#QuestionInsertBtn 클릭했을때
    $("#addItemBtn").click(function (e) {

        e.preventDefault();

        // 누구에게 input의 값을 who 변수에 저장
        var who = $("#whoQuestion").val();
        // 상품 내용 input의 값을 item 변수에 저장
        var item = $("#itemQuestion").val();
        // url input의 값을 item 변수에 저장
        var url = $("#urlQuestion").val();
        // 이미지 받기의 체크 유무 확인 (true, false)

	     

	     
        
        var tmp = _.template($("#settingGoods").html());
        var markup = tmp({who:who,item:item,url:url,image:image});
        // 질문 정보가 들어갈 공간
        $("#ItemUlBox").append(markup);

    });//#insertBtn click end

    $("#ItemUlBox").on("click","#itemDelete",function (e) {
        // 브라우저가 가진 css 제거
        e.preventDefault();
        // x 버튼을 누르면 해당 li를 삭제
        $(this).parent().parent().parent().remove();
    });
</script>

<!-- 달력에 관한 script -->
<script>
    /* 대회 시작 날짜 */
    var datepicker1 = new tui.DatePicker('#wrapper1', {
        date: new Date(),
        input: {
            element: '#datepickerStartInput',
            input: "#datepickerStartInput",
            format: 'yyyy-MM-dd'
        },
        language:'ko',
        change:function() {
        }
    });

   

    /* 대회 마치는 날짜 */
    var datepicker2 = new tui.DatePicker('#wrapper2', {
        date: new Date(),
        input: {
            element: '#datepickerEndInput',
            input: "#datepickerEndInput",
            format: 'yyyy-MM-dd'
        },
        language:'ko'
    });

    /* 접수마감일일 */
    var datepicker3 = new tui.DatePicker('#wrapper3', {
        date: new Date(),
        input: {
            element: '#datepickerDeadlineInput',
            input: "#datepickerDeadlineInput",
            format: 'yyyy-MM-dd'
        },
        language:'ko'
    });
</script>

<!-- 시간에 관한 script -->
<script>
    var now = new Date();
    var instance = new tui.TimePicker('#timepickerWrapper', {
        initialHour: now.getHours(),
        initialMinute: now.getMinutes(),
        inputType: 'spinbox'
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

    $("#prixImage").on("change",function () {
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
                ctx.drawImage(img,0,0,img.width,img.height,0,0,100,100);
            }//load이미지처리

        }// onload 이벤트핸들러

    });//change() end

</script>
<script>
function inputsSetter() {
	//참가자 공지사항
	   var txt= $(".tui-editor-contents")[1].innerHTML;
	   $("#participantAnnounce").attr("value",txt);
	   //시작시간 시
	   var hour= $(".tui-timepicker-hour").find(".tui-timepicker-spinbox-input").attr("value");
	   //시작시간 분
	   var min = $(".tui-timepicker-minute").find(".tui-timepicker-spinbox-input").attr("value");
	   
	   //대회기간 시작시간
	   console.log($("#datepickerStartInput").val())
	   $("#startDate").attr("value",$("#datepickerStartInput").val());
	   //대회기간 끝시간
	   console.log($("#datepickerEndInput").val())
	   $("#endDate").attr("value",$("#datepickerEndInput").val());
	   //접수마감일
	   console.log($("#datepickerDeadlineInput").val())
	   $("#endDateApplication").attr("value",$("#datepickerDeadlineInput").val());
	   //am 인지 아닌지 
	   //true면 am
	   //false 면 fm
	  var checkAMPM = $('.tui-timepicker-radio-am').is(':checked');
        // 이미지 받기의 체크 유무 확인 (true, false)
      if(checkAMPM){
    	  hour +=12;
      }

}
   $("form").on("submit", function(event) {
	   inputsSetter()
    });
</script>


</body>
</html>