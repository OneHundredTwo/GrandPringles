function makeMatchChart($boxMatchChart,afterGen, grnd){
/*
        view든 manage든 공통
    */
    var $presentPlayerDetail, $selectedTeam, $selectedScore, $selectedSchedule, $selectMatchSchedule;

    //matchChartGenerator(차트를보여줄 컨테이너 jquery객체, 1라운드 매치 수((참가자/팀 수)/2))
    matchChartGenerator($boxMatchChart,afterGen, grnd);

    //on클래스를 모두 제거하는 함수
    function detatchOn() {
        /*
        	.palyer_detail 
        	.round_match
        	.round_match.on  .match_box .red_corner
        */
        $boxMatchChart.find(".on").removeClass("on");

    }
    //다른곳을 클릭하면 선택해서 보이는 모든 요소들을 해제한다.
    $("body").on("click", function() {
        detatchOn();
    });

    //대진표안의 요소들 클릭시 각각 이벤트들을 할당한다.
    $boxMatchChart.on("click", ".team", function() {
            detatchOn();
            if ($selectedTeam) {
                if ($selectedTeam.get(0) == $(this).get(0)) { $selectedTeam = null; return false; }
            }

            $selectedTeam = $(this);
            $selectedTeam.parents(".round_match").addClass("on");
            $selectedTeam.parents(".red_corner").addClass("on");
            $selectedTeam.parents(".blue_corner").addClass("on");
            


            $selectedTeam.find(".player_detail").addClass("on");;

            return false;
        })
        //스코어를 클릭했을땐 팀스코어를 보여준다.
        .on("click", ".score", function() {
            detatchOn();
            if ($selectedScore) {
                if ($selectedScore.get(0) == $(this).get(0)) { $selectedScore = null; return false; }
            }
            $selectedScore = $(this);
            $selectedScore.parents(".round_match").addClass("on");
            $selectedScore.parents(".red_corner").addClass("on");

            $selectedScore.find(".score_detail").addClass("on");
            return false;

        })
        //경기를 클릭했을땐 경기일정을 보여준다.
        .on("click", ".match_schedule", function() {
            detatchOn();
            if ($selectMatchSchedule) {
                if ($selectMatchSchedule.get(0) == $(this).get(0)) { $selectMatchSchedule = null; return false; }
            }
            $selectMatchSchedule = $(this);
            $selectMatchSchedule.parents(".round_match").addClass("on");
            $selectMatchSchedule.parents(".match_schedule").addClass("on");

            $selectMatchSchedule.find(".match_schedule_detail").addClass("on");
            return false;

        })
        //데이터가 있는 match의 팀을 클릭했을때 플레이어 상세정보/ 화살표를 누르면 각 판의 데이터로 넘기는 이벤트 할당
        .on("click", ".left_arrow", function() {
            var $presentShowRecord = $(this).parent().parent().find(".record_body.selected");
            var $prev = $presentShowRecord.prev();
            if ($prev.get(0)) {
                $presentShowRecord.removeClass("selected");
                var cnt = $prev.addClass("selected").data("cnt");
                $(this).parent().find("span").text("game " + cnt);
            }
        }).on("click", ".right_arrow", function() {
            var $presentShowRecord = $(this).parent().parent().find(".record_body.selected");
            var $next = $presentShowRecord.next();
            if ($next.get(0)) {
                $presentShowRecord.removeClass("selected");
                var cnt = $next.addClass("selected").data("cnt");
                $(this).parent().find("span").text("game " + cnt);
            }
        })
        //팀원 디테일 클릭했을때 team클릭 이벤트에 전파되지 않도록.
        .on("click", ".detail", function(e) {
            e.stopPropagation();
        });
}