<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>template</title>
    <%@include file="/WEB-INF/template/link.jsp" %>
    
    <link rel="stylesheet" href="/css/competition_watch_header.css">
    <style>
        .fas, .far {
            font-size: 17px;
            color: #000;
            margin-left: 5px;
            margin-right: 10px;
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
            left: 10px;
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


        .match_team{
            background: #C8C8C8 ;
            width: 210px;
            position: absolute;
            left: -220px;
            top: 0px;
            border: 1px solid #BDBDBD;
            
            z-index:10;
        	
        }
        
        
		.box_inp_teamname{
			padding:3px;
		}
        .box_inp_teamname>input{
            background: #fafafa ;
            width:85%;
            height: 30px;
            line-height: 30px;
            font-size: 15px;
            
            vertical-align:middle;
            
        }
        .box_inp_teamname>span{
        	display:inline-block;
        	vertical-align:middle;
        	width:10%;
        }

        .insertBtn {
            height: 25px;
            width: 25px;
            cursor: pointer;
            border: 1px solid #424242;
            border-radius: 30px;
        }

        .insertBtn>i {
            font-size: 15px;
            margin:0;
        }

        .wrap_team {
            padding:3px;
            border: 1px solid #BDBDBD;
            background: #E0E0E0;
        }
        .wrap_team>div, .make_form>div{
        	margin-bottom:3px;
        }
        .wrap_team>div:last-child, .make_form>div:last-child{
        	margin:0px;
        }

        .name_team{
            height: 30px;
            margin-bottom:5px;
            line-height: 30px;
            text-align: center;
            border-bottom: 1px solid #BDBDBD;
            background: #B4B4B4;
        }
        
        #teamList{
        	margin-bottom:5px;
        	text-align:center;
        	height:140px;
        	overflow:auto;
        	
        	background-color:rgba(250, 255, 231, 0.41);
        }
        #teamList li{
        	background-color:white;
        	height:25px;
        	line-height:25px;
        	margin-bottom:3px;
        	
        }
        #teamList li.on{
        	background-color:black;
        }
        #teamList li.on a{
        	color:yellow;
        }
        #teamList a{
        	display:block;
        	text-decoration:none;
        	
        	color:black;
        }
        

        #makeTeamBtn{
        	width:100%;
        	display:block;
        }
        
        .make_form{
        	padding:3px;
        	text-align:center;
        	display:none;
        }
        
        .make_form input{
        	width:90%;
        	padding-left:10px;
        	font-size:12px;
        }
        .make_form input[type="checkbox"]{
        	width:10%;
        	padding-left:10px;
        	font-size:12px;
        }
        .make_form>div:last-child{
        	height:30px;
        }
        .make_form>div:last-child>div{
        	float:left;
        	width:50%;
        }
        
        .make_form>div:last-child button{
        	display:inline-block;
        	height:30px;
        	line-height:30px;
        	width:60%;
        }
        .team_info{
        	display:block;
        	
        	position:absolute;
        	right:-160px;
        	top:42px;
        
        	width:140px;
        	padding:10px;
        	
        	background-color:#B4B4B4;
        	
        }
        .team_info>ul{
        	background-color:white;
        	margin:auto;
        	font-size:15px;
        	
        }
        .team_info i{
        	margin:0;
        	font-size:15px;
        }
        .team_info .leader{
        	color:red;
        }
        .team_info li{
        	margin-bottom:2px;
        	border:1px solid black;
        }
        .team_info a{
			text-decoration:none;
			color:black;
			display:block;
			
			height:20px;
			line-height: 20px;
        }
        
        .team_info .status{
        	padding-left:5px;
        	margin-bottom:3px;
        	
        	font-size:10px;
        }
        .team_info .status .crr_part{
        	color:yellow;
        	font-size:15px;
        }
        .team_info ul a>div{
        	display:inline-block;
        	text-align:center;
        }
        .team_info ul .box_icon{
        	width:20%;
        }
        .team_info ul .box_name{
        	width:80%;
        	text-align:left;
        }
        
        

        .pwd_input{
            height: 23px;
            width:40%;
            font-size: 12px;
            color: #424242;
            line-height: 23px;
            padding-left: 5px;

        }


        .partBtn{
        	width:45%;
        	height:29px;
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
			
        <!-- 팀 찾기 (검색창)-->
        <div class="match_team">
 
			
            <div class="wrap_team">
                <div class="name_team">팀 목록</div>
                
                <div id="teamList">
                	<ul>
                	<c:forEach items="${teams }" var="team">
                		<li><a class="team_item" href=""><span><c:if test="${team.isShow=='T' }"><i class="fas fa-lock"></i> </c:if></span>${team.name }
                		                		<input type="hidden" class="leader_No" value="${team.leaderNo }"/>
                		</a></li>

                	
                	</c:forEach>

                	</ul>

                </div>

                <div>
                	<button id="makeTeamBtn">팀 만들기</button>
                </div>
            </div>  <!-- .wrap_team end -->
            <div>
            	<form id="makeTeamForm" class="make_form" method="post"  action="/Participant/Team" enctype="multipart/form-data">
	            	<div><span>팀 로고</span></div>
	            	<div><canvas id="cvTeamLogo" width="50" height="50"></canvas><input id="inpTeamLogo" type="file" name="upload"/></div>
	            	<div><span>팀 이름</span></div>
	            	<div><input type="text" name="name" width="100%" placeholder="팀이름을 적어주세요"/></div>
	            	<div><input type="checkbox" name="isShow"  id="isPassword" value="F"/><span>패스워드</span></div>
	            	<div><input type="password" name="password " placeholder="패스워드 4자리를 입력해주세요" maxlength="4"/></div> 
	            	<div><div><button id="makeBtn">만들기</button></div><div><button id="makeCancle">취소</button></div></div>
	            	<input type= "hidden" name ="grndNo" value="${grandprix.grndNo}">
    				<input type= "hidden" name ="grndNum" value="${grandprix.num}">
            		<input type="hidden" name="leaderNo" value="${loginUser.no }">
            	</form>
            </div>



        </div> <!-- .match_team end -->
                        	<script type="text/template" id="teamListmp">

            <div class="team_info">
            	<div class="status">참가인원 : <span class="crr_part"><@=count@></span>/5 <span><i class="fas fa-lock"></i></span></div>
            	<ul>
<@_.each(teams, function(team){@>
            		<li><a href=""><div class="box_icon"><i class="fas fa-user leader"></i></div><div class="box_name"><@=team.nickname@></div></a></li>
<@})@> 
            	</ul>
                    	<c:if test="${loginUser!=null }">
            	<div class="pwd_team">
                    <input class="pwd_input" type="password" autofocus="" required="" placeholder="비밀번호!"
                           maxlength="4" title="비밀번호.">
                   	<button class="partBtn" >참가</button>
                </div> <!-- .pwd_team end -->
				</c:if>
            </div>

                	</script>

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
	var $makeForm = $(".make_form");
	var $makeTeamBtn = $("#makeTeamBtn");
	$makeTeamBtn.on("click", function(){
		$makeForm.slideToggle();
		$(this).slideToggle();
	});
	
	$("#makeCancle").on("click", function(){
		$makeForm.slideToggle();
		$makeForm.find("input").val("");
		$makeTeamBtn.slideToggle();
	});
	
	var $teamList = $("#teamList");
	
	$teamList.on("click",".team_item",function(e){
		e.preventDefault();
		//on인 상태인넘이 다시 눌렸을때
		if($(this).parent().hasClass("on")){
			$(".team_info").hide();
			$(this).parent().removeClass("on");
			return;
		}
		//on 아닌넘이 눌렸을때
		if($(".team_info").css("display")=="none")
			$(".team_info").show();
		
		$teamList.find(".on").removeClass("on");
		$(this).parent().addClass("on");
		
		$.ajax({
			url:"",
			method:"GET",
			data:{
				/* grndNo:,
				grndNum:,
				leaderNo:
				*/
			},
			error:function(){
				
			},
			success:function(){
				//여기서 $(".team_info")의 내용물만 갈아끼기.
			}
		});
	});
	
	var $isPassword = $("#isPassword"), pwdBox=$isPassword.parent().next();
	pwdBox.hide();
	$isPassword.on("change",function(){
		if($isPassword.is(":checked")){
			pwdBox.slideToggle();
			$isPassword.attr("value","T");
		}else{
			pwdBox.slideToggle();
			$isPassword.attr("value","F");
		}
		
	})
	
	$("#makeBtn").on("click", function(){
		$.ajax({
			url:"",
			method:"POST",
			data:{
				/* grndNo:,
				grndNum:,
				teamName:,
				logoImage:,
				teamPassword:,
				teamLeaderNo: */
			},
			error:function(){
				
			},
			success:function(){
				
			}
		});
	})
	
</script>

<%--팀로고 이미지 선택 처리 스크립트 --%>
<script>

	var regex = /^image\//, 
		$canvas=$("#cvTeamLogo"), 
		canvas = $canvas.get(0),
		ctx=canvas.getContext("2d"),
		//HTML5에 추가된 FileReader API로 컴퓨터에 저장되있는 파일을 읽어올 수 있음.
		
		reader = new FileReader();
	  var reg = /^image\//;

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

	//input type이 file인 요소는 현재 상태와 다른 파일을 선택하면 change이벤트가 발생함.
	$("#inpTeamLogo").on("change", function(){
		//type이 file인 input요소의 DOM은 files라는 속성을 갖음.
		//files는 file선택 대화상자에서 선택한 파일들의 정보 각각을 File객체로 저장한 배열이다.
		//배열인 이유는 input요소에 multiple속성을 지정하면 파일을 여러개 선택할 수 있기때문.
		//한개만 선택하면 files의 0번째 File을 선택하면 됨.
		var file = this.files[0];
		/*
			lastModified : 마지막수정날짜(unixtime)
			lastModifiedDate : 마지막수정날짜를 local timezone에 맞춰 표시
			name : 파일이름
			size : 파일크기(byte)
			type : 파일타입(MIME:주타입/부타입:부타입은 주로 확장자)		
		*/
		
		//이미지를 띄우기위한 파일유효성검사단계
		//1)제대로 된 파일인지 확인
		if(file.size<=0){
			alert("빈 파일을 선택할 수 없습니다.");
			return;
		}
		//2)이미지 파일만 가능하게 확인
		//정규표현식으로 image/xx 형식 확인하기.
		if(!regex.test(file.type)){
			alert("이미지파일만 선택해주세요!");
			return;
		}
		
		//3)유효성 검사가 끝나면 FileReader객체를 통해서 파일을 읽어옴.
		reader.readAsDataURL(file);
		//이미지크기/컴퓨터성능/브라우저성능에따라서 이미지를 읽어오는 속도가 다 다르기때문에, 
		//이미지를 읽어온후에 해야할 일을 onload이벤트에 함수를 할당함.
		reader.onload = function(){
			console.log("다 읽어왔습니다!");
			
			
			//다읽은 결과물(base64인코딩)을 얻음
			var result = reader.result;
			//console에 인코딩된 문자열을 출력해보기 => 그림이 너무크면 뻑이감.(글씨가 너무많아서인듯)
			//console.log(result);
			
			//이미지 객체 생성하고 
			var img = new Image();
			//이미지 객체의 src에 결과값 할당하고
			img.src = result;
			//이미지가 로딩된 후에 할 일을 정의.
			img.onload = function(){
				//$("body").append(img); // 이렇게하면 img요소가 body에 추가됨.
				
				//캔버스에 그림을 그림
				//근데 아무설정도 안하고 그냥 넣으면, 원본사진을 그대로 넣기때문에 캔버스크기에 맞춰서 짤려보인다.
				
				ctx.drawImage(img,
					0,
					0,
					img.width,
					img.height,
					0,
					0,
					50,
					50
				);
				
				//그래서 이미지에서 원하는 부분을짤라서 캔버스의 원하는 위치에 원하는크기로 넣는 옵션이 있다.
				/*
				drawImage(이미지객체,
						image_x,
						image_y,
						image_width,
						image_height, 
						canvas_image_x,
						canvas_image_y, 
						canvas_image_width, 
						canvas_image_height)
				*/
				// * 이미지 원본크기는 img.width, img.height로 얻을 수 있음.
				// * 그래서 캔버스크기에 딱맞춰서 
				// -cover 혹은 contain(원본크기를 유지하면서 캔버스의 가운데와 이미지의 가운데를 맞춤)으로 넣으려면 \
				// -각각의 비율을 계산해서 잘 넣어라
			
			}
			
		};
		
		
	});
	
</script>
	
	
<script>


var $leaderNo = $(".leader_No")
var teamListmp = _.template($("#teamListmp").html());
var code="";
var data = new FormData();
var leaderNo =0;
var count=0;
var maxCount=5;


<c:choose>
<c:when test="${loginUser==null }">
	var memberNo = 0;
	data.delete('memberNo')
	data.append('memberNo',memberNo)
</c:when>
<c:otherwise>
	var memberNo = ${loginUser.no}
	data.delete('memberNo')
	data.append('memberNo',memberNo)
</c:otherwise>
</c:choose>


data.append('grndNo',${grandprix.grndNo });
data.append('grndNum',${grandprix.num });


	$(".team_item").click(function () {
		var idx = $(this).parent().index();
		//idx 는 0,2,4, 짝수로
		leaderNo = $(this).find(".leader_No").attr("value")
		data.delete('leaderNo')
		data.append('leaderNo', leaderNo);
		$(".team_info").remove();
		teamMerberList();


	})
	
	

	    
 	//팀원 목록 AJAX
	function teamMerberList() {
	
		     $.ajax({
		         url: '/ajax/TeamMemberList',
		         type: "post",
		         dataType: "json",
		         data: data,
		         processData: false,
		         contentType: false,
		         success: function(json) {
					 
		        	 code = teamListmp({"teams":json.teams,"count":json.count})
		        	 count=json.count;

		        	 $(".match_team").append(code);
					 if(count>=maxCount) {
							$(".pwd_input").remove();
							$(".partBtn").remove();
						}
					 if(json.attendTF) {
						 $(".pwd_input").remove();
						 $(".partBtn").text("탈퇴");
						 $(".partBtn").attr("class","deleteBtn");
					 } 
					 if(json.leaderTF){
						 $(".deleteBtn").text("해체");
						 $(".deleteBtn").attr("class","deleteAllBtn");
					 }
		        	 
		         }, error: function(jqXHR, textStatus, errorThrown) {
		        	 
		        	 alert(textStatus);
		         }
		     });
			

		
		
	}
	
	function teamInsert() {

		data.append('memberNo', ${loginUser.no});
		data.append('password', password);
	     $.ajax({
	         url: '/ajax/TeamMemberInsert',
	         type: "post",
	         dataType: "json",
	         data: data,
	         processData: false,
	         contentType: false,
	         success: function(json) {

	        	data.delete('memberNo')
	     		data.delete('password')
	     		if(json){
	    			teamMerberList();
	     		}else {
	     			alert("비빌번호가 틀렸습니다.")
	     		}
	         }, error: function(jqXHR, textStatus, errorThrown) {
	        	 
	        	 alert(textStatus);
	         }
	     });
		
	}
	
	
	function deleteTeam() {
		data.append('memberNo', ${loginUser.no});
	     $.ajax({
	         url: '/ajax/deleteTeam',
	         type: "post",
	         dataType: "json",
	         data: data,
	         processData: false,
	         contentType: false,
	         success: function(json) {
	     		$(".team_info").remove()
	        	 teamMerberList()
	         }, error: function(jqXHR, textStatus, errorThrown) {
	        	 
	        	 alert(textStatus);
	         }
	     });
		
	}
	
	
	

	//참가 버튼
	var password=0;
	$(".match_team").on("click",".partBtn",function (){
		password= $(".pwd_input").val();
		
		teamInsert()
	})
	
	//탈퇴버튼
	$(".match_team").on("click",".deleteBtn",function (){
		password= $(".pwd_input").val();

		deleteTeam()
		
	})
	
	//해체버튼
	$(".match_team").on("click",".deleteAllBtn",function (){
		password= $(".pwd_input").val();
		deleteTeam()
	})
	
	//팀만들기


</script>

</body>
</html>