<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="resources/img/icon72x72.png" type="image/png" />
<title>로그인 페이지</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
	<link type="text/css" rel="stylesheet" href="resources/css/style.css">
	<link type="text/css" rel="stylesheet" href="resources/css/button.css">
	<link type="text/css" rel="stylesheet" href="resources/css/page/login.css">
	<link rel="stylesheet" href="resources/css/font-awesome-4.7.0/css/font-awesome.min.css">
	<script type="text/javascript">
$(function(){
	$("#login1").click(function(){
		//사용자 입력값 얻어오기
		var id = $("input[name='cust_id']").val();
		var pw = $("input[name='cust_pw']").val();
		//입력여부 검사
		if(!id){
			alert("아이디를 입력하세요");
			$("input[name='cust_id']").focus();
			return false;
		}
		if(!pw){
			alert("비밀번호를 입력하세요");
			$("input[name='cust_pw']").focus();
			return false;
		}
	});
});
</script>
</head>
<body>
<jsp:include page="menu.jsp">
	<jsp:param name="param1" value="1"/>
</jsp:include>

<form action="loginCk.do" method="post">
<div class="main">
<div id="login-form">
  <h3><span>L</span><span>o</span><span>g</span><span>i</span><span>n</span></h3>
  <input class="textbox" type="text" name="cust_id" placeholder="UserID"/>
  <c:if test="${message == 'error'}">
 	<div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.
  </div>
  </c:if>
  <input class="textbox" type="password" name="cust_pw" placeholder="Password" />
  <br>
  <input type="submit" class="btn" id="login1" value="로그인" />
  <a href="signUpPage"><input type="button" class="btn" id="register" value="회원가입" /></a><br><br>
  <input class=idsave type="checkbox" name="idsave" value="idsave" >아이디 저장  
  <a class=linetext href="idFindPage" >아이디찾기</a>
  <a class=linetext href="pwFindPage">비밀번호찾기</a>

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