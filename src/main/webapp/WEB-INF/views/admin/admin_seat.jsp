<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
<head>
<style type="text/css">
.main {
	padding:0px;
	height: 0px;
}

	.btn{
                display: inline-block;
                outline: 0;
                cursor: pointer;
                border-radius: 6px;
                border: 2px solid #1d89ff;
                color: #fff;
                background-color: #1d89ff;
                padding: 8px;
                box-shadow: rgba(0, 0, 0, 0.07) 0px 2px 4px 0px, rgba(0, 0, 0, 0.05) 0px 1px 1.5px 0px;
                font-weight: 800;
                font-size: 20px;
                width: 160px;
                height: 48px;
                }
               .btn:hover{
                    background: #cdd7ea;
                    color: #1d89ff;
                }
.btn.update_chair{
	position: relative;
	top: 460px;
	left:-260px;
	width: 120px;
	height: 80px;	
}
.btn.change{
	position: absolute;
	width: 120px;
	height: 80px;	 
	top:380px;
	left:-140px;
}                

.ftop2 {
	position: relative;
	top: 200px;
	color: #fff;
	background: #070707;
	width: 960px;
	margin: 0 auto;
	height: 70px;
	padding: 10px;
	float :bottom;
}
.num_bar{
	position: absolute;
	left: 36px;
	width:	400px;
	height: 20px;
	font-size:20px;
	word-spacing:17px;
}
.num_bar2{
	position: absolute;
	left: 30px;
	width:	400px;
	height: 20px;
	font-size:20px;
	word-spacing:6px;
}
.alpa_bar{
	position: absolute;
	top: 0px;
	left: 10px;
	width:	10px;
	height: 700px;
	font-size:20px;
	line-height:31px;
}
.ch_table{
	position:relative;
	margin: auto;
}
.chair{
	border:2px solid #F0F;
	font-size: 12px;
	text-align: center;
	width:	33px;
  	height: 29px;
  	
}

 input[type="checkbox"] {
        display: none;
    }
/*   input[type="checkbox"]:hover {
    	 background-color: #ffffff;
    }
 
/*   input[type="checkbox"] + span {
        display: inline-block;
        width:	31px;
  		height: 27px;
  		font-size: 12px;
        border: 1px solid #dfdfdf;
        background-color: #ffffff;
        text-align: center;
        cursor: pointer;
    } */
input[type="checkbox"]:checked + span {
   background-color: #ffffff;
   color: #000000;
}

.chairY1 {
	display: inline-block;
        width:	31px;
  		height: 27px;
  		font-size: 12px;
        border: 1px solid #dfdfdf;
        background-color: #0064FF;
        text-align: center;
        cursor: pointer;
        color: #ffffff;
}

.chairY2 {
		display: inline-block;
        width:	31px;
  		height: 27px;
  		font-size: 12px;
        border: 1px solid #dfdfdf;
        background-color: #228B22;
        text-align: center;
        cursor: pointer;
        color: #ffffff;
}

