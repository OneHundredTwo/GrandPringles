<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>메인페이지</title>
    
    <style>

        a {
            text-decoration: none;
            cursor: pointer;
        }

        #content {
            width: 100%;
        }

        /*전체박스*/
        #wrapMain {
            width: 1600px;
            height: 1000px;
            position: relative;
            background: #E0E0E0;
            margin: auto;
        }

        /*------------------상단CSS------------------*/


        /*상단 공간*/
        #BoxUpSpace {
            width: 1560px;
            height: 520px;
            position: relative;
            top: 10px;
            margin: auto;
        }
        /*트위치 영상 담는 박스*/
        #BoxLive {
            width: 1000px;
            height: 500px;
            position: absolute;
            left: 10px;
            top: 10px;
        }
        /*우측 상단 소개*/
        #ListCompetition {
            width: 520px;
            height: 500px;
            position: absolute;
            right: 10px;
            top: 10px;
            border: 1px solid #BDBDBD;
            background: #EEEEEE;
        }
        /*맨위 게임 이름*/
        #gameName {
            width: 500px;
            height: 40px;
            line-height: 40px;
            font-size: 20px;
            text-align: center;
            position: absolute;
            top: 10px;
            left: 10px;
            background: #CCCCCC;
            color: #424242;
            font-weight: 600;
            border: 1px solid #BDBDBD;
        }


        #titleCompetition {
            background: #E0E0E0;
            width: 500px;
            height: 80px;
            position: relative;
            left: 10px;
            top: 50px;
            border: 1px solid #BDBDBD;


        }
        /*이미지 및 대회이름 박스*/
        #imgBoxCompetition {
            position: absolute;
            width: 150px;
            height: 80px;
            background-image: url("img/1_대회 로고.PNG");
            background-size: cover;
            background-repeat: no-repeat;
        }

        /*대회이름*/
        #nameCompetition{
            width: 350px;
            height: 80px;
            text-align: center;
            font-size: 25px;
            position: absolute;
            right: 0;
            top: 0px;
            line-height: 80px;
        }

        /*대회이름*/
        #nameCompetition>a{
           color: #000;
        }

        /*대회소개 박스*/
        #boxIntroduce {
            background: #EEEEEE;
            width: 500px;
            height: 360px;
            position: absolute;
            top: 130px;
            left: 10px;
            border: 1px solid #BDBDBD;
        }

        /*대회소개내용 p요소*/
        #boxIntroduce #contentIntroduce {
            font-size: 20px;
            /*background: yellow;*/
            margin: 10px;
        }


        /*-----------------------------------------------------------*/
        /*중단 공간*/

        /*전체 내용 박스*/
        #boxCompetition {
            width: 1340px;
            height: 140px;
            margin-left: 250px;
            left: -170px;
            top: 0px;
            /*background:black;*/
            position: absolute;
            overflow: hidden;
        }

        /*이미지 슬라이드*/
        #listImg {
            position: absolute;
            top: 535px;
            left: 45px;
            width: 1500px;
            height: 138px;

            border: 1px solid #424242;

        }
        /*고정박스*/

        /*움직이게 할 이미지 박스*/
        #imgHistory {
            position: absolute;
            width: 2100px;
            height: 140px;
            /*background: red;*/
            top: 0px;
            left: 0px;
            transition: ease 500ms;
        }
        /*역대이미지 하나하 감싸는 span*/
        #imgHistory .img_span{
            float: left;
            width: 276px;
            height: 140px;
            /*margin: 0px 35px 0px 0px;*/
            margin:0px 60px 0px 0px;
            position: relative;
        }


        /*슬라이드 버튼박스!!*/
        .btn_Img {
            text-align: center;
            line-height: 130px;
            cursor: pointer;
            margin: 5px;
            border: 1px solid rgb(150,150,150);
            height: 130px;
            width: 69px;
            opacity: 0.3;
        }
        /*버튼 위치지정*/
        #imgRightBtn {
            position: absolute;
            right: 0px;
            top:0px;
        }
        #imgLeftBtn {
            position: absolute;
            left: 0px;
            top:0px;


        }
        /*폰트어섬 위치지정, 폰트 크기*/
        .fa-arrow-right {
            font-size: 50px;
            position: absolute;
            left:15px;
            top:40px;


        }
        .fa-arrow-left {
            font-size: 50px;
            position: absolute;
            left:15px;
            top:40px;
        }



        /*슬라이드 버튼 호버시*/
        .btn_Img:hover{
            opacity: 1;
            color: #B71C1C;
        }

        .inline_Box {
            display: inline-block;
        }





        /*-----------------------------------------------------------*/


        /*하단 공간*/
        #BoxDownSpace {
            width: 1540px;
            height: 300px;
            position: absolute;
            bottom: 10px;
            left: 30px;

        }

        /*개최자 정보*/
        #listHost {
            width: 600px;
            height: 300px;
            position: absolute;
            left: 0px;
            position: relative;
            border: 1px solid #9E9E9E;

        }
        /*개최자 이름*/
        #listHost #hostName {
            width: 590px;
            height: 40px;
            background: #CCCCCC;
            font-size: 20px;
            font-weight: 600;
            padding-left: 10px;
            line-height: 40px;
            position: relative;
        }

        /*검색창*/
        #hostName #hostFind {
            position: absolute;
            right: 10px;
            top: -5px;
        }

        /*검색창 INPUT*/
        #hostFind .input_Search {
            display: inline-block;
            width: 180px;
            height: 28px;
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
            top: 11px;
            right: 10px;
            cursor: pointer;
        }

        /*개최자박스 안에내용*/
        #hostBox {
            height: 260px;
            width: 600px;
            background: #D6D6D6 ;
        }
        /*개최자 한명에 대한 박스*/
        #hostBox .list_Host {
            float: left;
            height: 75px;
            width: 285px;
            margin-left: 10px;
            top: 5px;
            background: transparent;
            position: relative;
            border: 1px solid #9E9E9E;

        }
        /*개최자 이미지 박스*/
        #hostBox .box_Imghost {
            height: 75px;
            width: 75px;
        }
        /*개최자 이미지*/
        #hostBox .host_Img {
            height: 75px;
            width: 75px;
            border-bottom-right-radius: 75px;
            border-top-right-radius: 75px;
            border-right: 1px solid #9E9E9E;
        }
        /*개최자 이름 들어가는 곳*/
        .name_Host {
            position: absolute;
            width: 200px;
            height: 75px;
            background: #DCDCDC;
            top: 0px;
            left: 85px;
            text-align: center;
            line-height: 75px;
            font-size: 25px;
            border-bottom-left-radius: 30px;
            border-top-left-radius: 30px;
            border-left: 1px solid #9E9E9E;
            border-right: 1px solid #9E9E9E;

        }








        /*커뮤니티 인기글*/
        #listCommunity {
            background: #F5F5F5;
            width: 920px;
            height: 300px;
            position: absolute;
            bottom: 0px;
            right: 0px;
            border: 1px solid #9E9E9E;

        }

        #nameCommunity {
            height: 40px;
            width: 920px;
            background: #CCCCCC;
            font-size: 20px;
            font-weight: 600;
            text-align: center;
            line-height: 40px;
            position: absolute;
            left: 0px;
            top: 0px;
        }

        #boxContentCommunity {
            height: 260px;
            width: 920px;
            position: relative;
            top: 40px;
            background: #D6D6D6;
        }
        /*인기글 핫아이디어 공통class*/
        #boxContentCommunity .posts_Box{
            width: 380px;
            height: 260px;
            position: absolute;
        }
        #boxContentCommunity  #popularPosts{
            width: 450px;
            height: 260px;
            position: absolute;
            left: 0px;
        }



        #boxContentCommunity  #hotIdeaPosts{
            left: 460px;
            position: absolute;

        }

        #boxContentCommunity .posts_span{
            width: 430px;
            height: 40px;
            line-height: 40px;
            text-align: left;
            font-size: 20px;
            position: absolute;
            left: 10px;
            padding-left: 10px;
            top: 3px;
            border: 1px solid #BDBDBD;
            background: #C8C8C8;

        }
        .posts_btn {
            position: absolute;
            top: 10px;
            right: 10px;
            border: none;
            box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
            background: #FFF176;


        }
        .box_list_posts {
            position: absolute;
            bottom: 0px;
            width: 380px;
            height: 225px;

        }
            .community_ul {
            position: absolute;
            left: 10px;
            top: 10px;
            width: 440px;
            height: 215px;
            border: 1px solid #BDBDBD;
        }
        .community_li {
            width: 415px;
            height: 30px;
            background: darkgreen;
            position: relative;
            line-height: 20px;
            padding-left: 10px;
            left: 5px;
            top: 5px;
            font-size: 15px;
            margin-bottom: 10px;

            background: transparent;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }

        .community_li a {
            font-size: 15px;
            color: #424242;
        }

        .community_like {
            width: 40px;
            position: absolute;
            right: 10px;
            top: 5px;
            font-size: 20px;
            background: #E4E4E4;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            text-align: center;
            border-radius: 30px;
        }
        .community_content {
            font-size: 25px;
        }

        /*-------------------------------------------*/






    </style>
