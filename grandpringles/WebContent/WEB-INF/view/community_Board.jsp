<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시글</title>
<%@include file="/WEB-INF/template/link.jsp"%>

<link rel="stylesheet" href="/css/competition_common.css">
<link rel="stylesheet" href="/css/competition_watch_header.css">
<style>
a {
	color: black;
	text-decoration: none;
}

.sort_Box a {
	display: inline-block;
	line-height: 30px;
	text-align: center;
}

#wrap {
	height: 1000px;
	position: relative;
}

/* 커뮤니티 인기 내용 */
#content {
	margin: auto;
	width: 1200px;
	border: 2px solid #fff;
	background: #212121;
}

/* 커뮤니티 탭 (템플릿화) */
#communityTapboard {
	width: 1160px;
	background: #C6C6C6;
	height: 60px;
	position: relative;
	top: 20px;
	left: 20px;
}
/* 커뮤니티 탭 게시물 각 탭 속성 */
#communityTapboard>div {
cursor:pointer;
	position: absolute;
	width: 228px;
	height: 60px;
	font-size: 25px;
	line-height: 60px;
	text-align: center;
	border-right: 5px solid #212121;
	color: #424242;
}
/*<!--커뮤니티 탭 : 인기 잡담 미디어 배팅 토론 -->*/
/* 게시물 각 탭 속성 */
#communityTapboard>#popularityTab {
	left: 0px;
}

#communityTapboard>#chattingTab {
	left: 233px;
}

#communityTapboard>#mediaTab {
	left: 466px;
}

#communityTapboard>#battingTab {
	right: 228px;
}

#communityTapboard>#debateTab {
	border: none;
	right: 0px;
}

#communityTapboard .participant_board.on {
	background: #FFF176;
	color: black;
}

/* 모든 게시물 공통 사항 */

/* 1_게시물 제목 박스 (제목, 추천갯수) */
.post_Box>.post_Title_Box {
	position: relative;
	width: 730px;
	height: 40px;
}

/* 2_게시물 제목 */
.post_Box>.post_Title_Box>.post_Title {
	position: absolute;
	left: 0px;
	background: transparent;
	position: absolute;
	top: -5px;
	width: 650px;
	height: 30px;
	line-height: 30px;
	font-size: 25px;
	font-weight: 600;
	padding: 5px 5px 2px 10px;
	border-bottom: 3px solid #BDBDBD;
}

/* 3_게시물 추천 갯수 */
.post_Box>.post_Title_Box>.post_Like {
	width: 65px;
	height: 35px;
	line-height: 35px;
	text-align: center;
	position: absolute;
	top: -3px;
	right: 0px;
	font-size: 20px;
	font-weight: 600;
	border-radius: 35px;
	background: #fafafa;
}

/* 4_게시글 추천 폰트 어썸 */
.post_Box>.post_Title_Box>.post_Like>i {
	color: red;
	top: 7px;
}

/* 5_게시물 내용 프리뷰 */
.preview_Box {
	padding: 10px;
	position: absolute;
	width: 700px;
	height: 95px;
	left: 10px;
	top: 5px;
	border-radius: 10px;
	background: #EEEEEE;
	font-size: 17px;
}

/* 6_내용 대표 항목 (이미지, 간편배팅, 투표) */
.content_Item {
	position: absolute;
	width: 200px;
	height: 200px;
	right: 20px;
	top: -40px;
	border: 3px solid #BDBDBD;
	font-size: 25px;
	line-height: 200px;
	text-align: center;
	z-index: 1;
}

/* 7_작성 기록 (작성자, 작성 시간) */
.content_Writer_Time {
	position: absolute;
	width: 720px;
	height: 30px;
	line-height: 30px;
	bottom: 10px;
	margin-left: 10px;
	color: #9E9E9E;
	font-weight: 300;
}

/* 8_글 내용을 담은 Box */
.content_Box {
	width: 1000px;
	height: 140px;
	position: relative;
}

/* 해당 페이지를 감싸는 가장 큰 틀 */
#Wrapcommunity {
	padding-top: 20px;
	position: relative;
	width: 1160px;
	height: 870px;
	top: 33px;
	left: 20px;
	background: #D2D2D2;
}

/* 정렬 label */
#Wrapcommunity>label {
	left: 70px;
	box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

/* 정렬 버튼들을 담은 BOX */
#Wrapcommunity .sort_Box {
	width: 1050px;
	height: 50px;
	position: relative;
	left: 60px;
	top: 2px; 
	
}



/* 정렬 버튼 CSS */
#Wrapcommunity .btn_sort {
	height: 30px;
	width: 100px;
	background: rgb(235, 235, 235);
	box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	border: none;
	border-radius: 30px;
		
	
	
	
}

/* 인기순 */
#popularityBtn {
	margin-left:170px;
}

/* 최신순 */
#latestBtn {
	margin-left:20px;
}

#writeBtn {
	margin-left:530px;
}

/* 정렬 버튼들을 눌렀을 때 */
#Wrapcommunity .btn_sort:hover {
	background: #E0E0E0;
}

