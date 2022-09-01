<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<style type="text/css">
.pay_box1{
	position: relative;
	top: -550px;
	left: 720px;
	width: 200px;
  	height: 80px;
	border: 2px solid #140e14;
	border-radius:5px;
	font-size:24px;
	text-align: center;
  	font-weight: bold;
  	line-height: 40px;
	background: linear-gradient(#777e8d 50%, rgba(20, 20, 20, 0) 50%);
	color:white;
	display:inline-block;
}
.pay_box2{
	position: relative;
	top: -450px;
	left: 518px;
	width: 200px;
  	height: 80px;
	border: 2px solid #140e14;
	border-radius:5px;
	font-size:24px;
	text-align: center;
  	font-weight: bold;
  	line-height: 40px;
	background: linear-gradient(#1d84bf 50%, rgba(20, 20, 20, 0) 50%);
	color:#07e3ff;
	display:inline-block;
}
.pay_box3{
	position: relative;
	top: -350px;
	left: 316px;
	width: 200px;
  	height: 80px;
	border: 2px solid #140e14;
	border-radius:5px;
	font-size:24px;
	text-align: center;
  	font-weight: bold;
  	line-height: 40px;
	background: linear-gradient(#722c19 50%, rgba(20, 20, 20, 0) 50%);
	color:#eefe5f;
	display:inline-block;
}
.b_text{
	position: absolute;
	width: 200px;
  	height: 40px;
	top:45px;
	left:0px;
	font-size:24px;
	text-align: center;
  	font-weight: bold;
	color:#121310;
}


.black_box {
	position: relative;
	float:bottom;
	border-color:#7b7672;
	border-width: 1px;
  	border-style: solid;
	background:white;
	width: 100%;
  	height: 140px;
	background:#202121;
	font-size: 16px;
  	text-align: center;
  	font-weight: bold;
  	display:inline-block;
}
.pic {
	position: absolute;
	top: 10px;
	right:700px;
	width: 100px;
  	height: 120px;
  	border: 1px solid #dfdfdf;
}
.pic2 {
	position: absolute;
	top: 45px;
	left:690px;
	width: 60px;
  	height: 60px;
}

/* <<<화살표 7~9 */
.pic7 {
	position: absolute;
	z-index: 10;
	top: 10px;
	left: 40px;
	width: 60px;
  	height: 60px;
  	transform: rotate(90deg);
}
.pic8 {
	position: absolute;
	z-index: 10;
	top: 10px;
	left: 10px;
	width: 60px;
  	height: 60px;
  	transform: rotate(90deg);
}
.pic9 {
	position: absolute;
	z-index: 10;
	top: 10px;
	left: 70px;
	width: 60px;
  	height: 60px;
  	transform: rotate(90deg);
}

.black_boxt1{
	position: relative;
	top:-110px;
	left: 270px;
	width: 160px;
  	height: 120px;

}
.black_boxt2{
	position: relative;
	top:-230px;
	left: 440px;
	width: 60px;
  	height: 120px;
  	
}
.black_boxt3{
	position: relative;
	top:-350px;
	left: 500px;
	width: 180px;
  	height: 120px;

}
.black_boxt4{
	position: relative;
	top:-430px;
	left: 680px;
	width: 100px;
  	height: 40px;
  	font-size:24px;
  	font-weight: bold;
  	color:gray;

}
.black_boxt5{
	position: relative;
	top:-560px;
	left: 300px;
	width: 100px;
  	height: 40px;
  	font-size:24px;
  	font-weight: bold;
  	color:gray;

}
.black_Btext1{
	position: relative;
	font-size: 14px;
	color:white;
	text-align: left;
}
.select_btn{
	position: relative;
	z-index: 20;
	top:-470px;
	left: 670px;
	width: 240px;
  	height: 120px;
  	font-size:32px;
  	font-weight: bold;
  	color:white;
  	cursor:pointer;
  	background:rgba(255, 0, 0, 0.3);
  	border-radius:10px;
  	border: 3px solid #e32e47;
}

.cancel_btn{
	position: relative;
	z-index: 20;
	top:10px;
	left: 10px;
	width: 120px;
  	height: 120px;
  	font-size:24px;
  	font-weight: bold;
  	color:white;
  	cursor:pointer;
  	border-radius:10px;
  	border: 3px solid #dfdfdf;
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
.chair:hover{
	border:5px solid #c80800;
	font-size: 12px;
	text-align: center;
	width:	33px;
  	height: 29px;
}
.chairT{
	
	font-size: 20px;
	font-weight: bold;
	text-align: center;
	width:	33px;
  	height: 29px;
}

.main_box{
 	position: relative;
 	display: flex;
	top:  10px;
	background: rgba(77, 88, 99, 0.3);
	left: 0px;
	width: 700px;
  	height: 610px;
  	text-align: left;
  	box-shadow: 0px 0px 8px #777;
  	border-radius: 3px;
}
.title_boxT{
	color:white;
	background:#272826;
	width: 960px;
    height: 40px;
    font-size:24px;
    font-weight:bold;
    line-height:40px;
    text-align: center;
    overflow:hidden;
    border: 2px solid #dfdfdf;
    text-shadow: -1px 0 #4E4F4D, 0 1px #4E4F4D, 1px 0 #4E4F4D, 0 -1px #4E4F4D;
}
.text_cacao{
	position: absolute;
	width: 200px;
  	height: 40px;
	top:45px;
	left:0px;
	font-size:24px;
	text-align: center;
  	font-weight: bold;
	color:#121310;
	text-shadow: -1px 0 #9D9D9C, 0 1px #9D9D9C, 1px 0 #9D9D9C, 0 -1px #9D9D9C;
}
.btn_kakao{
	position: absolute;
	z-index: 50;
	top: 500px;
	left:280px;
	border: 2px solid #22231f;
	box-shadow:3px 3px 3px  rgba(0, 0, 0, 0.5);
	border-radius:30px;
	outline:0;
	cursor: pointer;
	text-decoration: 0.3s;
}

.btn_kakao:active{
	margin-top:3px;
	box-shadow:none;
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="resources/img/icon72x72.png" type="image/png" />
<title>결제</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link type="text/css" rel="stylesheet" href="resources/css/style.css">
<link type="text/css" rel="stylesheet" href="resources/css/button.css">
<link type="text/css" rel="stylesheet" href="resources/css/page/payment.css">
</head>
<body>
<script>
$(document).ready(function(){ 
	const IMP = window.IMP;
	var list = [];
	<c:forEach var="list" items="${seat_name}">
		list.push('${list}');
	</c:forEach>
	for(var o=0; o<list.length; o++)
		{
		console.log(list);
		}
	$("#seat").attr("value", list);
//버튼 클릭하면 실행
$("#kakaoPay").click(function() {
	
	IMP.init('imp88661735');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
    IMP.request_pay({// param
        pg: "kakaopay.TC0ONETIME", //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
        pay_method: "card", //지불 방법
        merchant_uid: 'merchant_' + new Date().getTime(), //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
        name: "<LTS 시네마>", //결제창에 노출될 상품명
        amount: "${price}", //금액
        
    }, function (rsp) { // callback
        if (rsp.success) {
            alert("결제가 완료되었습니다");
            $("#merchant").attr("value", rsp.merchant_uid);
            $("#imp").attr("value", rsp.imp_uid);
            $("#paydate").attr("value", rsp.paid_at);
            $("#payInsert").submit();
        } else {
            alert("실패 : 코드(" + rsp.error_code + ") / 메세지(" + rsp.error_msg + ")");
        }
    });
});
});
    </script>
    
	<jsp:include page="menu.jsp">
         <jsp:param name="param1" value="1"/>
    </jsp:include>

	<div class="main">
		<section class="main_box">
		<div class="title_boxT">결제 수단</div>
		<div class="text_kakao">카카오 페이</div>
		<div class="btn_kakao"><img src="resources/img/payment_icon_yellow_medium.png" id="kakaoPay"></div>
		<button id="cancel" type="button"></button>
		
		</section>
		<span class="pay_box1">
		결제하실 금액 <br><br><span class="b_text">${price }원</span> 
		</span>
		<span class="pay_box2">
		할인 금액 <br><br><span class="b_text">0원</span> 
		</span>
		<span class="pay_box3">
		최종 결제금액<br><br><span class="b_text">${price }원</span> 
		</span>
	
	


	
	<section class="black_box">
	<div class="cancel_btn"><br><br><br><br><br>좌석선택</div>
	<img class="pic" src="resources/img/spidericon.png" alt="">
	<div class="black_boxt1"><div class="black_Btext1"><br>스파이더맨-노웨이홈<br><br>2D(라스트 특가)<br>12세 관람가</div></div>
	<div class="black_boxt2"><div class="black_Btext1"><br>극장<br>일시<br>상영관<br>인원</div></div>
	<div class="black_boxt3"><div class="black_Btext1"><br> CGV 대구스타디움<br> 2022.02.11(금)11:35<br> 3관<br></div></div>
	<img class="pic2" src="resources/img/arrow.png" alt="">
	<img class="pic7" src="resources/img/arrow.png" alt="">
	<img class="pic8" src="resources/img/arrow.png" alt="">
	<img class="pic9" src="resources/img/arrow.png" alt="">
	
	</section>
	
	<form id="payInsert" action="payOk" method="get">
		<input type="hidden" id="merchant" name="merchant_uid">
		<input type="hidden" id="imp" name="imp_uid">
		<input type="hidden" name="cust_code" value="${cust.cust_code}">
		<input type="hidden" id="paydate" name="pay_date">
		<input type="hidden" name="price" value="${price}">
		<input type="hidden" name="amount" value="${price}">
		<input type="hidden" name="refund" value="${price}">
		<input type="hidden" name="cinema_code" value="${cinema_code}">
		<input type="hidden" name="theater_name" value="${theater_name}">
		<input type="hidden" name="scr_date" value="${scr_date}">
		<input type="hidden" name="scr_start" value="${scr_start}">
		<input type="hidden" id="seat" name="seat_name" >
		<input type="hidden" name="movie_code" value="${movie_code}">
	</form>

	
</div>
			
</body>
</html>