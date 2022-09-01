<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<style type="text/css">
#login-form
{
  position: relative;
  color: #777;
  border: 0px solid #afafaf;
  width: 600px;
  height: 400px;
  margin-left: 180px;
  margin-top: 60px;
  text-align: center;
  padding: 20px;
  padding-top: 5px;
  border-radius: 3px;
  box-shadow: 0px 0px 8px #777;
  background: rgba(77, 88, 99, 0.3);
}

input.textbox
{
 width: 350px;
 height: 30px;
 margin: 15px;
}
a.linetext
{
color: #0A5BB8;
text-decoration: underline;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="resources/img/icon72x72.png" type="image/png" />
<title>비밀번호 찾기</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="codetomake.com">
	<link type="text/css" rel="stylesheet" href="resources/css/style.css">
	<link type="text/css" rel="stylesheet" href="resources/css/button.css">
	<link rel="stylesheet" href="resources/css/font-awesome-4.7.0/css/font-awesome.min.css">
	<script type="text/javascript">
$(function(){
	$("#submit").click(function(){
		//사용자 입력값 얻어오기
		var id = $("input[name='cust_id']").val();
		var name = $("input[name='cust_name']").val();
		var email = $("input[name='cust_email']").val();
		//입력여부 검사
		if(!id){
			alert("아이디를 입력하세요");
			$("input[name='cust_id']").focus();
			return false;
		}
		if(!name){
			alert("이름을 입력하세요");
			$("input[name='cust_name']").focus();
			return false;
		}
		if(!email){
			alert("이메일을 입력하세요");
			$("input[name='cust_email']").focus();
			return false;
			
		}
 
		var custinfo = $("#pwFind").serialize();
		var url="pwFind";
		$.getJSON(url, custinfo, function(json) {
			//html 뿌리기
			var result_text = json.result;
			var result = eval(result_text);
		   	if(result)
		   	{
		   		var cust_pw = json.cust_pw;
		   		alert('비밀번호는 '+cust_pw+'입니다');
		   	}
		   	else
		   	{
		   		alert('틀린 정보입니다');
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

<form id="pwFind">
<div class="main">
<div id="login-form">
  <h3 >비밀번호 찾기</h3>
  <input class="textbox" type="text" name="cust_id" placeholder="아이디"/>
  <input class="textbox" type="text" name="cust_name" placeholder="이름"/>
  <input class="textbox" type="text" name="cust_email" placeholder="이메일" />
  <br>
  <input type="button" class="bttn-fill bttn-lg bttn-primary" id="submit" value="비밀번호찾기" />
  <a href="signUpPage"><input type="button" class="bttn-fill bttn-lg bttn-primary" id="register" value="회원가입" /></a><br><br>
  <a class=linetext href="idFindPage" >아이디찾기</a>

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