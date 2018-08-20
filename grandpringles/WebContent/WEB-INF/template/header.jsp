<%@page import="com.firedogs.grandpringles.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

                <%@ taglib prefix = "c"
uri="http://java.sun.com/jsp/jstl/core_1_1"
 %>
 <!-- fmt JSTL -->
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!-- 
 <c:if test="${loginUser==null }">
 	<script >
		alert("${param.no}는 없는 아이돌번호 입니다.")
		location.href="/idolList.ims";
	
</script>
 </c:if>
  -->
<div id= "header">
    <div id="gnb">
        <!--로고, 대회만들기, 대회찾기, 사용자목록, 검색-->
        <a href="/main" id="headerLogo" title="메인으로"></a>
        <c:choose>
        	<c:when test="${loginUser!=null }">
        		<a class="template_btn" id="linkMakeCompet" href="/${loginUser.no}/1/make" title="대회만들기 페이지로 이동합니다">대회만들기</a>
        	</c:when>
        	<c:otherwise>
				<a class="template_btn" id="linkMakeCompet" href="/main " title="대회만들기 페이지로 이동합니다">대회만들기</a>
        	</c:otherwise>
        </c:choose>

        <a class="template_btn" id = "linkSearchCompet" href="" title="대회찾기 페이지로 이동합니다">대회찾기</a>
        <a class="template_btn" id = "linkUserList" href="" title="사용자목록 페이지로 이동합니다">사용자목록</a>

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
      	<c:choose>
			<c:when test="${loginUser==null }">
		 <!-- 로그인 상태가 아닐때 -->
		            <span id="boxLogoutStatus" class="right">
		                <a class="template_btn" id ="btnRegist" href="/signUp" title="회원가입 페이지로 이동합니다">회원가입</a>
		                <a class="template_btn" id ="btnLogin" href="/session" title="로그인 페이지로 이동합니다">로그인</a>
		            </span>
			</c:when>
		<c:otherwise>
            <span id="boxLoginStatus">  
 
            	<button form="logoutForm" class="template_btn" id ="btnLogout" title="로그아웃">로그아웃</button>

                <span id="potatochip"><img src="/img/potatochip.png"/><span id="spCountChips">${loginUser.potatochip}개</span></span>
                <a class="circle_btn" id="linkUserInfo" href="" title="유저페이지로 이동합니다">
                    <img class="circle_btn" src="/img/profile/<c:choose><c:when test="${loginUser.profile==null }">template_default_user_logo.png</c:when><c:otherwise>${loginUser.profile}</c:otherwise></c:choose>"/>
	
                </a>
            </span>
			</c:otherwise>
		</c:choose>
        </div>
             <form action="/session" method="post" id="logoutForm">
            	<input type="hidden" name="_method" value="DELETE">
            </form> 

    </div><!--gnb-->

</div><!--header-->