.chairN {
display: inline-block;
        width:	31px;
  		height: 27px;
  		font-size: 12px;
        border: 1px solid #dfdfdf;
        background-color: #EB0000;
        text-align: center;
        cursor: pointer;
        color: #ffffff;
}
.section1{
	position: relative;
	top: 20px;
	
}
.main_box4{

 	position: relative;
 	display: flex;
	margin-top: 10px;
	top: 80px;
	background: rgba(77, 88, 99, 0.3);
	left: 162px;
	width: 750px;
  	height: 550px;
  	text-align: left;
  	box-shadow: 0px 0px 8px #777;
  	border-radius: 3px;
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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="../resources/img/icon72x72.png" type="image/png" />
<title>관리자 페이지(좌석)</title>
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
			<h1 class="title">좌석 관리</h1>
			<form action="seatList" method="post">
            	<span class="Csel">
              		<select id="cinemaList" name="cinema_code" size = "1">
	            		<option>영화관 선택</option>
	            	<c:forEach var="cinema" items="${CINEMALIST}">
						<option <c:if test="${CINEMACODE eq cinema.cinema_code}">selected</c:if> value="${cinema.cinema_code}">${cinema.cinema_name}</option>
					</c:forEach>
					</select>
               	</span>
            
             	<span class="Tsel2">
               		<select id = "theaterList" name="theater_name" size = "1">
						<option>상영관 선택</option>
					<c:forEach var="theater" items="${THEATERLIST}">
						<option id="theaterOp" <c:if test="${THEATERONE.theater_name eq theater.theater_name}">selected</c:if> value="${theater.theater_name}">${theater.theater_name}관</option>
					</c:forEach>
					</select>
					<button type="submit" class="bttn-fill bttn-sm bttn-primary btn1">검 색</button>
                </span>
            </form>     
		</section>
			
			<button type="button" class="btn update_chair" id=update_check>사용여부<br>변경</button>
		
		<section class="main_box4">
		
				<button type="button" class="btn change" id=update_grade>등급<br>변경</button>
				
			<c:set var="x" value="${THEATERONE.seat_y}"/>
			<c:set var="0" value="0"/>
			<form id="updateOK" action="seatUpdateOK" method="post">
				<input type="hidden" value="${CINEMACODE}" name="cinema_code">
				<input type="hidden" value="${THEATERONE.theater_name}" name="theater_name">
				<input id="value" type="hidden" name="value">
				<table class="ch_table">
					<c:forEach var="seat" items="${SEATLIST}">
						<c:if test="${y%x == 0}">
							<tr>
						</c:if>
								<td>
									<label class="butt_obj">
								  		<c:if test="${y%x == 0}">
								  			<span class=chairT>${seat.seat_name.substring(0,1)}</span>
								  		</c:if>
									  	<c:if test="${seat.use_check eq 'Y'.charAt(0) && seat.grade eq '1'.charAt(0)}">
										  	<input class="chair" type="checkbox" name="seatList" value="${seat.seat_name}">
										    <span class="chairY1">${seat.seat_name.substring(1)}</span>
									    </c:if>
									    <c:if test="${seat.use_check eq 'Y'.charAt(0) && seat.grade eq '2'.charAt(0)}">
										  	<input class="chair" type="checkbox" name="seatList" value="${seat.seat_name}">
										    <span class="chairY2">${seat.seat_name.substring(1)}</span>
									    </c:if>
									    <c:if test="${seat.use_check eq 'N'.charAt(0)}">
										  	<input class="chair" type="checkbox" name="seatList" value="${seat.seat_name}">
										    <span class="chairN">${seat.seat_name.substring(1)}</span>
									    </c:if>
								    </label>
								 </td>
						<c:if test="${y%x == x-1}">
							</tr>
						</c:if>
						<c:set var="y" value="${y+1}"/>
					</c:forEach>
				</table>
			</form>
			<br>
	</section>
</div>
<script>
	$(function(){
    	$("input:radio[name='btn']:radio[value='seat']").prop('checked', true);
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
    	
    	$("#update_check").click(function(){
    		 if (confirm("좌석사용여부를 변경 하시겠습니까?") == true){
	    		 $("#value").attr("value", "check");
	    		 $("#updateOK").submit();
	    		 alert("변경이 완료 되었습니다.");
    		 }
    		 else {
    			 return false;
    		 }
    	});
    	
    	$("#update_grade").click(function(){
    		 if (confirm("좌석등급을 변경하시겠습니까?") == true){
		   		 $("#value").attr("value", "grade");
		   		 $("#updateOK").submit();
		   		 alert("변경이 완료 되었습니다.");
    		 }
    		 else {
    			 return false;
    		 }
   		});
    });
</script>
       
<div class="ftop2">
	Copyright &copy; 2022 - All rights reserved Its Cinema Company <br>
	Fully compatible for all major browsers.
</div>	
</body>
</html>