<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<style type="text/css">
.titleA{
	position: relative;
	top:150px;
	left:120px;
 	width: 250px;
 	text-align: center;
 	font-size:36px;
 	font-weight:bold;
}
.ticketA{
	position: relative;	
	margin-bottom: 20px;
	top:150px;
	background: rgba(77, 88, 99, 0.3);
	left: 162px;
	width: 750px;
  	height: 176px;
  	box-shadow: 0px 0px 8px #777;
  	border-radius: 3px;
}
.thumb_medium.tc{
 	position: relative;
	height:160px;
	width:140px;
}
.text2A{
	position: relative;
	left: 170px;
	top: -170px;
	width: 560px;
	font-size:16px;
	font-weight:600;
 	text-align: left;
  	color: #121c2b;
  	height: 160px;
  	padding:10px;
  	border-radius: 3px;
  	background: white;
  	border: 2px solid #bddaff;
}
.payA{
	position: relative;	
	top: -260px;
	left: 540px;
	width: 150px;
  	height: 80px;
  	font-size: 24px;
  	font-weight:bold;
  	text-align: center;
}
.moneyA{
	font-size: 24px;
	color:#1d89ff;
}
button.btn4A{
	position: relative;
	width: 120px;
    height: 50px;
	top: -400px;
	left:545px;
	font-weight: bold;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="resources/img/icon72x72.png" type="image/png" />
<title>관리자 페이지(회원)</title>
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
		<section class="section1" id="section1"> 
			<h1 class="title">회원관리</h1>
			<section class="main_box">
				<form action="cstOne" method="post">
					<input type="text" name="cust_id">
					<button type="submit" class="bttn-fill bttn-sm bttn-primary btn1">검색</button>
				</form>
				<table class="box_title2">
					<tr class="tline">
						<td>아이디</td>
						<td>이름</td>
						<td>전화번호</td>
						<td>생년월일</td>
						<td>관리자 권한</td>
						<c:if test="${ONE eq 'Y'}">
						<td>예약내역</td>
						</c:if>
					</tr>
					
					<c:forEach var="customer" items="${CUSTLIST}">
						<tr class="box_text modal-open" id="modal-open" >
							<td style="display:none">${customer.cust_code}</td>
							<td>${customer.cust_id}</td>
							<td>${customer.cust_name}</td>
							<td>${customer.cust_tel.substring(0,3)}-${customer.cust_tel.substring(3,7)}-${customer.cust_tel.substring(7,11)}</td>
							<td style="display:none">${customer.cust_email}</td>
							<td>${customer.cust_birth.substring(0,4)}/${customer.cust_birth.substring(4,6)}/${customer.cust_birth.substring(6,8)}</td>
							<td onclick="event.cancelBubble=true"><input type="checkbox" name="managerChk" value="${customer.manager_check}" disabled="disabled"></td>
						</tr>
							<c:if test="${ONE eq 'Y'}">
								<td><input type="button" id="book" value="예약내역관리"></td>
							</c:if>
						
					</c:forEach>
				</table>
			</section>
	
			<div class="page_box">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<c:if test="${PAGEDTO.prev}"> 
								<li class="page-item"><a class="page-link" href="cstAdmin?curPage=${PAGEDTO.curPage-1}">Previous</a></li>
							</c:if>
							<c:forEach var="page" begin="${PAGEDTO.startNum}" end="${PAGEDTO.lastNum}">
								<li class="page-item" ><a class="page-link" href="cstAdmin?curPage=${page}">${page}</a></li>
							</c:forEach>
							<c:if test="${PAGEDTO.next}">
								<li class="page-item"><a class="page-link" href="cstAdmin?curPage=${PAGEDTO.curPage+1}">Previous</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
	</section>
	
	<form id="updateOK" action="cstUpdateOK" method="post">
		<section class="section2" id="section2"> 
			<h1 class="title">관리자권한 수정</h1>
			<div class="main_box3">
				<div class="member_box"> 
					<div class="manager_check">관리자 권한<input type="checkbox" id="u_manager" name="manager_check" value="Y"></div>
					<input type="hidden" id="u_code" name="cust_code">
					<input type="hidden" name="curPage" value="${PAGEDTO.curPage}">
					<table class="type03">
				  		<tr>
							<th scope="row">회원아이디</th>
						    <td id=u_id></td>
						</tr>
						<tr>
							<th scope="row">이름</th>
						    <td id=u_name></td>
						</tr>
						<tr>
						    <th scope="row">전화번호</th>
						    <td id=u_tel></td>
						</tr>
						<tr>
						    <th scope="row">이메일</th>
						    <td id=u_email></td>
						</tr>
						<tr>
						    <th scope="row">생년월일</th>
						    <td id=u_birth></td>
						</tr>
					</table>
					<div class="button_box">
						<button type="button" class="bttn-fill bttn-sm bttn-primary btn1" id="update">수 정</button>
						<button class="bttn-fill bttn-sm bttn-default btn2" id=btn2>취 소</button>
					</div>
				</div>
			</div>
		</section>
	</form>
	
	<div id="section3">
		<h1 class="titleA">예매 내역</h1>	
		
		<c:if test="${empty TICKETLIST}">
			<section class="ticketA">
				예매내역이 존재하지 않습니다
			</section>
		</c:if>
		<c:forEach var="ticket" items="${TICKETLIST}">
			<section class="ticketA">
			<img class="thumb_medium tc" id=pic src="${ticket.movie_poster}" alt="">
			<div class="text2A">
			티켓 번호 : <c:out value="${ticket.tk_code}" /><br>
			<c:out value="${ticket.movie_name}" /><br>
			극장 : <c:out value="${ticket.cinema_name}" /><br>
			일시 : <c:out value="${ticket.scr_date.substring(0,4)}" />년 
			<c:out value="${ticket.scr_date.substring(4,6)}" /> 월
			<c:out value="${ticket.scr_date.substring(6,8)}" /> 일 
			<c:out value="${ticket.scr_start.substring(0,2)}" />:
			<c:out value="${ticket.scr_start.substring(2,4)}" /><br>
			상영관 : <c:out value="${ticket.theater_name}" /> 관 <br>
			좌석 : <c:out value="${ticket.seat_name}" />
			</div>
			<form id="t_deleteOK" action="ticketDeleteOK" method="get">
			<input type="hidden" name="cust_code" value="${ticket.cust_code}"/>
			<input type="hidden" name="tk_code" value="${ticket.tk_code}"/>
			<div class="payA">총 결제금액<br><span class="moneyA">${ticket.price}원</span></div>
			<button type="button" class="bttn-fill bttn-sm bttn-danger btn4A" id="t_delete">예매취소</button>	
			</form>
			</section>
		</c:forEach>
		
		</div>
	<div class="container"> 
  		<div class="popup-wrap" id="popup"> 
    		<div class="popup">	
      			<div class="popup-head">	
          			<span class="head-title">SYSTEM</span>
      			</div>
	      		<div class="popup-body">	
	        		<div class="body-content">
	          			<div class="body-titlebox">
	            		<h1 id="custID"></h1>
	          			</div>
	        		</div>
      			</div>
		      	<div class="popup-foot"> 
			        <span class="pop-btn confirm" id="confirm">권한수정</span>
			        <form id="deleteOK" action="cstDeleteOK" method="post">
			        	<span class="pop-btn confirm" id="delete">삭제</span>
			        	<input type="hidden" id="d_code" name="cust_code">
			        	<input type="hidden" name="curPage" value="${PAGEDTO.curPage}">
			        </form>
			        <span class="pop-btn close" id="close">취소</span>
		      	</div>
    		</div>
   		</div>
	</div>
	
		<script>
			$(function(){
				$(document).ready(function(){
					$('#section1').show();
					$('#section2').hide();
					$('#section3').hide();
					
					$("input:checkbox[name=managerChk]").each(function() { 
						var test = $(this).val();
						if(test == 'Y') {
							$(this).attr("checked",true);
						}
						
					});
				});
						
				$("input:radio[name='btn']:radio[value='member']").prop('checked', true); 
				
				$("#confirm").click(function(){
					modalClose(); //모달 닫기 함수 호출
					$('#section2').show();
					$('#section1').hide();
					      //컨펌 이벤트 처리
				});
				
				$("#update").click(function(){
					
					if(confirm("관리자권한을 수정 하시겠습니까?") == true) {
						$("#updateOK").submit();
						alert("권한수정이 완료 되었습니다.")
					}
					else {
						return false;
					}
				});
				
				$("#delete").click(function(){
					if (confirm("삭제 하시겠습니까?") == true){    //확인
						$("#deleteOK").submit();
						alert("삭제가 완료 되었습니다.");
					}else{   //취소
						return false;
					}
					modalClose(); //모달 닫기 함수 호출
				});
				
				$(".modal-open").click(function(){
					$("#popup").css('display','flex').hide().fadeIn();
						var code_data = $(this).find("td:eq(0)",this).text();
				      	var id_data = $(this).find("td:eq(1)",this).text();
				      	var name_data = $(this).find("td:eq(2)",this).text();
				      	var tel_data = $(this).find("td:eq(3)",this).text();
				      	var email_data = $(this).find("td:eq(4)",this).text();
				      	var birth_data = $(this).find("td:eq(5)",this).text();
				      	var manager_data = $(this).find($("input:checkbox[name=managerChk]"),this).val();
				      	
				      	// 수정
				      	$("#u_code").val(code_data);
				      	$("#u_id").text(id_data);
				      	$("#u_name").text(name_data);
				      	$("#u_tel").text(tel_data);
				      	$("#u_email").text(email_data);
				      	$("#u_birth").text(birth_data);
				      	
				      	//삭제
				      	$("#d_code").val(code_data);
				      	// 팝업타이틀
				      	document.getElementById("custID").innerHTML = id_data;
				      	
				      	if(manager_data == 'Y') {
				      		$("#u_manager").attr("checked",true);
				      	}
				});
				
				$("#close").click(function(){
					modalClose(); //모달 닫기 함수 호출
				});
				
				$("#book").click(function(){
					$('#section3').show();
					$('#section1').hide();
				});
				
				$("#t_delete").click(function(){
					if (confirm("삭제 하시겠습니까?") == true){    //확인
						$("#t_deleteOK").submit();
						alert("삭제가 완료 되었습니다.");
					}else{   //취소
						return false;
					}
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