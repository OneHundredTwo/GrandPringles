<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>커뮤니티-상세글</title>
    <%@include file="/WEB-INF/template/link.jsp" %>    
    <link rel="stylesheet" href="/css/post_common.css">
    <link rel="stylesheet" href="/css/competition_watch_header.css">
    
<style>

	  #wrap{

            height: 1330px;
            position: relative;

        }

        /* 커뮤니티 인기 내용 */
        #content {
            margin: auto;
            width: 1300px;

            border: 2px solid #fff;
            background: #212121;
        }

        #WrapCommunity{


            padding-top: 20px;
            position: relative;
            width: 1160px;
            height: 1130px;
            top: 33px;
            left: 20px;

            background: #D2D2D2;
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
        #communityTapboard>div{
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
        #communityTapboard>#popularityTab{
            left: 0px;
        }
        #communityTapboard>#chattingTab{
            left: 233px;
        }
        #communityTapboard>#mediaTab{
            left: 466px;
        }
        #communityTapboard>#battingTab{
            right: 228px;
        }
        #communityTapboard>#debateTab{
            border: none;
            right: 0px;
        }
        #communityTapboard .participant_board.on{
            background: #FFF176;
            color: black;
        }





        /*BoxBatting*/
        #BoxBatting{
            width: 450px;
            height: 160px;
            position: absolute;
            bottom: 20px;
            right: 20px;
            min-height: 70px;
            background: #FAFAFA;
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

        }
        #BoxBatting label{
            display: block;
            padding: 10px 0 10px 0;
        }
        #BoxBatting .Batting_input {
            padding: 20px 0px 20px 20px;
        }
        .input_position {
            position: absolute;
            right: 100px;
            bottom:10px;
            font-size: 15px;
            width: 170px;
            height: 27px;
            background: rgb(230,230,230);
            color: #616161;
            border: none;
            border-bottom: 1px solid #BDBDBD;
            line-height: 40px;
            padding-left: 10px;
        }


        button:hover{
            cursor: pointer;
        }

        /*페이징 CSS*/
        #boxRecruitPage{
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
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            opacity: 0.5;
            text-align: center;
        }

        #boxRecruitPage i {
            color: #424242;
        }

        #boxRecruitPage li:hover {
            opacity: 1;
        }
        
        .content_Item {
		position: absolute;
		width: 200px;
		height: 200px;
		right: 10px;
		bottom: 5px;
		border: 3px solid #BDBDBD;
		font-size: 25px;
		line-height: 200px;
		text-align: center;
		z-index: 1;
	}     

	.views {
	    position: absolute;
    	right: 25px;
	}

	table {
		margin-top:10px;
	}

	.participantPerson {
		position: absolute;
    	left: 10px;
	}
	
	#nameBox {
	    position: absolute;
	    left: 10px;
	    top: 10px;
	    width: 110px;
	    height: 100px;
	    background: #e6e6e6;
	}
	
	#nameBox>div{
	    height: 50px;
	    line-height: 50px;
	}
	
	#nameBox>div>span{
		margin-left: 5px;
	}
	
	#graphBox {
	    position: absolute;
	    left: 120px;
	    top: 10px;
	    display: inline-block;
	    height: 100px;
	    width: 220px;
	    background: #e0e0e0;
    }
    
 	.content_graph{
	    background: #424242;
	    width: 200px;
	    height: 30px;
	    margin-top: 10px;
	    margin-left: 10px;
	    margin-bottom: 20px;
	    color:#ffffff;
        }
    
    .bar{
        background: transparent;
        width: 30px;
        height: 30px;
        text-align: center;
        transition: 500ms ease;         
    }
    
    .bar>span {
    	line-height: 30px;
    }
   	
   	.bold_yl{
    	color: #D68A06;
    } 
    
    #countBox {
	    position: absolute;
	    left: 340px;
	    top: 10px;
	    display: inline-block;
	    height: 100px;
	    width: 100px;
	    background: #e6e6e6;
    }
    
    #countBox>div{
        height: 50px;
	    line-height: 50px;
	    font-size: 15px;
	    text-align: center;
    }
    
    .chipAside{
    	display:none;
    }
    
    .chipBside {
     	display:none;
     }

	.Batting_input>span {
	    position: absolute;
	    left:15px;
	    bottom: 18px;
	}
	
	.winChips {
		display: none;
	}

    </style>


</head>
<body>
<h1 class="screen_out">그랑프링글스</h1>

<%@include file="/WEB-INF/template/header.jsp" %><!--header-->