/* 정렬 버튼들을 눌렀을 때 */
#Wrapcommunity .btn_sort:active {
	box-shadow: 0 0px 0px;
	background: #E0E0E0;
}

/* 하나의 게시글 속성 */
.post_Box {
	width: 1000px;
	height: 200px;
	position: relative;
	background: #E4E4E4;
	top: 20px;
	padding: 10px;
	border: 3px solid #fff;
	box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	margin: auto;
	margin-bottom: 30px;
}

/* 작성자와 시간을 떨어뜨리기 위한 마진 부여 */
.writer {
	margin-right: 20px;
}

.views {
	position: absolute;
    right: 10px;
}

/*배팅*/
#BoxBatting {
	width: 300px;
	min-height: 70px;
	position: fixed;
	right: 20px;
	top: 120px;
	background: #FAFAFA;
	border-radius: 20px;
	box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	display: none;
}

#BoxBatting.on {
	display: block;
}

#BoxBatting label {
	display: block;
	padding: 10px 0 10px 0;
}

#BoxBatting .Batting_input {
	padding: 20px 0px 20px 20px;
}

#BoxBatting .Batting_input input {
	width: 120px;
}

.easy_Preview_Box {
	position: absolute;
	width: 180px;
	height: 180px;
	right: 33px;
	top: -28px;
}

/*그래프*/
.content_Table th { /* table의 th - 투표의 답이 들어가는 부분 */
	height: 41px;
	text-align: left;
	margin: 0px;
	color: #333333;
	font-size: 15px;
	/*padding-right: 20px;*/
	display: inline-block;
	width: 100px;
}

.content_Table td {
	/* td의 텍스트 element 지정 // 그래프가 들어가는 부분에는 텍스트가 없으므로 전체 td로 정해버렸음 */
	color: #757575;
	font-size: 12px;
}

.content_Table .content_graph {
	width: 150px;
	height: 15px;
	background-color: #FFAE22; /* 속을 파낸 그래프 테두리안에 off 컬러 지정 */
	margin-top: 5px;
}

.bar {
	width: 150px;
	height: 15px;
	transition: 500ms ease;
}

.content_Table .bold_yl {
	color: #D68A06;
} /* 우측의 투표인원수의 컬러값 지정 */

/*페이징 CSS*/
#boxRecruitPage {
	position: absolute;
	bottom: 30px;
	left: 50%;
	margin-left: -75px;
}

#boxRecruitPage li {
	display: inline-block;
	float: left;
	width: 20px;
	height: 20px;
	/*background: red;*/
	margin: 5px;
	font-size: 20px;
	cursor: pointer;
	border-radius: 50px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	opacity: 0.5;
	text-align: center;
}

#boxRecruitPage i {
	color: #424242;
}

#boxRecruitPage li:hover {
	opacity: 1;
}

.paginate {
	width: 60px;
	height: 40px;
	position: absolute;
	bottom: 10px;
	left: 50%;
	margin-left: -30px;
	font-size: 25px;
	color: black;
}

.paginate a {
	color: #424242;
	font-size: 20px;
	text-decoration: none;
}

.paginate i {
	font-size: 20px;
	text-decoration: none;
}

#Css_label {
 width: 150px;                               /*너비*/
    height: 30px;                               /*높이*/
    background:rgb(235,235,235);         /*배경색*/
    font-size: 18px;                            /*글자크기*/
    color: #424242;                             /*글자색*/
    line-height: 30px;                          /*폰트수직정렬*/
    text-align: center;                         /*폰트수평정렬*/
    border: 1px solid #BDBDBD; 
}

