<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>그랑프링글스</title>
<%@include file="/WEB-INF/template/link.jsp"%>

<style>
a {
	text-decoration: none;
	cursor: pointer;
}

ol, ul {
	list-style: none;
}

#content {
	width: 100%;
}

/*전체박스*/
#wrapMain {
	width: 1600px;
	min-height: 900px;
	padding: 15px 0;
	background-color: #424242;
	margin: auto;
}

/*------------------상단CSS------------------*/

/*상단 공간*/
#intro {
	padding-bottom: 15px;
	overflow: hidden;
}

.empty{
	width:100%;
	height:642.75px;
	
	
	line-height:642.75px;
	text-align:center;
	
	font-size:75px;
	color:#B71C1C;
}

#boxUpSpace {
	/*박스모델 완성된 후, 스타일 적용을 위한 postion변경*/
	z-index: 1;
	position: relative;
	width: 100%;
	margin: auto;
	padding: 0 10px;
	text-align: center;
}

#boxUpSpace>div {
	display: inline-block;
	vertical-align: middle;
	margin: 0 5px;
}

/*트위치 영상 담는 박스*/
#boxLive {
	width: 1000px;
	height: 500px;
}

/*우측 상단 소개*/
#listCompetition {
	width: 500px;
	height: 480px;
	border: 1px solid #BDBDBD;
	padding: 10px;
	background: #EEEEEE;
}
/*맨위 게임 이름*/
#gameName {
	width: 500px;
	height: 38px;
	line-height: 40px;
	font-size: 20px;
	text-align: center;
	background: #CCCCCC;
	color: #424242;
	font-weight: 600;
	border: 1px solid #BDBDBD;
}

#titleCompetition {
	background: #E0E0E0;
	width: 500px;
	height: 78px;
	border: 1px solid #BDBDBD;
}

#titleCompetition>div {
	float: left;
}
/*이미지 및 대회이름 박스*/
#imgBoxCompetition {
	width: 150px;
	height: 78px;
	background-image: url("img/1_대회 로고.PNG");
	background-size: cover;
	background-repeat: no-repeat;
}

/*대회이름*/
#nameCompetition {
	width: 350px;
	height: 78px;
	text-align: center;
	font-size: 25px;
	line-height: 80px;
}

/*대회이름*/
#nameCompetition>a {
	color: #000;
}

/*대회소개 박스*/
#boxIntroduce {
	position: relative;
	width: 500px;
	height: 358px;
	border: 1px solid #BDBDBD;
	background: #EEEEEE;
}

/*대회소개내용 p요소*/
#boxIntroduce #contentIntroduce {
	position: absolute;
	left: 5px;
	top: 2.5px;
	width: 490px;
	height: 353px;
	font-size: 20px;
	text-align: left;
	overflow-y: auto;
}

/*-----------------------------------------------------------*/
/*중단 공간*/

/*이미지 슬라이드*/
#listImg {
	position: relative;
	margin: auto;
	background-color: #151515;
	box-shadow: 0px -30px 50px rgba(0, 0, 0, 0.5), 0px 5px 20px
		rgba(0, 0, 0, 0.5);
}
/*고정박스*/

/*전체 내용 박스*/
#boxCompetition {
	width: 90%;
	margin: auto;
	overflow: hidden;
}

/*움직이게 할 이미지 박스*/
/*imgHistory -> ul로 바꿈*/
#imgHistory {
	position: relative;
	left: 0;
	width: 2880px;
	height: 140px;
	transition: 0.7s ease;
	overflow: hidden;
}

/*역대이미지 하나하나 감싸는 span*/
#imgHistory .img_span {
	float: left;
	width: 200px;
	height: 110px;
	margin: 15px 20px;
	cursor: pointer;
}

#imgHistory .img_span img {
	width: 200px;
	height: 110px;
	opacity: 0.3;
	transition: 0.2s ease;
}

#imgHistory .img_span.on img {
	opacity: 0.8;
}

#imgHistory .img_span:hover img {
	opacity: 1;
}

/*슬라이드 버튼박스!!*/
.btn_img {
	z-index: 1;
	position: absolute;
	top: 0px;
	margin: 5px;
	height: 130px;
	width: 70px;
	color: gray;
	text-align: center;
	line-height: 130px;
	cursor: pointer;
	opacity: 0.3;
	transition: 0.3s ease;
	display: none;
}

.btn_img.on {
	display: block;
}
/*버튼 위치지정*/
#imgRightBtn {
	right: 0px;
}

#imgLeftBtn {
	left: 0px;
}
/*폰트어섬 위치지정, 폰트 크기*/
.fa-arrow-right {
	font-size: 50px;
	position: absolute;
	left: 15px;
	top: 40px;
}

