<%-- <%@page import="com.sun.corba.se.impl.orb.ParserTable.TestContactInfoListFactory"%> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>대회 참가</title>
    <%@include file="/WEB-INF/template/link.jsp" %>
    
    <link rel="stylesheet" href="/css/competition_watch_header.css">
    <style>


        .fas, .far {
            font-size: 17px;
            color: #000;
            margin-left: 5px;
            margin-right: 10px;
        }


        /* 기본적인 폰트 어썸 속성*/
        #competitionHeader .fas, .far {
            font-size: 17px;
            color: #FFF176;
            margin : 0px;
        }

        /* 가장 큰 틀 */
        #attend_warp{
            width: 1200px;
            height: 719px;
            background: #F5F5F5;
            position: relative;
            margin: auto;
        }

        /* 참가자 공지사항, 정보입력하기와 같은 제목 공통 요소 */
        .attend_title {
            height: 35px;
            line-height: 35px;
            text-align: center;
            background: #E0E0E0;
            font-weight: 600;
            font-size: 20px;
            position: absolute;
            top: 20px;
            border:1px solid #BDBDBD;
            background: #9E9E9E;
            color: #000;
        }

        /* 참가자 공지사항 */
        #attend_notice {
            width: 500px;
            left: 20px;
        }

        /* 참가자 공지사항, 정보입력하기 아래 컨텐츠를 공간 공통 요소 */
        .attend_content {
            height: 490px;
            line-height: 50px;
            top: 57px;
            padding: 5px 10px 5px 10px;
            border: 1px solid #BDBDBD;
            position: absolute;
            border-top:none ;
            font-size: 18px;
            background: #BEBEBE;
        }


        /* 참가자 공지사항 내용 */
        #attend_notice_contents {
            width: 480px;
            left: 20px;
            color: #424242;
        }

        #attend_information {
            width: 640px;
            height: 35px;
            line-height: 35px;
            text-align: center;
            font-weight: bold;
            font-size: 20px;
            position: absolute;
            right: 20px;
            top: 20px;
            border:1px solid #BDBDBD;
        }


	

        #attend_information_contents {
            width: 620px;
            right: 20px;
        }

        /* 한 개의 질문에 대한 답변을 담는 BOX */
        .attend_required_field {
            position: relative;
            width: 620px;
            height: 485px;
        }

        /* 필수 체크 + 질문 라벨*/
        .question_box {
            position: relative;
            width: 600px;
            height: 230px;
            left: 0px;
            top: 10px;
            margin-bottom: 10px;
            border: 1px solid #BDBDBD;
            background:  #E0E0E0;
        }

        .question_box>.question_label_box {
            position: relative;
            width: 580px;
            height: 30px;
            left: 5px;
            top: 10px;
        }



        .question_box>.question_label_box>.question_label {
            background: #fafafa;
        }

        .question_box>.question_label_box>.choice {
            position: absolute;
            display: block;
            height: 30px;
            width: 80px;
            line-height: 30px;
            padding-left: 10px;
            left: 0px;
            color: #424242;
            background: #fafafa;
        }

        .question_content_box {
            display: inline-block;
            position: absolute;
            width: 580px;
            height: 40px;
            top: 45px;
            left: 10px;
            line-height: 40px;
        }


        .image_content_box {
            display: inline-block;
            position: absolute;
            width: 580px;
            height: 130px;
            top: 90px;
            left: 10px;
            line-height: 40px;
            border: 1px solid #BDBDBD;
        }

        .image_content_box>i {
            position: absolute;
            bottom: 9px;
            left: 5px;
        }

        .image_content_box>input {
            position: absolute;
            bottom: 5px;
            left: 35px;
        }

        .image_content_box>.upload_image_box {
            position: absolute;
            width: 120px;
            height: 120px;
            border: 1px solid #BDBDBD;
            bottom: 5px;
            right: 5px;
        }


        .css_input{
            width: 530px;
            height: 30px;
            background: transparent;
            font-size: 20px;
            color: #424242;
            line-height: 30px;
            border: 1px solid #BDBDBD;
            padding-left: 10px;
            position: relative;
        }




        /* 질문 내용 */
        .css_label {
            width: 470px;
            height: 30px;
            line-height: 30px;
            background: #E0E0E0;
            font-size: 15px;
            color: #424242;
            left: 100px;
            position: absolute;
            padding-left: 10px;
        }
        #attendCheckBox {
            width: 400px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            color: #000;
            font-size: 20px;

            border: 1px solid  #BDBDBD;
            width: 560px;

            position: relative;
            left: 340px;
            top: 590px;
        }

        #attend_checkbox{
            cursor: pointer;
        }


        .attend_btn{

            width: 300px;
            height: 50px;
            position: absolute;
            left: 460px;
            top: 640px;
            border-radius: 50px;
        }


        .apply_btn{
            width: 300px;
            height: 50px;
            line-height: 50px;
            font-size: 30px;
            background:  #E0E0E0;
            font-weight: 600;
            cursor: pointer;
            transition: .2s ease;
            border-radius: 50px;
        }


        .apply_btn:hover{
            background: #F5F5F5 ;
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }


    </style>