<div id= "content">

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


    <div id="wrap">
        <!--커뮤니티 탭 -->
        <div id="communityTapboard">
            <div id="popularityTab" class = "participant_board">인기</div>
            <div id="chattingTab" class = "participant_board">잡담</div>
            <div id="mediaTab" class = "participant_board">미디어</div>
            <div id="battingTab" class = "participant_board">배팅</div>
            <div id="debateTab" class = "participant_board">토론</div>
        </div><!--communityTapboard-->



 	<div id="WrapCommunity">
        <div id = "BoxContent">
			 <div class="post_Box">
                <div class="post_Head">
                    <span class ="post_Title_Box">
                        <span class="post_Title">${article.title}</span>
                        <!-- 여기여기 -->
                        <span class = "post_Like"><i class="far fa-thumbs-up"></i><span id="post_liking">${article.liking}</span></span>
                      
                    </span> <!-- post_Title_Box End-->
                    <!--수정 , 삭제 버튼 -->
                    
                    <c:if test="${article.userNo==loginUser.no}">
                    <div class="sort_Box">
                        <button form="updateForm" id ="UpdateBtn" class = "btn_sort">수정                          
                        </button>                        
       
                        <button form="deleteForm" id="DeleteBtn" class = "btn_sort">삭제
                        </button>
              			
              			<form id="updateForm" action="/${grndNo}/${grndNum}/community/updateForm" method="post">
              				<input type="hidden" name="title" value="${article.title}">
              				<input type="hidden" name="content" value="${article.content}"> 
              				<input type="hidden" name="boardNo" value="${article.boardNo}">                			
              			</form>
                        
              			<form id="deleteForm" action="/${grndNo}/${grndNum}/community/${article.category}/${article.boardNo}" method="post">
              				<input type="hidden" name="_method" value="DELETE"/>       			
              			</form>     
                    </div>
				</c:if>
                </div>

                <div class="post_Body">
                    <span class = "preview_Box">
						${article.content}
                    </span><!--Content_Box End-->
                    
                    <div id = "BoxBatting">
         <%--               <form action="/${grndNo}/${grndNum}/community/betting/${boardNo}" method="post">           --%>
							<input type="hidden" name="userNo" value="${loginUser.no}">
                       		<input type="hidden" name="matchNo" value="${article.matchNo}">
                       		
							<span id="nameBox"> 
								<div>
									<input type="radio" name="betting" value="${article.red}">
									<span>${article.redName}</span>
								</div>
								<div>
									<input type="radio" name="betting" value="${article.blue}">
									<span>${article.blueName}</span>
								</div>
							</span>

							<span id="graphBox"> 
								<div class="content_graph">							
									<div class ="bar graphAside">
										<span class="addAside">0</span>배<b class="chipAside" >(0chips)</b>
									</div>
								</div>
								<div class="content_graph">
									<div class ="bar graphBside">
										<span class="addBside">0</span>배<b class="chipBside">(0chips)</b> 
									</div>
								</div>
							</span>
							
							<span id="countBox"> 
								<div>
									<b class="bold_yl countAside" >0</b> 명 (<b class="bold_yl perAside">0</b>%)								
								</div>
								<div>
									<b class="bold_yl countBside">0</b> 명 (<b class="bold_yl perBside">0</b>%)
								</div>
							</span>
							<div class = "Batting_input">          
								<span class="winChips"> 성공시 : <span class="bold_yl">0</span>chips</span>
	                        	<input name="chip" type="text" placeholder="금액" maxlength=6 class="input_position">
	                        	<button id="bettingBtn" type="button" class="btn_middle_button">배팅</button>	                        
                            </div>
                  
                                               
               <!--          </form> -->
                    </div><!--BoxBatting End-->
                 
                </div>

                <div class="post_Foot">
                    <div class="content_Writer_Time">
                        <span class = "writer">${article.nickname}</span>
                        <span class = "time">${article.regDate}</span>
                        <span class="views">조회수 : ${article.viewCnt}회</span>
                    </div> <!-- content_Writer_Time End -->
                </div>

            </div><!--post_Box End-->
       
        
          <div id = BoxComment>
               <div id = "titleComment">댓글 <span id="countComment">${comment.no}</span>
                    <select class ="Best_Sort">
                            <option value="new">최신순</option>
                            <option value="hot">베스트순</option>
                    </select>
               </div> <!-- titleComment End -->
                    

			<div class = "Comment_many">

      		<c:forEach items="${comments}" var="comment">
      			<c:choose>
      				<c:when test="${comment.userNo!=article.userNo}">
      				    <div class = "Commnet_User_Box">
                            <div class="Comment_img_Box">
                                <img src="/img/${comment.profile}" alt="" class="Comment_img">
                                <div class="Comment_User_name">${comment.nickname}</div>
                            </div>

			
                            <div class="Comment_Content">${comment.content}
                                <a
	                                data-no="${article.boardNo}"
	                                data-comment="${comment.no}"
	                                href="#" class = "Commnet_like">
                                	<i  class="fas fa-heart heart_font"></i>
                                	<span class="comment_liking">
                                		${comment.liking}
                                	</span>
                                </a>
                                <div class = "Comment_regDate">${comment.regDateStr}</div>
                            </div>

                        </div><!--Commnet_User_Box End-->
      				</c:when>
      			
      				<c:otherwise>
      				 <div class = "Writer_Commnet_User_Box">
                            <div class="Writer_Comment_img_Box">
                                <img src="img/${comment.profile}" alt="" class="Comment_img">
                            </div><!--Writer_Comment_img_Box End-->
                            <div class="Writer_Comment_User_name">${comment.nickname}</div>
                            <!--Writer_Comment_User_name End-->

                            <div class="Writer_Comment_Content">${comment.content}
                                <a
	                                data-no="${article.boardNo}"
	                                data-comment="${comment.no}"
	                                href="#" class = "Commnet_like">
                                	<i  class="fas fa-heart heart_font"></i>
                                	<span class="comment_liking">
                                		${comment.liking}
                                	</span>
                                </a>
                                <div class = "Writer_Comment_regDate">${comment.regDateStr}</div>
                            </div><!--Writer_Comment_Content End-->

                        </div><!--Writer_Commnet_User_Box End-->
      				</c:otherwise>
      			</c:choose>
      
			</c:forEach>
		    </div> <!-- .Comment_many End -->
		    
		    <c:if test="${loginUser!=null}">
		    	<div id="writeComment" >            
                  	<div id="writeCommentContents">
                	    <form action="">
                    	    <textarea type="text" placeholder="댓글작성" id="inputComment" maxlength="50"  style="resize: none"></textarea>
                                <button type="button" id= "btnComment" class = "btn_small_button" >작성</button>
                        </form>
                    </div> <!-- #writeCommentContents End -->
           		</div> <!-- #writeComment End -->
		    </c:if>
		    </div><!--BoxComment End-->       
    		</div><!--BoxContent End-->
 		</div> <!-- Wrapcommunity End -->
	</div><!--wrap End-->
