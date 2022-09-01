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
<link type="text/css" rel="stylesheet" href="resources/css/style.css">
<link type="text/css" rel="stylesheet" href="resources/css/button.css">
<link type="text/css" rel="stylesheet" href="resources/css/manager.css">
</head>

<jsp:include page="admin_menu.jsp">
	<jsp:param name="param1" value="1"/>
</jsp:include>

<body>

<div class="main">

	<!-- 극장선택 -->
	<section class="section1" id="section1"> 
		<h1 class="title">상영관 관리</h1>
		<form action="theaterList" method="post">
	        <span class="Csel">
	        	<select id="cinemaList" name="cinema_code" size = "1">
					<option>영화관 선택</option>
					<c:forEach var="cinema" items="${CINEMALIST}">
						<option <c:if test="${CINEMACODE eq cinema.cinema_code}">selected</c:if> value="${cinema.cinema_code}">${cinema.cinema_name}</option>
					</c:forEach>
				</select>
				<button type="submit" id="search" class="bttn-fill bttn-sm bttn-primary search">검 색</button>
	        </span>
        </form>
		<button class="bttn-fill bttn-sm bttn-primary insert_btn theater" id=insert_btn>상영관 추가</button>
		
		<!-- 상영관 리스트 -->
		<section class="main_box">
			<table class="box_title">
				<tr class="tline">
					<td>상영관이름</td>
					<td>x행</td>
					<td>y열</td>
				</tr>
				
				<c:forEach var="theater" items="${THEATERLIST}">
					<tr class="box_text modal-open" id="modal-open" >
						<td style="display:none">${theater.cinema_code}</td>
						<td>${theater.theater_name}관</td>
						<td>${theater.seat_x}</td>
						<td>${theater.seat_y}</td>
					</tr>
				</c:forEach>
			</table>
		</section>
	</section>

	<!-- 상영관 수정 -->
	<form id="updateOK" action="theaterUpdateOk" method="post">
		<section class="section2" id="section2"> 
			<h1 class="title">상영관 수정</h1>
			<div class="main_box2">
				<table class="box_title2">
				<tr>
					<td>상영관이름</td>
					<td>x행</td>
					<td>y열</td>
				</tr>
				<tr>
					<td><input type="text" id="u_name" name="theater_name" class="Ctel" maxlength="40"></td>
					<td><input type="text" id="u_x" name="seat_x" class="xy" maxlength="2"></td>
					<td><input type="text" id="u_y" name="seat_y" class="xy" maxlength="2"></td>
				</tr>
				</table>
				<input type="hidden" name="cinema_code" id="u_code">
				<div class="button_box">
					<button type="button" class="bttn-fill bttn-sm bttn-primary btn1" id=update>수 정</button>
					<a href="theaterList?cinema_code=${CINEMACODE}"><button type="button" class="bttn-fill bttn-sm bttn-default btn2" id=btn2>취 소</button></a>
				</div>
			</div>
		</section>
	</form>
	
	<!-- 상영관 추가 -->
	<form id="insertOK" action="theaterInsertOK" method="get">
		<section class="section3" id="section3"> 
			<h1 class="title">상영관 추가</h1>
			<div class="main_box2">
				<table class="box_title2">
					<tr >
						<td>상영관이름</td>
						<td>좌석행</td>
						<td>좌석열</td>
					</tr>
					<tr>
						<td><input type="text" id="i_name"name="theater_name" class="Ctel" maxlength="40"></td>
						<td><input type="text" id="i_x"name="seat_x" class="xy" maxlength="2"></td>
						<td><input type="text" id="i_y"name="seat_y" class="xy" maxlength="2"></td>
					</tr>
				</table>
				<input type="hidden" name="cinema_code" id="i_code" value="${CINEMACODE}">
				<div class="button_box">
					<button type="button" class="bttn-fill bttn-sm bttn-primary btn1" id="insert">추 가</button>
					<a href="theaterList?cinema_code=${CINEMACODE}"><button type="button" class="bttn-fill bttn-sm bttn-default btn2" id=btn2>취 소</button></a>
				</div>
			</div>
		</section>
	</form>

	<div class="container"> 
  <div class="popup-wrap" id="popup"> 
    <div class="popup">	
      <div class="popup-head">	
          <span class="head-title">SYSTEM</span>
      </div>
      <div class="popup-body">	
        <div class="body-content">
          <div class="body-titlebox">
            <h1 id="theaterName"></h1>
          </div>
          
        </div>
      </div>
      <div class="popup-foot"> 
        <span class="pop-btn confirm" id="confirm">수정</span>
        <form id = "deleteOK" action = "theaterDeleteOK" method="post">
        	<span class="pop-btn confirm" id="delete">삭제</span>
        	<input type="hidden" id="d_code" name="cinema_code">
			<input type="hidden" id="d_name" name="theater_name">
        </form>
        <span class="pop-btn close" id="close">취소</span>
      </div>
    </div>
   </div>
