<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<style type="text/css">

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="resources/img/icon72x72.png" type="image/png" />
<title>회원가입 페이지</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
	<link type="text/css" rel="stylesheet" href="resources/css/style.css">
	<link type="text/css" rel="stylesheet" href="resources/css/button.css">
	<link rel="stylesheet" href="resources/css/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="resources/css/page/register.css">
 

</head>
<body>
        <!-- header -->
        <header class="header">
<div class="head">
<a href="main" class="logo"   title="메인 페이지">

</a>
</div>
<br>
</header>
<script type="text/javascript">
$(function() {
	
	var click = false;
	var check = false;
	var confirmcheck = false;
	
	
	$("#checkid").click(function() {
		
		var input_value = $("input[name='cust_id']").val();
		
		if(!input_value) {
			alert("아이디를 입력하세요");
			$("input[name='cust_id']").focus();
			return false;
		}
		
		var url = "IdChkCtrl";
		
		$.getJSON(url, {"cust_id":input_value}, function(json) {
			
			var result_text = json.result;
			
			var result = eval(result_text);
			
			if(result) {
				
				alert("사용가능한 아이디입니다");
				check = true;
				
			}else{
				
				alert("중복 된 아이디 입니다");
				
			}
			
		});
		
		click = true;
		
	});
	
	$("#cust_id").change(function(){
		
		click = false;
		
	});
	
	$('#btnJoin').click(function(){
		if(click == false ) {
			
			alert("아이디 중복확인을 해주세요.");
			$("#checkid").focus();
			
			return false;
		}
		else if(check == false) {
			
			alert("중복된 아이디 입니다.");
			$("#cust_id").focus();
			
			return false;
		}
		
		else {
			
			return true;
			
		}
			
	});	
	
	var emailclick = false;
	var emailcheck = false;
	
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
	});
	
	$('#btnJoin').click(function(){
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
		else if($("#cust_pw").val() != $("#pswd2").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		else if($("#cust_email").val()		 == ""
			     || $("#cust_birth").val()   == ""
				 || $("#cust_name").val()    == ""
				 || $("#cust_pw").val()		 == ""
	 	 		 || $("#cust_id").val() 	 == "" )
		{
			alert('필수 항목을 모두 작성 하십시오');
			return false;
		}
		else {
			return true;
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
	
		
		
});

</script>
<h3 class=sign>회원가입</h3>
        <!-- wrapper -->
        <form action="signUp" method="post">
        <div id="wrapper">

            <!-- content-->
            <div id="content">

                <!-- ID -->
                <div>
                  
                    <h3 class="join_title">
                        <label for="id">* 아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text"  name="cust_id" id="cust_id" class="int" maxlength="15">
                        <button type="button" class="bttn-fill bttn-sm bttn-primary btn1" id="checkid">중복확인</button>
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">* 비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" name="cust_pw" id="cust_pw" class="int" maxlength="15">
                        <span id="alertTxt">사용불가</span>
                        <img src="resources/img/m_icon_pass.png" id="pswd1_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">* 비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="password" id="pswd2" class="int" maxlength="15">
                        <img src="resources/img/m_icon_check_disable.png" id="pswd2_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">* 이름</label></h3>
                    <span class="box int_name">
                        <input type="text" name="cust_name" id="cust_name" class="int" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
                </div>
				
				
                <!-- BIRTH -->
                <div>
                    <h3 class="join_title"><label for="yy">* 생년월일</label></h3>
                    <div id="bir_wrap">
                        <!-- BIRTH_YY -->
                        <div id="bir_yy">
                            <span class="box">
                                <input type="text" name="cust_birth" id="yy" class="int" maxlength="8" placeholder="ex)19981019 (8자)">
                            </span>
                       
                        </div>
					
                    </div>
                    <span class="error_next_box"></span>
                    <span class="error_next_box"></span>      
                </div>
                
                <!-- EMAIL -->
                <div>
                  
                    <h3 class="join_title">
                        <label for="id">* E-MAIL</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text"  name="cust_email" id="cust_email" class="int" maxlength="30">
                        <button type="button" class="bttn-fill bttn-sm bttn-primary btn1" id="checkemail">인증메일발송</button>
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
                        <button type="button" class="bttn-fill bttn-sm bttn-primary btn1" id="confirmEmail">인증</button>
                    </span>
                    <span class="error_next_box"></span>
                </div>
                

                <!-- MOBILE -->
                <div>
                   <h3 class="join_title"><label for="phoneNo">* 휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" name="cust_tel" id="mobile" class="int" maxlength="11" placeholder="-을 빼고 입력해주세요. ex)01012345678">
                    </span>
                    <span class="error_next_box"></span>    
                </div>


                <!-- JOIN BTN-->
                
             
                <div class="btn_area">
                    <button type="submit" id="btnJoin">
                        <span class="signbt">가입하기</span>
                    </button>
                </div>
             
           <div class="ftop">
Copyright &copy; 2022 - All rights reserved Its Cinema Company
<br>
Fully compatible for all major browsers. 
</div>               

            </div> 
            <!-- content-->

        </div>
        </form>
         
  <script src="resources/js/register.js"></script>



</body>



</html>