.fa-arrow-left {
	font-size: 50px;
	position: absolute;
	left: 15px;
	top: 40px;
}

/*슬라이드 버튼 호버시*/
.btn_img:hover {
	opacity: 1;
	color: #B71C1C;
}

.inline_box {
	display: inline-block;
}

/*-----------------------------------------------------------*/

/*하단 공간*/
#boxDownSpace {
	height: 300px;
	padding-top: 5px;
	background-color: #424242;
}

#boxDownSpace>div {
	float: left;
}

/*개최자 정보*/
#listHost {
	width: 39%;
	height: 300px;
	margin: 0 0.5%;
}
/*개최자 이름*/
#listHost #hostName {
	height: 40px;
	padding-left: 10px;
	font-size: 20px;
	font-weight: 600;
	line-height: 40px;
	background: #949494;
}

/*검색창*/
#hostName #hostFind {
	position: relative;
	float: right;
	height: 40px;
}

/*검색창 INPUT*/
#hostFind .input_search {
	display: block;
	width: 180px;
	height: 34px;
	border: 2px solid #FAFAFA;
	border-radius: 30px;
	padding-left: 10px;
	color: #424242;
	background-color: transparent;
}
/*검색창 BTN*/
#hostFind #insertBtn {
	background: transparent;
	border: none;
	height: 25px;
	line-height: 25px;
	position: absolute;
	top: 7.5px;
	right: 10px;
	cursor: pointer;
}

/*개최자박스 안에내용*/
#hostBox {
	height: 260px;
	background: #D6D6D6;
	overflow: auto;
}
/*개최자 한명에 대한 박스*/
#hostBox .list_host {
	float: left;
	height: 70px;
	width: 48%;
	padding: 2.5px 1%;
	list-style: none;
	cursor: pointer;
	transition: 0.2s ease;
}

#hostBox .list_host:hover {
	background-color: #828282;
}

#hostBox .list_host>* {
	float: left;
}

/*개최자 이미지*/
#hostBox .host_img {
	height: 70px;
	width: 70px;
	border-radius: 70px;
}
/*개최자 이름 들어가는 곳*/
.name_host {
	width: calc(100% - 70px);
	height: 70px;
	line-height: 70px;
	font-size: 25px;
	text-align: center;
}

/*커뮤니티 인기글*/
#listCommunity {
	width: 59%;
	margin: 0 0.5%;
	background: #F5F5F5;
}

#nameCommunity {
	height: 40px;
	background: #949494;
	font-size: 20px;
	font-weight: 600;
	text-align: center;
	line-height: 40px;
}

#boxContentCommunity {
	height: 255px;
	padding-top: 5px;
	background: #D6D6D6;
}
/*인기글 핫아이디어 공통class*/
#boxContentCommunity .posts_box {
	float: left;
	width: 49%;
	height: 253px;
	margin: 0 0.5%;
}

#boxContentCommunity .posts_span {
	position: relative;
	width: 95%;
	height: 40px;
	line-height: 40px;
	text-align: left;
	font-size: 20px;
	padding-left: 5%;
	background: #C8C8C8;
}

.posts_btn {
	position: absolute;
	top: 10px;
	right: 10px;
	border: none;
	box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0
		rgba(0, 0, 0, 0.19);
	background: #FFF176;
	cursor: pointer;
}

.box_list_posts {
	height: 225px;
}

.community_ul {
	height: 210px;
	border: 1px solid #BDBDBD;
	overflow: auto;
}

.community_li {
	position: relative;
	width: 90%;
	height: 30px;
	padding-left: 10px;
	margin: 10px auto;
	font-size: 15px;
	line-height: 30px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	list-style: none;
}

.community_li a {
	font-size: 15px;
	color: #424242;
}

.community_like {
	position: absolute;
	right: 10px;
	top: 5px;
	width: 60px;
	height: 20px;
	border-radius: 30px;
	font-size: 20px;
	background: #E4E4E4;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	text-align: center;
	line-height: 20px;
}

.fa-thumbs-up {
	width: 15px;
	height: 20px;
}

.community_content {
	font-size: 15px;
}

.fa-thumbs-up {
	width: 15px;
	height: 20px;
}

.community_content {
	font-size: 15px;
}

/*-------------------------------------------*/
</style>

</head>

