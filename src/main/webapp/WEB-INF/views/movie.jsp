<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="resources/img/icon72x72.png" type="image/png" />
<title>무비 차트</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="resources/css/style.css">
<link type="text/css" rel="stylesheet" href="resources/css/button.css">
<link type="text/css" rel="stylesheet" href="resources/css/page/movie.css">
</head>
<body>
	<jsp:include page="menu.jsp">
         <jsp:param name="param1" value="1"/>
    </jsp:include>

	<div class="main">
	<h1 class="title">무비 차트</h1>
	<div class="line"></div>
	
		<c:forEach var="movie" items="${MovieList}"  varStatus="status">
			<div class="bt1">
				<c:if test="${status.count<4}">
					<div class="num">No.${status.count}</div>
				</c:if>
				<c:if test="${status.count>3}">
					<div class="num2">No.${status.count}</div>
				</c:if>
				<a href="movieOne?movie_code=${movie.movie_code}">
				<img class="thumb_medium" id=pic src="${movie.movie_poster}" alt="">
				</a><h2 class="text"><c:out value="${movie.movie_name}" /></h2>
				<h2 class="text">예매율 ${movie.movie_rate}%</h2>
				<a href="movieBook?movie_code=${movie.movie_code}"><button class="bttn-fill bttn-sm bttn-primary btn1" id=btn1>예매하기</button></a>
			</div> 
		</c:forEach>
	<br>
	</div>
<div class="ftop">
		Copyright &copy; 2022 - All rights reserved Its Cinema Company <br>
		Fully compatible for all major browsers.<br>
</div>		
</body>
</html>