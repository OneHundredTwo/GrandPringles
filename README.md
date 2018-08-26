# Grandpringles
![그랑 프링글스](https://github.com/OneHundredTwo/GrandPringles/blob/master/img/logo.png "그랑프링글스") 

> 누구나 소규모 온라인게임대회를 개최할 수 있는, 게임대회 플랫폼 사이트 입니다

## 개발 환경
* **개발언어** : JAVA 8, HTML5, javascript, css, JSP(el, jstl)
* **WAS** : Apache Tomcat 8.5
* **Server Framework** : Spring 5, Spring web MVC 5(RESTful), Mybatis 3.4
* **IDE** : Eclipse 4.7 Oxygen, Web Storm 
* **OS** : windows 10
* **DBMS** : Oracle 11g SE

## 개발 파트
### 프론트 엔드
* 사용 라이브러리
![jquery,underscore,moment](https://github.com/OneHundredTwo/GrandPringles/blob/master/img/front_end_libs.png "프론트엔드 라이브러리")
* 대진표 컴포넌트 개발
	* 참가자 수에 따라 라운드 및 경기수 변화
![match table](https://github.com/OneHundredTwo/GrandPringles/blob/master/img/match_table.png "대진표")
	* 경기 스케쥴 설정 컴포넌트 개발(toast time picker api 사용)
![match scheduler](https://github.com/OneHundredTwo/GrandPringles/blob/master/img/match_scheduler.png "경기 일정변경")
	* 경기 상태를 반영하는 경기 컴포넌트 개발
![match status](https://github.com/OneHundredTwo/GrandPringles/blob/master/img/match_status.png "경기 상태")
	* 게임상태 조작 컴포넌트 개발(스코어링, 게임상태 변경, 경기 종료)
![game controller](https://github.com/OneHundredTwo/GrandPringles/blob/master/img/game_controller.png "게임 컨트롤러")
* 참가자 관리 UI 개발
![manage participations](https://github.com/OneHundredTwo/GrandPringles/blob/master/img/manage_participations.png "참가자 관리")