</div><!--content End-->

   <script type="text/template" id = "CommentTmp">
	<@_.each(list,function(comment) { @>

		<@ if(comment.userNo==${article.userNo}) { @>

			<div class = "Writer_Commnet_User_Box">
				<div class="Writer_Comment_img_Box">
					<img src="img/<@=comment.profile@>" alt="" class="Comment_img">
				</div>
	 			<div class="Writer_Comment_User_name"><@=comment.nickname@></div>
				<div class="Writer_Comment_Content"><@=comment.content@>
					<a
	        			data-no="${article.boardNo}"
	            		data-comment="<@=comment.no@>"
						href="#" class = "Commnet_like">
                		<i  class="fas fa-heart heart_font"></i>
                		<span class="comment_liking">
                			<@=comment.liking@>
                		</span>
            		</a>

				<div class = "Writer_Comment_regDate"><@=moment(comment.regDate).format("YYYY-MM-DD H:m")@></div>
			</div>
	 	</div><!--Writer_Commnet_User_Box End-->

		<@ }else { @>

 			<div class = "Commnet_User_Box">
                <div class="Comment_img_Box">
                    <img src="img/<@=comment.profile@>" alt="" class="Comment_img">
                </div>
                <div class="Comment_User_name"><@=comment.nickname@></div>
                <div class="Comment_Content"><@=comment.content@>

					<a
	        			data-no="${article.boardNo}"
	            		data-comment="<@=comment.no@>"
						href="#" class = "Commnet_like">
                		<i  class="fas fa-heart heart_font"></i>
                		<span class="comment_liking">
                			<@=comment.liking@>
                		</span>
            		</a>

                <div class = "Comment_regDate"><@=moment(comment.regDate).format("YYYY-MM-DD HH:mm")@></div>
         		</div>
        	</div><!--Commnet_User_Box End-->
		<@}@>

	<@ }) @>
    </script>
     
<%@include file="/WEB-INF/template/footer.jsp"%><!--footer-->

<%@include file="/WEB-INF/template/js.jsp"%>

<script>
 	_.templateSettings = {
			interpolate: /\<\@\=(.+?)\@\>/gim,
			evaluate: /\<\@(.+?)\@\>/gim,
			escape: /\<\@\-(.+?)\@\>/gim
			}; 