</head>
<body>
<h1 class="screen_out">그랑프링글스</h1>

<%@include file="/WEB-INF/template/header.jsp" %><!--header-->

<div id= "content">
    <!-- 대회 헤더 -->
    <div id="competitionHeader" >
        <div class="competition_img">
                <img class = "competition_logo_img" src="/img/${grandprix.image }" width ="180px" height="100px">
        </div>
        <div class="competition_title">
            ${grandprixName.title }
        </div>
        <div id="competitionSideBtn">
            <!-- 즐겨찾기 -->
            <div id="bookmarkBox" class="btn_Side_Box">
                <i class="fas fa-star"></i><a href="">즐겨찾기</a>
            </div>
            <!-- 추천갯수 -->
            <div id="goodBox" class="btn_Side_Box">
                <i class="far fa-thumbs-up competition_Like"></i><a href=""> ${grandprixName.liking }개</a>
            </div>
            <div id="nextCompetitionBox" class="btn_Side_Box">
                <i class="far fa-hand-point-right"></i><a href="">다음 대회 만들기</a>
            </div>

            <div id="competitionParticipationBox" class="btn_Side_Box">
                <label id="competitionTypeBox"><a href="">대회 참가</a></label>
                <label id="competitionPeopleSlash">${grandprix.numberOfParticipant }  / ${grandprix.maxParticipant } </label>  
            </div>
            <div id="openerData" class="btn_Side_Box">
                <i class="fas fa-user-circle"></i><a href="">개최자 정보</a>
            </div>
        </div><!--#competitionSideBtn end -->
    </div> <!--#competitionHeader end -->


    <div id="attend_warp">

        <div id="attend_notice" class="attend_title">참가자 공지사항</div> <!-- .attend_warp end -->

        <div id="attend_notice_contents" class="attend_content">
      		${grandprix.participantAnnounce}
        </div>

        <div id="attend_information" class="attend_title">정보 입력하기</div>
        <div id="attend_information_contents" class="attend_content">
            <div class="attend_required_field" style="overflow:scroll; overflow-x:hidden;">
			<form action="/Participant" method="post" id="conditionForm"  enctype="multipart/form-data">
<c:forEach items="${conditions }" var="condition"  varStatus="status">
			<div class="question_box">

                    <div class="question_label_box">
                        <c:if test="${condition.isNecessary.equals('T') }"><i class="fas fa-check  choice"> 필수</i></c:if>
                        <label class="css_label question_label"> ${condition.title }</label>
                    </div>
                    <div class="question_content_box">
                        <i class="fas fa-arrow-right"></i>
                        <input class="css_input" type="text" name="content"  value="">
                    </div>


				<c:if test="${condition.isImage.equals('T') }">
	                    <div class="image_content_box">
	                        <i class="fas fa-upload"></i>
	                            <input class="image"  type="file" name="upload"/>
	                       <canvas class="upload_image_box canvas${status.index}"   width="120" height="120"></canvas>
	                    </div>
                   </c:if>
                    <c:choose>
						<c:when test="${condition.isImage.equals('T') }"><input type="hidden" name="imageTF" value="T"/></c:when>
                    	<c:otherwise><input type="hidden" name="imageTF" value="F"/></c:otherwise>										
                    </c:choose>

                </div>
