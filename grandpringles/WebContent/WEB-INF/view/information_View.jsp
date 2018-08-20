<%@page import="com.firedogs.grandpringles.vo.Prix"%>
<%@page import="java.util.List"%>
<%@page import="com.firedogs.grandpringles.dao.PrixesDAO"%>
<%@page import="com.firedogs.grandpringles.dao.GrandprixesDAO"%>
<%@page import="com.firedogs.grandpringles.vo.Grandprix"%>
<%@page import="com.firedogs.grandpringles.dao.GrandprixNamesDAO"%>
<%@page import="com.firedogs.grandpringles.vo.GrandprixName"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>    
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>대회정보 - 관람</title>
    <%@include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/competition_watch_header.css">
    <style>

        /*header, footer teamplate*/


        #WrapContent {
            position: relative;
            top: 10px;
            margin: auto ;
            background: #212121;
            width: 1200px;
        }

        /*영상처리*/
        #BoxVideo {
            background: #212121;
            width: 1108px;
            height: 500px;
            margin: auto;
            padding-top: 20px;
            position: relative;
            left: -12px;
        }
        .InlineBox {
            display: inline-block;
        }
        #BoxLive {

            width: 800px;
            height: 500px;
            background: white;

        }
        #BoxChat {

            width: 300px;
            height: 500px;
            background: white;
            position: relative;
            right: -32px;
        }

        /*대회정보 */

        #BoxCompetition {
            width: 1200px;
            height: 300px;
            background: #212121;
            margin: auto;
            margin-top: 20px;

        }
        #InfoCompetition {
            width: 550px;
            height: 300px;
            background:#212121;
            /*float: left;*/
            position: relative;
            bottom:0px;
            left: 35px;
        }

        .Info_Box {
            width: 170px;
            height: 50px;
            background: #212121;
            line-height: 50px;
            text-align: center;
            font-size: 25px;
            position: relative;
            margin-right: 8px;

            color: #FFF176;
            bottom: -3px;

            cursor: pointer;

        }

        .Info_Box.on{
            border: 3px white solid;
            border-bottom:none ;
            background:  #D2D2D2;
            color: black;
            font-weight: bold;
            font-size: 25px;
            text-align: center;

        }

        /*대회공지사항*/
        #BoxContent {
            width:548px;
            height: 240px;
            background: #D2D2D2;
            border: 3px white solid;
        }
        #BoxContent #InfoContent{
            width:518px;
            height: 170px;
            font-size: 15px;
            margin: 10px 10px 10px 10px;
            background: #EEEEEE;;
            padding: 5px;
            border-radius: 10px;
        }

        #InfoTitle {
            font-size: 25px;
            font-weight: bold;
            margin: 10px;
            margin-left: 20px;
            border-bottom: 3px solid #BDBDBD;
            padding: 5px 5px 2px 10px;

        }



        #TimeCompetition {
            width: 550px;
            height: 300px;
            float: right;
            position: relative;
            bottom: 0px;
            right: 35px;
        }


        #WeekendInfo {
            width: 170px;
            height: 50px;
            background:  #D2D2D2;
            line-height: 50px;
            text-align: center;
            font-size: 25px;
            position: relative;
            margin-left: 8px;
            border: 3px white solid;
            border-bottom:none ;
            cursor: pointer;
            bottom: -3px;
            z-index: 99;
            /*position: relative;*/
            font-weight: bold;
        }
        #TimeCompetition ul{
            width: 550px;
            height: 240px;
            background:  #D2D2D2;
            position: relative;
            overflow:    hidden;
            border: 3px white solid;
        }
        #BoxWeekend{
            width: 550px;
            height: 500px;

            background: #FAFAFA;
            position: relative;
            bottom: 0px;
            transition: 500ms ease;
        }
        #TimeCompetition li{
            width: 546px;
            height: 58px;
            margin: 2px 0px 2px 0px;
            border: 1px solid black;
            background:  #D2D2D2;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            line-height: 58px;
        }
        .WeekendCalendar {
            width: 176px;
            height: 62px;
            text-align: center;
            background: #EEEEEE;;
            line-height: 62px;
            font-size: 20px;

        }
        .scroll {
            position: absolute;
            font-size: 25px;
            opacity: 0.4;
            cursor: pointer;
            color: black;
            left: 260px;
        }
        .scroll:hover{
            opacity: 1;
        }
        #TopScroll  {
            top: 49px;

            color: black;
            z-index: 5;

        }
        #BottomScroll {
            bottom: 0px;

        }
        .day {

            width:110px;
            height: 30px;
            border: 1px solid black;
            text-align: center;
            line-height: 30px;
            margin-left: 10px;
        }
        .time {
            font-size: 5px;
        }
        .round {

            width: 110px;
            height: 30px;
            border: 1px solid black;
            text-align: center;
            line-height: 30px;
            margin-left: 80px;
        }
        .battle{
            width: 110px;
            height: 30px;
            border: 1px solid black;
            text-align: center;
            line-height: 30px;
            margin-top: 4px;
            margin-left: 80px;
            position: relative;
            
            font-size:13px;
        }
        .battle .easy_batting_btn{
            float: left;
            position: absolute;
            right :-30px;
            bottom: 5px;
            background: transparent;
            border: 3px solid #EEEEEE;
        }


        /*상품*/
        #popProducts {
            width:250px;
            height:300px;
            background:#E0E0E0;
            color:black;
            position:fixed;
            top:300px;
            right:100px;
            /*border:2px solid #000;*/
            background: #E0E0E0;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);


        }



        #boxImgProducts {
            width: 250px;
            height: 220px;
            /*border:2px solid black ;*/
            /*border-top:none ;*/

            position: relative;
            overflow: hidden;
            margin: auto;
        }

        #imgProducts {
            width: 1000px;
            height: 220px;
            position: relative;
            left: 0px;

            transition: 500ms ease;

        }
        #imgProducts img{
            width: 250px;
            height: 220px;
            float: left;

        }

        .fa-arrow-right {
            position: absolute;
            right: 1px;
            top:170px;
            width: 30px;
            height: 30px;

            cursor: pointer;
            /*border: 1px solid black;*/
            background: rgba(0,0,0,0.5);
            border-radius: 20px;
            font-size: 25px;
            opacity: 0;
            z-index: 1;
            text-align: center;
            line-height: 30px;
        }
        .fa-arrow-right.on{
            opacity: 0.4;
        }

        .fa-arrow-left {
            position: absolute;
            left: 1px;
            top:170px;
            cursor: pointer;
            width: 30px;
            height: 30px;
            /*border: 1px solid black;*/
            background: rgba(0,0,0,0.5);
            border-radius: 20px;
            font-size: 25px;
            opacity: 0;
            z-index: 1;
            text-align: center;
            line-height: 30px;
        }
        .fa-arrow-left:hover {
            opacity: 1;
        }
        .fa-arrow-right:hover {
            opacity: 1;
        }
        .fa-arrow-left.on{
            opacity: 0.4;
        }
        #contentProducts {
            width: 250px;
            height: 80px;
            font-size: 20px;
            margin: 5px;
            line-height: 30px;
            text-align: center;

        }
        #contentProducts strong {
            font-weight: bold ;
            color: #B71C1C;
        }

        .box_email_close {
            font-size: 25px;
            position: absolute;
            top: 0px;
            right: 5px;
            opacity: 0.4;
        }



    /*////////////////////////////*/

        /*BoxBatting*/
        #BoxBatting{
            width: 300px;
            height: 130px;
            position: absolute;
            right: -300px;
            bottom:-200px;
            background: #FAFAFA;
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

        }
        #BoxBatting label{
            /*display: block;*/

        }

        #BoxBatting .Batting_input {
            padding: 20px 0px 20px 20px;
        }

        .input_position {
            position: absolute;
            left: 10px;
            bottom:10px;
            font-size: 15px;
            width: 180px;
            height: 30px;
            background: rgb(230,230,230);
            color: #616161;
            border: none;
            border-bottom: 1px solid #BDBDBD;
            line-height: 40px;
            padding-left: 10px;
        }


        .btn_middle_button {
            width:80px;                                /* 너비 */
            height:30px;                                /* 높이 */
            line-height: 24px;                          /* 글자의 수직 정렬 */
            text-align: center;                         /* 글자의 수평 정렬 */
            border:1px solid #BDBDBD;                 /* 보더 */
            font-weight: 600;                           /* 글자 굵기 */
            font-size:17px;                             /* 글자 크기 */
            color:#616161;                              /* 글자색 */
            background-color:transparent;                   /* 배경색 */
            cursor:pointer;                             /* 커서 모양 */
            position: absolute;
            right: 15px;
            bottom: 10px;
        }

        /* 6번 중간 크기 버튼:hover */
        .btn_middle_button:hover {
            color:#424242;
            background-color:#F5F5F5;
        }
        .content_Table {
            position: relative;
            left: 10px;
        }

        .content_Table .batting_radio{ /* table의 th - 투표의 답이 들어가는 부분 */
            height: 35px;
            text-align: center;
            margin-top: 10px;
            color: #333333;
            font-size: 20px;
            /*padding-right: 20px;*/
            display: inline-block;
            width: 50px;
            background: red;
            position: relative;
            left: 10px;

        }
        .content_Table td{ /* td의 텍스트 element 지정 // 그래프가 들어가는 부분에는 텍스트가 없으므로 전체 td로 정해버렸음 */
            color: #757575;
            font-size: 12px;

        }


        /* 요기부터 그래프 관련 */



        .content_Table .content_graph{

            width: 150px;
            height: 23px;
            background-color: #424242; /* 속을 파낸 그래프 테두리안에 off 컬러 지정 */
            /*margin-top: 10px;*/
        }
        .bar{
            width: 150px;
            height: 23px;
            transition: 500ms ease;
        }




        .content_Table .bold_yl{
            color: #D68A06;

        } /* 우측의 투표인원수의 컬러값 지정 */




    </style>

