<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>대회관리-상품관리</title>
<%@include file="/WEB-INF/template/link.jsp"%>

<link rel="stylesheet" href="/css/competition_watch_header.css">


<link rel="stylesheet" href="/css/management_common.css">
<!-- tui-editor css -->
<link rel="stylesheet" href="/css/codemirror.css">
<link rel="stylesheet" href="/css/github.css">
<link rel="stylesheet" href="/css/tui-editor-contents.min.css">
<link rel="stylesheet" href="/css/tui-editor.min.css">
<style>

	
	#addItemBox {
	    width: 450px;
	    height: 660px;
	}
	
	.addItem_title {
	    height: 40px;
	    text-align: center;
	    line-height: 40px;
	    margin-left: 135px;
	}
	
	.addItem_title>label{
		width: 150px;                              
	    height: 30px;                            
	    background:rgb(235,235,235);        
	    font-size: 18px;                       
	    color: #424242;                        
	    line-height: 30px;                      
	    text-align: center;                     
	    border: 1px solid #BDBDBD;   
	    display:block;
	    margin-top: 100px;
	    margin-left: 10px;
	}
	
	
	#addItemCategoryBox{
	    width: 286px;
	    height: 320px;
	    margin-left: 75px;
	    margin-top: 5px;
	    border: 3px solid #fff;

	}
	
	.category {
		width: 286px;
	   	height: 60px;
		
	}
	
	.item_label_css {
		background:rgb(235,235,235);       
	    font-size: 15px;                        
	    color: #424242;                       
		height:25px;
		line-height:25px;
		width:100px;
		display:block;
		margin-left: 10px;
		text-align: center;
		margin-top: 10px;
		
	}
	
	.item_input_css {
		height:16px;
		line-height:20px;
		width:258px;
		padding: 2px;
		margin-left: 10px;
		border: 3px solid #fff;
	}
	
	
	#boxNoticeUpdateList {
	    overflow-y: scroll;
	    width: 540px;
	    margin-left: 20px;
	}
	
	.itemImage {
	    width: 286px;
	    height: 114px;
	    display: inline-block;

	}

	
	#canvasBox {
	    display: block;
	    width: 120px;
	    height: 105px;
	    margin: 0px 10px 0px 10px;
	    float: left;
	}
	
	#canvasBtnBox {
		display:block;
		width: 143px;
		height: 115px;
		float: left;
	}
	
       /* canvas */
	#canvasBox>canvas {
	    border: 1px solid #424242;
	    margin-left: 15px;
   		margin-top: 8px;

    }	
    
  
	#canvasBtnBox>#uploadImage {
		display:block;
	    width: 100px;
        height: 30px;
		line-height: 30px;
        text-align: center;
        background: #FAFAFA;
        margin-top: 15px;
   		margin-left: 23px;
   		font-size: 15px;
	}
	
	#canvasBtnBox>#addItemBtn {
		display:block;
	    width: 100px;
        height: 30px;
		line-height: 30px;
        text-align: center;
        background: #FAFAFA;
        margin-top: 15px;
   		margin-left: 23px;
   		font-weight: 600;
    	font-size: 15px;
	}
	
    
    #profile {
        display: none;
    }
	

	

