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