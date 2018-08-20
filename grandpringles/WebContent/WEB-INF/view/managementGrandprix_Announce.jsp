<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>대회관리-공지사항관리</title>
<%@include file="/WEB-INF/template/link.jsp"%>

<link rel="stylesheet" href="/css/competition_watch_header.css">
<link rel="stylesheet" href="/css/competition_common.css">

<link rel="stylesheet" href="/css/management_common.css">
<!-- tui-editor css -->
<link rel="stylesheet" href="/css/codemirror.css">
<link rel="stylesheet" href="/css/github.css">
<link rel="stylesheet" href="/css/tui-editor-contents.min.css">
<link rel="stylesheet" href="/css/tui-editor.min.css">
<style>

	/*Editor을 담은 Div 크기 조절 */
	#boxNoticeContent {	
		width: 500px;
		height: 660px;
	}
	
	/* 제목을 담은 Div 크기 조절 */
	.notice_title {	
		width: 500px;
		height: 40px;
	}
	
	/* 제목 글씨 */
	.notice_title>span {
		font-size: 20px;
		margin-left: 25px;
		line-height:40px;
	}
	
	.tui-editor-defaultUI {
		width: 450px;
		height: 550px;
		margin: auto;
	}
	
	#inpNoticeTitle {
	 	 width: 390px;
    	height: 20px;
    	padding: 3px;
        margin-left: 2px;
  
	}
	
	#btnUpdateNotice {
	    width: 100px;
   	 	height: 30px;
    	margin-left: 375px;
    	margin-top: 5px;
    	color: #424242;
	}
	
	.tui-editor {
		height: 550px;
	}

	#boxNoticeUpdateList {
		overflow-y: auto;
		width: 500px;
	}
	
	

