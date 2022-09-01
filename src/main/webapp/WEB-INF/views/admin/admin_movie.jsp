<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<style type="text/css">


</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="../resources/img/icon72x72.png" type="image/png" />
<title>관리자 페이지(영화)</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="codetomake.com">
<link type="text/css" rel="stylesheet" href="resources/css/style.css">
<link type="text/css" rel="stylesheet" href="resources/css/button.css">
<link type="text/css" rel="stylesheet" href="resources/css/manager.css">
<link rel="stylesheet"
	href="resources/css/font-awesome-4.7.0/css/font-awesome.min.css">
	
</head>

<jsp:include page="admin_menu.jsp">
	<jsp:param name="param1" value="1"/>
</jsp:include>

<body>
	<div class="main">
		<section class="section1" id="section1"> 
			<h1 class="title">영화목록</h1>
			<form id="rateUpdate" action="movieUpdateOK" method="post">
			<button type="button" class="bttn-fill bttn-sm bttn-primary insert_btn theater" id="update_btn">예매율<br>업데이트</button>
			</form>
			<section class="main_box">
				<table class="box_title">
					<tr class="tline">
						<td>제목</td>
						<td>개봉날짜</td>
						<td>등급</td>
						<td>예매율</td>
					</tr>
					<c:forEach var="movie" items="${MOVIELIST}">
					<tr class="box_text modal-open">
						<td>${movie.movie_name}</td>
						<td>${movie.movie_date.substring(0,4)}년${movie.movie_date.substring(4,6)}월${movie.movie_date.substring(6,8)}일</td>
						<td>${movie.movie_grade}세관람가</td>
						<td>${movie.movie_rate}</td>
					</tr>
					</c:forEach>
				</table>
			</section>
			<div class="page_box">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<c:if test="${PAGEDTO.prev}"> 
								<li class="page-item"><a class="page-link" href="movieList?curPage=${PAGEDTO.curPage-1}">Previous</a></li>
							</c:if>
							<c:forEach var="page" begin="${PAGEDTO.startNum}" end="${PAGEDTO.lastNum}">
								<li class="page-item" ><a class="page-link" href="movieList?curPage=${page}">${page}</a></li>
							</c:forEach>
							<c:if test="${PAGEDTO.next}"> 
								<li class="page-item"><a class="page-link" href="movieList?curPage=${PAGEDTO.curPage+1}">Next</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</section>
	
		<script>
		$(function(){
			$("input:radio[name='btn']:radio[value='movie']").prop('checked', true);
			
			$("#update_btn").click(function(){
				$("#rateUpdate").submit();
				alert("업데이트가 완료 되었습니다.");
			});
		/*	  $("#insert_btn").click(function(){
				  $.ajax({
					  type: "POST",
					  url: "m_insertChk",
					  data:"",
					  dataType: "JSON",
					  success : function(json) {
						  var result_text = json.RESULT;
						  var result = eval(result_text);
						  
						  if(result) {
						  	alert(json.MSG);
							location.href= json.PATH;
						  }
						  else {
							alert(json.MSG);
							return false;
						  }
					  },
					  error : function() {
						  alert("접속실패");
					  }
				  });
			  }); */
			});
		</script>

	</div>
	

        
<div class="ftop">
		Copyright &copy; 2022 - All rights reserved Its Cinema Company <br>
		Fully compatible for all major browsers.
	</div>	
</body>
</html>