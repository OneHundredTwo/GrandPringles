
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>대회관리-경기관리</title>
<%@include file="/WEB-INF/template/link.jsp"%>

<link rel="stylesheet" href="/css/competition_watch_header.css">
<link rel="stylesheet" href="/css/competition_common.css" />

<link rel="stylesheet" href="/css/management_common.css">

<!--  외부 css  -->
<link rel="stylesheet" href="/css/tui-date-picker.css">
<link rel="stylesheet" href="/css/tui-time-picker.css" />

<!-- page css -->
<link rel="stylesheet" href="/css/matchchart_common.css">


<style>

/*popup 배경*/
#popLayer {
	display: none;
	position: relative;
	z-index: 10;
}

#popWrapper {
	/*밴드같이 popup 컨텐츠크기에따라 맨위~가운데에 위치시키기위한 속성설정 1*/
	/*표준은 아닌듯*/
	display: flex;
	position: fixed;
	left: 0;
	top: 0;
	bottom: 0;
	right: 0;
	width: 100%;
	height: 100%;
	/*밴드같이 popup 컨텐츠크기에따라 맨위~가운데에 위치시키기위한 속성설정 2*/
	padding: 30px;
	background-color: #424242aa;
	/*밴드같이 popup 컨텐츠크기에따라 맨위~가운데에 위치시키기위한 속성설정 3*/
	box-sizing: border-box;
	overflow: auto;
}

#popWinnerSelect {
	position: relative;
	width: 450px;
	margin: auto;
	/*밴드엔 있는 왜있는지 모르겠는 애, 없어도 지장없다*/
	align-self: flex-start;
}

#winnerSelect {
	background-color: #ffffcc;
}

#winnerSelect .row {
	overflow: hidden;
	color: black;
	font-size: 15px;
}

#winnerSelect .title {
	padding: 3px 10px;
	background-color: #424242;
	color: ivory;
	font-size: 35px;
}

#winnerSelect .content.image {
	text-align: center;
}

#winnerSelect .content.text {
	
}

#winnerSelect .img_cond {
	width: 150px;
	height: 150px;
}

#winnerSelect .box_btn {
	background-color: #424242;
	padding: 10px 10px;
}

#winnerSelect form {
	display: inline-block;
}

#winnerSelect .pop_team {
	position: relative;
	float: left;
	width: 50%;
	height: 180px;
	line-height: 180px;
	text-align: center;
	cursor: pointer;
}

#winnerSelect .pop_team:hover {
	
}

#winnerSelect .pop_team::before {
	content: "";
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 180px;
	background-size: contain;
	background-position: center;
	background-repeat: no-repeat;
}

#winnerSelect .pop_team::after {
	content: "";
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 180px;
	background-image: url(/img/grad_box.png);
	background-size: contain;
	background-repeat: no-repeat;
	transition: 0.3s ease;
	opacity: 0;
}

#winnerSelect .pop_team:hover::after {
	opacity: 1;
}

#winnerSelect .pop_team.selected::after {
	opacity: 1;
}

#winnerSelect .red_team {
	background-color: red;
}

#winnerSelect .red_team::before {
	background-image: url(/img/tiger_red.png);
	opacity: 0.5;
}

#winnerSelect .blue_team {
	background-color: blue;
}

#winnerSelect .blue_team::before {
	background-image: url(/img/dragon_blue.png);
	opacity: 0.5;
}

#winnerSelect .pop_team>span {
	text-shadow: 0px 0px 10px rgba(0, 0, 0, 1);
	color: ivory;
	font-size: 45px;
	position: relative;
	z-index: 1;
}

#winnerSelect .box_btn {
	text-align: right;
}

#winnerSelect .button {
	width: 75px;
	height: 35px;
	color: white;
	background-color: #828282;
	border: none;
	cursor: pointer;
}

