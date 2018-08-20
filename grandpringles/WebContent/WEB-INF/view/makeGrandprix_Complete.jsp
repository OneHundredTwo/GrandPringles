<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>대회만들기 - 완료</title>
    <%@include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/competition_common.css"/>
    
    <link rel="stylesheet" href="/css/codemirror.css">
    <link rel="stylesheet" href="/css/tui-editor-contents.min.css">
    <link rel="stylesheet" href="/css/tui-editor.min.css">
    <link rel="stylesheet" href="/css/github.css">
    <style>

        /* < 대회(competition) 만들기(Make) 탭(Tab) > */
        #competitionMakeTab {
            width: 1200px;
            height: 100px;
            background: red;
            margin: auto;
        }
        /* #competitionMakeTab 안에 있는 a와 i의 공통요소 CSS */
        #competitionMakeTab>a, #competitionMakeTab>i {
            height: 100px;                              /*높이*/
            background: #212121;                        /*배경색*/
            font-size: 30px;                            /*글자크기*/
            color: #FFF176;                             /*글자색상*/
            line-height: 100px;                         /*폰트수직정렬*/
            text-align: center;                         /*폰트수평정렬*/
            float: left;                                /*떠 있음*/
        }
        /* #competitionMakeTab 안에 있는 a요소 CSS */
        #competitionMakeTab>a{
            width: 200px;                               /*너비*/
            font-weight: 500;                           /*글자굵기*/
            text-decoration: none;                      /*요소기본효과제거*/
        }
        /* #competitionMakeTab 안에 있는 i요소 CSS */
        #competitionMakeTab>i {
            width: 50px;                                /*너비*/
            font-weight: 700;                           /*글자굵기*/
        }
        /* 완료 페이지에 해당하므로 CSS 재 정의 */
        #competitionMakeTab #confirm {
            background: #FAFAFA;                        /*배경색*/
            font-weight: 700;                           /*글자굵기*/
            color: #000;                                /*글자색상*/
        }
        /* 기본정보 탭과 그 다음 요소 '>>'에 대한 공통:hover */
        #competitionMakeTab #confirm:hover {
            background:  #FFF176;                       /*배경색*/
            color: #000;                                /*글자색상*/
            transition: .3s ease;                       /*0.3초에 거친 효과적용*/
        }

        /* < 다단설정 > */
        /* 한 페이지에 보다 깔끔한 배열을 위해 다단을 도입 다단이 2개일 경우 총 3공간으로 분열 */
        /* 모든 단의 공통 요소 */
        #firstDan, #secondDan {
            width: 598px;
            height: 850px;
            background: #F5F5F5;                        /*배경색*/
            float: left;                                /*떠 있음*/
            position: relative;                         /*모든 자식들의 absolute에 대한 포지셔닝컨테스팅*/
        }

        /*첫번째 단*/
        #firstDan {
            border-right: 4px solid #FFCDD2;            /*오른쪽만 border 5px*/
        }

        /* 테이블 border */
        #settingConfirmBox table, td, th, tr{
            border:1px solid #424242;

        }

        #settingConfirmBox table{
            position: absolute;
            top: 70px;
            left: 30px;
        }
        #settingConfirmBox th{
            font-size: 18px;
            font-weight: 500;
            padding: 10px;
        }
        #settingConfirmBox td{
            padding: 5px;
            text-align: center;
        }



        /* 대회 약관 label 위치 설정 */
        #settingConfirmBox>label {
            /* 위치 적용 */
            left: 20px;
            top: 20px;

        }
        #competitionRule{
        	height: 400px;
        	width: 500px;
        	position:absolute;
			margin: 60px 0px 0px 20px;
        }
        #ruleLabel {
        	left:0px;
        	top:0px;

        }
        #competitionIntrodauce {
        	height: 250px;
        	width: 500px;
        	margin: 60px 0px 0px 20px;
        }

        #competitionIntrodauce>label {
            /* 위치 적용 */
            left: 20px;
            top: 20px;
        }

        .editor2 {
            position: absolute;
            /* 위치 적용 */
            top: 40px;
            width: 500px;
        }
#guideWindowBox{
			display:none;
		}
		
		#createGrandpirx{
			position:absolute;
			bottom:100px;
			right:50px;
			display:inline-block;
			
			width:500px;
			height:50px;
			border:none;
			line-height:50px;
			
			text-align:center;
			text-decoration:none;
			
			color:#212121;
			
			background-color:#FFFFFF;
			font-size:25px;
			
			 box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			
			
		}

    </style>

