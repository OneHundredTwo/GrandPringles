<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글
<c:choose>
	<c:when test="${update==true}">
		수정
	</c:when>
	<c:otherwise>
		쓰기		
	</c:otherwise>
</c:choose>
폼</title>
<%@include file="/WEB-INF/template/link.jsp"%>

<link rel="stylesheet" href="/css/common.css" />

<link rel="stylesheet" href="/css/codemirror.css">
<link rel="stylesheet" href="/css/github.css">
<link rel="stylesheet" href="/css/tui-editor-contents.min.css">
<link rel="stylesheet" href="/css/tui-editor.min.css">
<style>
#boxWriteSpace {
	position: relative;
	width: 1200px;
	background-color: #E0E0E0;
	margin: auto;
}
/* inp 모양 */
.post_inp {
	border: none;
	padding: 20px;
	/*border-radius: 2px;*/
	margin-left: 30px;
	vertical-align: middle;
	background-color: white;
}

/* 큰 기본 모양 + 해당 버튼 배치*/
.btn_big_button {
	margin-right: 20px;
}

.right {
	float: right;
}

/* circle_btn 모양*/
#boxWriteSpace .circle_btn {
	display: inline-block;
	width: 65px;
	height: 65px;
	border-radius: 40px;
	vertical-align: top;
	text-decoration: none;
	cursor: pointer;
	border: none;
	color: #B71C1C;
	background-color: #E0E0E0;
	transition: 0.4s ease;
}

.delete_btn {
	width: 25px;
	height: 25px;
	border: none;
}

#boxWriteSpace .circle_btn:hover, #boxWriteSpace:hover {
	
}

#boxWriteSpace .circle_btn:hover, #boxWriteSpace:active {
	
}

#boxWriteSpace .circle_btn.on {
	color: #FFF176;
	background-color: black;
}
/*category 부분*/
#boxCategories {
	width: 700px;
	height: 65px;
	padding: 10px;
}

#boxCategories li {
	float: left;
	padding: 0 10px;
}

#boxCategories .circle_btn i {
	font-size: 38px;
}

#boxCategories .circle_btn span {
	font-size: 12px;
}
/* title 부분 */
#boxPostTitle .post_inp {
	border-bottom: 1px solid #888888;
	width: 540px;
	height: 30px;
	font-size: 30px;
	background-color: transparent;
}
/* text editor 부분*/
#boxPostEditor {
	width: 1200px;
	min-height: 500px;
	margin-bottom: 20px;
	border: 3px solid #fff;
	background-color: black;
}
/*title*/
#boxPostTitle {
	position: relative;
	height: 50px;
	padding-left: 15px;
	padding-bottom: 20px;
	font-size: 35px;
	color: /*#E0E0E0*/ white;
	line-height: 50px;
	overflow: hidden;
	background-color: #E5E5E5;
}

#boxPostTitle::before {
	position: absolute;
	left: 00px;
	top: -70px;
	border: 120px solid black;
	border-right: 120px solid transparent;
	border-top: 120px solid transparent;
	content: "";
}

#boxPostTitle .title_bar {
	position: absolute;
	top: 10px;
	z-index: 1;
}

#boxPostTitle label {
	vertical-align: middle;
}

#boxPostTitle label {
	vertical-align: middle;
}
/*유튜브서치버튼*/
#btnSearchYoutube {
	color: black;
}
/*batting 등 컴포넌트 부분 */
#boxAdditionalComponents {
	position: absolute;
	right: -380px;
	top: 10px;
	width: 350px;
	text-align: center;
	background-color: #E0E0E0;
	box-shadow: 0 16px 28px 0 rgba(0, 0, 0, 0.22), 0 25px 55px 0
		rgba(0, 0, 0, 0.21);
}

#boxAdditionalComponents>* {
	display: none;
}

#boxAdditionalComponents>*.on {
	display: block;
}

#boxAdditionalComponents .component_title {
	display: inline-block;
	color: #424242;
	font-size: 22px;
	font-weight: 500;
	padding: 15px 20px;
}

#boxAdditionalComponents .component_item {
	padding: 10px;
}

/* 배팅 항목 설정 안의 li */
#boxBattingItemList {
	background: #E0E0E0;
}

/* 배팅 항목 설정 안의 라디오 버튼 */
.component_item>.write_radio {
	position: relative;
	background: #E0E0E0;
	left: -145px;
	top: 0px;
}

/* 배팅 항목 설정 안의 라디오 버튼 */
.component_item>.write_text {
	position: absolute;
	background: #fafafa;
	left: 50px;
	top: 10px;
}

/* 배팅 항목 설정 안의 라디오 버튼 */
.component_item>.delete_btn {
	position: absolute;
	left: 300px;
	top: 10px;
}

