<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="resources/img/icon72x72.png" type="image/png" />
<title>관리자 페이지</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="codetomake.com">
<link type="text/css" rel="stylesheet" href="resources/css/style.css">
<link type="text/css" rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet"
	href="resources/css/font-awesome-4.7.0/css/font-awesome.min.css">
	
</head>
<body>

	<header class="header">
		<div class="head">
			<a href="main" class="logo" title="메인페이지"></a> <br> 
			<br>
		<section class="chart">
				<div class="chart_text"><br><br>
				<h1>${cust.cust_name}님</h1><br>			
				</div>
		</section>
			<div class="line"></div>
	
			<div class="line"></div>
		<section class="menu">
			 
		<label class="butt_obj" >
    		<input type="radio" id="cinema" name="btn" value="cinema" onclick = "location.href='adminPage'">
    		<span>영화관 관리</span>
		</label>
		<label class="butt_obj">
    		<input type="radio" id="btn2" name="btn" value="theater" onclick = "location.href='theaterList'">
    		<span>상영관 관리</span>
		</label>
		<label class="butt_obj">
    		<input type="radio" id="btn3" name="btn" value="seat" onclick = "location.href='seatList'">
    		<span>좌석 관리</span>
		</label>
		<label class="butt_obj">
    		<input type="radio" id="btn3" name="btn" value="screening" onclick = "location.href='screeningList'">
    		<span>상영 일정</span>
		</label>
		<label class="butt_obj">
    		<input type="radio" id="btn3" name="btn" value="movie" onclick = "location.href='movieList'">
    		<span>영화 목록</span>
		</label>
		<label class="butt_obj">
    		<input type="radio" id="btn3" name="btn" value="member" onclick = "location.href='cstAdmin'">
    		<span>회원 관리</span>
		</label>
		
		</section>
		</div>
	</header><br>	
		
</body>
</html>