</head>
<body>
<h1 class="screen_out">그랑프링글스</h1>

<%@include file="/WEB-INF/template/header.jsp" %><!--header-->


<div id= "content">
    <!-- 대회 헤더 -->
    <div id="competitionHeader" >
        <div class="competition_img">
        	<img class = "competition_logo_img" src="/img/grndLogo/${grandprix.image}" width ="180px" height="100px">
        </div>
        <div class="competition_title">
            ${name.title}
        </div>
        <div id="competitionSideBtn">
            <!-- 즐겨찾기 -->
            <div id="bookmarkBox" class="btn_Side_Box">
                <i class="fas fa-star"></i><a href="">즐겨찾기</a>
            </div>
            <!-- 추천갯수 -->
            <div id="goodBox" class="btn_Side_Box">
                <i class="far fa-thumbs-up competition_Like"></i><a href=""> ${name.liking}개</a>
            </div>
            <c:if test="${grandprix.status=='E' && loginUser.no == grandprix.ownerNo }">
	            <div id="nextCompetitionBox" class="btn_Side_Box">
	                <i class="far fa-hand-point-right"></i><a href="">다음 대회 만들기</a>
	            </div>
            </c:if>
            <div id="competitionParticipationBox" class="btn_Side_Box">
            <c:choose>
            	<c:when test="${grandprix.partType.equals('T') }">
            	    <a href="/${grandprix.grndNo}/${grandprix.num}/${loginUser.no}/Participant/Team" id="competitionTypeBox">대회 참가</a>
            	</c:when>
            	<c:otherwise>
            		<a href="/${grandprix.grndNo}/${grandprix.num}/${loginUser.no}/Participant/Solo" id="competitionTypeBox">대회 참가</a>
            	</c:otherwise>
            </c:choose>
                 <label id="competitionPeopleSlash">${grandprix.numberOfParticipant }  / ${grandprix.maxParticipant } </label>  
            </div>
	        <script>
	        	
	        </script>
	        <c:forEach items="${managers }" var="manager">
	        	<c:if test="${(manager.adminNo == loginUser.no) || (grandprix.ownerNo == loginUser.no)}">
		            <div id="openerData" class="btn_Side_Box">
		                <i class="fas fa-user-circle"></i><a href="/${grandprix.grndNo }/${grandprix.num}/management/schedule">관리하기</a>
		            </div>
	            </c:if>
	        </c:forEach>
	         
        </div><!--#competitionSideBtn end -->
    </div> <!--#competitionHeader end -->
    
    <div id = "competitionTapboard">
       <a id = "previewTab"  class="  board_css on" href= "information_View.jsp?grnoNo=${grandprix.grndNo}" >관람</a>
        <a id = "informationTab" class="  board_css" href= "information_History.jsp?grnoNo=${grandprix.grndNo}">대회정보</a>
			<a id="communityTab" class=" board_css" 
				href="/${grandprix.grndNo}/${grandprix.num}/community/pop/new/page/1">커뮤니티</a>
    </div><!--competitionTapboard End-->



    <div id ="WrapContent">
        <div id = "BoxVideo">
            <div id = "BoxLive" class = "InlineBox">
                 <iframe
                        src="http://player.twitch.tv/?channel=${grandprix.channelId}"
                        height="500"
                        width="800"
                        frameborder="0"
                        scrolling="no"
                        allowfullscreen="true">
                </iframe>
                 

            </div>

            <div id = "BoxChat"class = "InlineBox">
                <iframe frameborder="0"
                        scrolling="no"
                        id="chat_embed"
                        src="https://www.twitch.tv/embed/${grandprix.channelId}/chat"
                        height="500"
                        width="300">
                </iframe>
                


            </div>

            <div id = "popProducts" class="">

                <i class="fas fa-arrow-right"></i>
                <i class="fas fa-arrow-left"></i>
                <div id="boxProducts" class="">
                    <div id = "boxImgProducts">

                        <div id ="imgProducts">
                        <c:forEach items="${prixes }" var="p">
			               <c:choose>
                                <c:when test="${p.image!=null }">
                                        <img src="/img/prixes/${p.image}" alt="">
                                </c:when>
                                <c:otherwise>
                                        <img src="/img/로고.png" alt="">
                                </c:otherwise>
                           </c:choose>

						</c:forEach>
                        </div>



                    </div>
                    <div id = "contentProducts">
                    	<c:forEach items="${prixes }" var = "prix">
                        <p><strong>누구에게 :</strong> <span>${prix.toUser }</span><br>
                            <strong>상품 :</strong> <span>${prix.content }</span>

                        </p>
                        </c:forEach>

                    </div>
                    <div id="close" class="box_email_close"><i class="fas fa-times"></i></div>
                </div>

            </div>

        </div><!--BoxVideo-->
        <div id ="BoxCompetition">

            <div id = "InfoCompetition" class = "InlineBox">
                    <div class = "InlineBox Info_Box on">
                        대회소개
                    </div>
                    <div class = "InlineBox Info_Box">
                        공지사항
                    </div>
                    <div class = "InlineBox Info_Box">
                        대회규칙
                    </div>
                <!--대회소개, 공지사항 , 대회규칙-->
                <div id = "BoxContent">

                    <div id = "InfoTitle">${name.title}</div>
                    <p id ="InfoContent">
                       ${grandprix.intro}
                    </p>
                </div><!--BoxContent-->
            </div>
            <!--InfoCompetition end-->

            <div id = "TimeCompetition" class = "InlineBox">
                <div id="TopScroll" class="scroll"><i class="fas fa-arrow-up"></i></div>
                    <div id = "WeekendInfo">주간일정</div>

                    <ul>
                        <div id = "BoxWeekend">
                        <c:forEach items="${matchs }" var="match">
                        
	                        <li>
	                            <div class="InlineBox WeekendCalendar day">
	                            	<c:set var="startDate" value="${match.startDate }"/>
									<fmt:formatDate value="${startDate}" pattern="E" var="yoil" />
									<span class="yoil">${yoil }</span>	                                
	                                <span class = "time">시간 - <fmt:formatDate value="${startDate}" pattern="HH:mm"/></span>
	                            </div>
	                            <div class="InlineBox WeekendCalendar round">
	                                ROUND ${match.round }
	                            </div>
	
	                            <div class="InlineBox WeekendCalendar battle">
	                                ${match.redName }vs${match.blueName }
	                                <button class = "easy_batting_btn"><i class="fas fa-dollar-sign"></i></button>
	                            </div>
	                        </li>
                        
							</c:forEach>
                        </div><!--BoxWeekend END-->
                    </ul>

                <div id="BottomScroll" class="scroll"><i class="fas fa-arrow-down"></i></div>
            </div> <!--TimeCompetition END-->




    </div><!--BoxCompetition END-->

    </div><!--WrapContent-->