</head>
<body>
<h1 class="screen_out">그랑프링글스</h1>
<div id= "header">
    <div id="gnb">
        <!--로고, 대회만들기, 대회찾기, 사용자목록, 검색-->
        <a href="main.html" id="headerLogo" title="메인으로"></a>
        <a class="template_btn" id="linkMakeCompet" href="#" title="대회만들기 페이지로 이동합니다">대회만들기</a>
        <a class="template_btn" id = "linkSearchCompet" href="#" title="대회찾기 페이지로 이동합니다">대회찾기</a>
        <a class="template_btn" id = "linkUserList" href="#" title="사용자목록 페이지로 이동합니다">사용자목록</a>

        <!-- 템플릿이 적용된 어떤 페이지에서 검색해서 들어간경우 대회찾기 페이지에서 해당 키워드가 input값에 유지되어야 함-->
        <span class="search_box" title="대회관련 키워드로 대회를 검색합니다">
            <input type="text" id="inpGlobalSearch" placeholder="대회를 찾아보세요" >
            <button id="btnSearch"><i class="fa fa-search"></i></button>
        </span>

        <div class="right">
            <ul class="popup_list" id="listPopupDots">
                <li><a class="template_btn" href="#" title="홈페이지 가이드 페이지로 이동합니다.">홈페이지 가이드</a></li>
            </ul>
            <div class="circle_btn dots"><i class="fa fa-ellipsis-h"></i></div>

            <!-- 오른쪽에 정렬될 요소들 : 로그인,회원가입,유저로고,감자칩,dots -->
            <!-- 로그인 상태가 아닐때 -->
            <span id="boxLogoutStatus" class="right">
                <a class="template_btn" id ="btnRegist" href="register.html" title="회원가입 페이지로 이동합니다">회원가입</a>
                <a class="template_btn" id ="btnLogin" href="login.html" title="로그인 페이지로 이동합니다">로그인</a>
            </span>
            <!-- 로그인 상태일 때 -->
            <span id="boxLoginStatus">
                <span id="potatochip"><img src="img/potatochip.png"/><span id="spCountChips">35,550,444개</span></span>
                <a class="circle_btn" id="linkUserInfo" href="" title="유저페이지로 이동합니다">
                    <img class="circle_btn" src="img/template_default_user_logo.png"/>
                </a>
            </span>
        </div>

    </div><!--gnb-->