</script>


   
<script>
	// 좋아요 버튼을 누르면 게시물의 추천 수가 증가
	$(".post_Like").on("click",function() {
		
	<c:choose>
		<c:when test="${loginUser!=null}">
			// 로그인이 되어 있으면 ajax가 적용되어야 한다.
			$.ajax({
				url : "/ajax/boardLiking",
				data:{"boardNo":${article.boardNo}, "userNo":${loginUser.no} ,"type":"B"},			
				error : function(xhr, error, code) {
					alert(error);
				}, // error() end
				success : function(json) {				
					$("#post_liking").text(json.count);				
					
				} // success() end
			 }); // ajax end			
		</c:when>
		
		<c:otherwise>
			alert("로그인이 필요한 서비스 입니다. 로그인을 해 주십시오.");
		</c:otherwise>
	</c:choose>
		
		
		
	});//click end()	

</script>

<script>
	// 좋아요 버튼을 누르면 댓글의 추천 수가 증가
	$(".Comment_many").on("click",".Commnet_like" ,function(e) {
		var comment = $(this).data("comment");
	
	<c:choose>
	<c:when test="${loginUser!=null}">
		
		e.preventDefault();	
		
		var $this = $(this);		
		var no = $this.data("no");		
		var commentNo = $this.data("comment");
		
 		$.ajax({
			url : "/ajax/commentLiking",
			data:{"boardNo":${article.boardNo}, "userNo":${loginUser.no},"commentNo":comment, "type":"C"},
		
			error : function(xhr, error, code) {
				alert(error);
			}, // error() end
			success : function(json) {
				console.log(json);
				$this.find(".comment_liking").text(json.count);
			} // success() end
		 }); // ajax end					
	</c:when>
		
		<c:otherwise>
			alert("로그인이 필요한 서비스 입니다. 로그인을 해 주십시오.");
		</c:otherwise>
	</c:choose>
		
	});//click end()						
</script>

<script>	

	var order = "new";
	
	//작성 클릭시 댓글추가 및 스크롤 맨아래
	$("#btnComment").click(function () {
		var content = $("#inputComment").val();	
		
		$.ajax({
			url : "/ajax/addComment",
			data:{"content":content, "boardNo":${article.boardNo}, "userNo":${loginUser.no}, "nickname":"${loginUser.nickname}", "profile":"${loginUser.profile}"},
			dataType:"json",
			error : function(xhr, error, code) {
				alert(error);
			}, // error() end
			success : function(json) {
				console.log(json.result);
				
				if(json.result) {
					 getComments();
				}
		    
			} // success() end
		 }); // ajax end	
	});
	
	$(".Best_Sort").on("change",function(){
		order = $(".Best_Sort option:selected").val();
		
		 getComments();
		
	});
	
	function getComments() {
		
		$.ajax({
			url : "/ajax/getComments",
			data:{"boardNo":${article.boardNo}, "order":order},
			success:function(data) {
				console.log(data);
				/* 댓글 리스트를 지우는 것*/
				$(".Comment_many").empty();
				/* 작성자가 아닐 때 들어가야하는 정보 */
				var commetTmp = _.template($("#CommentTmp").html());
				var markup = commetTmp({list:data});
		        $(".Comment_many").html(markup);
			}
		});
		
		
	}
	
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

<!-- 배팅에 대한 글 -->	
<script>

/* 	$("#bettingBtn").click(function() {
		
		<c:choose>
		
			<c:when test="${loginUser==null}">
				alert("배팅을 하려면 로그인을 먼저 하셔야합니다.");
			</c:when>
			
			<c:otherwise>

				if($('input:radio[name="betting"]').is(':checked')) {
					
					var chips = $(".input_position").val();
					console.log(chips);
					
					$(".input_position").val("");
					$(".graphBside").css("width",150);
					$(".graphAside").css("width",50);
		
					$(".countBside").text(64);
					$(".perAside").text(29.7);
					$(".perBside").text(70.3);
					
					$(".addAside").text(3.4);
					$(".addBside").text(1.33);
					
					$(".chipBside").css("display","inline");
					$(".winChips").css("display","inline");
					
					$.ajax({
						url : "/ajax/betting",
						method:'POST',
						dataType:"json",
						data:{"potatochip":chips, "no":${loginUser.no}, "usersChips":${loginUser.potatochip}},
					
						error : function(xhr, error, code) {
							console.log(xhr);
							console.log(error);
							console.log(code);
						}, // error() end
						success : function(json) {
							console.log(json.usersChips);
							
							$("#spCountChips").text(json.usersChips+"개");
							
						} // success() end
					 }); // ajax end					
					
				} else {
					alert("배팅 항목을 체크해 주시길 바랍니다.");
				}
			
			</c:otherwise>
			
		</c:choose>
		
	});
 */
	
</script>