</div><!--content-->

<%@include file="/WEB-INF/template/footer.jsp" %><!--footer-->

<script type="text/template" id = "battingTmp">

    <div id = "BoxBatting">
        <form action="">


            <table cellpadding="0" cellspacing="0" border="0" class="content_Table">
                <colgroup><col width="148px;"><col width="276px" align="left"><col width="184px" align="left">
                    <tr class = "item_idx">
                        <!-- 투표1 제목 -->
                        <span class="batting_radio"><input type="radio" name="batting">A 항목</span>
                        <!-- 투표1 그래프 -->
                        <td >
                            <div class="content_graph"><div class ="bar"></div></div>
                        </td>
                        <!-- 투표 1 투표인원 -->
                        <td><b class="bold_yl">982</b> 명 (50%)</td>
                    </tr>


            <table cellpadding="0" cellspacing="0" border="0" class="content_Table">
                <colgroup><col width="148px;"><col width="276px" align="left"><col width="184px" align="left">
                    <tr class = "item_idx">
                        <!-- 투표1 제목 -->
                        <div class="batting_radio"><input type="radio" name="batting">B 항목</div>
                        <td>
                            <div class="content_graph"><div class ="bar"></div></div>
                        </td>
                        <td><b class="bold_yl">982</b> 명 (50%)</td>
                    </tr>


            </table>

            <div class = "Batting_input">
                <form action="">
                    <input type="text" placeholder="금액" maxlength=6 class="input_position">
                    <button class="btn_middle_button batting" >배팅</button>
                </form>
            </div>
        </form>
    </div><!--BoxBatting End-->

