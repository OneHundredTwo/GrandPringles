<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<c:set var="grndparam" value="grndNo=${grnd.grndNo}&grndNum=${grnd.num}" />


<!DOCTYPE html>
<html lang="ko">
<head>
<c:if test="${isConfirmFail }">
	<script>
		alert("참가승인에 실패했습니다. 참가인원을 확인해주세요.");
	</script>
</c:if>

<c:if test="${isRejectFail }">
	<script>
		alert("참가거절에 실패했습니다. 확인 후 다시 시도해주세요.");
	</script>
</c:if>

<meta charset="UTF-8">
<title>대회관리-참가자관리</title>
<%@include file="/WEB-INF/template/link.jsp"%>
<link rel="stylesheet" href="/css/competition_watch_header.css">

<link rel="stylesheet" href="/css/management_common.css">

<link rel="stylesheet" href="/css/tui-date-picker.css">
<style>
a {
	text-decoration: none;
	color: #424242;
}

/*참가자 관리*/
/*모집목록 승인목록 공통요소*/
.member_Manage_list {
	float: left;
	position: relative;
	background: #E0E0E0;
	border-radius: 10px;
}
/*모집,승인목록의 h4*/
.member_Manage_list h4 {
	margin-top: 10px;
	font-size: 30px;
	text-align: center;
}

/*모집목록 */
#recruitMember {
	width: 490px;
	height: 400px;
	position: relative;
	top: 70px;
	margin-left: 5px;
	border-bottom: none;
	text-align: center;
}
/*승인목록*/
#approveMember {
	width: 490px;
	height: 400px;
	position: relative;
	top: 70px;
	margin-left: 5px;
	border-bottom: none;
	text-align: center;
}
/*참가인원 변경*/
#changeMemberCount {
	display: inline-block;
	position: relative;
	width: 1000px;
	margin-right: 5px;
	top: 70px;
	background: #D2D2D2;
}

#boxTable {
	width: 450px;
	height: 300px;
	background: #F0F0F0;
	position: absolute;
	top: 50px;
	left: 35px;
	border-radius: 20px;
}

#memberTable {
	position: absolute;
	top: 25px;
	left: 25px;
	width: 400px;
	/*min-height: 500px;*/
}

#memberTable td, th {
	width: 100px;
	font-size: 20px;
	text-align: center;
	border: 3px solid #FAFAFA;
	box-shadow: 1px 2px 2px rgba(0, 0, 0, 0.4);
}

.button {
	display: inline-block;
	width: 70px;
	height: 30px;
	background: #E0E0E0;
	border: none;
	text-align: center;
	line-height: 30px;
	border-radius: 5px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	
	cursor:pointer;
}

.button:active {
	box-shadow: 0px 0px;
}

.user_name {
	background: #E0E0E0;
	padding: 10px 0px 10px;
	cursor: pointer;
}

/**/
#partInfo {
	position: absolute;
	left: 30px;
	top: 30px;
	font-size: 30px;
}

#partInfo .pre_parts { 
	<c:choose>  
		<c:when test="${grnd.maxParticipant==grnd.numberOfParticipant}">  
			color:red; 
		</c:when>  
		<c:otherwise>  
			color:yellow; 
		</c:otherwise>  
	</c:choose>
}

#partInfo .max_parts {
	color: black;
}

/*페이징 CSS*/
#boxRecruitPage {
	position: absolute;
	bottom: 15px;
	left: 150px;
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
}

#boxRecruitPage li:hover {
	opacity: 1;
}

#boxApprove {
	background: #F0F0F0;
}

#boxApprovePage {
	position: absolute;
	bottom: 15px;
	left: 150px;
}

#boxApprovePage li {
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
}

#boxApprovePage li:hover {
	opacity: 1;
}

/*승인목록*/
#boxApprove {
	width: 450px;
	height: 300px;
	position: absolute;
	top: 50px;
	left: 20px;
	border-radius: 20px;
}

/*승인된 목록*/
.approve_list {
	display: inline-block;
	width: 450px;
	height: 50px;
	margin-top: 5px;
	text-align: center;
	border-bottom: 3px solid #FAFAFA;
	font-size: 30px;
	position: relative;
}

.approve_list .approve_user {
	width: 250px;
	height: 50px;
	text-align: left;
}

.approve_list input {
	position: absolute;
	right: 100px;
	width: 20px;
	height: 20px;
}

