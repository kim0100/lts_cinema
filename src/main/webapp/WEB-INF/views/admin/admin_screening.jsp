<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<style type="text/css">
.insert_btn2{
	position: absolute;
	top: 40px;
	left: 200px;
	float: left; 	 	
}
.delete_btn{
	position: relative;
	top: 40px;
	left: -80px;
	float: right; 	 	
}
.Tsel2{
	position: relative;
	top: 60px;
	left: 420px;
	float: left;
	width:140px;                      
  	height:40px; 
}
.btn1{
	position: absolute;
	top:-30px;
	left:140px;
	width:140px;                      
  	height:40px; 
}
.btn2{
	position: absolute;
	width:140px;                      
  	height:40px; 
}
.btn3{
	position: absolute;
	width:140px;                      
  	height:40px; 
}
.btn4{
	position: relative;
	top:-0px;
	left:0px;
	width:140px;                      
  	height:40px; 
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="resources/img/icon72x72.png" type="image/png" />
<title>관리자 페이지(일정)</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="resources/css/style.css">
<link type="text/css" rel="stylesheet" href="resources/css/button.css">
<link type="text/css" rel="stylesheet" href="resources/css/manager.css">


<jsp:include page="admin_menu.jsp">
	<jsp:param name="param1" value="1"/>
</jsp:include>

<body>
	<div class="main">
		<section class="section1" id="section1"> 
			<h1 class="title">상영 일정</h1>
			<form action="screeningList" method="post">
	            <span class="Csel">
	            	<select id="cinemaList" name="cinema_code" size = "1">
	            		<option>영화관 선택</option>
	            	<c:forEach var="cinema" items="${CINEMALIST}">
						<option <c:if test="${CINEMACODE eq cinema.cinema_code}">selected</c:if> value="${cinema.cinema_code}">${cinema.cinema_name}</option>
					</c:forEach>
					</select>
	            </span>
            
	            <span class="Tsel2">
		            <select id="theaterList"name="theater_name" size = "1">
						<option>상영관 선택</option>
					<c:forEach var="theater" items="${THEATERLIST}">
						<option id="theaterOp" <c:if test="${THEATERNAME eq theater.theater_name}">selected</c:if> value="${theater.theater_name}">${theater.theater_name}관</option>
					</c:forEach>
					</select>
					<button type="submit" class="bttn-fill bttn-sm bttn-primary btn1">검 색</button>
	            </span>
            </form>
            <form id="deleteOK" action="screeningDeleteOK" method="get">
				<section class="main_box">
					<table class="box_title">
						<tr class="tline">
							<td>영화이름</td>
							<td>상영날짜</td>
							<td>상영시작시간</td>
							<td>상영종료시간</td>
							<td>선택</td>
						</tr>
							<c:forEach var="screening" items="${SCREENINGLIST}">
							<tr class="box_text modal-open" id="modal-open" >
								<td style="display:none">${screening.cinema_code}</td>
								<td style="display:none">${screening.theater_name}</td>
								<td>${screening.movie_name}</td>
								<td>${screening.scr_date.substring(0,4)}년${screening.scr_date.substring(4,6)}월${screening.scr_date.substring(6,8)}일</td>
								<td>${screening.scr_start.substring(0,2)}시${screening.scr_start.substring(2,4)}분</td>
								<td>${screening.scr_end.substring(0,2)}시${screening.scr_end.substring(2,4)}분</td>
								<td onclick="event.cancelBubble=true"><input type="checkbox" name="scrArr" value="${screening.cinema_code}-${screening.theater_name}-${screening.movie_code}-${screening.scr_date}-${screening.scr_start}-${PAGEDTO.curPage}-${screening.movie_name}-${screening.scr_end}"></td>
							</tr>
						</c:forEach>
					</table>
				</section>
			</form>
			<button class="bttn-fill bttn-sm bttn-primary insert_btn2" id=insert_btn>상영목록 추가</button>
			<div class="page_box">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<c:if test="${not empty PAGEDTO}">
								<c:if test="${PAGEDTO.prev}"> 
									<li class="page-item"><a class="page-link" href="screeningList?curPage=${PAGEDTO.curPage-1}&cinema_code=${CINEMACODE}&theater_name=${THEATERNAME}">Previous</a></li>
								</c:if>
								<c:if test="${not empty SCREENINGLIST}">
									<c:forEach var="page" begin="${PAGEDTO.startNum}" end="${PAGEDTO.lastNum}">
										<li class="page-item" ><a class="page-link" href="screeningList?curPage=${page}&cinema_code=${CINEMACODE}&theater_name=${THEATERNAME}">${page}</a></li>
									</c:forEach>
								</c:if>
								<c:if test="${PAGEDTO.next}"> 
									<li class="page-item"><a class="page-link" href="screeningList?curPage=${PAGEDTO.curPage+1}&cinema_code=${CINEMACODE}&theater_name=${THEATERNAME}">Next</a></li>
								</c:if>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			
			
			
			<form id="deleteok" action="screeningDeleteOK" method="post">
				<button type="button" class="bttn-fill bttn-sm bttn-default delete_btn" id=delete_btn>선택항목 삭제</button>
			</form>
		</section>
		
		<form id="insertOK" action="screeningInsertOK" method="post">
			<section class="section3" id="section3"> 
				<h1 class="title">상영일정 추가</h1>
				<div class="main_box2">
					<table class="box_title2">
						<tr >
							<td>제목</td>
							<td>상영날짜</td>
							<td>시작시간</td>
							<td>종료시간</td>
						</tr>
						<tr>
							<td>
							<select id="movieList" name="movie_code" size = "1">
		            			<option>영화선택</option>
		            			<c:forEach var="movie" items="${MOVIELIST}">
									<option value="${movie.movie_code}">${movie.movie_name}</option>
								</c:forEach>
							</select>
							</td>
							<td><input type="date" id="i_scr_date" name="scr_date"></td>
							<td><input type="time" id="i_scr_start" name="scr_start"></td>
							<td><input type="time" id="i_scr_end" name="scr_end"></td>
						</tr>
					</table>
					<input type="hidden" id="i_code" name="cinema_code">
					<input type="hidden" id="i_name" name="theater_name">
					
					<div class="button_box">
						<button type="button" class="bttn-fill bttn-sm bttn-primary btn2" id=insert>추 가</button>
						<a href="screeningList?curPage=${PAGEDTO.curPage}&cinema_code=${CINEMACODE}&theater_name=${THEATERNAME}"><button type="button" class="bttn-fill bttn-sm bttn-default btn3" id=btn2>취 소</button></a>
					</div>
				</div>
			</section>
		</form>
</div>

<form id="location" action="screeningList" method="post">
	<input type=hidden name="cinema_code" value="${CINEMACODE}">
	<input type=hidden name="theater_name" value="${THEATERNAME}">
	<input type=hidden name="curPage" value="${PAGEDTO.curPage}">
</form>
<script>
	
	$(function(){
		$('#section1').show();
		$('#section2').hide();
		$('#section3').hide();
		$("input:radio[name='btn']:radio[value='screening']").prop('checked', true); 
		
		$("#cinemaList").change(function(){
			var cinemaCode = $("#cinemaList").val();
				
			$("option").remove("#theaterOp");
				
			$.ajax({
				type: "POST",
				url: "s_theaterChk",
				data: {"cinema_code":cinemaCode},
				dataType: "JSON",
				success: function(json) {
					$(json).each(function(i){
						$("#theaterList").append("<option id=theaterOp value="+json[i].theater_name+">"+json[i].theater_name+"관</option>");
					});
				}
			});
		});
		
		var result = ${RESULT};
		
		$("#insert_btn").click(function(){
			
			if(result) {
				var c_code = ${CINEMACODE};
				var t_name = ${THEATERNAME};
				$("#i_code").val(c_code);
				$("#i_name").val(t_name);
				
				$('#section3').show();
				$('#section1').hide();
			  }
			  else {
				alert("극장,상영관 을 검색하세요");
				return false;
			  }
		});
		
		$("#cinemaList").change(function(){
			  result = false;
		});
		
		$("#theaterList").change(function(){
			  result = false;
		});
			
		$("#insert").click(function(){
			var code = $("#i_code").val();
			var name = $("#i_name").val();
			var movie = $("#movieList").val();
			var date = $("#i_scr_date").val().replace(/\-/g,"");
			var start = $("#i_scr_start").val().replace(':',"");
			var end = $("#i_scr_end").val().replace(':',"");
					  
			if(movie == "영화선택") {
				alert("영화를 선택하세요");
				return false;
			}
			else if(!date) {
				alert("상영날짜를 입력하세요");
				return false;
			}
			else if(!start) {
				alert("상영시작시간을 입력하세요");
				return false;
			}
			else if(!end) {
				alert("상영종료시간을 입력하세요");
				return false;
			}
					  
			$.ajax({
				type: "POST",
				url: "s_insertChk",
				data: {"cinema_code":code, 
					   "theater_name":name,
					   "movie_code":movie,
					   "scr_date":date,
					   "scr_start":start},
				dataType: "JSON",
				success: function(json) {
						  
					var result_text = json.RESULT;
					var result = eval(result_text);
							  
					if(result) {
						$("#insertOK").submit();
						alert("상영일정 등록이 완료되었습니다.");
					}
					else {
						alert("이미 등록된 상영일정입니다.");
						return false;
					}
				}
			});
		});
		
/*		$("#delete_btn").click(function(){
			if (confirm("삭제 하시겠습니까?") == true) {
				alert("삭제가 완료 되었습니다.")
				$("#deleteOK").submit();
			}
			else {
				return false;
			}
		}); */
		$("#delete_btn").click(function(){
			var scrArr = new Array();
			$("input[name='scrArr']:checked").each(function(){
				var value = $(this).val();
				scrArr.push(value);
			});
		
			if(confirm("선택한 상영일정을 삭제 하시겠습니까?") == true) {
				$.ajax({
					  type: "POST",
					  url: "s_deleteChk",
					  data: {"scrArr": scrArr},
					  dataType: "JSON",
					  success : function(json) {
						  var result_text = json.RESULT;
						  var result = eval(result_text);
						   
						  if(result) {
						  	alert(json.COUNT+"건의 상영일정을 삭제하였습니다.");
						  }
						  else {
							var msg = "";
							var count = json.COUNT;
							var cinema_code = json.CINEMACODE;
							var theater_name = json.THEATERNAME;
							var page = json.PAGE;
						  	$(json.THEATERLIST).each(function(i){
								msg += json.THEATERLIST[i].movie_name+"  "+json.THEATERLIST[i].scr_date+"  "+json.THEATERLIST[i].scr_start+"  "+json.THEATERLIST[i].scr_end+"\n";
							});
						  	alert(count+"건의 상영일정을 삭제하였습니다.\n\n<삭제실패 상영일정>\n\n"+msg);
						  }
						  $("#location").submit();
					  },
					  error: function() {
						  alert("처리중 오류가 발생하였습니다.");
					  }
				  });
			}
			else {
				return false;
			}
		}); 
	});
</script>
        
<div class="ftop">
	Copyright &copy; 2022 - All rights reserved Its Cinema Company <br>
	Fully compatible for all major browsers.
</div>	
</body>
</html>