</div><!--header-->



<div id= "content">


    <!-- 메인 Wrap-->
    <!-- 노트북이라 height 최대값이 다를수도 있음 -->
    <div id="wrapMain">


        <!--트위치 API 따오는곳 (아직 적용을 못함 질문내용) -->
        <div id="BoxUpSpace">

                <div id = "BoxLive" class = "InlineBox">
                    <iframe
                            src="http://player.twitch.tv/?channel=bonnysurang"
                            height="500"
                            width=1000"
                            frameborder="0"
                            scrolling="no"
                            allowfullscreen="true">
                    </iframe>
                </div>


            <div id="ListCompetition">
                <div id="gameName">리그오브레전드</div>
                <!--대회 이미지 and 게임 이름-->
                <div id="titleCompetition">
                    <div id="imgBoxCompetition"></div>
                    <div id="nameCompetition"><a href="">2017 필구배 ALL-STAR 대회</a></div>
                </div> <!-- .competition_title end-->
            <!-- 대회소개 및 대회 대진표 -->
                <div id="boxIntroduce">
                    <p id = "contentIntroduce">
                        대회소개를 합니다. 대회소개를 합니다. 대회소개를 합니다. 대회소개를 합니다.
                    </p>
                </div>
            </div>  <!-- #List_Competition end-->
        </div><!--BoxUpSpace-->




        <!--이미지 슬라이드-->
        <div id ="listImg">

            <div id = "imgRightBtn" class = "btn_Img"><i class="fas fa-arrow-right"></i></div>
            <div id = "imgLeftBtn" class = "btn_Img"><i class="fas fa-arrow-left"></i></div>

            <div id="boxCompetition">
                    <div id = "imgHistory">
                        <span class = "img_span"><img src="img/롤.jpg" alt=""></span>
                        <span class = "img_span"><img src="img/배그.jpg" alt=""></span>
                        <span class = "img_span"><img src="img/롤.jpg" alt=""></span>
                        <span class = "img_span"><img src="img/배그.jpg" alt=""></span>
                        <span class = "img_span"><img src="img/롤.jpg" alt=""></span>
                        <span class = "img_span"><img src="img/배그.jpg" alt=""></span>
                    </div><!--imgHistory-->

            </div><!--List_img-->
        </div><!--Box_competition-->


        <!--하단부부-->
        <div id="BoxDownSpace">
           <div id="listHost">

                    <span id="hostName" class="inline_Box">개최자
                        <div id="hostFind">

                            <input class="input_Search" type="text" placeholder="닉네임">

                            <button id="insertBtn"><i class="fas fa-search"></i></button>



                        </div> <!--.hostFind-->
                    </span>



                <div id="hostBox">
                    <ul>
                        <li class = "list_Host">
                            <div class = "box_Imghost">
                                <img src="img/template_default_user_logo.png" alt="" class = "host_Img">
                            </div>
                            <span class = "inline_Box name_Host">
                                개최자 이름
                            </span>
                        </li>
                        <li class = "list_Host">
                            <div class = "box_Imghost">
                                <img src="img/template_default_user_logo.png" alt="" class = "host_Img">
                            </div>
                            <span class = "inline_Box name_Host">
                                개최자 이름
                            </span>
                        </li>


                    </ul>


                </div><!--boxHost-->




            </div> <!-- #listHost end-->



            <div id="listCommunity">

                <div id="nameCommunity">League Of Legend 커뮤니티</div>
                    <div id = "boxContentCommunity">
                        <div id = "popularPosts" class = "posts_Box">
                            <span id = "popularTitle" class="posts_span inline_Box" >인기글 <button class = "posts_btn">More+</button></span>
                            <div class = "box_list_posts">
                                <ul class = "community_ul">

                                    <li class = "community_li">
                                        <span class="community_content"> <a href="">글 이름</a></span>
                                        <span class = "community_like"><i class="far fa-thumbs-up"></i> 1</span>
                                    </li>

                                    <li class = "community_li">
                                        <span class="community_content"> <a href="">글 이름</a></span>
                                        <span class = "community_like"><i class="far fa-thumbs-up"></i> 1</span>
                                    </li>

                                </ul>
                            </div>
                        </div>

                        <div id = "hotIdeaPosts" class = "posts_Box">
                            <span id = "hotIdeaTitle" class="posts_span inline_Box">핫아이디어<button class = "posts_btn">More+</button></span>
                            <div class = "box_list_posts">
                                <ul class = "community_ul">
                                    <li class = "community_li">
                                        <span class="community_content"> <a href="">글 이름</a></span>
                                        <span class = "community_like"><i class="far fa-thumbs-up"></i> 1</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div><!--nameCommunity-->


            </div> <!-- #List_community end-->




        </div>
    </div> <!-- #Warp_main end-->


</div><!--content-->

<div id= "footer">
    <a class="template_btn" href="">이용약관</a>
    <a class="template_btn" href="">고객센터</a>
    <a class="template_btn" href="">가이드</a>
    <a class="template_btn copyright" href="">&copy;jbm개불자들</a>

</div><!--footer-->

<script src="js/jquery.js"></script>
<script>
    var $listPopupDots = $("#listPopupDots");
    //dots 버튼 클릭시 하위메뉴 보이기, 보이지않기
    $(".dots").on("click",function(e){
        //문제 3. 이것좀 세련되게 보이기.
        $listPopupDots.slideToggle();
        return false;

    });
    

    $("body").on("click", function(){
        $listPopupDots.slideUp();
    });


    var left =0;
    $("#imgRightBtn").click(function () {
        if(left>-600) {
            left -= 336;
            $("#imgHistory").css("left", left);
        }

    })
    $("#imgLeftBtn").click(function () {
        if (left < 0){
            left += 336;
            $("#imgHistory").css("left", left);
        }

    })




</script>

</body>
</html>