/*강퇴 박스*/
#boxReject {
	width: 450px;
	height: 40px;
	background: #F0F0F0;
	position: absolute;
	bottom: 14px;
	left: 0px;
	border-top: 3px #FAFAFA solid;
	border-radius-: 20px;
	line-height: 40px;
	text-align: center;
}

#boxReject #btnReject {
	position: absolute;
	right: 20px;
	bottom: 2px;
}

/*참가인원 변경*/
#changeMemberCount {
	width: 993px;
	height: 100px;
	font-size: 30px;
	text-align: center;
	line-height: 100px;
	border-top: 2px solid black;
	position: relative;
	left: 5px;
}

#changeMemberCount h4 {
	display: inline-block;
	font-size: 18px;
}

#changeMemberCount select {
	width: 100px;
	height: 30px;
	font-size: 18px;
}

.inline_block {
	display: inline-block;
}

.paginate {
	position: absolute;
	bottom: 0;
	left: 150px;
}

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

#popCondition {
	position: relative;
	width: 450px;
	margin: auto;
	/*밴드엔 있는 왜있는지 모르겠는 애, 없어도 지장없다*/
	align-self: flex-start;
}

#conditions {
	background-color: #222222;
}

#conditions .row {
	padding: 3px 10px;
	color: beige;
	font-size: 13px;
}

#conditions .title {
	background-color: #ff3333;
	color: #111111;
}

#conditions .content.image {
	text-align: center;
}

#conditions .content.text {
	
}

#conditions .img_cond {
	width: 150px;
	height: 150px;
}

#conditions .box_btn {
	background-color: #424242;
	padding: 10px 10px;
}

#conditions form{
	display:inline-block;
}
</style>

</head>
<body>
	<h1 class="screen_out">그랑프링글스</h1>
	<h2 class="screen_out">대회정보</h2>

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
    


		<div id="boxInfoContent">
			<h3 class=screen_out>참가자관리</h3>
			<div class="management_contents_tab" data-index="2">
			<div id="tabInfomationContents">
				<div class="vertical_tab">
						<ul>
							<li><a class="vertical_tab_item" href="/${grandprix.grndNo }/${grandprix.num}/management/schedule" title="대회일정 탭">대회일정</a></li>
							<li><a class="vertical_tab_item" href="/${grandprix.grndNo }/${grandprix.num}/management/announce_log" title="대회공지사항 탭">대회공지사항</a></li>
							<li><a class="vertical_tab_item on" href="/${grandprix.grndNo }/${grandprix.num}/management/participations?applyPage=1&partPage=1" title="참가자관리 탭">참가자관리</a></li>
							<li><a class="vertical_tab_item" href="/${grandprix.grndNo }/${grandprix.num}/management/prixes" title="상품관리 탭">상품관리</a></li>
							<li><a class="vertical_tab_item" href="/${grandprix.grndNo }/${grandprix.num}/management/match_chart" title="경기관리 탭">경기관리</a></li>
						</ul>
					</div>
				</div><!--tabInfomationContents-->
				


				<h4 class="screen_out">참가자관리</h4>
				<div id="partInfo">
					현재 <span class="pre_parts">${grnd.numberOfParticipant }</span>/최대 <span
						class="max_parts">${grnd.maxParticipant }</span>
				</div>
				<div id="recruitMember" class="member_Manage_list">
					<h4>모집목록</h4>
					<div id="boxTable">

						<table id="memberTable">
							<tbody>
								<c:forEach items="${applyList }" var="apply">
									<tr class="member_idx">
										<th class="user_name" data-no="${apply.userNo }"><i
											class="fas fa-user"></i>${apply.userNickname }</th>
										<td>
											<form action="/partConfirm.grnd" method="POST">
												<%-- <input type="hidden" name="_method" value="PUT"/> --%>
												<input type="hidden" name="grndNo" value="${grnd.grndNo }" />
												<input type="hidden" name="grndNum" value="${grnd.num }" />
												<input type="hidden" name="userNo" value="${apply.userNo }" />
												<input type="hidden" name="applyPage" value="${applyPage }" />
												<input type="hidden" name="partPage" value="${partPage }" />
												<button class="button confirm">승인</button>
											</form>
										</td>
										<td>
											<form action="/partReject.grnd" method="POST">
												<%-- <input type="hidden" name="_method" value="DELETE"/> --%>
												<input type="hidden" name="grndNo" value="${grnd.grndNo }" />
												<input type="hidden" name="grndNum" value="${grnd.num }" />
												<input type="hidden" name="userNo" value="${apply.userNo }" />
												<input type="hidden" name="applyPage" value="${applyPage }" />
												<input type="hidden" name="partPage" value="${partPage }" />
												<button class="button reject">거절</button>
											</form>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						${applyPaginate }

						<div id="popLayer">
							<div id="popWrapper">
								<div id="popCondition">
									<div id="conditions"></div>
									<script type="text/template" id="conditionsTmpl">
										<c:forEach items="${conditions }" var="condition">
										<c:if test='${condition.isNecessary.equals("T") }'>
											<c:set var="nec" value="nec"/>
										</c:if>
										<c:choose>
											<c:when test='${condition.isImage.equals("T") }'>
												<div class="row title" ${nec}>Q${condition.num}.${condition.title }</div>
												<p class="row content image">
													<img src="/img/application/" class="img_cond" />
												</p>
											</c:when>
											<c:otherwise>
												<div class="row title" ${nec}>Q${condition.num}.${condition.title }</div>
												<p class="row content text"></p>
											</c:otherwise>
										</c:choose>
										</c:forEach>
