<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>대회만들기-대회방식</title>
    <%@include file="/WEB-INF/template/link.jsp" %>
    
    <link rel="stylesheet" href="/css/competition_common.css"/>
    <style>
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
        /* 대회방식 페이지에 해당하므로 CSS 재 정의 */
        #competitionMakeTab #competitionMethod {
            background: rgb(247,247,247);                          /*배경색*/
            font-weight: 700;                           /*글자굵기*/
            color: #000;                                /*글자색상*/
        }
        /* 대회방식 탭과 그 다음 요소 '>>'에 대한 공통:hover */
        #competitionMakeTab #competitionMethod:hover+.fa-angle-double-right, #competitionMakeTab #competitionMethod:hover {
            background:  #FFF176;                       /*배경색*/
            color: #000;                                /*글자색상*/
            transition: .3s ease;                       /*0.3초에 거친 효과적용*/
        }

        /* < 다단설정 > */
        /* 한 페이지에 보다 깔끔한 배열을 위해 다단을 도입 다단이 2개일 경우 총 3공간으로 분열 */
        /* 모든 단의 공통 요소 */
        #firstDan, #secondDan {
            height: 800px;                              /*높이*/
            background: #EEEEEE;                        /*배경색*/
            float: left;                                /*떠 있음*/
            position: relative;                         /*모든 자식들의 absolute에 대한 포지셔닝컨테스팅*/
        }
        /*첫번째 단*/
        #firstDan {
            width: 885px;
            border-right: 5px solid rgb(200,200,200);
        }
        /*두번째 단*/
        #secondDan {
            width: 310px;                                /*너비*/
        }


        #competitionMethodBox>label {
            /* 위치 설정 */
            left: 20px;
            top: 20px;
        }

        /* 모든 이미지 + 라디오 + 라벨을 담은 틀 */
        #competitionTable {
            width: 730px;
            height: 270px;
            /* 위치 설정 */
            left: 20px;
            top: 60px;
            position: relative;
        }
        /* 모든 이미지을 담은 틀 */
        #competitionImageBox {
            width: 690px;
            height: 200px;
            position: absolute;
            /* 위치 설정 */
            left: 20px;
            top: 20px;
        }
        /* 모든 라디오 + 라벨을 담은 틀 */
        #competitionlabelBox {
            width: 690px;
            height: 50px;
            position: absolute;
            /* 위치 설정 */
            left: 20px;
            top: 200px;
        }


        /* 모든 이미지의 공통 요소*/
        .image_competition {
            width: 150px;
            height: 150px;
            position: absolute;
            top: 10px;
            background-size: cover;
        }
        /* 토너먼트 이미지 */
        #tournamentImage {
            /* 위치 설정 */
            left: 20px;
            background-image: url("/img/1_토너먼트.png");
        }
        /* 리그 이미지 */
        #leagueImage {
            /* 위치 설정 */
            left: 270px;
            background-image: url("/img/2_리그.png");
        }
        /* 풀리그 이미지 */
        #fullLeagueImage {
            /* 위치 설정 */
            left: 520px;
            background-image: url("/img/2_리그.png");
        }

        /* 모든 라디오 + 라벨의 공통 요소*/
        .competitionlabel {
            height: 30px;                               /*높이*/
            width: 150px;
            line-height: 30px;                          /*폰트수직정렬*/
            text-align: center;                         /*폰트수평정렬*/
            position: absolute;                         /*상대적위치적용*/
        }
        /* 토너먼트 라벨 */
        #tournamentLabel {
            /* 위치 설정 */
            left: 15px;
        }
        /* 리그 라벨 */
        #leagueLabel {
            /* 위치 설정 */
            left: 265px;
        }
        /* 풀리그 라벨 */
        #fullLeagueLabel {
            /* 위치 설정 */
            left: 515px;
        }

        /* < 참가(participants) 인원(Person) 담는 틀(Box) */
        /* #participantsPersonBox 안에 있는 label요소 CSS */
        #participantsPersonBox>label {
            height: 33px;                               /*높이 재정의(10% 늘림)*/
            line-height: 33px;                          /*폰트수직정령 재정의(높이에 맞춰서 변화)*/
            /* 위치 설정 */
            left: 20px;
            top: 340px;
        }
        /* #participantsPersonBox 안에 있는 lnput요소 CSS */
        #participantsPersonBox>input {
            height: 33px;                               /*높이 재정의(10% 늘림)*/
            width: 140px;                               /*너비*/
            /* 위치 설정 */
            left: 200px;
            top: 340px;
        }
        /* #participantsPersonBox 안에 있는 input:hover */
        #participantsPersonBox>input:hover {
            transform: none;                            /*버튼때문에 transform 초기화하여 재정의*/
        }
        /* #participantsPersonBox 안에 있는 up 버튼 CSS */
        #participantsPersonBox .up {
            left: 330px;
            top: 343px;
        }
        /* #participantsPersonBox 안에 있는 down 버튼 CSS */
        #participantsPersonBox .down {
            left: 330px;
            top: 358px;
        }


        /* < 시드(seed) 배정(Assignment)여부 정보를 담는 틀(Box) > */
        /* #seedAssignmentBox 안에 있는 label요소 CSS */
        #seedAssignmentBox>label {
            /* 위치 설정 */
            left: 20px;
            top: 420px;
        }

        /* #seedAssignmentBox CSS */
        #seedAssignment {
            /* 위치 설정 */
            left: 20px;
            top: 460px;
        }

        #seedAssignment .radio_label_right {
            width: 120px;
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

    </style>