</style>
</head>
<body>
	<h1 class="screen_out">그랑프링글스</h1>

	<%@include file="/WEB-INF/template/header.jsp"%><!--header-->

	<div id="content">
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
	        
	        <c:forEach items="${managers }" var="manager">
	        	<c:if test="${(manager.adminNo == loginUser.no) || (grandprix.ownerNo == loginUser.no)}">
		            <div id="openerData" class="btn_Side_Box">
		                <i class="fas fa-user-circle"></i><a href="">관리하기</a>
		            </div>
	            </c:if>
	        </c:forEach>
	         
        </div><!--#competitionSideBtn end -->
    </div> <!--#competitionHeader end -->
    
		
		<c:if test="${grnd.status=='W' }">
			<script>
				alert("기다려욧!");
			</script>
		</c:if>

		<div id="boxInfoContent">

			<div class="management_contents_tab" data-index="4">
				<div class="" id="tabInfomationContents">
					<div class="vertical_tab">
						<ul>
							<li><a class="vertical_tab_item" href="/${grandprix.grndNo }/${grandprix.num}/management/schedule" title="대회일정 탭">대회일정</a></li>
							<li><a class="vertical_tab_item" href="/${grandprix.grndNo }/${grandprix.num}/management/announce_log" title="대회공지사항 탭">대회공지사항</a></li>
							<li><a class="vertical_tab_item" href="/${grandprix.grndNo }/${grandprix.num}/management/participations?applyPage=1&partPage=1" title="참가자관리 탭">참가자관리</a></li>
							<li><a class="vertical_tab_item" href="/${grandprix.grndNo }/${grandprix.num}/management/prixes" title="상품관리 탭">상품관리</a></li>
							<li><a class="vertical_tab_item on" href="/${grandprix.grndNo }/${grandprix.num}/management/match_chart" title="경기관리 탭">경기관리</a></li>
						</ul>
					</div>
				</div>

				<h4 class="screen_out">경기 관리</h4>
				<div id="boxMatchChart"></div>
			</div>
			<!--.management_contents_tab -->
		</div>
		<!--boxInfoContent -->

	</div>
	<!--content-->

	<%@include file="/WEB-INF/template/footer.jsp"%><!--footer-->
	<!--대진표 제너레이터, match 템플릿-->
	<script type="text/template" id="tmplUseMatchData">
