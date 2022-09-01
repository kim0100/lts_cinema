<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<style type="text/css">

</style>
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
    <!-- 영화관 리스트 -->
	<section class="section1" id="section1"> 
		<h1 class="title">영화관 관리</h1>
		<button class="bttn-fill bttn-sm bttn-primary insert_btn" id=insert_btn>영화관 추가</button>
		
		<section class="main_box">
	
		<table class="box_title">
			<tr class="tline">
				<td>번호</td>
				<td>이름</td>
				<td>주소</td>
				<td>전화번호</td>
			</tr>
			<c:forEach var="cinema" items="${CINEMALIST}">
			<tr class="box_text modal-open" id="modal-open" >
				<td>${cinema.cinema_code}</td>
				<td>${cinema.cinema_name}</td>
				<td>${cinema.cinema_adres}</td>
				<td>${cinema.cinema_tel}</td>
				<td style="display:none">${cinema.cinema_image}</td>
			</tr>
			</c:forEach>
		</table>
		
		</section>
	
		<div class="page_box">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<c:if test="${PAGEDTO.prev}"> 
								<li class="page-item"><a class="page-link" href="adminPage?curPage=${PAGEDTO.curPage-1}">Previous</a></li>
							</c:if>
							<c:forEach var="page" begin="${PAGEDTO.startNum}" end="${PAGEDTO.lastNum}">
								<li class="page-item" ><a class="page-link" href="adminPage?curPage=${page}">${page}</a></li>
							</c:forEach>
							<c:if test="${PAGEDTO.next}"> 
								<li class="page-item"><a class="page-link" href="adminPage?curPage=${PAGEDTO.curPage+1}">Next</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
	
	</section>
	<!-- 영화관 수정 -->
	<form id = "updateOK" action = "cinemaUpdateOK" method = "post">
		<section class="section2" id="section2"> 
			<h1 class="title">영화관 수정</h1>
			
			<div class="main_box2">
				<table class="box_title2">
				<tr >
					<td>코드</td>
					<td>이름</td>
					<td>주소</td>
					<td>전화번호</td>
					<td>영화관사진</td>
				</tr>
				
				<tr>
					<td><input type="text" name="cinema_code"  id="u_code" class="Cnum" maxlength="2" readonly></td>
					<td><input type="text" name="cinema_name"  id="u_name" class="Cname" maxlength="15"></td>
					<td><input type="text" name="cinema_adres" id="u_adres" class="Cadd" maxlength="50"></td>
					<td><input type="text" name="cinema_tel"   id="u_tel" class="Ctel" maxlength="11"></td>
					<td><input type="text" name="cinema_image" id="u_post" class="Cmov" maxlength="50"></td>
				</tr>
				
				</table>
			<div class="button_box">
				<button type="button" class="bttn-fill bttn-sm bttn-primary btn1" id=update>수 정</button>
				<input type = "hidden" value="${PAGEDTO.curPage}">
				<a href="adminPage?curPage=${PAGEDTO.curPage}"><button type="button" class="bttn-fill bttn-sm bttn-default btn2" id=btn2>취 소</button></a>
			</div>
		</div>
		</section>
	</form>
	<!-- 영화관 추가 -->
	<form id = "insertOK" action = "cinemaInsertOK" method = "post">
		<section class="section3" id="section3"> 
			<h1 class="title">영화관 추가</h1>
			
			<div class="main_box2">
				<table class="box_title2">
					<tr >
						<td>코드</td>
						<td>이름</td>
						<td>주소</td>
						<td>전화번호</td>
						<td>영화관사진</td>
					</tr>
		
					<tr>
						<td><input type="text" name="cinema_code" id="i_code" class="Cnum" maxlength="2"></td>
						<td><input type="text" name="cinema_name" id="i_name" class="Cname" maxlength="15"></td>
						<td><input type="text" name="cinema_adres" id="i_adres" class="Cadd" maxlength="50"></td>
						<td><input type="text" name="cinema_tel" id="i_tel" class="Ctel" maxlength="11"></td>
						<td><input type="text" name="cinema_image" id="i_post"class="Cmov" maxlength="50"></td>
					</tr>
		
				</table>
				<div class="button_box">
					<button type="button" class="bttn-fill bttn-sm bttn-primary btn1" id="insert">추 가</button>
					<a href="adminPage?curPage=${PAGEDTO.curPage}"><button type="button" class="bttn-fill bttn-sm bttn-default btn2" id=btn2>취 소</button></a>
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
            				<h1 id=cinemaname></h1>
          				</div>
        			</div>
      			</div>
	      		<div class="popup-foot"> 
			        <span class="pop-btn confirm" id="confirm">수정</span>
			        <form id = "deleteOK" action = "cinemaDeleteOK" method="post">
			        	<span class="pop-btn confirm" id="delete" >삭제</span>
			        	<input type="hidden" id="d_code" name="cinema_code">
			        	<input type="hidden" name="curPage" value="${PAGEDTO.curPage}">
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
			$("input:radio[name='btn']:radio[value='cinema']").prop('checked', true); 
			  $("#confirm").click(function(){
			      modalClose(); //모달 닫기 함수 호출
			      $('#section2').show();
				  $('#section1').hide();
			      
			      //컨펌 이벤트 처리
			  });
			  
			  $("#delete").click(function(){
				var code = $("#d_code").val();

				if (confirm("삭제 하시겠습니까?") == true){    //확인
			  		$.ajax({
						  type: "POST",
						  url: "c_deleteChk",
						  data: {"cinema_code":code},
						  dataType: "JSON",
						  success : function(json) {
							  var result_text = json.RESULT;
							  var result = eval(result_text);
							  
							  if(result) {
							  	$("#deleteOK").submit();
							  	alert("삭제가 완료되었습니다.");
							  }
							  else {
								alert("삭제 할 수 없는 영화관 입니다.\n확인 후 다시 시도 해주십시오.");
								return false;
							  }
						  }
					  });
				}else{   //취소
					return false;
				}
			    modalClose(); //모달 닫기 함수 호출
			  });
			  
			  $("#update").click(function(){
				  if (confirm("변경사항을 저장 하시겠습니까?") == true){    //확인
						$("#updateOK").submit();
						alert("변경이 완료 되었습니다.")
					}else{   //취소
						return false;
					}
			  });
			  
			  $(".modal-open").click(function(){        
			      $("#popup").css('display','flex').hide().fadeIn();
			      var data1 = $(this).find("td:eq(0)",this).text();
			      var data2 = $(this).find("td:eq(1)",this).text();
			      var data3 = $(this).find("td:eq(2)",this).text();
			      var data4 = $(this).find("td:eq(3)",this).text();
			      var data5 = $(this).find("td:eq(4)",this).text();
			      
			      // 수정
			      $("#u_code").val(data1);
			      $("#u_name").val(data2);
			      $("#u_adres").val(data3);
			      $("#u_tel").val(data4);
			      $("#u_post").val(data5);
			      
			      //삭제
			      $("#d_code").val(data1);
			      
			      // 팝업타이틀
			      document.getElementById("cinemaname").innerHTML = data2;
			  });
			  
			  $("#close").click(function(){
			      modalClose(); //모달 닫기 함수 호출
			  });
			  
			  $("#insert_btn").click(function(){
			      $('#section3').show();
				  $('#section1').hide();
			  });
			  function modalClose(){
			      $("#popup").fadeOut(); //페이드아웃 효과
			  }
 			  
			  $("#insert").click(function(){
				  var code = $("#i_code").val();
				  var name = $("#i_name").val();
				  var adrs = $("#i_adres").val();
				  var tel  = $("#i_tel").val();
				   
				  if(!code) {
					  alert("코드를 입력하세요");
					  $("#i_code").focus();
					  return false;
				  }
				  else if(!name) {
					  alert("이름를 입력하세요");
					  $("#i_name").focus();
					  return false;
				  }
				  else if(!adrs) {
					  alert("주소를 입력하세요");
					  $("#i_adres").focus();
					  return false;
				  }
				  else if(!tel) {
					  alert("전화번호를 입력하세요");
					  $("#i_tel").focus();
					  return false;
				  }
				  
				  $.ajax({
					  type: "POST",
					  url: "c_insertChk",
					  data: {"cinema_code":code},
					  dataType: "JSON",
					  success : function(json) {
						  var result_text = json.RESULT;
						  var result = eval(result_text);
						  
						  if(result) {
						  	$("#insertOK").submit();
						  	alert("영화관 등록이 완료되었습니다.");
						  }
						  else {
							alert("이미 등록된 코드입니다.");
							return false;
						  }
					  }
				  });
			  });
			});
	    
	</script>
</div>
        
<div class="ftop">
	Copyright &copy; 2022 - All rights reserved Its Cinema Company <br>
	Fully compatible for all major browsers.
</div>	
</body>
</html>