<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="resources/img/icon72x72.png" type="image/png" />
<title>Main page</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="resources/css/style.css">
<link type="text/css" rel="stylesheet" href="resources/css/button.css">
<link type="text/css" rel="stylesheet" href="resources/css/page/main.css">
	<!-- 스와이퍼 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
</head>

<body>
		<jsp:include page="menu.jsp">
             <jsp:param name="param1" value="1"/>
        </jsp:include>

	<section class="slider">
		<div class="inner">
			<video autoplay controls loop muted width="960" height="310">
  				<source src="resources/spider.mov" type="video/mp4">
  			</video>
		</div>
	</section>
	<div class="main">
		<h1>무비 차트</h1>
		<section class="ba">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<c:forEach var="list" items="${LIST}" varStatus="status">		<!-- 리스트 반복 출력 -->
					<div class="swiper-slide" >
						<div class="${list.movie_code}">
							<img class="thumb_medium" id=pic1 src="${list.movie_poster}" alt="" >
							<div class="postertext">
      							<span style=" font-style: italic ; 
											  font-weight: bold; 
											  font-size: 4em;
											  line-height: 1.0em; 
											  color: white;
											  font-family: 'Jeju Myeongjo', serif;">
									${status.count}
								</span>
   							</div>
   							<a href="movieChart?movie_code=${list.movie_code}"><button class="bttn-fill bttn-sm bttn-primary btn1" id="rbt${list.movie_code}">예매하기</button></a>
							<a href="movieOne?movie_code=${list.movie_code}"><button class="bttn-fill bttn-sm bttn-default btn2" id="mbt${list.movie_code}">상세보기</button></a>
   						</div>
						<script type="text/javascript">
							$(document).ready(function() {
								//영화포스터에 마우스올리면 예매, 상세보기 버튼 보이게
								$('.${list.movie_code}').mouseenter(function() {
									$('#rbt${list.movie_code}').show();
									$('#mbt${list.movie_code}').show();
								});
								//영화포스터에 마우스때면 예매, 상세보기 버튼 없어지게
								$('.${list.movie_code}').mouseleave(function() {
									$('#rbt${list.movie_code}').hide();
									$('#mbt${list.movie_code}').hide();
								}); 
							});
						</script>
						<div class="movie_name"><c:out value="${list.movie_name}" /></div>
					</div> 
				</c:forEach>
			</div>
		<div class="swiper-button-next"></div><!-- 다음버튼 -->
    	<div class="swiper-button-prev"></div><!--이전버튼-->
<script>
    //무비차트 슬라이드
    var swiper = new Swiper(".swiper-container", {
    	slidesPerView: 5,//보여지는 슬라이드 수
        spaceBetween: 0,// 슬라이드 간의 거리
        slidesPerGroup : 5,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",//다음버튼
            prevEl: ".swiper-button-prev",//이전버튼
        }
    });
</script>
	</div>
	</section>		
	</div>
	<section class="ba">
		<br>
	</section>
	<div class="ftop">
		Copyright &copy; 2022 - All rights reserved Its Cinema Company <br>
		Fully compatible for all major browsers.
	</div>
</body>
</html>