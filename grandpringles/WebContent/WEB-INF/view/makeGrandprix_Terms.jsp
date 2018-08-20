<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>대회만들기-약관설정</title>
    <%@include file="/WEB-INF/template/link.jsp" %>
    
    <link rel="stylesheet" href="/css/competition_common.css">

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
        /* 약관설정 페이지에 해당하므로 CSS 재 정의 */
        #competitionMakeTab #clauseEstablish {
            background: #FAFAFA;                        /*배경색*/
            font-weight: 700;                           /*글자굵기*/
            color: #000;                                /*글자색상*/
        }
        /* 약관설정 탭과 그 다음 요소 '>>'에 대한 공통:hover */
        #competitionMakeTab #clauseEstablish:hover+.fa-angle-double-right, #competitionMakeTab #clauseEstablish:hover {
            background:  #FFF176;                       /*배경색*/
            color: #000;                                /*글자색상*/
            transition: .3s ease;                       /*0.3초에 거친 효과적용*/
        }

        /* < 다단설정 > */
        /* 한 페이지에 보다 깔끔한 배열을 위해 다단을 도입 다단이 2개일 경우 총 3공간으로 분열 */
        /* 모든 단의 공통 요소 */
        #firstDan, #secondDan {
            height: 800px;                              /*높이*/
            background: #F5F5F5;                        /*배경색*/
            float: left;                                /*떠 있음*/
            position: relative;                         /*모든 자식들의 absolute에 대한 포지셔닝컨테스팅*/
        }
        /*첫번째 단*/
        #firstDan {
            width: 885px;
            border-right: 5px solid #FFCDD2;
        }
        /*두번째 단*/
        #secondDan {
            width: 310px;                                /*너비*/
        }






        /* 약관설정 전체 틀 */
        #clauseBox {
            width: 880px;
            height: 80px;
            background: #F5F5F5;
        }
        /* 대회 약관 label 위치 설정 */
        #clauseBox>label {
            /* 위치 적용 */
            left: 20px;
            top: 20px;
        }

        /* 추가 버튼 위치 설정 */
        #clauseAddBtn {
            /* 위치 적용 */
            left: 700px;
            top: 15px;
        }

        /* 약관이름 input */
        #clauseName {
            width: 300px;
            /* 위치 적용 */
            top: 75px;
            left: 20px;
        }

        /* editor */
        .editor {
            width:700px;
            position: absolute;                        /*상대적위치적용*/
            /* 위치 적용 */
            top: 170px;
            left: 10px;
        }

        /* 약관이 추가될 ul*/
        #clauseList {
            height: 770px;
            position: absolute;
            /* 위치 적용 */
            top: 70px;
            left: 20px;
            overflow-y: auto;
        }

        /* 약관 저장 버튼 */
        #clauseSave {
            /* 위치 적용 */
            top: 25px;
            left: 620px;
        }


        /* 약관 삭제 버튼 */
        #clauseDelete {
            /* 위치 적용 */
            top: 25px;
            left: 670px;
        }

        #mustCheckLabel {
            /* 위치 적용 */
            top: 125px;
            left: 360px;
        }

        #mustCheckInput {
            /* 위치 적용 */
            top: 125px;
            right: 180px;
        }

        /* 약관 설정 label */
        .item #clauseContentLabel {
            top: 125px;
        }

        /* 언더템플릿 css 설정 */

        /* 약관 이름 label */
       .item #clauseNameLabel {
       }


        /* 언더템플릿 li의 css */
        .item {
            height: 600px;
            width: 700px;
            border: 3px solid #424242;
            padding: 10px;
            margin-top: 20px;
            margin-bottom: 0px;
            position: relative;
            background: #fafafa;
        }

        /* 문단 사이를 띄워주는 역할 */
        .item>p {
            margin-bottom: 10px;
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
    <!--대회만들기탭-->
    <form action="/make/method" method="post">
    <div id="competitionMakeTab">
        <!-- 해당 탭들은 유일하므로 id값 부여 -->
        <a id="basicInformation" href="makeGrandprix_Necessary.jsp">기본정보</a><i class="fas fa-angle-double-right"></i>
        <a id="participant" href="makeGrandprix_Participations.jsp">참가자</a><i class="fas fa-angle-double-right"></i>
        <a id="clauseEstablish" href="makeGrandprix_Terms.jsp">약관설정</a><i class="fas fa-angle-double-right"></i>
        <button id="competitionMethod">대회방식</button><i class="fas fa-angle-double-right"></i>
        <a id="confirm" href="makeGrandprix_Complete.jsp">완료</a>
    </div><!--#competitionMakeTab end-->

    <!--모든 폼의 input 값들을 넘겨주기 위한 단을 감싸는 가장 큰 틀-->
    <div id="wrap">
            <!--첫번째 단-->
            <div id="firstDan">
                <!--약관설정-->
                <div id="clauseBox">
                    <label class="label_css"> 대회 약관 설정</label>
                    <button type="button" id="clauseAddBtn" class="button_clause_css"><i class="fas fa-plus-circle"></i></button>
                    <ul id="clauseList">

                    </ul>

                </div><!--#clauseBox end-->
            </div><!--#firstDan end-->

            <div id="secondDan">
                <div id="guideWindowBox">
                    <label class="label_css">안내창</label>
                    <div id="guideContent">
                        <p>
                            대회만들기 - 약관설정
                        </p>
                        <div id="guideContentImage">
                        </div>
                        <p>
                            해당 절차에 대한 일을 그림과 설명을 통해 나타냅니다.
                        </p>

                    </div><!--#guideContent end-->
                </div><!--#guideWindowBox end-->

            </div><!--#secondeDan end-->
            
                        <!-- value 값 변경요망 ${grnd.grndNo} ${grnd.num} -->
            <input type= "hidden" name ="grndNo" value="${grnd.grndNo}">
    		<input type= "hidden" name ="num" value="${grnd.num}">
        </form>
    </div><!--#wrap end-->
</div><!--#content end-->


<%@include file="/WEB-INF/template/footer.jsp" %><!--footer-->

<!-- 언더스코어 탬플릿 -->
<script type="text/template" id="clauseItem">
    <li class="item">
        <hr>
        <label id="clauseNameLabel" class="label_css">약관 이름</label>
        <p>
            <input class="input_css" type="text" id="title" name = "title" placeholder="약관이름을 입력해주세요" title="약관이름을 입력해주세요">
            <button type="button" id="clauseSave" class="button_clause_css"><i class="fas fa-save"></i></button>
            <button type="button" id="clauseDelete" class="button_clause_css"><i class="fas fa-times"></i></button>
        </p>
        <p>
            <input id="mustCheckInput" class="must_Check_Input input_css" type="checkbox" >
            <input class="must_Check_Input<@=count@>" type="hidden" name = "isNecessary" value="">
            <label id="mustCheckLabel" class="label_css">필수 약관 체크</label>
        </p>
        <p>
            <label id="clauseContentLabel" class="label_css">약관 내용
			<input type="hidden" name= "content" value="" id = "clauseContent<@=count@>">
			</label>
        <div class="editor"></div>
        </p>
    </li>

</script>


<%@include file="/WEB-INF/template/js.jsp" %>

<script src="/js/tui-code-snippet.min.js"></script>
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
        height: 600
    });