.label_css {
	top: 0px;
	left: 0;
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
		<div id="competitionTapboard">
			<a id="previewTab" class=" board_css"
				href="/${grndNo}/${grndNum}/information/view">관람</a>
			 <a id="informationTab" class=" board_css"
				href="/${grndNo}/${grndNum}/management/schedule/">대회정보</a>
			<a id="communityTab" class=" board_css on" 
				href="/${grndNo}/${grndNum}/community/pop/new/page/1">커뮤니티</a>
		</div>
		<!--competitionTapboard End-->


		<div id="wrap">
			<!--커뮤니티 탭 -->
			<div id="communityTapboard">
				<div id="popularityTab" class="participant_board">인기</div>
				<div id="chattingTab" class="participant_board">잡담</div>
				<div id="mediaTab" class="participant_board">미디어</div>
				<div id="battingTab" class="participant_board">배팅</div>
				<div id="debateTab" class="participant_board">토론</div>
			</div>
			<!--communityTapboard-->
			<!-- 인기순, 최신순, 잡담,배팅,룰추천 감싸는 Wrap -->
			<div id="Wrapcommunity">
				
				
				<div class="sort_Box">						
					<label id=Css_label class="label_css">정렬</label>
								
					<a id="popularityBtn" class="btn_sort" href="/${grndNo}/${grndNum}/community/${type}/hot/page/1">인기순</a> 
					<a id="latestBtn" class="btn_sort" href="/${grndNo}/${grndNum}/community/${type}/new/page/1">최신순</a>
					<c:if test="${loginUser!=null}">					
					<a id="writeBtn" class="btn_sort" href="/${grndNo}/${grndNum}/community/writeForm">글쓰기</a>
					</c:if>		
				</div>
				
				
				<div class="temp">
					<!--일반글-->
					<c:forEach items="${boards}" var="board">
					<a href="/${grndNo}/${grndNum}/community/${type}/${board.boardNo}">
						<div class="post_Box">
							<div class="post_Title_Box">

								<span class="post_Title">${board.title}</span> <span
									class="post_Like"><i class="far fa-thumbs-up"></i>${board.liking}</span>
							</div>

							<div class="content_Box">
								<span class="preview_Box">${board.content}
								</span>
								<!--Content_Box End-->
								<span class="content_Item"> <img src="/img/team_logo.jpg"
									width="200" height="200">
								</span>
								<!--img 부분에 이미지뿐만 아니라 영상도 들어가야함 (더찾기)-->
							</div>
							<div class="content_Writer_Time">

								<span class="writer">${board.nickname}</span>
								<span class="time">	${board.regDate}</span>
								<span class="views">${board.viewCnt}</span>
							</div>
						</div>
					</a>
					</c:forEach>
				</div>
			
				
				<%--paginate --%>
				${paginate}
			</div>
		</div>
	</div><!-- //#content -->
	
	<!-- 언더스코어 탬플릿이 들어가야함  -->

	<%@include file="/WEB-INF/template/footer.jsp"%>

	<%@include file="/WEB-INF/template/js.jsp"%>


	<!-- 대회 헤더  -->
	<script>
		$(".board_css").click(function() {
			var idx = $(this).index();
			$(".board_css").removeClass("on");
			$(".board_css").eq(idx).addClass("on")
		});
	</script>

	<!-- 커뮤니티 탭  -->
	<script>
		$(".participant_board").click(function() {
			var idx = $(this).index();
			$(".participant_board").removeClass("on");
			$(".participant_board").eq(idx).addClass("on")
		});
	</script>

	<script>
		/* var $listPopupDots = $("#listPopupDots"), resultTmp = _.template($("#ResultTmp").html()), resultMarkup = resultTmp();
		//dots 버튼 클릭시 하위메뉴 보이기, 보이지않기
		$(".dots").on("click", function(e) {
			//문제 3. 이것좀 세련되게 보이기.
			$listPopupDots.slideToggle();
			return false;
		});

		$("body").on("click", function() {
			$listPopupDots.slideUp();
		});

		//간편배팅 누르면 배팅화면나옴
		$(".batting_Easy").click(function() {
			$("#BoxBatting").addClass("on")
		})
		$(".batting_select").click(function() {
			$("#BoxBatting").removeclass("on")
		})

		//    간편 투표 확인
		$(".debate_Easy_Result").click(function() {
			$(".debate_Easy_Result").css("display", "none")
			$(".easy_Preview_Box").append(resultMarkup)
		}) */
	</script>

	<!-- 인기순, 최신순에 대한 정렬 버튼 -->
	<script>
		// 인기순 버튼을 누르면
		$('#popularityBtn').on("click", function() {

			// pageNo가 1로 넘어가지며

			// 해당 게시글이 전부 지워지고
			$(".post_Box").remove();
			// 인기순으로 정렬 된다.		
		});

		// 최신순 버튼을 누르면
		$('#popularityBtn').on("click", function() {

			// pageNo가 1로 넘어가지며

			// 해당 게시글이 전부 지워지고
			$(".post_Box").remove();
			// 최신순으로 정렬 된다.		
		});
	</script>
	
	<script>
	/*탭 이동*/	
	
		if('${type}' == 'pop') {
			$("#popularityTab").addClass("on");
		} else if('${type}' == 'free') {
			$("#chattingTab").addClass("on");
		} else if('${type}' == 'media') {
			$("#mediaTab").addClass("on");
		} else if('${type}' == 'bet') {
			$("#battingTab").addClass("on");
		} else {
			$("#debateTab").addClass("on");
		}

		$("#popularityTab").on("click", function() {
			location.href = 'http://localhost/' + ${grndNo}+ '/' +${grndNum}+ '/community/pop/new/page/1';
		});		
	
		$("#chattingTab").on("click", function() {			
			location.href = 'http://localhost/' + ${grndNo}+ '/' +${grndNum}+ '/community/free/new/page/1';
		});
		
		$("#mediaTab").on("click", function() {
			location.href = 'http://localhost/' + ${grndNo}+ '/' +${grndNum}+ '/community/media/new/page/1';
		});
		
		$("#battingTab").on("click", function() {
			location.href = 'http://localhost/' + ${grndNo}+ '/' +${grndNum}+ '/community/bet/new/page/1';
		});
		
		$("#debateTab").on("click", function() {
			location.href = 'http://localhost/' + ${grndNo}+ '/' +${grndNum}+ '/community/debate/new/page/1';
		});		
	</script>
	
</body>
</html>