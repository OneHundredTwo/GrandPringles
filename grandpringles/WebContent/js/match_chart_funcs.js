
    var tmplUseMatchData = _.template($("#tmplUseMatchData").text()),
        tmplNoMatchData = _.template($("#tmplNoMatchData").text()),
        timepickers = [];
    /*
	 * 1.div 를 만든다(경기 컴포넌트 레이어) 2.header와 body의 비율을 정한다. 3.n강전을 정한다 4.log2N으로
	 * 라운드수(0~log2N=카운트론 log2N+1)를 정한다 5.라운드수 = header의 th수 6.width를 라운드수로 나눠서
	 * th의 너비로한다. 7.1라운드 = (2^(라운드 수-0))경기 ... n라운드 = (2^(라운드수-라운드수))경기 8.7에서
	 * 계산한 경기수로 body의 height을 나눠서 각 td에 부여한다.
	 */
    
    var competInfo;
    function matchChartGenerator(chartContainer, afterGen, grnd) {
    	console.log(grnd);
        $.ajax({
            url: "/matchChart.json",
            dataType: "json",
            type: "get",
            data: {
            	"grndNo":grnd.grndNo,
            	"num":grnd.grndNum
            },
            error: function(xhr, err, code) {
                alert("서버점검중! " + code);
            },
            success: function(json) {
            	console.log("ok!"+(afterGen==null));
            	console.log(json);
                competInfo = json;
                generate(chartContainer , competInfo.totParticipants/2);
                if(afterGen!=null){
                	afterGen(chartContainer);
                }
            }
        });


    }
    

    function generate(chartContainer, startMatchCnt) {
    	 

        var roundsData = competInfo.rounds;

        var width = chartContainer.width(),
            height = chartContainer.height(),
            header = 0.05,
            body = 0.95,
            round = Math.ceil(Math.log2(startMatchCnt)),
            borderWeight = 2,
            borderColor = 'rgba(0,255,0,0.8)';

        var $header = $('<div id="boxMatchHeader">').css("height", header * height),
            $body = $('<div id="boxMatchBody">').css("height", body * height);

        chartContainer.append($header, $body);

        // 라운드 너비
        var roundWidth = width / (round + 1),
            // 라운드 수만큼 round헤더 추가
            roundHead = $('<div class="round_head">')
            .css({
                "width": roundWidth - (2 * borderWeight),
                "line-height": header * height + "px",
                "border-left": borderWeight + 'px solid ' + borderColor,
                'border-right': borderWeight + 'px solid ' + borderColor
            }),
            // 각 라운드 경기들을 감싸는 div
            roundBody = $('<div class="round_body">')
            .css({
                "width": roundWidth
            }),
            // 각 라운드마다 각 경기를 감쌀 div
            roundMatch = $('<div class="round_match">'),
            // 각 경기를 잇는 선을 그릴 svg 요소
            roundVSLayer = $('<svg class="vs_layer" xmlns="http://www.w3.org/2000/svg">');

        // vsLayer 만들때 필요한 값들
        // css에 정의한건데... 중복해서쓰는건 좀 아닌거같고 나중에 여기에만 쓰거나 그래야겠다
        /*
		 * var wCorrection=3, msW = 35,//match_schedule width mbW = 180, mbH =
		 * 50,// match_box width, height contentWidth = mbW+msW+wCorrection,
		 * sideWidth = (roundWidth-contentWidth)/2, 고정값(width관련)만 채워놓고 나머지는
		 * 라운드마다 채워지는 함수호출
		 * 
		 * version 1 decated 6.before 최소선 2개 line 1 : 1-2-4-5 line 2 : 3-6
		 * 
		 * 7.최소선을 그릴 bfore점들 좌표 점 1 : 0, rm.h/4 점 2: sideWidth/2, 점1.y 점 4 :
		 * 점2.x, rm.h-rm.h/4 점 5 : 0,점4.y
		 * 
		 * 점 3 : 점2.x, rm.h/2 점 6 : 점2.x*2, 점3.y
		 * 
		 * 8.after 최소선 1개 line : 7-8-10-11
		 * 
		 * 9.최소선을 그릴 after 점들 좌표 점 7 : roundWidth-sideWidth, rm.h/2 - mb.h/4 점 8 :
		 * roundWidth, 점7.y 점 10 : 점8.x, 점7.y+mb.h 점 11 : 점7.x , 점10.y
		 */
        /*
		 * version 2 6.before 최소선 2개 line 1 : 1-2-4-5 line 2 : 3-6
		 * 
		 * 7.최소선을 그릴 bfore점들 좌표 점 1 : 0, rm.h/4 점 2: sideWidth/2, 점1.y 점 4 :
		 * 점2.x, rm.h-rm.h/4 점 5 : 0,점4.y
		 * 
		 * 점 3 : 점2.x, rm.h/2 점 6 : 점2.x*2, 점3.y
		 * 
		 * 8.after 최소선 2개 line1 : 7-8-10-11 line2 : 12-13
		 * 
		 * 9.최소선을 그릴 after 점들 좌표 점 7 : roundWidth-sideWidth, rm.h/2 - mb.h/4 점 8 :
		 * roundWidth-(sideWidth/3)*2, 점7.y //꺾이는 지점 조절하는 x값을 여기서 지정한다. 점 10 :
		 * 점8.x, 점7.y+mb.h 점 11 : 점7.x , 점10.y 점 12 : 점8.x , h/2 점 13 :
		 * roundWidth, 점12.y
		 */

        var wCorrection = 3,
            /* 인라인블록으로인한 띄어쓰기 보정값 */
            msW = 35, // match_schedule width
            mbW = 180,
            mbH = 50, // match_box width, height
            contentWidth = mbW + msW + wCorrection,
            sideWidth = (roundWidth - contentWidth) / 2,
            /* 고정값(width관련)만 채워놓고 나머지는 라운드마다 채워지는 함수호출 */
            /* before */
            d1 = { "x": 0, "y": 0 },
            d2 = { "x": sideWidth / 2, "y": 0 },
            d4 = { "x": d2.x, "y": 0 },
            d5 = { "x": 0, "y": 0 },
            d3 = { "x": d2.x, "y": 0 },
            d6 = { "x": d2.x * 2, "y": 0 },
            /* after */
            d7 = { "x": roundWidth - sideWidth, "y": 0 },
            d8 = { "x": roundWidth - (sideWidth / 3) * 2 /* after의 1/3지점 */ , "y": 0 },
            d10 = { "x": d8.x, "y": 0 },
            d11 = { "x": d7.x, "y": 0 },
            d12 = { "x": d8.x, "y": 0 },
            d13 = { "x": roundWidth, "y": 0 };

        /* height 관련 속성을 채우는 함수 */
        function prepareDots(h) {
            /* before */
            d1.y = h / 4;
            d2.y = d1.y;
            d4.y = h - h / 4;
            d5.y = d4.y;

            d3.y = h / 2;
            d6.y = d3.y;

            /* after */
            d7.y = h / 2 - mbH / 4;
            d8.y = d7.y;
            d10.y = d7.y + mbH / 2;
            d11.y = d10.y;

            d12.y = h / 2;
            d13.y = d12.y;
        }

        function lineGen(dotArr) {
            var points = "";
            for (var i = 0; i < dotArr.length; i++) {
                points += dotArr[i].x + "," + dotArr[i].y + " ";
            }
            return points;
        }

        // vsLayer에 점들로 polyline을 만들어 반환한다
        function generateVSLayer(i, vsLayer) {
            // 만들 라인은 3개
            // before 2개 - 1라운드엔 만들지 않는다

            // SVG는 jquery로 사용하면 안됨
            // 자세한 얘기는 교육센터에서
            var originalLayer = vsLayer.get(0);

            if (i != 0) {

                var line1 = lineGen([d1, d2, d4, d5]),
                    line2 = lineGen([d3, d6]);


                var polyline1 = document.createElementNS('http://www.w3.org/2000/svg', "polyline");

                polyline1.setAttribute("points", line1);
                var polyline2 = document.createElementNS('http://www.w3.org/2000/svg', "polyline");

                polyline2.setAttribute("points", line2);

                originalLayer.appendChild(polyline1);
                originalLayer.appendChild(polyline2);

                // vsLayer.append($polyline.attr("points",line1))
                // .append($("<polyline>").attr("points",line2));
            }
            // after 1개 - 결승에선 만들지 않는다.
            if (i != round) {
                var line3 = lineGen([d7, d8, d10, d11]);
                var line4 = lineGen([d12, d13]);

                var polyline3 = document.createElementNS('http://www.w3.org/2000/svg', "polyline");
                polyline3.setAttribute("points", line3);
                var polyline4 = document.createElementNS('http://www.w3.org/2000/svg', "polyline");
                polyline4.setAttribute("points", line4);

                originalLayer.appendChild(polyline3);
                originalLayer.appendChild(polyline4);
            }
            return vsLayer;
        }
        // 찍히긴 찍히는데, 안보인다... 왜안보일까
        // => svg(및 하위 요소들)나 canvas는 HTML5 API로 작성하는거라서 jquery엔 아직 기능미비. 순수
		// javascript로 생성해야하고, createElementNS로 생성해야한다.

        for (var i = 0; i <= round; i++) {
            /* 그리기 */
            // 큰 틀들을 추가함
            // clone 함써봄.(roundHead로 append 등을 하면 요소 한개가 이동함)
            $header.append(roundHead.clone().text("round" + (i + 1)));


            // i번째 round body 추가
            var presentRound = roundBody.clone().data("round", i + 1),
                // round body 아이템 추가 : 각 라운드 body에 match를 감싸는 div를 추가함
                // -match 수는 2의 max_round-해당라운드 승
                matchCnt = Math.pow(2, round - i),
                // -해당 라운드 아이템의 height은 body의 height을 경기수만큼 나눠가짐
                presentMatch = roundMatch.clone().css({
                    "height": $body.height() / matchCnt,
                    "line-height": $body.height() / matchCnt + "px"
                }),
                // -해당 라운드 표시선을 그릴 vsLayer
                presentVSLayer = roundVSLayer.clone().css({
                    width: roundWidth,
                    height: $body.height() / matchCnt
                });
            // 라운드에 해당하는 점들 준비
            prepareDots($body.height() / matchCnt);
            presentVSLayer = generateVSLayer(i, presentVSLayer);

            /*
			 * 데이터 채우기:그리는 라운드는 계속해서 돈다, 없는 라운드는 스킵하고, 라운드 전체에 barrier를 씌운다(이거또
			 * absolute로하면...어떤일이 벌어질지 모르니까 무섭다...)
			 */
            // 해당라운드에 채워질 데이터를 준다
            var roundData = roundsData[i];
            var k=0;
            if (roundData) { // round가 있으면 match데이터가 있거나 없거나이므로 match가 있는지
								// 체크하면서 템플릿을 선택
                for (var j = 0; j < matchCnt; j++) {
                	var presentMatchData=null;// js for문안에서 선언할때 초기화 안돼?
                	// 라운드 내 경기번호가 matchChart를 그릴때 라운드 내 round_match 번호와 같으면
					// 데이터를 할당하고 해당 데이터를 그린다.
                	// 이렇게 하는 이유는 인덱스로하면 경기번호에 맞지 않게 위로 몰리기 때문.
                	
                	if(k<roundData.matchs.length){
                		if(roundData.matchs[k].matchNum-1 == j){
                			presentMatchData = roundData.matchs[k];
                    		k++;
                		}
                	}

                    var match = presentMatch.clone();

                    var matchEl;
                    if (presentMatchData) {
                        matchEl = tmplUseMatchData({
                            matchCnt: (j + 1),
                            matchName: i != round ? (j + 1) + "경기" : "결승",
                            m: presentMatchData
                        });
                        // 매치기록이 있으면 상태에따라서 출력
                        match.addClass(presentMatchData.status);
                        if(i == round) match.addClass("final_match");
                    } else {
                    	matchEl = tmplNoMatchData({
                            matchCnt: (j + 1),
                            matchName: i != round ? (j + 1) + "경기" : "결승"
                        });
                        // 매치기록이 없으면 Before로 일정수정부터 가능하도록 함
                        match.addClass("B").addClass("no_data");
                    }

                    
                    // match 템플릿으로 생성
                    match.append(matchEl)
                    .append(presentVSLayer.clone())

                    if (!presentMatchData) { // 데이터 없으면 no_data클래스 붙여주기
                        match.addClass("no_data");
                    }

                    presentRound.append(match);

                }
            } else { // round가 없으면 match데이터가 없다

                for (var j = 0; j < matchCnt; j++) {
                    var matchEl = tmplNoMatchData({
                        matchCnt: (j + 1),
                        matchName: i != round ? (j + 1) + "경기" : "결승"
                    });
                    /* presentMatch = .round_match <- 얘한테 .no_data를 추가해줘야함 */
                    var match = presentMatch.clone()
                        // match 템플릿으로 생성
                        .append(matchEl)
                        .append(presentVSLayer.clone())
                        .addClass("no_data")
                        .attr("data-status","B");
                    presentRound.append(match);

                }
            }


            // 다 채워진 round body 추가
            $body.append(presentRound);

        }

    }
    // 관리자 페이지일때
  // 각 round_match의 match_schedule에 timepicker 할당하는 함수
    function setTimepicker($container) {
    	console.log("setTimepicker");
    	timepickers=[];
    	var i=0;
        $container.find(".match_schedule_detail").each(function(){
            var $matchScheduleDetail=$(this);
            var date = moment($matchScheduleDetail.data("start"),"YYYY-MM-DD HH:mm").toDate();

            var datePicker = $matchScheduleDetail.find('.match_start_date_picker').empty().get(0),
            datePickerInp = $matchScheduleDetail.find('.match_start_date_inp').get(0),
            timePicker = $matchScheduleDetail.find('.time_picker_box').empty().get(0);

            new tui.DatePicker(datePicker, {
                date: date,
                input: {
                    element: datePickerInp,
                    format: 'yyyy년 MM월 dd일'
                },
                language: 'ko'
            });
            // 얘를 저장할 배열이 필요하다.
            timepickers.push(
            		new tui.TimePicker(timePicker, {
	                initialHour: date.getHours(),
	                initialMinute: date.getMinutes(),
	                inputType: 'spinbox'
	            })
            );
            
            $matchScheduleDetail.data("time-piker-idx", i++);
            $matchScheduleDetail.find(".tui-calendar-btn-next-month,.tui-calendar-btn-prev-month").on("click", function(e){
				e.stopPropagation();
			});
        });
    }
