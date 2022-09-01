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
<title>마이 페이지</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="resources/css/style.css">
<link type="text/css" rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="resources/css/myPage.css">
<link rel="stylesheet" href="resources/css/page/register.css">


<script type="text/javascript">
$(function(){
	//회원탈퇴
	$("#btn7").click(function(){
		//사용자 입력값 얻어오기
		var pw = $("#pw").val();
		//입력여부 검사
		if(!pw){
			alert("비밀번호를 입력하세요");
			$("#pw").focus();
			return false;
		}
		
		if (confirm("회원탈퇴 절차를 진행 하시겠습니까?")) {
            // 확인 버튼 클릭 시 동작
   			//get방식 ajax 연동
   			var url = "PwChkCtrl";
   			$.getJSON(url, {"cust_pw":pw}, function(json) {
   			//결과가 전달되는 파라미터에 읽어온 데이터가 담겨 있으며
   			//JSON 이므로 별도의 추출 과정 없이 점(.) 으로 데이터 계층을 연결하여 사용할수 있다.
   			var result_text = json.result;
   			  			
   			//"true" 혹은 "false"라는 문자열이므로 eval함수를 사용하여 boolean값으로 변경
   			var result = eval(result_text);
   			
   			//결과출력
   			if(result) {
   				alert("회원탈퇴를 진행합니다");
   			 	location.href = "withdrawal";
   			}else{
   				alert("비밀번호가 틀렸습니다");
   				return false;
   			}
   		});
       } else {
           // 취소 버튼 클릭 시 동작
       	return false;
       }
	});
});
</script>
<script type="text/javascript">
$(function() {

var emailclick = true;
var emailcheck = true;
var confirmcheck = true;

$("#checkemail").click(function() {
	
	var input_emailvalue = $("input[name='cust_email']").val();
	
	if(!input_emailvalue) {
		alert("이메일을 입력하세요");
		$("input[name='cust_email']").focus();
		return false;
	}
	
	var url = "EmailChkctrl";
	
	$.getJSON(url, {"cust_email":input_emailvalue}, function(json) {
		
		var result_text = json.result;
		
		
		var result = eval(result_text);
		
		if(result) {
			
			emailcheck = true;
			
			 var email = $("#cust_email").val();       
			    
			    $.ajax({
			        
			        type:"GET",
			        url:"EmailGetctrl",
			        data : {"cust_email" : email},
			        dataType : "Json",
			        success: function(json) {
			        	alert(email + "로 인증번호를 발송하였습니다");
			        	console.log("json : " + jason);
			        }
			    });
		}else{
			alert("중복 된 이메일 입니다");
	
		}
	});
	emailclick = true;
	
});

$("#cust_email").change(function(){
	emailclick = false;
	emailchech = false;
	confirmcheck = false;
});

$('#btn5').click(function(){
	
	if(emailclick == false ) {
		alert("이메일 인증을 해주세요.");
		$("#checkemail").focus();
		return false;
	}
	else if(emailcheck == false) {
		alert("중복된 이메일 입니다.");
		$("#cust_email").focus();
		return false;
	}
	else if(confirmcheck == false) {
		alert("인증번호를 다시 입력해주세요.");
		return false;
	}
	else if($("#cust_pw").val() !== $("#pswd2").val()) {
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	 
	if(confirm("정보변경을 하시겠습니까?") == true) {
		
			$('#mypageOk').submit();
			alert("정보변경을 완료 하였습니다.");
	}
	
	else {
		 	return false;
		 }
		
});
	$("#confirmEmail").click(function(){
		
		var data = $("#send_email").val();
		
			 $.ajax({
			        
			        type:"GET",
			        url:"EmailGetctrl",
			        data : {"cust_email" : email},
			        dataType : "Json",
			        success: function(json) {
			        	
			        if(data == json.email){
			        	alert("인증번호가 확인되었습니다.");
			        	confirmcheck = true;
			        }
			        else{
			        	alert("인증번호가 다릅니다.");
			        	return false;
			        }
			        
			        }
				});
		 
	});
	$("#btn6").click(function(){
		
		if(confirm("회원정보를 변경하지 않겠습니까?") == true){
			
			$('#section1').show();
			$('#section2').hide();
			
		}
		
		else{
			return false;
		}
		
	});
});
</script>
	
</head>
<body>
	<header class="header">
		<div class="head">
			<a href="main" class="logo" title="메인페이지"> </a> <br>
			<br>
		</div>
	</header><br>

	<div class="main">
		<section class="chart">
			<img class="Cicle" id=pic src="resources/img/cap.png" alt="">
				<div class="text"><br><br>
				<h1>${cust.cust_name} 님 </h1><br>			
				</div>
				
		</section>
			<div class="line"></div>
		<section class="menu">
			 
		<label class="butt_obj">
    		<input type="radio" id="btn1" name="btn" checked="checked" >
    		<span>예매 내역</span>
		</label>
		<label class="butt_obj">
    		<input type="radio" id="btn2" name="btn">
    		<span>정보 변경</span>
		</label>
		<label class="butt_obj">
    		<input type="radio" id="btn3" name="btn">
    		<span>회원 탈퇴</span>
		</label>
		</section>
		<div id="section1">
		<h1 class="title">예매 내역</h1>	
		
		<c:if test="${empty resHist}">
			<section class="ticket">
				예매내역이 존재하지 않습니다
			</section>
		</c:if>
		<c:forEach var="resHist" items="${resHist}">
			<section class="ticket">
			<img class="thumb_medium tc" id=pic src="${resHist.movie_poster}" alt="">
			<div class="text2">
			티켓 번호 : <c:out value="${resHist.tk_code}" /><br>
			<c:out value="${resHist.movie_name}" /><br>
			극장 : <c:out value="${resHist.cinema_name}" /><br>
			일시 : <c:out value="${resHist.scr_date.substring(0,4)}" />년 
			<c:out value="${resHist.scr_date.substring(4,6)}" /> 월
			<c:out value="${resHist.scr_date.substring(6,8)}" /> 일 
			<c:out value="${resHist.scr_start.substring(0,2)}" />:
			<c:out value="${resHist.scr_start.substring(2,4)}" /><br>
			상영관 : <c:out value="${resHist.theater_name}" /> 관 <br>
			좌석 : <c:out value="${resHist.seat_name}" />
			</div>
			<form action="resCancle">
			<input type="hidden" name="cust_code" value="${resHist.cust_code}"/>
			<input type="hidden" name="tk_code" value="${resHist.tk_code}"/>
			<div class="pay">총 결제금액<br><span class="money">${resHist.price}원</span></div>
			<button type="submit" class="bttn-fill bttn-sm bttn-danger btn4" id=btn4>예매취소</button>	
			</form>
			</section>
		</c:forEach>
		
		</div>
		
		
		<div id="section2">
		<h1 class="title2">회원 정보변경</h1>
		<div class="box2">
		
		<form action="Update" method="post" id="mypageOk">
		<div id="wrapper">
		 <!-- content-->
            <div id="content">

                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" name="cust_pw" id="cust_pw" class="int" maxlength="15" value="${cust.cust_pw}">
                        <span id="alertTxt">사용불가</span>
                        <img src="resources/img/m_icon_pass.png" id="pswd1_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                   <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="password" id="pswd2" class="int" maxlength="15" value="${cust.cust_pw}">
                        <img src="resources/img/m_icon_check_disable.png" id="pswd2_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" name="cust_name"id="name" class="int" maxlength="20" value="${cust.cust_name}">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                

                <!-- BIRTH -->
                <div>
                    <h3 class="join_title"><label for="yy">생년월일</label></h3>

                    <div id="bir_wrap">
                        <!-- BIRTH_YY -->
                        <div id="bir_yy">
                            <span class="box">
                                <input type="text" id="yy" class="int" maxlength="8" value="${cust.cust_birth}" disabled>
                            </span>
                        </div>
                </div>
                
                <!-- EMAIL -->
                <div>
                  
                    <h3 class="join_title">
                        <label for="id">E-MAIL</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text"  name="cust_email" id="cust_email" class="int" maxlength="30" value="${cust.cust_email}">
                    	<button type="button" class="bttn-fill bttn-sm bttn-primary jong" id="checkemail">중복확인</button>
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                <!-- EMAIL -->
                <div>
                  
                    <h3 class="join_title">
                        <label for="id">* 인증번호</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text"  name="cust_email" id="send_email" class="int" maxlength="30">
                        <button type="button" class="bttn-fill bttn-sm bttn-primary confirmEmail" id="confirmEmail">인증</button>
                    </span>
                    <span class="error_next_box"></span>
                </div>
                

                <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" name="cust_tel" id="mobile" class="int" maxlength="16" value= "${cust.cust_tel}">
                    </span>
                    <span class="error_next_box"></span>    
                </div>
                <div class="butt_box">
               	 	<button type="button" class="bttn-fill bttn-sm bttn-primary btn5" id=btn5>정보변경</button>
					<button type="button" class="bttn-fill bttn-sm bttn-primary btn6" id=btn6 >취소</button>
                </div>
                <input type="hidden" name="cust_code" value="${cust.cust_code}"/>
                <input type="hidden" name="cust_id" value="${cust.cust_id}"/>
                <input type="hidden" name="manager_check" value="${cust.manager_check}"/>
                <input type="hidden" name="cust_birth" value="${cust.cust_birth}"/>

            </div> 
            <!-- content-->
		</div>
		</div> 
	</form>
	</div>
	
		</div>
		<div id="section3">
		<h1 class="title">회원 탈퇴</h1>
		<div class="box3">
		<div class="text4">
		회원탈퇴 절차를 진행 하시겠습니까?<br>
		</div>
		<div class="text5">${cust.cust_id}</div><br><br>
		비밀번호 :
		<input class="input" type="password" id="pw" class="int" maxlength="15"><br>
		<button class="bttn-fill bttn-sm bttn-primary btn5" id=btn7>회원탈퇴</button>
		<button class="bttn-fill bttn-sm bttn-primary btn6" id=btn8>취 소</button>
		</div>
		</div>
		<script>
		$(document).ready(function() {
			$('#btn1').click(function() {
				$('#section1').show();
				$('#section2').hide();
				$('#section3').hide();
			});
			$('#btn2').click(function() {
				$('#section1').hide();
				$('#section2').show();
				$('#section3').hide();
			});
			$('#btn3').click(function() {
				$('#section1').hide();
				$('#section2').hide();
				$('#section3').show();
			});
		});	
		
		</script>
 <script src="resources/js/mypage.js"></script>
	<div class="ftop2">
		Copyright &copy; 2022 - All rights reserved Its Cinema Company <br>
		Fully compatible for all major browsers.
	</div>
</div>	
</body>
</html>