<div class="row box_btn">
											<form action="/partConfirm.grnd" method="POST">
												<%-- <input type="hidden" name="_method" value="PUT"/> --%>
												<input type="hidden" name="grndNo" value="${grnd.grndNo }" />
												<input type="hidden" name="grndNum" value="${grnd.num }" />
												<input type="hidden" name="userNo" value="<@=userNo@>" />
												<input type="hidden" name="applyPage" value="${applyPage }" />
												<input type="hidden" name="partPage" value="${partPage }" />
												<button class="button confirm">승인</button>
											</form>
											<form action="/partReject.grnd" method="POST">
												<%-- <input type="hidden" name="_method" value="DELETE"/> --%>
												<input type="hidden" name="grndNo" value="${grnd.grndNo }" />
												<input type="hidden" name="grndNum" value="${grnd.num }" />
												<input type="hidden" name="userNo" value="<@=userNo@>" />
												<input type="hidden" name="applyPage" value="${applyPage }" />
												<input type="hidden" name="partPage" value="${partPage }" />
												<button class="button reject">거절</button>
											</form>
</div>
									</script>
								</div>
							</div>
						</div>



					</div>
					<!--boxTable-->




				</div>
				<!--recruitMember-->

				<div id="approveMember" class="member_Manage_list">

					<h4>승인목록</h4>
					<form action="/extinguishParts.grnd" method="POST">
						<%-- <input type="hidden" name="_method" value="DELETE">--%>
						<input type="hidden" name="grndNo" value="${grnd.grndNo }"/>
						<input type="hidden" name="num" value="${grnd.num }"/>
						<input type="hidden" name="partPage" value="${partPage }"/>
						<input type="hidden" name="applyPage" value="${applyPage }"/>
						<div id="boxApprove">
							<c:forEach items="${partList }" var="part">
								<span class="approve_list"> <span
									class="inline_block approve_user"><i class="fas fa-user"></i>${part.userNickname}</span>
									<input name="userNo" type="checkbox" value="${part.userNo }">
								</span>
							</c:forEach>
	
							<div id="boxReject">
								<button id="btnReject">강퇴</button>
							</div>
							<!--boxReject-->
	
							${partPaginate }
						</div>
					</form>
					<!--approveMember-->
				</div>
				<!--management_contents_tab-->

				<div id="changeMemberCount">
					<h4>최대 참가인원 변경</h4>
					<select name="limit" id="limit">
						<option <c:if test='${grnd.maxParticipant==16}'>selected</c:if>
							value="16">16</option>
						<option <c:if test='${grnd.maxParticipant==15}'>selected</c:if>
							value="15">15</option>
						<option <c:if test='${grnd.maxParticipant==14}'>selected</c:if>
							value="14">14</option>
						<option <c:if test='${grnd.maxParticipant==13}'>selected</c:if>
							value="13">13</option>
						<option <c:if test='${grnd.maxParticipant==12}'>selected</c:if>
							value="12">12</option>
						<option <c:if test='${grnd.maxParticipant==11}'>selected</c:if>
							value="11">11</option>
						<option <c:if test='${grnd.maxParticipant==10}'>selected</c:if>
							value="10">10</option>
						<option <c:if test='${grnd.maxParticipant==9}'>selected</c:if>
							value="9">9</option>
						<option <c:if test='${grnd.maxParticipant==8}'>selected</c:if>
							value="8">8</option>
						<option <c:if test='${grnd.maxParticipant==7}'>selected</c:if>
							value="7">7</option>
						<option <c:if test='${grnd.maxParticipant==6}'>selected</c:if>
							value="6">6</option>
						<option <c:if test='${grnd.maxParticipant==5}'>selected</c:if>
							value="5">5</option>
						<option <c:if test='${grnd.maxParticipant==4}'>selected</c:if>
							value="4">4</option>
						<option <c:if test='${grnd.maxParticipant==3}'>selected</c:if>
							value="3">3</option>
						<option <c:if test='${grnd.maxParticipant==2}'>selected</c:if>
							value="2">2</option>
						<option <c:if test='${grnd.maxParticipant==1}'>selected</c:if>
							value="1">1</option>
					</select>
					<button id="btnCountChange" disabled>변경</button>
				</div>
				<!--changeMemberCount-->


			</div>
			<!--boxInfoContent-->
		</div>
	</div>	<!--content-->



		<%@include file="/WEB-INF/template/footer.jsp"%><!--footer-->

		<%@include file="/WEB-INF/template/js.jsp"%>

		<script src="/js/tui-code-snippet.js"></script>
		<script src="/js/tui-time-picker.min.js"></script>
		<script src="/js/tui-date-picker.min.js"></script>

		<script>
        $(".board_css").click(function () {
            var idx = $(this).index();
            $(".board_css").removeClass("on");
            $(".board_css").eq(idx).addClass("on")
        });
    </script>

		<!-- 탬 클릭시 발생하는 이벤트 -->
		<script>
        console.log($("#tabManagementContents>div:nth-child(1)").get(0));

        var $verticalTabItems = $(".vertical_tab_item"),
            $tabManagementContents = $("#tabManagementContents");

        //네비게이션 바 아이템 클릭시 이벤트
        $verticalTabItems.on("click", function() {
            $verticalTabItems.removeClass("on");
            $(this).addClass("on");
            /*
                //ajax로 클릭한 탭으로 컨텐츠 변경
                $.ajax({$tabManagementContents....});

            */

        });
    </script>

		<!-- 모집목록에 아이템 눌렀을때 popup이벤트 처리 -->
		<script>
        var $popLayer = $("#popLayer"),
        	$popWrapper = $("#popWrapper"),
            $popCondition = $("#popCondition"),
            $conditions = $("#conditions"),
            $body=$("body"),
            imageLocation = '/img/application/',
            conditionsTmpl = _.template($("#conditionsTmpl").text());
        var grndNo = ${grnd.grndNo} , grndNum=${grnd.num};
        $("#memberTable").on("click", ".user_name",  function(){
    		$popLayer.fadeIn(0);
            //popup켜졌을때 body의 스크롤 막기(body의 스크롤없애기)
            $body.css("overflow","hidden");
    		var	userNo=$(this).data('no');
    			
    		$.ajax({
    			url:"/userApplications.json",
    			data:{
    				grndNo:grndNo,
    				grndNum:grndNum,
    				userNo:userNo
    			},
    			dataType:"json",
    			error:function(){
    				
    			},
    			success:function(json){
    				console.log(json);
    				replaceApplications(json,userNo);
    			}
    		});
    	});
        $conditions.on("click",function(){
            return false;
        });
        $popWrapper.on("click",function(){
        	$popLayer.fadeOut(0);
            $body.css("overflow","visible");
            return false;
        });
        
        
        function replaceApplications(applies,userNo){
        	$conditions.empty();
        	$conditions.html(conditionsTmpl({userNo:userNo}));
        	var contents = $conditions.find('.content');
        	for(var i=0; i<contents.length; i++){
        		var content = $(contents[i]);
        		content.append("<div>"+applies[i].content+"<div>");
        		
        		if(content.hasClass("image")){
        			content.find("img").attr("src",imageLocation+applies[i].image);
        		}
        	}
        }
        var oriMaxPart = ${grnd.maxParticipant};
        $("#limit").on("change",function(){
        	if($(this).val()==oriMaxPart){
        		$(this).next().attr("disabled",true);
        	}else{
        		$(this).next().attr("disabled",false)
        	}
        })
        
		$("#btnCountChange").on("click", function(){
			$.ajax({
				url:"/changePartsLimit.json",
				data:{
					grndNo:grndNo,
    				num:grndNum,
					maxParticipant:$("#limit").val()
				},
				dataType:"json",
				error:function(){
					console.log('/changePartsLimit.grnd error');
				},
				success:function(result){
					if(result.isSuccess){
						location.reload();
					}else{
						alert("현재 참가인원보다 적게 설정할 수 없습니다! 참가인원을 조정해주세요!");
					}
				}
			})
			
		});      
    </script>
</body>
</html>