</style>
</head>
<body>
	<h1 class="screen_out">그랑프링글스</h1>

	<%@include file="/WEB-INF/template/header.jsp"%><!--header-->

	<!-- tui-editor 기본 lib -->
	<script src='js/markdown-it.js'></script>
	<script src="js/to-mark.min.js"></script>
	<script src="js/tui-code-snippet.js"></script>
	<script src="js/codemirror.js"></script>
	<script src="js/highlight.js"></script>
	<script src="js/squire-raw.js"></script>
	<!-- 뷰어 컴포넌트 라이브러리 -->
	<script src="js/tui-editor-Viewer.js"></script>
	<!-- 에디터 컴포넌트 라이브러리 -->
	<script src="js/tui-editor-Editor.js"></script>

	<div id="content">
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
	        
	        <c:forEach items="${managers }" var="manager">
	        	<c:if test="${(manager.adminNo == loginUser.no) || (grandprix.ownerNo == loginUser.no)}">
		            <div id="openerData" class="btn_Side_Box">
		                <i class="fas fa-user-circle"></i><a href="">관리하기</a>
		            </div>
	            </c:if>
	        </c:forEach>
	         
        </div><!--#competitionSideBtn end -->
    </div> <!--#competitionHeader end -->
		<%--
		<!--content-->
		<div id="competitionTapboard">
			<div id="previewTab" class="board_css on">관람</div>
			<div id="informationTab" class="board_css">대회정보</div>
			<div id="communityTab" class="board_css">커뮤니티</div>
		</div>
		<!--competitionTapboard End-->
		 --%>
		<div id="boxInfoContent">


			<div class="management_contents_tab" data-index="1">
				<div class="" id="tabInfomationContents">
					<div class="vertical_tab">
						<ul>
							<li><a class="vertical_tab_item" href="/${grandprix.grndNo }/${grandprix.num}/management/schedule" title="대회일정 탭">대회일정</a></li>
							<li><a class="vertical_tab_item on" href="/${grandprix.grndNo }/${grandprix.num}/management/announce_log" title="대회공지사항 탭">대회공지사항</a></li>
							<li><a class="vertical_tab_item" href="/${grandprix.grndNo }/${grandprix.num}/management/participations?applyPage=1&partPage=1" title="참가자관리 탭">참가자관리</a></li>
							<li><a class="vertical_tab_item" href="/${grandprix.grndNo }/${grandprix.num}/management/prixes" title="상품관리 탭">상품관리</a></li>
							<li><a class="vertical_tab_item" href="/${grandprix.grndNo }/${grandprix.num}/management/match_chart" title="경기관리 탭">경기관리</a></li>
						</ul>
					</div>
				</div>
				<!-- //#tabInformationContents -->
				<h4 class="screen_out">대회공지사항</h4>
				<div id="boxNoticeContent" class="update_content">
					<div id="boxNoticeEditor">
						<div class="notice_title">
							<span>마지막 수정일 : <fmt:formatDate value="${lastModifiedAnn.regdate }" pattern="YYYY년 M월 d일 hh:mm:ss"/></span>
						</div>
						<div id="tuiNoticeEditor">
							<!-- tui-editor가 렌더링되는 공간 -->
						</div>
						<div>
							<button id="btnUpdateNotice" disabled>수정</button>
						</div>
					</div>
				</div>
				<!-- 업데이트 이력 리스트 -->
				<div id="boxNoticeUpdateList" >
					<h5 class="screen_out">업데이트 이력</h5>
					<ol class="update_list">
						<c:forEach items="${updateLogs }" var="log" varStatus="status">
							<c:set var="index" value="${status.index }"/>
							<li <c:if test="${index==0}">class="firstLi"</c:if>>
								<div class="who">
									<a class="circle_btn" href=""> <img width="50" height="50"
										class="circle_btn" src="/img/<c:out value="${log.managerImage }" default="template_default_user_logo.png"/>">
										<span class="user_nickname">${log.managerName }</span>
									</a>
								</div>
								<div class="what">
									<span class="content"> 공지사항이 변경되었습니다. 이전내용을 보시려면 <strong>클릭</strong>하세요.
									</span> <span class="ymd_date"><fmt:formatDate value="${log.regdate }" pattern="YYYY년 M월 d일 hh:mm:ss"/></span>
								</div>
							</li>
						</c:forEach>
					</ol>
				</div>

			</div>
		</div>

	</div>
	<!--boxInfoContent-->
	</div>
	<!-- //#content -->
	<%@include file="/WEB-INF/template/footer.jsp"%><!--footer-->

	<%@include file="/WEB-INF/template/js.jsp"%>
	<!-- tui-editor 기본 lib -->
    <script src='/js/markdown-it.js'></script>
    <script src="/js/to-mark.min.js"></script>
    <script src="/js/tui-code-snippet.js"></script>
    <script src="/js/codemirror.js"></script>
    <script src="/js/highlight.js"></script>
    <script src="/js/squire-raw.js"></script>
    <!-- 뷰어 컴포넌트 라이브러리 -->
    <script src="/js/tui-editor-Viewer.js"></script>
    <!-- 에디터 컴포넌트 라이브러리 -->
    <script src="/js/tui-editor-Editor.js"></script>
	
	
	<script>
		$(".board_css").click(function() {
			var idx = $(this).index();
			$(".board_css").removeClass("on");
			$(".board_css").eq(idx).addClass("on")
		});
	</script>

	<!-- 탬 클릭시 발생하는 이벤트 -->
	<script>
		console.log($("#tabManagementContents>div:nth-child(1)").get(0));

		var $verticalTabItems = $(".vertical_tab_item"), $tabManagementContents = $("#tabManagementContents");

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
	<!-- tui-editor 추가 및 youtbue extension추가 스크립트 -->
	<script>
		//의미를 모르겠지만, extension을 추가하기 위한 글로벌 코드.
		(function(root, factory) {
			if (typeof define === 'function' && define.amd) {
				define([ 'tui-editor' ], factory);
			} else if (typeof exports === 'object') {
				factory(require('tui-editor'));
			} else {
				factory(root['tui']['Editor']);
			}
		})
				//toast ui에 extendsion을 추가하는 코드
				(
						this,
						function(Editor) {
							// editor에 새로운 extension을 정의하는 메서드
							Editor
									.defineExtension(
											//extension 이름
											'youtube',
											//extension이 사용됐을때 수행하는 함수
											function() {
												// editor에 입력된 코드블럭(extension명, 입력값들)을 html요소로 생성하는 메서드
												Editor.codeBlockManager
														.setReplacer(
																//코드블럭 시작하는 이름(```extension) : 호출하는 함수명
																'youtube',
																//순서대로 입력된 입력값들을 매개변수로 html요소를 생성하는 함수
																//무엇을, 어떻게에 해당하는 내용을 구현한다.
																function(
																		youtubeId) {
																	// 생성된 코드블럭을 구분하는 유일한 id값을 생성해서 할당
																	var wrapperId = 'yt'
																			+ Math
																					.random()
																					.toString(
																							36)
																					.substr(
																							2,
																							10);
																	// avoid sanitizing iframe tag
																	setTimeout(
																			renderYoutube
																					.bind(
																							null,
																							wrapperId,
																							youtubeId),
																			500);

																	return '<div id="' + wrapperId + '"></div>';
																});
											});

							//extension으로 받는 데이터로 에디터에 추가될 html 요소를 생성하는 함수
							function renderYoutube(wrapperId, youtubeId) {
								var el = document
										.querySelector('#' + wrapperId);
								el.innerHTML = '<iframe width="420" height="315" src="https://www.youtube.com/embed/' + youtubeId + '"></iframe>';
							}
						});

		$("#test")
				.on(
						"click",
						function() {
							/*noticeEditor.focus();
							noticeEditor.mdEditor.cm.setCursor(999,999,{});
							console.log(noticeEditor.mdEditor);*/
							//console.log(noticeEditor.getTextObject(noticeEditor.getRange())/*.getTextContent()*/);
							//console.log(noticeEditor.getRange());
							//console.log(noticeEditor.mdEditor.cm.getCursor('from'));
							//console.log(noticeEditor.mdEditor.cm.getLine(3));
							/*noticeEditor.setValue('[![Video Label](http://img.youtube.com/vi/uLR1RNqJ1Mw/0.jpg)](https://youtu.be/uLR1RNqJ1Mw?t=0s)',true); */

							var data = "[![Video Label](http://img.youtube.com/vi/uLR1RNqJ1Mw/0.jpg)](https://youtu.be/uLR1RNqJ1Mw?t=0s)";

							addElement(noticeEditor, data);
						});
		$("#hahaha").on("click", function() {
			console.log(noticeEditor.currentMode);
		});


		var events = {
			"change" : function() {
				$("#btnUpdateNotice").attr("disabled", false);
			}
		}

		/*var noticeEditor = $('#tuiNoticeEditor').tuiEditor({
		  initialEditType: 'markdown',
		  //tab 또는 vertical
		  previewStyle: 'tab',
		  //작성기 width는 style에서, height은 여기에서 지정해야함.
		  height: '480px',
		  events:events,
		  initialValue:content,
		  exts: ['youtube']
		});*/

		var noticeEditor = new tui.Editor({
			el : document.querySelector('#tuiNoticeEditor'),
			initialEditType : 'wysiwyg',
			previewStyle : 'vertical',
			height : '580px',
			events : events,
			exts : [ 'youtube' ],
			initialValue:'${lastModifiedAnn.content}'
		});
		setTimeout(function() {
			console.log(noticeEditor);
		}, 1000);

		/*
		  편집기 mode text
		  markdown
		  wysiwyg
		 */

		/*
		 $('#viewerSection').tuiEditor({
		 height: '500px',
		 viewOnly:false,
		 initialValue: content,
		 exts: ['youtube']
		 });*/
	</script>
	<!-- 추가할 markdown 요소 현재위치한 커서위치에 추가하기 -->
	<script>
		//됐다!!
		function addElement(editor, data) {
			//Editor모드 변경하기
			if (editor.isWysiwygMode()) {
				editor.changeMode('markdown', false);
			}
			//현재 커서위치와 after를 선택하기위한 mdEditor의 마지막위치
			var currentRange = editor.getRange(), cmLines = editor.mdEditor.cm.doc.children[0].lines, endPointOfMd = {
				"line" : cmLines.length - 1,
				"ch" : cmLines[cmLines.length - 1].text.length
			};
			//갱신할 value를 생성하기위한 before,newContent,after
			var newContent = '\n' + data + '\n', before = editor.getTextObject(
					{
						"start" : {
							"line" : 0,
							"ch" : 0
						},
						"end" : currentRange.start
					}).getTextContent(), after = editor.getTextObject({
				"start" : currentRange.end,
				"end" : endPointOfMd
			}).getTextContent();

			var value = before + newContent + after;
			//갱신한 value를 추가(현재 Editor가 어떤거든 md에디터에 추가해야 렌더링할 수 있음)

			editor.mdEditor.setValue(value);

			//editor에 포커스맞추고, 커서위치 셋팅
			editor.focus();
			//추가된 요소 다음에 커서를 맞춰야되는데, 그건 모르겠다. 확실한건 start위치는 변하지 않는다는것.
			editor.mdEditor.cm.setCursor(currentRange.start.line,
					currentRange.start.ch, {});

			//Editor모드 변경하기
			editor.changeMode('wysiwyg', true);
		}
	</script>
	
	<!-- 수정버튼누르면 추가하고 새로고침하기 -->
	<script>
		$("#btnUpdateNotice").on("click", function(){
			//editor에 작성한 공지사항 얻어오기(html? wig? 모르겠다 아직은... )
			var content = noticeEditor.getHtml();
			//지환이 로그인하고합치면 로그인유저 넘버로 변경 
			//managerNo:${loginUser.no}
			$.ajax({
				url:"/management/announce_log",
				method:"POST",
				data:{
					managerNo:${loginUser.no},
					grndNo:${lastModifiedAnn.grndNo},
					grndNum:${lastModifiedAnn.grndNum},
					content:content
				},
				error:function(){
					console.log("에러");
				},
				success:function(){
					location.reload();
				}
			})
			
		})
	</script>


</body>
</html>