/* 배팅 항목 설정 전체 틀 */
.component_item {
	width: 325px;
	height: 30px;
	background: #EEEEEE;
	border: 1px solid #fff;
	position: relative;
	margin-bottom: 10px;
}

.component_item input {
	width: 230px;
	height: 20px;
	padding-left: 10px;
}

#boxAdditionalComponents .btn_big_button {
	margin: 0;
	padding: 0;
}

#boxAdditionalComponents .add_item {
	margin-top: 10px;
	margin-bottom: 10px;
}

/*취소, 완료버튼*/
#boxPostButtons {
	height: 80px;
}

#btnPostCancle {
	text-decoration: none;
}

#matchNo {
	font-size: 20px;
	text-align: center;
}

.aTeam {
	display: inline-block;
    background: #fafafa;
    width: 120px;
    height: 25px;
    line-height: 25px;
    position: absolute;
    left: 50px;
    top: 10px;
}

.bTeam {
	display: inline-block;
    background: #fafafa;
    width: 120px;
    height: 25px;
    line-height: 25px;
    position: absolute;
    right: 10px;
    top: 10px;
}

.vsImg {
	height: 25px;
	width: 25px;
	position: absolute;
    left: 180px;
    top: 10px;

}

</style>

</head>
<body>
	<h1 class="screen_out">그랑프링글스</h1>

	<%@include file="/WEB-INF/template/header.jsp"%><!--header-->

	<div id="content">

		<h3 class="screen_out">커뮤니티</h3>
		<div id="boxWriteSpace">
			<div id="boxCategories">
				<ul>
					<li>
						<button class="circle_btn" id="btnCatBlahblah" data-cat="T">
							<div>
								<i class="far fa-comments"></i>
							</div>
							<span>잡담</span>
						</button>
					</li>
					<li>
						<button class="circle_btn" id="btnCatMedia" data-cat="M">
							<div>
								<i class="fab fa-youtube"></i>
							</div>
							<span>미디어</span>
						</button>
					</li>
					<li>
						<button class="circle_btn" id="btnCatBetting" data-cat="B">
							<div>
								<i class="fas fa-dollar-sign"></i>
							</div>
							<span>배팅</span>
						</button>
					</li>
					<li>
						<button class="circle_btn" id="btnCatDiscussion" data-cat="D">
							<div>
								<i class="fas fa-list-ul"></i>
							</div>
							<span>토론</span>
						</button>
					</li>
				</ul>
				
			</div>
			<div id="boxPostEditor">
				<div id="boxPostTitle">
					<div class="title_bar">
						<label for="inpPostTitle">Title </label> 
						<input id="inpPostTitle" class="post_inp" maxlength="255" placeholder="제목을 여기에 입력해주세요" value="${article.title}">						
					</div>
				</div>
				<div id="boxEditor"></div>
				<button id="btnSearchYoutube" title="유튜브 영상검색">
					<i class="fab fa-youtube-square"></i>
				</button>
			</div>
			<div id="boxAdditionalComponents">
				<div id="boxBattingItemList">
					<span class="component_title">배팅 항목 설정</span>
					<ul>
						<!--<li class="component_item">-->
						<!--<span>-->
						<!--승리팀 <input type="checkbox" class="">-->
						<!--</span>-->
						<!--<span>-->
						<!--스코어 <input type="checkbox" class="">-->
						<!--</span>-->

						<!--</li>-->

						<li class="component_item"><input type="radio"
							class="write_radio" disabled> <input type="text"
							class="write_text" placeholder="30자 이내의 항목" maxlength="30">
							<button class="delete_btn">
								<i class="fas fa-minus-square"></i>
							</button></li>
						<li class="component_item"><input type="radio"
							class="write_radio" disabled> <input type="text"
							class="write_text" placeholder="30자 이내의 항목" maxlength="30">
							<button class="delete_btn">
								<i class="fas fa-minus-square"></i>
							</button></li>
					</ul>

					<button class="btn_middle_button add_item">추가</button>
				</div>
				<div id="boxDiscussionItemList">
					<span class="component_title">투표 항목 설정</span>
					<ul>
						<li class="component_item"><input type="radio"
							class="write_radio" disabled> <input type="text"
							class="write_text" placeholder="30자 이내의 항목" maxlength="30">
							<button class="delete_btn">
								<i class="fas fa-minus-square"></i>
							</button></li>
						<li class="component_item"><input type="radio"
							class="write_radio" disabled> <input type="text"
							class="write_text" placeholder="30자 이내의 항목" maxlength="30">
							<button class="delete_btn">
								<i class="fas fa-minus-square"></i>
							</button></li>
					</ul>

					<button class="btn_middle_button add_item">추가</button>
				</div>
				
				<div id="boxMatchsList">
					<span class="component_title">관련 경기 설정</span>
					
					<ul>
					<c:forEach items="${matchs}" var="match">
						<li class="component_item">
						<input name="match" type="radio" class="write_radio" 
						<c:if test="${match.no==article.matchNo}">
							checked="checked"
						</c:if>
						 value="${match.no}">
						<span class="aTeam">${match.redName}</span>
						<img class="vsImg" src="/img/versus.jpg"/>
						<span class="bTeam">${match.blueName}</span>
						</li>
					</c:forEach>
					</ul>
					
				</div>
				<script type="text/template" id="tmplComponentItem">

            </script>
			</div>

			<div id="boxPostButtons">
			<c:choose>
				<c:when test="${update==true}">
					<button class="btn_big_button right" id="btnPostWrite" >수정</button>
				</c:when>
				<c:otherwise>
					<button class="btn_big_button right" id="btnPostWrite" >완료</button>
				</c:otherwise>
			</c:choose>
				<a href="#" onClick="history.back()" class="btn_big_button right" id="btnPostCancle">되돌아가기</a>
			</div>

		</div>


	</div>
	<!--content-->


	<%@include file="/WEB-INF/template/footer.jsp"%><!--footer-->

	<%@include file="/WEB-INF/template/js.jsp"%>
	<!-- tui-editor 기본 lib -->
	<script src="/js/tui-code-snippet.min.js"></script>
	<script src='/js/markdown-it.js'></script>
	<script src="/js/to-mark.min.js"></script>
	<script src="/js/codemirror.js"></script>
	<script src="/js/highlight.js"></script>
	<script src="/js/squire-raw.js"></script>
	<!-- 에디터 컴포넌트 라이브러리 -->
	<script src="/js/tui-editor-Editor.js"></script>
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

		//markdown content

		var postEditor = new tui.Editor({
			el : $("#boxEditor").get(0),
			initialEditType : 'wysiwyg',
			//tab 또는 vertical
			previewStyle : 'tab',
			//작성기 width는 style에서, height은 여기에서 지정해야함.
			height : '500px',
			exts : [ 'youtube' ],
			initialValue : "${article.content}"
		});
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
	<!-- 기타 -->
	<script>
		//btnSearchYoutube을 editor의 툴바에 추가하기
		var $editorToolBar = $("#boxEditor").find(
				".tui-editor-defaultUI-toolbar"), $btnSearchYoutube = $("#btnSearchYoutube");

		$btnSearchYoutube.appendTo($editorToolBar);

		//카테고리 클릭시 on 클래스 할당, 배팅, 토론일때 오른쪽에 항목보이기
		var catBtnElements = [ , , $("#boxMatchsList"),
				$("#boxDiscussionItemList") ], $boxAdditionalComponents = $("#boxAdditionalComponents");
		$("#inpPostTitle").focus();
		var $categories = $("#boxCategories");
		$categories.on("click", ".circle_btn", function() {
			console.log("clicked");
			var $btn = $(this);
			$categories.find(".on").removeClass('on');
			$btn.addClass("on");
			$boxAdditionalComponents.find('.on').removeClass("on");
			var index = $btn.parent().index();
			if (index == 2 || index == 3)
				catBtnElements[index].addClass("on");
		});

		//컴포넌트에 아이템 추가/제거
		//1. 템플릿 로드
		var tmplComponentItem = _.template($("#tmplComponentItem").text());
		//2.add버튼 눌렀을때 연관된 ul에 아이템 추가하는 함수
		function addComponentItem() {
			$(this).parent().find("ul").append(tmplComponentItem());
		}
		//3.-버튼 눌렀을때 리스트 아이템 제거하는 함수
		function removeComponentItem() {
			//항목은 항상 두개 이상 있어야함
			var $item = $(this).parent();
			if ($item.parent().find("li").length <= 2) {
				alert("항목은 두개 이상이여야만 합니다!");
				return;
			}
			$item.remove();
		}
		//3.각 요소에 클릭이벤트 연결 
		$boxAdditionalComponents.on("click", ".add_item", addComponentItem).on(
				"click", ".delete_btn", removeComponentItem);
	</script>
	<!-- 글쓰기 완료시 유효성 검사 -->
	<script>
		//항목중에 빈 항목이 있느지 체크하는 함수
		function checkItems(component) {
			var check = true;
			component.find("ul .write_text").each(function() {
				if ($(this).val() == "") {
					$(this).focus();
					check = false;
					return false;
				}
				;
			});
			console.log(check);

			return check;
		}

		var categories = [ "잡담", "미디어", "배팅", "토론" ];

		

	</script>
	<c:if test="${!update}">
	<!-- 글쓰기 ajax  -->
	<script>	
	function writePost() {
		
		var matchNo = $(".write_radio:checked").val();
		
		console.log(matchNo);
		
		

		//제목 안적었을때 체크
		var $postTitle = $('#inpPostTitle');
		if ($postTitle.val() == "") {
			alert("제목을 입력해주세요");
			$postTitle.focus();
			return;
		}
		//카테고리 선택
		var index = $categories.find(".on").parent().index();
		//혹은 find(".on>span").text()

		//배팅/토론일시 항목 체크
		if (index == 2 || index == 3) {
			if (!checkItems(catBtnElements[index])) {
				alert("빈 " + categories[index] + " 항목을 채워주세요!");
				catBtnElements[index].focus();
				return;
			}
		}

		//내용 받아오기
		var postContent =$(".tui-editor-contents")[1].innerHTML;
		console.log(postContent);
		//대회, userId, modifiedDate, content, title, categories, [componet list tiems]
		//를 보낸다.
		$.ajax({
			url:"/ajax/write",
			method:'POST',
			dataType:"json",
			data:{
				"title":$postTitle.val(),
				"content":postContent,
				"grndNo":${grndNo},
				"grndNum":${grndNum},
				"category":$("#boxCategories").find(".on").data("cat"),
				"userNo":${loginUser.no},
				"matchNo":matchNo
			},
			error:function(xhr, err, code){
				console.log(xhr);
				console.log(err);
				console.log(code);
			},
			success:function(json){
				console.log(json);
				
				if(json.category=="T") {
					json.category="pop";
				} else if(json.category=="B") {
					json.category="bet";
				} else if(json.category=="D") {
					json.category="debate";
				} else {
					json.category="media";
				}

				location.href = 'http://localhost/' + json.grndNo+ '/' +json.grndNum+ '/community/' +json.category+ '/' +json.no;
			
			}//success end

		});//ajax end
		
	}	
	</script>
	</c:if>
	<c:if test="${update}">
	<!-- 글 수정 ajax -->
	<script>
		function updatePost() {
		
			var matchNo = $(".write_radio:checked").val();	
			/*
			if(matchNo == null){
				matchNo=0;
			}
			*/

		//제목 안적었을때 체크
		var $postTitle = $('#inpPostTitle');
		if ($postTitle.val() == "") {
			alert("제목을 입력해주세요");
			$postTitle.focus();
			return;
		}
		//카테고리 선택
		var index = $categories.find(".on").parent().index();
		//혹은 find(".on>span").text()

		//배팅/토론일시 항목 체크
		if (index == 2 || index == 3) {
			if (!checkItems(catBtnElements[index])) {
				alert("빈 " + categories[index] + " 항목을 채워주세요!");
				catBtnElements[index].focus();
				return;
			}
		}

		//내용 받아오기
		var postContent =$(".tui-editor-contents")[1].innerHTML;
		console.log(postContent);
		//대회, userId, modifiedDate, content, title, categories, [componet list tiems]
		//를 보낸다.
		$.ajax({
			url:"/ajax/update",
			method:'POST',
			dataType:"json",
			data:{
				"boardNo":${article.boardNo},
				"title":$postTitle.val(),
				"content":postContent,
				"grndNo":${grndNo},
				"grndNum":${grndNum},
				"category":$("#boxCategories").find(".on").data("cat"),
				"userNo":${loginUser.no},
				"matchNo":matchNo
			},
			error:function(xhr, err, code){
				console.log(xhr);
				console.log(err);
				console.log(code);
			},
			success:function(json){
				console.log(json);
				
				if(json.category=="T") {
					json.category="free";
				} else if(json.category=="B") {
					json.category="bet";
				} else if(json.category=="D") {
					json.category="debate";
				} else {
					json.category="media";
				}			
				
				location.href = 'http://localhost/' + json.grndNo+ '/' +json.grndNum+ '/community/' +json.category+ '/' +json.no;
			}//success end

		});//ajax end
		
	}	
	</script>
	</c:if>
	<script>
		var type = "${article.category}";
		if(type=="T") {
			$("#btnCatBlahblah").addClass("on");
		} else if(type=="M") {
			$("#btnCatMedia").addClass("on");
		} else if(type=="B") {
			$("#btnCatBetting").addClass("on");
		} else if(type=="D"){
			$("#btnCatDiscussion").addClass("on");
		} else {
			$("#btnCatBlahblah").addClass("on");
		}
	 
	</script>

	<script>
	
	<c:choose>
	<c:when test="${update }">
	$("#btnPostWrite").click(updatePost);
	</c:when>
	<c:otherwise>
		$("#btnPostWrite").click(writePost);
	</c:otherwise>
</c:choose>
	
	</script>
	
	
	
</body>
</html>