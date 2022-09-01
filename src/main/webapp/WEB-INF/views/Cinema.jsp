<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="resources/img/icon72x72.png" type="image/png" />
<title>영화관 목록</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="resources/css/ico.css">
<link type="text/css" rel="stylesheet" href="resources/css/style.css">
<link type="text/css" rel="stylesheet" href="resources/css/button.css">
<link type="text/css" rel="stylesheet" href="resources/css/page/Cinema.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
</head>
<body>
	<jsp:include page="menu.jsp">
         <jsp:param name="param1" value="1"/>
    </jsp:include>

	<div class="main">
		<section class="menu_box">
		<div class="line"></div>
		
		<nav class="theater_list">
			<ul>
				<c:forEach var="list" items="${Cinema.CINEMALIST}">
					<li <c:if test="${Cinema.cinema_code==list.cinema_code}">id="slt"</c:if>>
					<a href="cinemaPage?cinema_code=${list.cinema_code}">${list.cinema_name}</a>&nbsp;   |</li>
				</c:forEach>
			</ul>
		</nav>
		</section>
			<h1 class="title"><c:out value="${Cinema.CINEMAINFO.cinema_name}" /></h1>
		<img class="Theater" id=pic src="${Cinema.CINEMAINFO.cinema_image}" alt="">
		
		<div class="Theater_text">
		<h1>${Cinema.CINEMAINFO.cinema_adres}<br>
		<br>
		${Cinema.CINEMAINFO.cinema_tel}<br>
		${Cinema.CINEMAINFO.theater_count}관/${Cinema.CINEMAINFO.seat_count}석</h1><br>
		</div>
		<div class="button-container">
			<div class="swiper-container">
			<ul class="swiper-wrapper">
				<c:forEach var="date" items="${Cinema.DATELIST}">
					<li class="swiper-slide" <c:if test="${Cinema.scr_date==date}">id="slttime"</c:if>><a id="time" href="cinemaPage?cinema_code=${cinema_code}&scr_date=${date}#time">${date}</a></li>
				</c:forEach>
			</ul>
			

			</div><br>
			<div class="swiper-button-next"></div><!-- 다음버튼 -->
    		<div class="swiper-button-prev"></div><!--이전버튼-->	
		</div>

<script>
    //무비차트 슬라이드
    let $swiperPrev = document.querySelector('.swiper-button-prev');
    let $swiperNext = document.querySelector('.swiper-button-next');
    var swiper = new Swiper(".swiper-container", {
    	slidesPerView: 8,// 한슬라이드에 보여지는 수
        spaceBetween: 0,// 슬라이드 간의 거리
        slidesPerGroup : 8,//슬라이드 그룹화
        loopFillGroupWithBlank : true,//8개를 한슬라이드에 보여주는데 갯수가 부족할시 빈칸으로 출력
        loop:true,//무한반복
        allowTouchMove: false,
        initialSlide: ${Cinema.SLIDE} ,//시작슬라이드 위치
        navigation: {
            nextEl: ".swiper-button-next",//다음버튼
            prevEl: ".swiper-button-prev",//이전버튼
        },
        on: {
            activeIndexChange : function() {
              if (this.realIndex == 0) {
            	  $swiperPrev.classList.add('swiper-button-disabled');
              } else {
            	  $swiperPrev.classList.remove('swiper-button-disabled');
              }
              if (this.realIndex == ${Cinema.BUTTON}) {
            	  $swiperNext.classList.add('swiper-button-disabled');
              } else {
                  $swiperNext.classList.remove('swiper-button-disabled');
              } 
            }
          }
    });
</script>

	<ul>
		<c:forEach var="list" items="${LIST}">
			<li class="movie"><div class="movie_title"><c:if test="${list.MOVIE.movie_grade eq 12 }"><span id="ico_12" >12</span></c:if>
													   <c:if test="${list.MOVIE.movie_grade eq 15 }"><span id="ico_15" >15</span></c:if>
													   <c:if test="${list.MOVIE.movie_grade eq 19 }"><span id="ico_18" >청불</span></c:if>
													   <c:if test="${list.MOVIE.movie_grade eq 0 }"><span id="ico_all" >전체</span></c:if>
			${list.MOVIE.movie_name}
			<span class="movie_element">${list.MOVIE.movie_genre}/${list.MOVIE.movie_time}분/
			${list.MOVIE.movie_date.substring(0,4)}.${list.MOVIE.movie_date.substring(4,6)}.${list.MOVIE.movie_date.substring(6,8)} 개봉</span></div>
				<ul>
					<c:forEach var="list1" items="${list.TTLIST}">
					<li class="movie_room">&#9654;${list1.THEATER.theater_name}관 | 총${list1.THEATER.seatcount}석
						<ul>
							<c:forEach var="list2" items="${list1.TIME}">
								<li style='cursor:pointer;' class="movie_time">
								<a href="cinemaBook?movie_code=${list.MOVIE.movie_code}&cinema_code=${Cinema.cinema_code}&theater_name=${list1.THEATER.theater_name}&scr_date=${Cinema.scr_date}&scr_start=${list2.scr_start}">${list2.scr_start}
								<br><span class="movie_time_text">${list2.empty_seat}석</span></a></li>				
							</c:forEach>
						</ul>
					</li>
					</c:forEach>
				</ul>
			</li>
		</c:forEach>
	</ul>
</div>
	
	<div class="ftop">
		Copyright &copy; 2022 - All rights reserved Its Cinema Company <br>
		Fully compatible for all major browsers.
	</div>		
</body>
</html>