<div class="match_info">
        <@var isTeam=m.partType=='T' ;@>
        <@var start = moment(m.start,"YYYY-MM-DD HH:mm");@>
            <span class="editable match_schedule" data-match="<@=matchCnt@>"><span class="match_name"><@=matchName@></span>
                <!--얘네한테 picker 붙이는건 각 페이지 스크립트에서 .  -->
                <div class="detail match_schedule_detail disabled" data-start="<@=m.start@>">
                    <div class="match_start_date_wrapper">
                        <span>경기시작일</span>
                        <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                            <input type="text" class="match_start_date_inp" aria-label="Date-Time">
                            <span class="tui-ico-date"></span>
                        </div>
                        <div class="match_start_date_picker" style="margin-top: -1px;"></div>
                        <!--#receptionDeaadline end-->
                    </div>
                    <!-- 시작 시간 설정 -->
                    <div class="match_start_time_wrapper">
                        <span>시작시간</span>
                        <div class="time_picker_box"></div>
                    </div>
                    <button class="btn editable save">저장</button>
                    <!---->
                    <button class='btn editable start_match'>경기 시작</button>
                </div>
            </span>
            <div class="match_box" data-no="<@=m.matchNo@>">
                <@for(var k=0; k<m.corners.length; k++){@>
                    <@var corner=m.corners[k];
					if(corner != null){
					@>
                    <div class="<@=k==0?'red':'blue'@>_corner <@=corner.isWin@>">
                        <div class="team" title="플레이어 상세 보기"><span class="team_name"><@=corner.name@></span>
                            <div class="detail player_detail" title="경기 기록 보기">
                                <@if(m.status!='B' && m.status!='D'){@>
                                    <@if(m.gameStatus=='MS'){@>
                                    <div class="match_status_message">
										<i class="fa fa-arrow-right"></i>
                                        <p>
                                            생성된 게임이 없습니다.<br> 
                                            게임을 생성해주세요.
                                        </p>
                                    </div>
                                    <@}else{@>
                                    <div class="record">
                                        <div class="move_game_record">
                                            <button class="circle_btn left_arrow"><i class="fa fa-arrow-left"></i></button>
                                            <span>game <@=corner.team.games.length@></span>
                                            <button class="circle_btn right_arrow"><i class="fa fa-arrow-right"></i></button>
                                        </div>
                                        <div class="record_table">
                                            <div class="record_row record_top_header header">
                                                <div class="cell record_type_divider">
                                                    <label class="top_header_type">점수</label>
                                                    <label class="bottom_header_type">팀원</label>
                                                </div>
                                                <div class="cell kill_head">킬</div>
                                                <div class="cell death_head">데스</div>
                                                <div class="cell assi_head">어시</div>
                                            </div>
                                            <div class="<@=isTeam?'team':'solo'@>_record_bottom">
                                                <div class="record_bottom_header header">
                                                    <@var team = corner.team;@>
                                                    <@for(var i=0; i<team.members.length; i++){@>
                                                        <div class="cell member_head">
                                                            <!--지금은 이름만, 나중엔 클릭하면 사용자상세로
                                                                여기에 롤티어 이미지도 괜찮을듯-->
                                                            <span><@=team.members[i].name@></span>
                                                        </div>
                                                        <@}@>
                                                            <@if(isTeam){@>
                                                                <div class="cell tot">팀 스코어</div>
                                                                <@}@>
                                                </div>
                                                <div class="record_bodies">
                                                    <!-- 팀전인경우 -->
                                                    <@if(isTeam){@>
                                                        <@for(var i=0; i<team.games.length; i++){@>
                                                            <@var game=team.games[i],
                                                                selected = i==(team.games.length-1)?'selected':''; @>

                                                                <div class="record_body <@=selected@>" data-cnt="<@=(i+1)@>">
                                                                    <@for(var j=0; j<game.record.length; j++){
                                                                    @>
                                                                        <div class="record_row">
                                                                            <div class="cell kill"><input maxlength='2' value='<@=game.record[j].kill@>'/></div>
                                                                            <div class="cell death"><input maxlength='2' value='<@=game.record[j].death@>'/></div>
                                                                            <div class="cell assi"><input maxlength='2' value='<@=game.record[j].assi@>'/></div>
                                                                        </div>
                                                                        <@}@>
                                                                            <div class="record_row tot">
                                                                                <div class="cell kill">
                                                                                    <@=game.tot.kill@>
                                                                                </div>
                                                                                <div class="cell death">
                                                                                    <@=game.tot.death@>
                                                                                </div>
                                                                                <div class="cell assi">
                                                                                    <@=game.tot.assi@>
                                                                                </div>
                                                                            </div>
                                                                </div>
                                                                <@}@>
                                                                    <!--개인전인경우 -->
                                                                    <@}else{@>
                                                                        <@for(var i=0; i<team.games.length; i++){@>

                                                                            <@var game=team.games[i], selected = i==(team.games.length-1)?'selected':'';@>
                                                                                <div class="record_body <@=selected@>" data-cnt="<@=(i+1)@>">
                                                                                    <div class="record_row">
                                                                                        <div class="cell kill"><input maxlength='2' value='<@=game.record[0].kill@>'/></div>
			                                                                            <div class="cell death"><input maxlength='2' value='<@=game.record[0].death@>'/></div>
			                                                                            <div class="cell assi"><input maxlength='2' value='<@=game.record[0].assi@>'/></div>
                                                                                    </div>
                                                                                </div>
                                                                                <@}@>
                                                                                    <@}@>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <@}@>
                                    <div class="manage_team_game <@=m.gameStatus@>">
                                        <ul>
                                            <li class="next_game"><button class="btn" title="다음 게임 생성">다음게임 생성</button></li>

                                            <li class="start_game"><button class="btn" title="게임 시작">게임 시작</button></li>

                                            <li class="cancel_game"><button class="btn" title="취소">취소</button></li>

                                            <li class="end_game"><button class="btn" title="게임 종료">게임 종료</button></li>

                                            <li class="end_match"><button class="btn" title="경기 종료">경기 종료</button></li>
                                            
											<li class="save_score"><button class="btn" title="점수 저장">저장</button></li>
                                        </ul>
                                    </div>
                                    <@}else if(m.status=='D'){
                                    //B하고 B가 아닐때만 작성한거에 추가하는거라... 코드가 좀 더럽다...
                                    @>
                                            <div class="announce">
                                                <p>부전승 경기입니다 ^^;;</p>
                                            </div>
                                    <@}else{
                                        @>
                                            <div class="announce">
                                                <@if(k==0){@><i class="fas fa-arrow-left"></i><@}else{@><i class="fas fa-arrow-left dio"></i><@}@>
                                                <p>
                                                    경기가 시작되지 않았습니다.
                                                </p>
                                                <p>
                                                    경기를 시작해주세요.
                                                </p>
                                            </div>
                                    <@
                                    }@>
                            </div>
                        </div>
                        <div class="score" title="스코어 보기"><@=corner.score@>
                        </div>
                    </div>
                <@}
	else{@>
		
		<div class="not_yet_corner">
	<@if(m.status!='D'){@>
			상대팀을 기다리고있습니다
	<@}@>
</div>
<@}
}@>
            </div>