</c:forEach>
            <input type= "hidden" name ="grndNo" value="${grandprix.grndNo}">
    		<input type= "hidden" name ="num" value="${grandprix.num}">
            <input type="hidden" name="ownerNo" value="${loginUser.no }">

					</form>
 		


            </div>
        </div> <!-- .attend_information_contents -->
        
        <c:choose>
        	<c:when test="${applicationTF==null }">
        	        <!-- 대회참가하기전 체크박스 -->
		        <div id="attendCheckBox">
		            <label>
		                <input type="checkbox" id="attend_checkbox"
		                       /> 대회의 진행 방식, 룰 등을 숙지하였으며 이에 동의합니다.
		            </label>
		        </div>   <!-- .attend_checkbox end -->
		
		        <!-- 참가신청 버튼 -->
		        <div class="attend_btn">
		            <button form="conditionForm" id = "Btnapply" class="apply_btn">참가신청</button>
		        </div>   <!-- .attend_btn end -->
        	</c:when>
        	<c:otherwise>
        	        <!-- 참가신청 버튼 -->
        <div class="attend_btn">
        <form action="/Participant" method="post" id="cancelForm" >
            <input type="hidden" name="_method" value="DELETE"> 
            <button form="cancelForm" id = "btnCancel"   class="apply_btn">취소하기</button>
            <input type= "hidden" name ="grndNo" value="${grandprix.grndNo}">
    		<input type= "hidden" name ="num" value="${grandprix.num}">
            <input type="hidden" name="ownerNo" value="${loginUser.no }">
        </form>
        </div>   <!-- .attend_btn end -->
        	</c:otherwise>
        </c:choose>

        <!-- 대회참가하기전 체크박스 -->



    </div> <!-- .attend_warp end -->
</div><!--content-->

<%@include file="/WEB-INF/template/footer.jsp" %><!--footer-->

<%@include file="/WEB-INF/template/js.jsp" %>



<script>
 $("#Btnapply").click(function () {
	 alert("참가신청이 되었습니다.")

})
 $("#btnCancel").click(function () {
	 alert("신청이 취소되었습니다.")

})



    // image/인지 알아내는 정규식 표현 객체
    var reg = /^image\//;

    reader = new FileReader(); //

    $(".image").on("change",function () {
        //input type=file요소는 files배열을 가지고 있음
        //각 번지에는 File객체가 들어가 있음
        var idx = $(this).parent().parent().index();

        var name= ".canvas"+idx;
        var $canvas = $(name), // canvas 제이쿼리 개체
        
        canvas = $canvas.get(0),    // canvas 객체
        ctx = canvas.getContext("2d"); //
        
        var file = this.files[0];

        //1) 재대로된 파일인지 확인
        if(file.size<=0) {
            alert("재대로 된 파일을 선택하세요");
            return;
        }//if end


        if(!reg.test(file.type)) {
            alert("이미지를 선택해주세요!");
        }
        
        console.log("파일이름:"+file.name);

        reader.readAsDataURL(file);

        // 다 읽어 로딩 되면
        reader.onload = function (ev) {

            // 다 읽은 결과물(base64인코딩)을 얻음
            var result = reader.result;


            //console.log(result);

            // 이미지 객체 생성
            var img = new Image();

            // 이미지 객체의 src속성에 대입
            img.src = result;

            // 이미지가 로딩되면
            img.onload = function () {
                // img요소로 붙이는거
                //$("body").append(img);

                // 캔버스에 그림을 그림
                // 뒷쪽이 4개가 캔버스가 그려진 영역 0,0 ~ 400,400까지
                ctx.drawImage(img,0,0,img.width,img.height,0,0,120,120);
            }//load이미지처리

        }// onload 이벤트핸들러

    });//change() end

</script>

</body>
</html>