</script>

<%@include file="/WEB-INF/template/js.jsp" %>

<script>
    $(".fa-arrow-down").click(function () {

        $("#BoxWeekend").css("bottom","250px");
    })
    $(".fa-arrow-up").click(function () {

        $("#BoxWeekend").css("bottom","0px");
    })


    <!-- 대회 헤더  -->
    $(".board_css").click(function () {
        var idx = $(this).index();
        $(".board_css").removeClass("on");
        $(".board_css").eq(idx).addClass("on")
    });


    $(".Info_Box").click(function () {
    	$("#InfoContent").text("");
        var idx = $(this).index();

        $(".Info_Box").removeClass("on")
        $(".Info_Box").eq(idx).addClass("on")
        if(idx==0) {
        	$("#InfoContent").html("${grandprix.intro}");
        }else if(idx==1) {
        	$("#InfoContent").html("${grandprix.participantAnnounce}");
        }else {
        	$("#InfoContent").html("${grandprix.rule}");
        }

    })

    var left =0;

    $(".fa-arrow-right").click(function () {

        console.log(left)
        if(left>-750 ) {
            left -=250;
            $("#imgProducts").css("left", left);
        }
    })
    $(".fa-arrow-left").click(function () {

        console.log(left)
        if (left < 0){
            left += 250;
        $("#imgProducts").css("left", left);
    }

    })
    
    $(document).ready(function() {
        $("#close").click(function () {

            $("#popProducts").slideUp();
        });
    });


    var $content_Table = $(".content_Table"),
        battingTmp =  _.template($("#battingTmp").html()),
        battingMarkup =  battingTmp(),
        A = 5000,
        B = 10000,
        sum = A+B,
        $bar = $(".bar"),
        num=0;
    //판 인덱스
    var gameIdx =0,
        tableIdx = 0;

    //언더스코어로 배팅창 추가

    $(".battle").find(".easy_batting_btn").click(function () {
        var idx = ($("#BoxBatting").index())
        if (idx == -1) {
            $("#WrapContent").append(battingMarkup)
        } else{
            $("#BoxBatting").remove();
            $("#WrapContent").append(battingMarkup)
        }
    })

    //요일별 경기 번호
    $("li").click(function () {

        gameIdx = $(this).index();


    })


    //막대형 그래프
    $("#WrapContent").on("click",".content_Table", function (e) {
        e.preventDefault()
        tableIdx = $(this).index();
        if (tableIdx == 1) {
            num = A;
        } else {
            num = B;
        }
        persent = ((num / sum) * 100) * 1.5;
        $(this).find(".bar").css({
            width: persent,
            background: "#B71C1C"
        })

    });

    $("#boxImgProducts").hover(function () {
        $(".fa-arrow-left").toggleClass("on")
        $(".fa-arrow-right").toggleClass("on")
    })

    $("#competitionTypeBox").click(function (e) {

    	var number=${grandprix.numberOfParticipant };
    	var max= ${grandprix.maxParticipant };
    	<c:choose>
    	<c:when test="${loginUser==null }">
    		var login=null;
    	</c:when>
    	<c:otherwise>
    		var login="notNull";
    	</c:otherwise>
    	</c:choose>
    	if(number>=max){
	    	 e.preventDefault();	
	    	 alert("정원초과");
    	}
    	
    	if(login==null){
	    	 e.preventDefault();	
	    	 alert("로그인이 필요한 서비스입니다.");
   	}
    	

	})

</script>


</body>
</html>