</style>
</head>
<body>
	<h1 class="screen_out">그랑프링글스</h1>

	<%@include file="/WEB-INF/template/header.jsp"%><!--header-->

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


			<div class="management_contents_tab" data-index="4">
				<div class="" id="tabInfomationContents">
					<div class="vertical_tab">
						<ul>
							<li><a class="vertical_tab_item" href="/${grandprix.grndNo }/${grandprix.num}/management/schedule" title="대회일정 탭">대회일정</a></li>
							<li><a class="vertical_tab_item" href="/${grandprix.grndNo }/${grandprix.num}/management/announce_log" title="대회공지사항 탭">대회공지사항</a></li>
							<li><a class="vertical_tab_item" href="/${grandprix.grndNo }/${grandprix.num}/management/participations?applyPage=1&partPage=1" title="참가자관리 탭">참가자관리</a></li>
							<li><a class="vertical_tab_item on" href="/${grandprix.grndNo }/${grandprix.num}/management/prixes" title="상품관리 탭">상품관리</a></li>
							<li><a class="vertical_tab_item" href="/${grandprix.grndNo }/${grandprix.num}/management/match_chart" title="경기관리 탭">경기관리</a></li>
						</ul>
					</div>
				</div>
				<!-- //#tabInformationContents -->
				<h4 class="screen_out">상품관리</h4>
				<div id="addItemBox">
                    <div class="addItem_title">
							<label>상품추가</label>
						</div>
                    <div id="addItemCategoryBox">
                        <div id="whoCategory" class="category">
                            <label class="item_label_css">누구에게</label>
                            <input id="whoQuestion" class="item_input_css" type="text" placeholder="내용을 입력해주세요">
                        </div>
                        <div id="itemCategory" class="category">
                            <label  class="item_label_css">상품내용</label> <input id="itemQuestion" class="item_input_css" type="text"  placeholder="내용을 입력해주세요">
                        </div>
                        <div id="urlCategory" class="category">
                            <label class="item_label_css">URL</label> <input id="urlQuestion" class="item_input_css" type="text" placeholder="내용을 입력해주세요">
                        </div>
                        <span class="itemImage">
                        <div id="canvasBox">     
                        	<canvas id="canvas" width="90" height="90"></canvas>
                        </div>   
                        <div id="canvasBtnBox">
                            <label id="uploadImage"> 이미지 업로드
                            <input id="profile" type="file" multiple/>
                            </label>
                            <button id="addItemBtn">추가</button>
                        </div>                    
            
                        </span><!--#itemImage end-->
                    </div><!--#addItemCategoryBox end-->
                </div ><!--#addItemBox end-->
				
				
				<!-- 업데이트 이력 리스트 -->
				<div id="boxNoticeUpdateList">
					<h5 class="screen_out">업데이트 이력</h5>
					<ol class="update_list">
						<li>
							<div class="who">
								<a class="circle_btn" href=""> <img width="50" height="50"
									class="circle_btn" src="/img/ggul.png">
									<span class="user_nickname">배자</span>
								</a>
							</div>
							<div class="what">
								<span class="content">
									<strong>우승팀</strong>에게 <strong>페리카나치킨 5마리</strong>으로 변경하였습니다
								</span> <span class="ymd_date">2018년 4월 2일 22:45:23</span>
							</div>
						</li>
						
					</ol>
					<!-- List Item 템플릿 -->
					<script type="text/template" id="tmplItem">
                    <li>
                        <div class="who">
                            <a class="circle_btn" href="">
                    <img width="50" height="50" class="circle_btn" src="<@=updateItem.who.userImg@>">
                    <span class="user_nickname"><@=updateItem.who.userNickname@></span>
                </a>
                        </div>
                        <div class="what">
                            <span class="content">
                </span>
                            <span class="ymd_date"><@=updateItem.updateDate@></span>
                        </div>
                    </li>
                    <@ //moment(ymdKorFormat,updateItem.updateDate).format('YYYY년MM월DD일 H시m분s초) @>
            </script>
					<!-- 카테고리별 컨텐츠 템플릿-->
					<!-- 대회 기간, 시작시간이 변경된 경우-->
					<script type="text/template" id="tmplContentAll">
                <strong>대회 일정</strong> 이
                <strong><@= updateItem.what.startDate.year@></strong>년 <strong><@= updateItem.what.startDate.month@></strong>월 <strong><@= updateItem.what.startDate.day@></strong>일
                <strong><@= updateItem.what.startTime.hour@></strong>시 <strong><@= updateItem.what.startTime.minute@></strong>분 부터 시작하여
                <strong><@= updateItem.what.endDate.year@></strong>년 <strong><@= updateItem.what.endDate.month@></strong>월 <strong><@= updateItem.what.endDate.day@></strong>일에 종료되는 것으로 변경되었습니다.
            </script>
					<!-- 시작날짜만 변경한경우 -->
					<script type="text/template" id="tmplContentStartDate">
                <span class="content"><strong>대회시작</strong> 날짜를 <strong><@= updateItem.what.startDate.year@></strong>년 <strong><@= updateItem.what.startDate.month@></strong>월 <strong><@= updateItem.what.startDate.day@></strong>일로 변경하였습니다.</span>

            </script>
					<!-- 종료날짜만 변경한경우 -->
					<script type="text/template" id="tmplContentEndDate">
                    <strong>대회 종료</strong> 날짜를 <strong><@= updateItem.what.endDate.year@></strong>년 <strong><@= updateItem.what.endDate.month@></strong>월 <strong><@= updateItem.what.endDate.day@></strong>일로 변경하였습니다
            </script>
					<!-- 시작날짜, 종료날짜를 변경한경우-->
					<script type="text/template" id="tmplContentTerm">
                    <strong>대회 기간</strong>을 <strong><@= updateItem.what.startDate.year@></strong>년 <strong><@= updateItem.what.startDate.month@></strong>월 <strong><@= updateItem.what.startDate.day@></strong>일부터 <strong><@= updateItem.what.endDate.year@></strong>년 <strong><@= updateItem.what.endDate.month@></strong>월 <strong><@= updateItem.what.endDate.day@></strong>일까지로 변경하였습니다
            </script>
					<!-- 시작시간이 변경된 경우-->
					<script type="text/template" id="tmplContentStartTime">
                    <strong>대회 시작시간</strong> 을 <strong><@= updateItem.what.startTime.hour@></strong>시 <strong><@= updateItem.what.startTime.minute@></strong>분으로 변경하였습니다
            </script>
				</div>
				<!--boxUpdateList-->



			</div>
		</div>

	</div>
	<!--boxInfoContent-->

	<!-- //#content -->
	<%@include file="/WEB-INF/template/footer.jsp"%><!--footer-->

	<%@include file="/WEB-INF/template/js.jsp"%>
		<script src="/js/tui-code-snippet.js"></script>
	<script src="/js/tui-time-picker.min.js"></script>
	<script src="/js/tui-date-picker.min.js"></script>

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

	<!-- boxCalendars 의 이벤트를 처리하는 스크립트 -->
	<script>
		/*
		                calendar_btn에서 날짜값을 moment객체로 얻어오는 함수
		 */
		function getMomentFromCalBtn(btn) {
			var year = btn.find(".year>strong").text(), month = btn.find(
					".month>strong").text(), day = btn.find(".day>strong")
					.text();

			return moment([ year, month - 1, day ]);
		}

		function addZero(value) {
			//모양때문에 정말 싫은데... 10미만이면 0추가하는 함수
			if (value < 10)
				value = "0" + value;
			return value;
		}

		function setMomentToCalBtn(btn, date) {
			btn.find(".year>strong").text(date.year());
			btn.find(".month>strong").text(addZero(date.month() + 1));
			btn.find(".day>strong").text(addZero(date.date()));

		}

		var $btnSetStartDate = $("#btnSetStartDate"), $btnSetEndDate = $("#btnSetEndDate"), startDate = $btnSetStartDate
				.find(".ymd_date"), endDate = $btnSetEndDate.find('.ymd_date'), oriStartDate = getMomentFromCalBtn($btnSetStartDate), oriEndDate = getMomentFromCalBtn($btnSetEndDate);

		/*
		        달력버튼 클릭이벤트
		        1.버튼을 클릭하면 버튼안의 YMD를 가져와서 그 날짜가 셋팅된 달력이 튀어나오게한다.
		        2.날짜를 선택하면 선택한날짜로 YMD가 바뀌게하고 상태가 바뀐 버튼주변에 강조표시를 한다.
		 */
		//startDate,endDate-DatePicker 연결 : 각 버튼을 클릭시 DatePicker호출
		var startDatePicker = new tui.DatePicker('#btnSetStartDate', {
			date : oriStartDate.toDate(),
			input : {
				element : '#btnSetStartDate .ymd_date',
				format : 'yyyy년MM월dd일'
			},
			language : 'ko'
		});

		var endDatePicker = new tui.DatePicker('#btnSetEndDate', {
			date : oriEndDate.toDate(),
			input : {
				element : '#btnSetEndDate .ymd_date',
				format : 'yyyy년MM월dd일'
			},
			language : 'ko'
		});
		var format = 'YYYYMMDD';
		//change:datePicker에서 날짜를 선택했을때 발생하는 이벤트
		//유효성 검사 : 오늘날짜 이상, endDate이전 이여야함
		startDatePicker
				.on(
						'change',
						function() {
							var newDate = moment(startDatePicker.getDate());

							if (
							//날짜단위까지만 얻어오기
							moment().hour(0).minute(0).second(0).millisecond(0)
									.valueOf() > newDate.valueOf() //오늘날짜 이전이거나
									|| getMomentFromCalBtn($btnSetEndDate)
											.valueOf() < newDate.valueOf() //종료날짜 보다 나중이면
							) {
								alert("경기시작날짜는 오늘보다 이전이거나 경기종료날짜보다 나중일 수 없습니다.");
								return false;
							}

							//대회일정관리 탭에 들어온 처음, 그러니까 변경되기 전 원본데이터를 선택했을땐 원본데이터 상태로, 그외엔 변경된상태로 클래스 추가/제거
							if (oriStartDate.format(format) == newDate
									.format(format)) {
								startDate.removeClass("changed");
								checkUpdateBtn();
							} else {
								startDate.addClass("changed");
								activatingUpdateBtn();
							}

							setMomentToCalBtn($btnSetStartDate, newDate);
							return false;
						});

		//유효성 검사 : startDate이상이면 됨.
		endDatePicker.on('change', function() {
			var newDate = moment(endDatePicker.getDate());

			if (getMomentFromCalBtn($btnSetStartDate).valueOf() > newDate
					.valueOf() //시작날짜보다 전이면
			) {
				alert("경기종료날짜는 경기시작날짜보다 전일 수 없습니다.");
				return false;
			}

			if (oriEndDate.format(format) == newDate.format(format)) {
				endDate.removeClass("changed");
				checkUpdateBtn();
			} else {
				endDate.addClass("changed");
				activatingUpdateBtn();
			}

			setMomentToCalBtn($btnSetEndDate, newDate);
		});
	</script>
	<!-- boxStartTime 의 이벤트를 처리하는 스크립트 -->
	<script>
		var $hour = $(".time_inp.hour"), $minute = $(".time_inp.minute")
		oriHour = $hour.val(), oriMinute = $minute.val();

		/*
		    hour 유효성검사 : 0보다 작거나 23보다 큰지 검사
		    minute 유효성검사 : 0보다 작거나 60보다 큰지 검사
		 */
		var reg = /^[0-9]{1,2}$/;

		//changed이벤트는 value가 변경될때만 발생, 값을 지웠다 똑같은 값을쓰면 발생 x
		//시간값을 변경하면 발생하는 이벤트
		$hour.on("change", function() {
			//정수값이 아닐때 원래 초기시간 입력 (0보다 작거나가 여기에 포함)
			if (!reg.test($hour.val()))
				$hour.val(oriHour);
			// 23보다 크면 각각 0, 23으로 입력
			if ($hour.val() > 23)
				$hour.val(23);

			if ($hour.val() == oriHour) {
				$hour.removeClass("changed");
				checkUpdateBtn();
			} else {
				$hour.addClass("changed");
				activatingUpdateBtn();
			}
		});
		//분값을 변경하면 발생하는 이벤트
		$minute.on("change", function() {
			//정수값이 아닐때 원래 초기시간 입력 (0보다 작거나가 여기에 포함)
			if (!reg.test($minute.val()))
				$minute.val(oriMinute);
			// 23보다 크면 각각 0, 23으로 입력
			if ($minute.val() > 59)
				$minute.val(59);

			if ($minute.val() == oriMinute) {
				$minute.removeClass("changed");
				checkUpdateBtn();
			} else {
				$minute.addClass("changed");
				activatingUpdateBtn();
			}
		});
	</script>
	<!-- 변경버튼을 비활성화/활성화 처리하는 스크립트 -->
	<script>
		var $btnUpdateSchedule = $("#btnUpdateSchedule")

		function activatingUpdateBtn() {
			$btnUpdateSchedule.addClass("on").attr("disabled", false);
		}

		function checkUpdateBtn() {
			//먼저 상태를 확인할 수 있는 changed 클래스를 보고
			var statStartDate = startDate.hasClass("changed")
			statEndDate = endDate.hasClass("changed")
			statStartTime = $hour.hasClass("changed")
					|| $hour.hasClass("changed");

			if (statStartDate || statEndDate || statStartTime) {
				$btnUpdateSchedule.addClass("on").attr("disabled", false);
			} else {
				$btnUpdateSchedule.removeClass("on").attr("disabled", true);
			}

		}
	</script>
	<!-- 변경 버튼을 클릭했을때의 이벤트 -->
	<script>
		$btnUpdateSchedule.on("click", function() {
			//흠...중복된 코드가 많아지는군.... 나중에 정리해야지
			var statStartDate = startDate.hasClass("changed")
			statEndDate = endDate.hasClass("changed")
			statStartTime = $hour.hasClass("changed")
					|| $minute.hasClass("changed");

			var templ1, templ2, templ3, templ4, templ5, tmpl;

			var log = "변경된게 없음" + statStartDate + " " + statEndDate + " "
					+ statStartTime;

			//상태는 다섯가지 , 검사순서를 하나->전부순으로, 이건 클릭했을때 들어가야겠네.

			//시작날짜 변경
			if (statStartDate) {
				tmpl = templ1;
				log = "시작날짜 변경";
			}

			//종료날짜 변경
			if (statEndDate) {
				tmpl = templ2;
				log = "종료날짜 변경";
			}

			//시작시간 변경
			if (statStartTime) {
				tmpl = templ3;
				log = "시작시간 변경";
			}

			//경기기간 변경
			if (statStartDate && statEndDate) {
				tmpl = templ4;
				log = "경기기간 변경";
			}

			//전부 변경
			if ((statStartDate || statEndDate) && statStartTime) {
				tmpl = templ5;
				log = "전부 변경";
			}

			console.log(log);

			/*
			    $.ajax(
			    1)입력되어있는 데이터 모두 +
			    변경이력카테고리(시작날짜변경,종료날짜 변경, 시작시간 변경, 경기기간변경, 전부변경)을 추가로 넘겨줌
			    2)이 페이지 새로고침
			    ) 
			 */

		})
	</script>
	<!-- boxUpdateList에 아이템을 추가하는 스트립트-->
	<script>
		_.templateSettings = {
			interpolate : /\<\@\=(.+?)\@\>/gim,
			evaluate : /\<\@(.+?)\@\>/gim,
			escape : /\<\@\-(.+?)\@\>/gim
		};

		var itemTmpl = _.template($("#tmplItem").text()), contentTmpls = [
				_.template($("#tmplContentAll").text()),
				_.template($("#tmplContentStartDate").text()),
				_.template($("#tmplContentEndDate").text()),
				_.template($("#tmplContentTerm").text()),
				_.template($("#tmplContentStartTime").text()) ];

		/*
		    ajax는 서버가 없으면 작동하지 않는다.
		    localhost로 접근하든 뭘하든 
		    서버가 켜져있지않은 url로 접근하려고하면 작동하지 않음.
		 */
		/* $.ajax({
		    url:"ajax/manageTest.json",
		    dataType:"json",
		    type:"get",
		    error:function(xhr,err,code){
		        alert("서버점검중! "+code);
		    },
		    success:function(json){
		        $(json).each(function(){
		            //item을 템플릿으로 생성후
		            var $item = $(itemTmpl({updateItem:this}));
		            //changeType에 따라 각각의 템플릿을 적용해 추가
		            //근데 이러면 템플릿을 사용하는 의미가 있나? 이렇게 사용하는게 아닌가?
		            $item.find(".content").html(contentTmpls[this.what.changeType]({updateItem:this}));
		            $item.appendTo("#boxUpdateList .update_list");
		            
		        })
		    }
		}); */
	</script>


</body>
</html>