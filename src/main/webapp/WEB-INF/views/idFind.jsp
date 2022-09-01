<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="resources/img/icon72x72.png" type="image/png" />
<title>아이디 찾기</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="codetomake.com">
	<link type="text/css" rel="stylesheet" href="resources/css/style.css">
	<link type="text/css" rel="stylesheet" href="resources/css/button.css">
	<link type="text/css" rel="stylesheet" href="resources/css/page/login.css">
	<link rel="stylesheet" href="resources/css/font-awesome-4.7.0/css/font-awesome.min.css">
	<script type="text/javascript">
$(function(){
	$("#submit").click(function(){
		//사용자 입력값 얻어오기
		var id = $("input[name='cust_name']").val();
		var pw = $("input[name='cust_email']").val();
		//입력여부 검사
		if(!id){
			alert("이름을 입력하세요");
			$("input[name='cust_name']").focus();
			return false;
		}
		if(!pw){
			alert("이메일을 입력하세요");
			$("input[name='cust_email']").focus();
			return false;
			
		}
 
		var custinfo = $("#idFind").serialize();
		var url="idFind";
		$.getJSON(url, custinfo, function(json) {
			//html 뿌리기
			var result_text = json.result;
			var result = eval(result_text);
		   	if(result)
		   	{
		   		var cust_id=json.cust_id;
		   		alert('아이디는 '+cust_id+'입니다');
		   	}
		   	else
		   	{
		   		alert('아이디가 존재하지 않습니다');
		   	}

		   	
		});
	});
});
</script>
</head>
<body>
<jsp:include page="menu.jsp">
	<jsp:param name="param1" value="1"/>
</jsp:include>

<form id="idFind">
<div class="main">
<div id="login-form">
  <h3 >아이디 찾기</h3>
  <input class="textbox" type="text" name="cust_name" placeholder="이름"/>
  <input class="textbox" type="text" name="cust_email" placeholder="이메일" />
  <br>
  <input type="button" class="bttn-fill bttn-lg bttn-primary" id="submit" value="아이디찾기" />
  <a href="signUpPage"><input type="button" class="bttn-fill bttn-lg bttn-primary" id="register" value="회원가입" /></a><br><br>
  <a class=linetext href="pwFindPage" >비밀번호찾기</a>

</div>
</div>
</form>
<br><br>
<div class="ftop">
Copyright &copy; 2022 - All rights reserved Its Cinema Company
<br>
Fully compatible for all major browsers. 
</div>
</body>
</html>