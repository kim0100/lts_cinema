<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="resources/img/icon72x72.png" type="image/png" />
<title>영화 상세</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="resources/css/style.css">
<link type="text/css" rel="stylesheet" href="resources/css/button.css">
<link type="text/css" rel="stylesheet" href="resources/css/page/story.css">
</head>
<body>
		<jsp:include page="menu.jsp">
             <jsp:param name="param1" value="1"/>
        </jsp:include>

	<div class="main">
		
			<h1 class="title">영화 상세</h1>
			<div class="line"></div>
			<section class="chart">
			<img class="thumb_medium" id=pic
				src="${movie.movie_poster}" alt="">
				<div class="text">
				<br><h3><c:out value="${movie.movie_name}" /></h3>
				감독 : ${movie.movie_gmgr} / 배우 : ${movie.movie_act}<br>
				장르 : ${movie.movie_genre} / 기본 : ${movie.movie_grade}세 이상, ${movie.movie_time}분<br>
				개봉 : ${movie.movie_date.substring(0,4)}년
				${movie.movie_date.substring(4,6)}월
				${movie.movie_date.substring(6,8)}일<br>
				<a href="movieBook?movie_code=${movie.movie_code}"><button class="bttn-fill bttn-sm bttn-danger btn1" id=btn1>예매하기</button></a>
				</div>
		</section>
		<section >
			<span class="type" style="--n:4000">${movie.movie_intrcn}</span>
			<br>
		</section>
		<script>
		
		
		
		
		</script>
	</div>
	<div class="ftop">
		Copyright &copy; 2022 - All rights reserved Its Cinema Company <br>
		Fully compatible for all major browsers.
	</div>
</body>
</html>