</script>

<!-- 참가 접수 설정에 관한 script -->
<script>

	_.templateSettings = {
			interpolate: /\<\@\=(.+?)\@\>/gim,
			evaluate: /\<\@(.+?)\@\>/gim,
			escape: /\<\@\-(.+?)\@\>/gim
	};


	var count=0;
	var editorContentNum = 1;
    /* 참가 접수 설정 */
    //#clauseAddBtn 클릭했을때
    $("#clauseAddBtn").click(function (e) {

        e.preventDefault();
        // 해당 input요소의 글자(값)를 얻어온 후 변수 question에 대입
        //var question = $("#participantsReceiptQuestion").val();
        // 필수체크박스의 체크 유무 확인 (true, false)

        /* 생성될 것에 대한 체크가 필요
        *    var checkMust = $(".mustQuestion").prop("checked");
        // 이미지 받기의 체크 유무 확인 (true, false)
        * */

        var tmp = _.template($("#clauseItem").html());
		count=count+1;

        var markup = tmp({count:count});
        // 질문 정보가 들어갈 공간
        $("#clauseList").append(markup);


        $('#clauseList>li:last-child>.editor').tuiEditor({
            initialEditType: 'wysiwyg',
            previewStyle: 'vertical',
            height: 400
        });

    });//#insertBtn click end

    $("#clauseList").on("click","#clauseDelete",function (e) {
        // 브라우저가 가진 css 제거
        e.preventDefault();
        // x 버튼을 누르면 해당 li를 삭제
        $(this).parent().parent().remove();
    });
    
    
    //저장버튼 눌러서 value값 세팅
    $("#clauseList").on("click",".fa-save",function (e) {

    	for(var i=0; i<count; i++)  {
	        	if($('.must_Check_Input').eq(i).is(':checked')) {
	     		   $(".must_Check_Input"+(i+1)).attr("value",'T');
	        	}else {
	      		   $(".must_Check_Input"+(i+1)).attr("value",'F');
	        	}
    		//약과내용 세팅
	    		if(i==0) {
	    			editorContentNum=1;
	    		}else {
	    			editorContentNum=editorContentNum+3;
	    		}
    	 	   var txt= $(".tui-editor-contents")[editorContentNum].innerHTML;

    		   $("#clauseContent"+(i+1)).attr("value",txt);
    	}

    });


</script>


</body>
</html>