</div>
    </script>
	<!-- match데이터가 없는 관람-대진표-match 템플릿(아무것도 없다.) -->
	<script type="text/template" id="tmplNoMatchData">
	<div class="match_info">
        <span class="match_schedule" data-match="<@=matchCnt@>"><@=matchName@>
            </span>
        <div class="match_box">
            <div class="red_corner">
                <div class="team" title="플레이어 상세 보기"></div>
                <div class="score" title="스코어 보기"></div>
            </div>
            <div class="blue_corner">
                <div class="team"></div>
                <div class="score" title="스코어 보기"></div>
            </div>
	</div>
    </script>

	<div id="popLayer">
		<div id="popWrapper">
			<div id="popWinnerSelect">
				<div id="winnerSelect">
					<div class="row title">누가 이겼나요?</div>
					<div class="row content">
						<div class="red_team pop_team" data-corner="RED">
							<span></span>
						</div>
						<div class="blue_team pop_team" data-corner="BLUE">
							<span></span>
						</div>
					</div>
					<div class="row box_btn">
						<button class="button reject" id="winnerCancel" data-corner="red">취소</button>
						<button class="button confirm" id="winnerConfirm"
							data-corner="blue">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@include file="/WEB-INF/template/js.jsp"%>
	<!-- external libs -->
	<script src="/js/tui-code-snippet.min.js"></script>
	<script src="/js/tui-time-picker.min.js"></script>
	<script src="/js/tui-date-picker.min.js"></script>

	<!-- body내에 꼭있어야하는 요소 : View나 Manage에 따라 다른 #tmplUseMatchData, #tmplNoMatchData-->
	<script src="/js/match_chart_funcs.js"></script>
	<!--view든 manage든 #boxMatchChart에 할당해야할 코드들-->
	<script src="/js/match_chart_common.js"></script>
	<script>
	
	</script>
	<!--  전역 설정 -->
	<script>
	/*
    view나 manage에 따라 낄낄빠빠하는 코드들
 */
 /*MatchChart를 구성하는 요소들이 다 만들어진 다음에 해당요소들에 대해서 작업을 수행하는 함수.*/
 function afterGen($boxMatchChart){
	 setTimepicker($boxMatchChart);
	 //경기상태가 종료이거나 플레이중이면 막아둬야할 요소들 disabled
	 $boxMatchChart.find(
				".round_match.E .match_schedule_detail *,"
				+".round_match.D .match_schedule_detail *,"
						+ ".round_match.E .player_detail .cell>input,"
						+ ".round_match.P .match_schedule_detail *,"
						+ ".round_match.P .record_bodies input").attr(
				"disabled", true);
	 //게임상태에 따라 막아둘 요소 제한e
	 $boxMatchChart.find(".PG").parents('.red_corner').find('.record_body').last().find("input").attr("disabled",false);
	 $boxMatchChart.find(".PG").parents('.blue_corner').find('.record_body').last().find("input").attr("disabled",false);
	 $boxMatchChart.find(".PG").parents('.match_info').find(".circle_btn").hide();
	 
	 
	 
	 
}
 
 