<body>
	<h1 class="screen_out">그랑프링글스</h1>
 
	<%@include file="/WEB-INF/template/header.jsp"%><!--header-->

	<div id="content">


		<!-- 메인 Wrap-->
		<!-- 노트북이라 height 최대값이 다를수도 있음 -->
		<div id="wrapMain">

			<div id="intro">
				<c:choose>
					<c:when test="${isEmpty }">
						<div class="empty">
							현재 진행중인 대회가 없습니다 ㅠㅠ
						</div>
					</c:when>
					<c:otherwise>
						<!--트위치 API 따오는곳 (아직 적용을 못함 질문내용) -->
						<div id="boxUpSpace">

							<div id="boxLive" class="inline_box">
								<c:choose>
								<c:when test="${grandprix.status.equals('W')}">
										<img id="grndLogo" src="/img/grndLogo/<c:out value="${grnd.image }" default="Default"/>" width="1000" height="500"/>
								</c:when>
								<c:otherwise>
																<iframe id="iframe"
												src=" http://player.twitch.tv/?channel=${grandprix.channelId }"
												height="500" width="1000" frameborder="0" scrolling="no"
												allowfullscreen="true"> </iframe>
								</c:otherwise>
							</c:choose>

							</div>
					    <script type="text/template" id="videoTmp">
												<iframe id="iframe"
												src=" http://player.twitch.tv/?channel=<@=channelId@>"
												height="500" width="1000" frameborder="0" scrolling="no"
												allowfullscreen="true"> </iframe>
						</script>
					    <script type="text/template" id="imgTmp">
								<img id="grndLogo" src="/img/grndLogo/<c:out value="<@=image@>" default="로고.png"/>" width="1000" height="500"/>	
						</script>

							<div id="listCompetition">
								<div id="gameName">리그오브레전드</div>
								<!--대회 이미지 and 게임 이름-->
								<div id="titleCompetition">
									<div id="imgBoxCompetition" ></div>
									<div id="nameCompetition">
										<a id="title"
											href="/${grndName.no}/${grandprix.num}/information/view">${grndName.title}</a>
									</div>
								</div>
								<!-- .competition_title end-->
								<!-- 대회소개 및 대회 대진표 -->
								<div id="boxIntroduce">
									<p id="contentIntroduce">${grandprix.intro}</p>
								</div>
							</div>
							<!-- #List_Competition end-->
						</div>
						<!--boxUpSpace-->



						<!--이미지 슬라이드-->
						<div id="listImg">

							<div id="boxCompetition">
								<ul id="imgHistory">
									<c:forEach items="${grndList }" var="grnd" varStatus="status">
										<li
											class="img_span <c:if test="${status.index==0 }">on</c:if>"
											data-no="${grnd.grndNo }"><img
											src="/img/grndLogo/<c:out value="${grnd.image }" default="default"/>" />
										</li>


									</c:forEach>

								</ul>
								<!--imgHistory-->


								<div id="imgRightBtn" class="btn_img on">
									<i class="fas fa-arrow-right"></i>
								</div>
								<div id="imgLeftBtn" class="btn_img">
									<i class="fas fa-arrow-left"></i>
								</div>

							</div>
							<!--List_img-->
						</div>
						<!--Box_competition-->
					</c:otherwise>
				</c:choose>
			</div>


			<!--하단부부-->
			<div id="boxDownSpace">
				<div id="listHost">

					<div id="hostName">
						<span>개최자</span>
						<div id="hostFind">

							<input class="input_search" type="text" placeholder="닉네임">

							<button id="insertBtn">
								<i class="fas fa-search"></i>
							</button>



						</div>
						<!--.hostFind-->
					</div>



					<div id="hostBox">
						<ul id="streamerSearch">


						</ul>
						<script type="text/template" id="streamerTmp">
									<@ _.each(list,function(steamer){ @>
							<li class="list_host">

<@if(steamer.profile!=null) {@>
<img src="/img/profile/<@=steamer.profile@>" class="host_img">
<@}else {@>
<img src="/img/profile/<@="로고.png"@>" class="host_img">
<@}@>

								<span class="inline_box name_host"> <@=steamer.nickname@> </span>
							</li>
									<@})@>
						</script>


					</div>
					<!--boxHost-->




				</div>
				<!-- #listHost end-->



				<div id="listCommunity">

					<div id="nameCommunity">League Of Legend 커뮤니티</div>
					<div id="boxContentCommunity">
						<div id="popularPosts" class="posts_box">
							<span id="popularTitle" class="posts_span inline_box">인기글
								<button class="posts_btn">More+</button>
							</span>
							<div class="box_list_posts">
								<ul class="community_ul" id="boardPopular">
									<c:forEach items="${boardPopular }" var="board">
										<li class="community_li"><span class="community_content">
												<a href="/${board.grndNo}/${board.grndNum}/community/pop/${board.boardNo}">${board.title }</a>
										</span> <span class="community_like"> <i
												class="far fa-thumbs-up"></i> ${board.liking }
										</span></li>
									</c:forEach>

								</ul>
								<script type="text/template" id="boardPopularTmp">

									<@ _.each(list,function(board){ @>
									<li class="community_li"><span class="community_content">
											<a href="/<@=board.grndNo@>/<@=board.grndNum@>/community/pop/<@=board.boardNo@>"><@=board.title@></a>
									</span> <span class="community_like"><i
											class="far fa-thumbs-up"></i> <@=board.liking@></span></li>

									<@})@>

								</script>


							</div>
						</div>

						<div id="hotIdeaPosts" class="posts_box">
							<span id="hotIdeaTitle" class="posts_span inline_box">최신글
								<button class="posts_btn">More+</button>
							</span>
							<div class="box_list_posts">
								<ul class="community_ul" id="boardNew">
									<c:forEach items="${boardNew }" var="board">
										<li class="community_li"><span class="community_content">
												<a href="/${board.grndNo}/${board.grndNum}/community/pop/${board.boardNo}">${board.title }</a>
										</span> <span class="community_like"><i
												class="far fa-thumbs-up"></i> ${board.liking }</span></li>
									</c:forEach>
								</ul>
								<script type="text/template" id="boardNewTmp">

									<@ _.each(list,function(board){ @>
									<li class="community_li"><span class="community_content">
											<a href="/<@=board.grndNo@>/<@=board.grndNum@>/community/pop/<@=board.boardNo@>"><@=board.title@></a>
									</span> <span class="community_like"><i
											class="far fa-thumbs-up"></i> <@=board.liking@></span></li>

									<@})@>

								</script>
							</div>
						</div>
					</div>
					<!--nameCommunity-->


				</div>
				<!-- #List_community end-->




			</div>


		</div>
		<!-- #Warp_main end-->


	</div>
	<!--content-->



	<%@include file="/WEB-INF/template/footer.jsp"%><!--footer-->

	<%@include file="/WEB-INF/template/js.jsp"%>

	<script>
			_.templateSettings = {
					interpolate: /\<\@\=(.+?)\@\>/gim,
					evaluate: /\<\@(.+?)\@\>/gim,
					escape: /\<\@\-(.+?)\@\>/gim
			};
			var grndNo = 0;
			var boardPopularTmp = _.template($("#boardPopularTmp").html());
			var boardNewTmp = _.template($("#boardNewTmp").html());
			var streamerTmp = _.template($("#streamerTmp").html());
			var videoTmp = _.template($("#videoTmp").html());
			var imgTmp = _.template($("#imgTmp").html());
		</script>
	<!-- 전체 값 바뀌는 ajax -->
	<script>
	//이미지 클릭할때 대회정보 바뀌는 함수
	function getGrandprixList(clickedItem) {
		$(".community_li").remove();
		$.ajax({
			url:"/ajax/mainGrandprixContent.json?grndNo="+grndNo,
			dateType :"json",
			error:function() {
				alert("mainGrandprixInfo err")
			},
			success:function(json) {
				console.log("sucess load grnd num : ");
				/*
					Map "grandprixName", "grandprix", "boardPopular","boardNew", 

				*/
				console.log(json);
				var grndName = json.grndName,
					grandprix = json.grandprix;
					boardPopular =  json.boardPopular,
					boardNew = json.boardNew;
					

				if(grandprix.status=='W'){
					$("#iframe").remove()
					$("#grndLogo").remove()
					var code = imgTmp({"img":grandprix.image})
					$("#boxLive").append(code);
				}else {
					$("#iframe").remove()
					$("#grndLogo").remove()
					var code = videoTmp({"channelId":grandprix.channelId})
					$("#boxLive").append(code);
				}

				$("#iframe").attr("src", "http://player.twitch.tv/?channel="+grandprix.channelId)
				$("#grndLogo").attr("src", "/img/grndLogo/"+grandprix.image)
				$("#contentIntroduce").html(grandprix.participantAnnounce);
				
				 $("#title").text(grndName.title);
				 $("#title").attr("href","/"+grandprix.grndNo+"/"+grandprix.num+"/information/view");
				
				var boardPopularCode = boardPopularTmp({"list":boardPopular});
				console.log(boardPopularCode);
				$("#boardPopular").empty();
				$("#boardPopular").append(boardPopularCode);
				
				var boardNewCode = boardNewTmp({"list":boardNew})
						
				$("#boardNew").empty();
				$("#boardNew").append(boardNewCode);
				
				
				//선택된 대회이미지에 on붙이기
				
				changeOnImg(clickedItem);
				

			}
		});
	}

	
	</script>



	<script>
	var $imgHistory = $("#imgHistory");
	function changeOnImg(clickedItem){
		$imgHistory.find(".img_span.on").removeClass("on");
		clickedItem.addClass("on");
	}
	
	$(".img_span").click(function() {
		var clickedItem = $(this);
		grndNo =clickedItem.data("no");
		getGrandprixList(clickedItem);

	});
	
	</script>
	<!-- 개최자 검색 ajax -->
	<script>
	var $inputSearch = $(".input_search");
	
	SteamerSearch();
	
	$("#testBtn").on("click",function(){
		if($inputSearch.val()=="")console.log(null);
	})
	
	$inputSearch.on("focusout",function(){
		SteamerSearch();
	});
	

	function SteamerSearch() {
		$(".list_host").remove();
		var nickname = $inputSearch.val();
		
		if(nickname=="")
			{
			nickname=null;
			}
		
		$.ajax({
			url:"/ajax/streamerList.json",
			data:{"nickname":nickname},
			dateType :"json",
			error:function() {
				alert("StreamerList err")
			},
			success:function(json) {
				console.log(json);
				var code = streamerTmp({"list":json})
				$("#streamerSearch").empty();
				$("#streamerSearch").append(code);
				console.log("SteamerSearch sucess");
				
			},
		});

	}
	$("#insertBtn").click(SteamerSearch)

	$(".input_search").keyup(function (e) {

		if(e.keyCode == 13) {
			SteamerSearch();
		}
	})
	</script>


	<script>

	console.log("hi");
		var left = 0;
		var $imgLi = $("#imgHistory>li");
		var imgListShowWidth = $("#boxCompetition").width(),
			imgListCount = $imgLi.length
			imgListBoxWidth=$imgLi.width()+parseInt($imgLi.css("margin-left").replace(/[^-\d\.]/g, ''));
		/*
			imgListCount 는 대회리스트 아이템 갯수
			imgListBoxWidth는 리스트아이템의 박스모델 크기
			imgListShowWidth는 보여지는 박스의 길이
			그래서
			imgListShowWidth/imgListBoxWidth는 그 박스에서 보여질 수 있는 최대 리스트갯수
			
		*/
		var maxImgLiCount  = $("#imgHistory").width()/imgListBoxWidth; // imgList에 최대로 들어갈 수 있는 이미지 갯수
		var maxCount = Math.floor(imgListShowWidth/imgListBoxWidth);
		/*
		 	 maxCount보다 대회리스트 갯수가 적으면 버튼을 클릭해도 움직이지 않는다.(활성화시키지 않는다.)
		 	 지금은 6.5개 나온다.
		 	 => 6개로 버리자
		*/
		 	 //최대로 right로 갈 수 있는 횟수 : 리스트아이템의 갯수가 최대로 보여줄 수 있는 아이템 갯수보다 많을때, 
		 	 //리스트아이템갯수-최대로보여줄 수 있는 갯수 : 최대로 right를 누를 수 있는 횟수.
		
		/*
			그냥 한번에 보여줄수 있는 갯수만큼 넘기는게 좋겠다.
			현재 아이템갯수 / 최대보여줄수있는갯수 -> 올림 => -1이 최대 클릭횟수
		*/
		var rightCount = Math.ceil(imgListCount/maxCount)-1,
			clickedCnt  = 0;
		console.log(rightCount);
		console.log(maxCount+":"+imgListCount);
		

		var $rightBtn = $("#imgRightBtn"), $leftBtn =  $("#imgLeftBtn")
		if(rightCount==0){
			//리스트아이템이 보여줄수있는 아이템갯수보다 많으면 오른쪽버튼 활성화
			//왼쪽버튼은 처음부터 비활성화
			$rightBtn.removeClass("on");
		}
		
		console.log(maxCount);
		$rightBtn.click(function() {
			$leftBtn.addClass("on");
			if (clickedCnt<rightCount) {
				left -= imgListShowWidth;
				$("#imgHistory").css("left", left);
				clickedCnt++;
			}
			console.log(clickedCnt==rightCount);
			if(clickedCnt==rightCount){
				$rightBtn.removeClass("on");
			}

		})
		$leftBtn.click(function() {
			$rightBtn.addClass("on");
			if (clickedCnt!=0) {
				left += imgListShowWidth;
				$("#imgHistory").css("left", left);
				clickedCnt--;
			}
			if(clickedCnt==0){
				$leftBtn.removeClass("on");
			}

		});
		

	</script>

</body>
</html>