</div>
<script>
		$(function(){
			
			$('#section1').show();
			$('#section2').hide();
			$('#section3').hide();
			  
			$("input:radio[name='btn']:radio[value='theater']").prop('checked', true); 
			  $("#confirm").click(function(){
			      modalClose(); //모달 닫기 함수 호출
			      $('#section2').show();
				  $('#section1').hide();
			      
			      //컨펌 이벤트 처리
			  });
			  
			  $(".modal-open").click(function(){        
			      $("#popup").css('display','flex').hide().fadeIn();
			      var cinemaName = $("#cinemaList option:selected").text();
			      var data1 = $(this).find("td:eq(0)",this).text();
			      var data2 = $(this).find("td:eq(1)",this).text().slice(0,-1);
			      var data3 = $(this).find("td:eq(2)",this).text();
			      var data4 = $(this).find("td:eq(3)",this).text();
			      
			      $("#u_code").val(data1);
			      $("#u_name").val(data2);
			      $("#u_x").val(data3);
			      $("#u_y").val(data4);
			      
			      $("#d_code").val(data1);
			      $("#d_name").val(data2);
			      
			      document.getElementById("theaterName").innerHTML=cinemaName+" "+data2+"관";
			  });
			  
			  $("#update").click(function(){
				  if (confirm("변경사항을 저장 하시겠습니까?") == true){    //확인
						$("#updateOK").submit();
						alert("변경이 완료 되었습니다.")
					}else{   //취소
						return false;
					}
			  })
			  
			  $("#delete").click(function(){
				  var name = $("#d_name").val();
				  
				  if (confirm("삭제 하시겠습니까?") == true){    //확인
				  		$.ajax({
							  type: "POST",
							  url: "t_deleteChk",
							  data: {"theater_name":name},
							  dataType: "JSON",
							  success : function(json) {
								  var result_text = json.RESULT;
								  var result = eval(result_text);
								  
								  if(result) {
								  	$("#deleteOK").submit();
								  	alert("삭제가 완료되었습니다.");
								  }
								  else {
									alert("삭제 할 수 없는 상영관 입니다.\n확인 후 다시 시도 해주십시오.");
									return false;
								  }
							  }
						  });
					}else{   //취소
						return false;
					}
			      modalClose(); //모달 닫기 함수 호출
			      
			      //컨펌 이벤트 처리
			  });
			  
			  $("#close").click(function(){
			      modalClose(); //모달 닫기 함수 호출
			  });
			  
			  var result = ${RESULT};
				
			  $("#insert_btn").click(function(){
				  
				  if(result) {
					  $('#section3').show();
					  $('#section1').hide();
				  }
				  else {
					  alert("극장을 검색하세요");
					  return false;
				  }
				  
			  });
			  
			  $("#cinemaList").change(function(){
				  result = false;
			  });
			  
			  $("#insert").click(function(){
				  var code = $("#i_code").val();
				  var name = $("#i_name").val();
				  var x = $("#i_x").val();
				  var y = $("#i_y").val();
				  
				  if(!name) {
					  alert("상영관이름을 입력하세요");
					  $("#i_name").focus();
					  return false;
				  }
				  else if(!x) {
					  alert("행을 입력하세요");
					  $("#i_x").focus();
					  return false;
				  }
				  else if(!y) {
					  alert("열을 입력하세요");
					  $("#i_y").focus();
					  return false;
				  }
				  
				  $.ajax({
					  type: "POST",
					  url: "t_insertChk",
					  data: {"cinema_code":code, 
						  	  "theater_name":name},
					  dataType: "JSON",
					  success: function(json) {
					  
						  var result_text = json.RESULT;
						  var result = eval(result_text);
						  
						  if(result) {
						  	$("#insertOK").submit();
						  	alert("상영관 등록이 완료되었습니다.");
						  }
						  else {
							alert("이미 등록된 코드입니다.");
							return false;
						  }
					  }
				  });
			  });
			  
			  function modalClose(){
			      $("#popup").fadeOut(); //페이드아웃 효과
			  }
			  
			});
	    
		</script>

	</div>
	

        
<div class="ftop">
		Copyright &copy; 2022 - All rights reserved Its Cinema Company <br>
		Fully compatible for all major browsers.
	</div>	
</body>
</html>