</head>
<body>
<h1 class="screen_out">그랑프링글스</h1>

<%@include file="/WEB-INF/template/header.jsp" %><!--header-->
<div id="content">
    <div id="competitionMakeTab">
        <!-- 해당 탭들은 유일하므로 id값 부여 -->
        <a id="basicInformation" href="makeGrandprix_Necessary.jsp">기본정보</a><i class="fas fa-angle-double-right"></i>
        <a id="participant" href="makeGrandprix_Participations.jsp">참가자</a><i class="fas fa-angle-double-right"></i>
        <a id="clauseEstablish" href="makeGrandprix_Terms.jsp">약관설정</a><i class="fas fa-angle-double-right"></i>
        <a id="competitionMethod" href="makeGrandprix_Method.jsp">대회방식</a><i class="fas fa-angle-double-right"></i>
        <a id="confirm" href="makeGrandprix_Complete.jsp">완료</a>
    </div><!--#competitionMakeTab end-->

    <!--모든 폼의 input 값들을 넘겨주기 위한 단을 감싸는 가장 큰 틀-->
    <div id="wrap">

            <!--첫번째 단-->
            <div id="firstDan">
                <!--설정확인-->
                <div id="settingConfirmBox">
                    <label class="label_css"> 기본 설정 확인 </label>
                    <table>
                        <thead>
                        <tr>
                            <th> 항목 </th>
                            <th> 설정 내용 </th>
                        </tr>
                        </thead>

                        <tbody>
                        <tr>
                            <th> 대회 이름 </th>
                            <td> ${grndName.title } </td>
                        </tr>

                        <tr>
                            <th> 게임 종류 </th>
                            <td> 리그오브레전드 </td>
                        </tr>

                        <tr>
                            <th> 대회시작일 </th>
                            <td> 
                           		<fmt:formatDate pattern="YYYY년MM월d일" value="${grnd.startDate }"/>

                            </td>
                        </tr>

                        <tr>
                            <th> 개최자 URL </th>
                            <td> https://www.twitch.tv/${grnd.channelId} </td>
                        </tr>

                        <tr>
                            <th> 참가인원 </th>
                            <td> ${grnd.maxParticipant } </td>
                        </tr>

                        <tr>
                            <th id="logo"> 대회로고 </th>
                            <td> <img width="400" height="400" src="/img/grndLogo/${grnd.image}"> </td>
                        </tr>

                        </tbody>

                    </table>

                    </ul>

                </div><!--#settingConfirmBox end-->
            </div><!--#firstDan end-->
            <div id="secondDan">
            <form action="/main" method="post">
                <!--대회 제목-->
                <div id="competitionIntrodauce">
                    <label class="label_css">대회 소개</label>
                    <div class="editor">
                    	<input type="hidden" id= "intro" name="intro" value=""/>
                    </div>
                </div><!--#competitionIntrodauce end-->
                <div id="competitionRule">
                    <label id= "ruleLabel" class="label_css">대회 룰</label>
                    <div class="editor2">
                    	<input type="hidden" id= "rule" name="rule" value=""/>
                    </div>
                </div><!--#competitionRule end-->
                
            <button id="createGrandpirx">대회생성!</button>
            <!-- 대회상태값 넘기기 -->
            <input type="hidden" id= "status" name="status" value="W"/>
            <input type= "hidden" name ="grndNo" value="${grnd.grndNo}">
    		<input type= "hidden" name ="num" value="${grnd.num}">
                    </form>
            </div><!--#secondDan end-->

    </div><!--#wrap end-->
</div><!--#content end-->


<%@include file="/WEB-INF/template/footer.jsp" %><!--footer-->

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
        height: 270
    });
    $('.editor2').tuiEditor({
        initialEditType: 'wysiwyg',
        previewStyle: 'vertical',
        height: 270
    });

    $("#createGrandpirx").click(function () {
 	   var txtIntro= $(".tui-editor-contents")[1].innerHTML;
	   $("#intro").attr("value",txtIntro);
 	   var txtRule= $(".tui-editor-contents")[4].innerHTML;
	   $("#rule").attr("value",txtRule);
 	   
	})
</script>
</body>
</html>