</head>
<body>
<h1 class="screen_out">그랑프링글스</h1>

<%@include file="/WEB-INF/template/header.jsp" %><!--header-->

<div id="content">
	<form action="/make/complete" method=post>
    <!--대회만들기탭-->
    <div id="competitionMakeTab">
        <!-- 해당 탭들은 유일하므로 id값 부여 -->
        <a id="basicInformation" href="makeGrandprix_Necessary.jsp">기본정보</a><i class="fas fa-angle-double-right"></i>
        <a id="participant" href="makeGrandprix_Participations.jsp">참가자</a><i class="fas fa-angle-double-right"></i>
        <a id="clauseEstablish" href="makeGrandprix_Terms.jsp">약관설정</a><i class="fas fa-angle-double-right"></i>
        <a id="competitionMethod" href="makeGrandprix_Method.jsp">대회방식</a><i class="fas fa-angle-double-right"></i>
        <button id="confirm">완료</button>
    </div><!--#competitionMakeTab end-->

    <!--모든 폼의 input 값들을 넘겨주기 위한 단을 감싸는 가장 큰 틀-->
    <div id="wrap">
            <!--첫번째 단-->
            <div id="firstDan">

                <!--대회방식-->
                <div id="competitionMethodBox">
                    <label class="label_css">대회 방식</label>
                    <!-- 모든 이미지 + 라디오 + 라벨을 담은 틀-->
                    <div id="competitionTable">
                        <!-- 모든 이미지를 담은 틀-->
                        <span id="competitionImageBox">
                            <!--토너먼트 이미지-->
                            <div id="tournamentImage" class="image_competition"></div>
                            <!--리그 이미지-->
                            <div id="leagueImage" class="image_competition"></div>
                            <!--풀리그 이미지-->
                            <div id="fullLeagueImage" class="image_competition"></div>
                        </span>

                        <!-- 모든 라디오 + 라벨을 담은 틀-->
                        <span id="competitionlabelBox">
                            <label for="tournament" id="tournamentLabel" class="competitionlabel">
                                 <input name="type" type="radio" checked="checked" id="tournament" class="" value = "T"/>
                                토너먼트
                            </label>
                             <label for="league" id="leagueLabel" class="competitionlabel">
                                <input name="type" type="radio" id="league" class="" value ="L"/>
                                리그
                            </label>
                             <label for="fullLeague" id="fullLeagueLabel" class="competitionlabel">
                                 <input name="type" type="radio" id="fullLeague" class="" value ="F"/>
                                풀리그
                            </label>
                        </span>

                    </div><!--#competitionTable end-->
                </div><!--#competitionMethodBox end-->



                <!--시드 배정 -->
                <div id="seedAssignmentBox">
                    <label class="label_css">시드 배정</label>
                    <!-- 대회 공개 여부에 관한 라디오 박스를 담은 틀 해당 id와 radio의 name을 맞춰준다. -->
                    <span id="seedAssignment" class="radio_css">
                         <label for="random" class="open radio_label_left">랜덤
                             <input name="seedingType" value="R" type="radio" checked="checked" id="random" class="radio_input_left"/>
                         </label>
                         <label for="choice" class="close radio_label_right">개최자 지정
                             <input name="seedingType" value="S" type="radio" id="choice" class="radio_input_right"/>
                         </label>
                    </span><!--#competitionShow end-->
                </div><!--#competitionShowBox end-->
            </div><!--#firstDan end-->

            <div id="secondDan">
                <div id="guideWindowBox">
                    <label class="label_css">안내창</label>
                    <div id="guideContent">
                        <p>
                            대회만들기 - 대회방식
                        </p>
                        <div id="guideContentImage">
                        </div>
                        <p>
                            해당 절차에 대한 일을 그림과 설명을 통해 나타냅니다.
                        </p>

                    </div><!--#guideContent end-->
                </div><!--#guideWindowBox end-->

            </div><!--#secondeDan end-->
            
            <input type= "hidden" name ="grndNo" value="${grnd.grndNo}">
    		<input type= "hidden" name ="num" value="${grnd.num}">
            </form>
    </div><!--#wrap end-->
</div><!--#content end-->


<%@include file="/WEB-INF/template/footer.jsp" %><!--footer-->

<%@include file="/WEB-INF/template/js.jsp" %>

<script>
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
</script>

</body>
</html>