//관리자페이지면 schedule_detail에 timepicker 만들기
//timepicker는 root노드 아래에 추가되기 전에 생성되면 안.보.인.다
		//전역변수
		var grndNo = ${grandprix.grndNo}, grndNum = ${grandprix.num};
		var $boxMatchChart = $("#boxMatchChart");
		makeMatchChart($boxMatchChart,afterGen,{grndNo:grndNo,grndNum:grndNum}); //match_chart_common.js에 있음 
	</script>

	<!-- 게임중일때 management 버튼들 처리하는 스크립트.-->
	<!--  popup처리 스크립트 -->
	<script>
    var $popWrapper = $("#popLayer"),
        $popWinnerSelect = $("#popWinnerSelect"),
        $winnerSelect = $("#winnerSelect"),
        $body = $("body");
    var endedMatchInfo;
    function showPopup(){
    	$popWrapper.fadeIn(200);
        //popup켜졌을때 body의 스크롤 막기(body의 스크롤없애기)
        $body.css("overflow", "hidden");
        
        endedMatchInfo = $boxMatchChart.find(".round_match.on>.match_info");
        
        var redName = endedMatchInfo.find(".red_corner .team_name").text(),
        	blueName =endedMatchInfo.find(".blue_corner .team_name").text();
        
        $winnerSelect.find(".red_team>span").text(redName);
        $winnerSelect.find(".blue_team>span").text(blueName);
        
    }
    
    $winnerSelect.on("click", function() {
        return false;
    });
    
    $(".pop_team").on("click",function(){
    	if($(this).hasClass("selected")){
    		$(this).toggleClass("selected");
    	}else{
        	$winnerSelect.find(".selected").removeClass("selected");
        	$(this).addClass("selected");
    	}
    });
    
    $winnerSelect.on("click", ".button.reject", function(){
    	//팝업에서 취소눌렀을때 : 초기화
    	$popWrapper.fadeOut(200);
        $body.css("overflow", "visible");
        setTimeout(function(){
	        $winnerSelect.find(".red_team>span").text("");
	        $winnerSelect.find(".blue_team>span").text("");
	        $winnerSelect.find(".selected").removeClass("selected");
	        endedMatchInfo = null;
	        },200);

        endedMatchInfo = null;
        return false;
    }).on("click", ".confirm", function(){
		//승자 선택하는 팝업에서 확인 눌렀을때
		//정상적으론 팝업을 띄워야지만 접근이 가능하기때문에 popup이 띄워질때 현재 선택된 match를 on으로 검색해서 할당한 endedMatchInfo를 그대로 사용할 수 있음.
		
		var winner = $winnerSelect.find(".selected").data("corner");
		if(winner == null){
			alert("승자를 선택해주세요!");
			return false;
		}
		
		var info = endedMatchInfo,
		matchNo = info.find(".match_box").data("no"),
		matchCnt = info.find(".match_schedule").data("match"),
		matchName = info.find(".match_name").text(),
		gameSeq = info.find(".red_corner .record_body.selected").data('cnt');
		
		//일단 개인전
		var corners = ['red','blue'];
		var kda = ['.kill','.death','.assi'];
		var redScore=[], blueScore=[];
		var redScoreRow = info.find(".red_corner .record_body.selected");
		var blueScoreRow  = info.find(".blue_corner .record_body.selected");
		var scores = [redScoreRow, blueScoreRow];
		var paramScores = [redScore, blueScore];

		var selectors=[]; //on이였던 애들을 선택하기위한 배열
		
		for(var i=0; i<scores.length; i++){
			for(var j=0; j<kda.length; j++){
				paramScores[i].push(scores[i].find(kda[j]+'>input').val());
			}
		}
		
		$.ajax({
				url:"/endGame.json",
				data:{
					matchNo:matchNo,
					seq:gameSeq,
					redScore:redScore,
					blueScore:blueScore,
					winner:winner
				},
				type:"POST",
				traditional:true,
				dataType:"json",
				error:function(){alert("end game error")},
				success:function(json){
					console.log(json);
					var onEls = info.find(".on");
					var matchInfo = {
							matchCnt:matchCnt,
							matchName:matchName,
							m:json
					};
					var corner;
					$(onEls).each(function(){
						var classes = $(this).attr('class').split(" ");
						var selector = "";
						for(var i=0; i<classes.length; i++){
							if(classes[i]!='on'){
								selector += '.'+classes[i];
							}
						}
						selectors.push(selector);
					});
					console.log(selectors);
					var container = info;
					container.after(tmplUseMatchData(matchInfo)).remove();
					container = info.find(".match_info");
					
					
					container.find(selectors[0]).addClass("on");
					container.find(selectors[0]+" "+selectors[1]).addClass("on");
					
					var cnt = container.find(".red_corner .record_body").last().data("cnt");
					container.find(".move_game_record>span").text("game "+cnt);
					
					afterGen($boxMatchChart);
					
					//초기화
			    	$popWrapper.fadeOut(200);
			        $body.css("overflow", "visible");
			        setTimeout(function(){
			        $winnerSelect.find(".red_team>span").text("");
			        $winnerSelect.find(".blue_team>span").text("");
			        $winnerSelect.find(".selected").removeClass("selected");
			        endedMatchInfo = null;
			        },200);
			        
				}
		});

        return false;
	});
    
    $popWrapper.on("click", function() {
        return false;
    });
    </script>

	<script>
		

		/*
		    경기상태(match.status)에따라서
		    B -> 스케쥴 편집가능 -> template에서 경기가 시작되지않아 경기기록을 편잡할 수 없다는 요소를 대신띄움
		    P -> 경기기록 편집가능 -> .match_schedule_detail disabled
		    E -> 아무것도 가능하지 않음 -> disabled 
		 */
		
		//게임관리 버튼들을 누를때 각 이벤트 연결
		$boxMatchChart.on("click", ".next_game>.btn", function() {

			var info = $(this).parents(".round_match"),
				matchNo = info.find(".match_box").data("no"),
				matchCnt = info.find(".match_schedule").data("match"),
				matchName = info.find(".match_name").text();
			var selectors=[]; //on이였던 애들을 선택하기위한 배열
			$.ajax({
					url:"/makeNextGame.json",
					method:"POST",
					data:{
						no:matchNo
					},
					dataType:"json",
					error:function(){alert("next game error")},
					success:function(json){
					
						var onEls = info.find(".on");
						var matchInfo = {
								matchCnt:matchCnt,
								matchName:matchName,
								m:json
						};
						var corner;
						$(onEls).each(function(){
							var classes = $(this).attr('class').split(" ");
							var selector = "";
							for(var i=0; i<classes.length; i++){
								if(classes[i]!='on'){
									selector += '.'+classes[i];
								}
							}
							selectors.push(selector);
						});
						console.log(selectors);
						var container = info.find(".match_info");
						container.after(tmplUseMatchData(matchInfo)).remove();
						container = info.find(".match_info");
						
						
						/*on ,select */
						container.find(selectors[0]).addClass("on");
						container.find(selectors[0]+" "+selectors[1]).addClass("on");
						
						var cnt = container.find(".red_corner .record_body").last().data("cnt");
						container.find(".move_game_record>span").text("game "+cnt);
						
						afterGen($boxMatchChart);
						
					}
			});
		}).on("click", ".start_game>.btn", function() {

			var info = $(this).parents(".round_match"),
				matchNo = info.find(".match_box").data("no"),
				matchCnt = info.find(".match_schedule").data("match"),
				matchName = info.find(".match_name").text();
			var selectors=[]; //on이였던 애들을 선택하기위한 배열
			$.ajax({
			url:"/startGame.json",
			method:"POST",
			data:{
				no:matchNo
			},
			dataType:"json",
			error:function(){alert("start game error")},
			success:function(json){
				console.log(json);
				var onEls = info.find(".on");
				var matchInfo = {
						matchCnt:matchCnt,
						matchName:matchName,
						m:json
				};
				var corner;
				$(onEls).each(function(){
					var classes = $(this).attr('class').split(" ");
					var selector = "";
					for(var i=0; i<classes.length; i++){
						if(classes[i]!='on'){
							selector += '.'+classes[i];
						}
					}
					selectors.push(selector);
				});
				console.log(selectors);
				var container = info.find(".match_info");
				container.after(tmplUseMatchData(matchInfo)).remove();
				container = info.find(".match_info");
				
				
				/*on ,select */
				container.find(selectors[0]).addClass("on");
				container.find(selectors[0]+" "+selectors[1]).addClass("on");
				
				var cnt = container.find(".red_corner .record_body").last().data("cnt");
				container.find(".move_game_record>span").text("game "+cnt);
				
				afterGen($boxMatchChart);
			}
			});
			
		}).on("click", ".cancel_game>.btn", function() {
			var info = $(this).parents(".round_match"),
			matchNo = info.find(".match_box").data("no"),
			matchCnt = info.find(".match_schedule").data("match"),
			matchName = info.find(".match_name").text();
		var selectors=[]; //on이였던 애들을 선택하기위한 배열
			$.ajax({
					url:"/cancelGame.json",
					method:"POST",
					data:{
						no:matchNo
					},
					dataType:"json",
					error:function(){alert("cancel game error")},
					success:function(json){
						var onEls = info.find(".on");
						var matchInfo = {
								matchCnt:matchCnt,
								matchName:matchName,
								m:json
						};
						var corner;
						$(onEls).each(function(){
							var classes = $(this).attr('class').split(" ");
							var selector = "";
							for(var i=0; i<classes.length; i++){
								if(classes[i]!='on'){
									selector += '.'+classes[i];
								}
							}
							selectors.push(selector);
						});
						console.log(selectors);
						var container = info.find(".match_info");
						container.after(tmplUseMatchData(matchInfo)).remove();
						container = info.find(".match_info");
						
						
						/*on ,select */
						container.find(selectors[0]).addClass("on");
						container.find(selectors[0]+" "+selectors[1]).addClass("on");
						
						var cnt = container.find(".red_corner .record_body").last().data("cnt");
						container.find(".move_game_record>span").text("game "+cnt);
						
						afterGen($boxMatchChart);
					}
			});
		}).on("click", ".end_game>.btn", showPopup)
		.on("click", ".end_match>.btn", function() {
			console.log("end_match clicked")
			var info = $(this).parents(".round_match"),
			matchNo = info.find(".match_box").data("no"),
			matchCnt = info.find(".match_schedule").data("match"),
			matchName = info.find(".match_name").text();
			$.ajax({
					url:"/endMatch.json",
					data:{
						no:matchNo
					},
					type:"POST",
					dataType:"json",
					error:function(){alert("end match error")},
					success:function(){
						//성공하면 reload : 왜냐면 다음라운드로 올라가기 때문에. 이건솔직히 form으로 해야되는데, 그냥... 다 ajax니까 일관성을 맞추기위해성
						location.reload();
					}
			});
		}).on("click", ".save_score>.btn", function(){
			var info = $(this).parents(".round_match"),
			matchNo = info.find(".match_box").data("no"),
			matchCnt = info.find(".match_schedule").data("match"),
			matchName = info.find(".match_name").text(),
			gameSeq = info.find(".red_corner .record_body.selected").data('cnt');
			
			//일단 개인전
			var corners = ['red','blue'];
			var kda = ['.kill','.death','.assi'];
			var redScore=[], blueScore=[];
			var redScoreRow = info.find(".red_corner .record_body.selected");
			var blueScoreRow  = info.find(".blue_corner .record_body.selected");
			var scores = [redScoreRow, blueScoreRow];
			var paramScores = [redScore, blueScore];
			
			for(var i=0; i<scores.length; i++){
				for(var j=0; j<kda.length; j++){
					paramScores[i].push(scores[i].find(kda[j]+'>input').val());
				}
			}
			
			
			$.ajax({
					url:"/saveScore.json",
					method:"POST",
					traditional:true,
					data:{
						matchNo:matchNo,
						seq:gameSeq,
						redScore:redScore,
						blueScore:blueScore
					},
					dataType:"json",
					error:function(){alert("cancel game error")},
					success:function(json){
						if(json.status){
							alert("저장했습니다.");
						}else{
							alert("저장에 실패했습니다. 다시 시도해주세요");
						}
					}
			}); 
		});
	</script>
	
	<!-- status가 B인 경기들 경기번호눌렀을때 클릭하는 이벤트 처리하는 스크립트 -->
	<script>
		$boxMatchChart.on("click", ".btn.editable.save", function(){
			//경기일정 저장버튼 클릭이벤트 할당
			var info = $(this).parents(".round_match"),
			matchNo = info.find(".match_box").data("no");
			var startDate = info.find(".match_start_date_inp").val();
			var picker = timepickers[info.find(".match_schedule_detail").data("time-piker-idx")];
			var hour = picker.getHour(), minute = picker.getMinute();
			
			var startTimeUnix = moment(startDate+" "+hour+":"+minute,"YYYY년 MM월 DD일 H:m").unix();
			//unixtime으로 long으로 넘겨주면 parameter type에러남
			var startTime = moment(startDate+" "+hour+":"+minute,"YYYY년 MM월 DD일 H:m").toDate();
			//date로 넘겨주면 ok!
			//java.util.Date 로 받을수있다. sql.Date는 못받음
			
			if(moment().unix()-startTimeUnix>0){
				alert("경기시작시간을 현재시간보다 이전으로 설정할 수 없습니다!");
				return false;
			}
			
			
		var selectors=[]; //on이였던 애들을 선택하기위한 배열
			$.ajax({
					url:"/saveMatchSchedule.json",
					method:"POST",
					data:{
						no:matchNo,
						startDate:startTime
					},
					dataType:"json",
					error:function(){alert("save match startTime error")},
					success:function(json){
						if(json.status){
							alert("경기시작 시간이 저장되었습니다.");
						}else{
							alert("저장에 실패했습니다. 다시 시도해주세요.")
						}
					}
			}); 
				
		}).on("click", ".btn.editable.start_match", function(){
			//경기 시작 버튼 클릭이벤트 할당.
			//경기일정 저장버튼 클릭이벤트 할당
			var info = $(this).parents(".round_match"),
			matchNo = info.find(".match_box").data("no");
			
			$.ajax({
				url:"/startMatch.json",
				method:"POST",
				data:{
					no:matchNo
				},
				dataType:"json",
				error:function(){alert("start match error")},
				success:function(json){
					if(json.isDefault){
						if(confirm("부전승처리 하시겠습니까?")){
							$.ajax({
								url:"/winByDefault.json",
								method:"POST",
								data:{
									no:matchNo
								},
								dataType:"json",
								error:function(){alert("win by default error")},
								success:function(){
									location.reload();
								}
							});	
						}
					}else{
						location.reload();
					}
				}
		}); 
		});
	
	</script>
	
	<!-- 위의 클릭이벤트 할당하는 코드보다 나중에 수행해야할 코드 -->
	<script>
	
		//결승전의 경기종료는 모든 경기의 종료와 1등 및 등수를 가리는 특별한 이벤트이기때문에 final_match의 경기종료버튼엔 다른 클릭이벤트를 할당한다.
		 //1.final_match의 경기종료에만 기존에 경기종료버튼에 적용되었던 클릭이벤트를 제거함.
		 $boxMatchChart.find(".final_match .end_match>.btn").off("click").on("click", function(){
			 console.log("final_match end clicked");
			 var info = $(this).parents(".round_match"),
				matchNo = info.find(".match_box").data("no");
				$.ajax({
						url:"/endFinalMatch.json",
						data:{
							no:matchNo
						},
						type:"POST",
						dataType:"json",
						error:function(){alert("end match error")},
						success:function(){
							//성공하면 reload : 왜냐면 다음라운드로 올라가기 때문에. 이건솔직히 form으로 해야되는데, 그냥... 다 ajax니까 일관성을 맞추기위해성
							location.reload();
						}
				});
		 });
	</script>


</body>
</html>