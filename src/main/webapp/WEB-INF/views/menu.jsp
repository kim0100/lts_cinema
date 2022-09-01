<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<style type="text/css">
.login.out{
	position: relative;	
	bottom:30px;
	right: 10px;
	width: 180px;
  	height: 60px;
  	font-weight:bold;
}
.login_box{
	position: relative;
	float:right;
	margin:10px;
	font-size: 15px;
	text-align: center;
	font-weight:bold;
	color:#4a4b51	
}
.login_img{
	position: relative;	
	top: 00px;
	left: 0px;
	width: 72px;
  	height: 72px;
  	cursor:pointer;
  	
}
.login_img:hover{
	border: 4px solid #191b1a;
}

.log_Windo2{
	position: relative;	
	top: -30px;
	left: 520px;
	width: 400px;
  	height: 130px;
  	border-radius:3px;
  	background: gray;
  	color:#000015;
  	box-shadow: 0px 0px 8px #777;
  	margin:0px;
}
.mypage_btn{
	position: relative;	
	top: -35px;
	right: 20px;
}

</style>
<body>
	<header class="header">
		<div class="head">
			<a href="main" class="logo" title="메인화면"> </a> <br>
			<section class="log_Windo">
			<c:if test="${empty cust}">
			<div class="login_box">
			<a href=myPage><img class="login_img" id=login src="resources/img/menu/loginMember.png" alt=""></a><br>개인정보
			</div>
			<div class="login_box">
			<a href=signUpPage><img class="login_img" id=login src="resources/img/menu/loginJoin.png" alt=""></a><br>회원가입
			</div>
			<div class="login_box">
			<a href=loginPage><img class="login_img" id=login src="resources/img/menu/loginPassword.png" alt=""></a><br>로그인
			</div>
			</c:if>
			<c:if test="${not empty cust}">
			<div class="login_box">
			<a href=myPage><img class="login_img" id=login src="resources/img/menu/loginMember.png" alt=""></a><br>개인정보
			</div>
			<div class="login_box">
			<a href=logOut><img class="login_img" id=login src="resources/img/menu/loginPassword.png" alt=""></a><br>로그아웃
			</div>
			</c:if>
			</section>
		</div>
<div class="title_Menu">

</div>
		<nav>
			<ul>
				<li><a href="bookPage">예매</a></li>
				<li><a href="moviePage"> 영화 </a></li>
				<li><a href="cinemaPage">영화관</a></li>
				<c:if test="${cust.manager_check eq 'Y'}">
				<li><a href="adminPage">관리자 페이지</a></li>
				</c:if>
			</ul>
		</nav>
	</header>			
</body>
</html>