<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="resources/img/icon72x72.png" type="image/png" />
<title>좌석 선택</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="resources/css/style.css">
<link type="text/css" rel="stylesheet" href="resources/css/button.css">
<link type="text/css" rel="stylesheet" href="resources/css/page/seat.css">

</head>
<body>
<script>
        // html 이 다 로딩된 후 실행
        $(document).ready(function() {
        	//이미 예약된 좌석 클래스 변경
        	var list = [];
        	<c:forEach var="list" items="${MAP.BOOKLIST}">
        		list.push('${list}');
        	</c:forEach>
        	for(var i=0; i<list.length; i++)
        	{
        		$('#'+ list[i]).attr('class','bookSeat');
        		$('#'+ list[i]).attr("onclick", "return false;");
        	}
            //선택된 인원이 없을시 체크박스 선택못하게
            $(":checkbox").attr("disabled", "disabled");

         	//일반 클릭
            $(document).on('click', '.adult', function(){ 
            	$('#select_btn2').attr('class','select_btn');
            	for(var i=1; i<7; i++)
            	{
            		if($('#youth'+i).hasClass("youth_select")==false)
            			$('#youth'+i).attr('class','youth'); 
            		if($('#senior'+i).hasClass("senior_select")==false)
            			$('#senior'+i).attr('class','senior');	
            	} 
            	$(this).attr('class', 'adult_select');
        		$('.adult_select').not($(this)).attr('class', 'adult');
                $(":checkbox").removeAttr("disabled");
                $(":checkbox").prop("checked", false);
                var html = '';
                var adult=$(".adult_select").data("code");
                var youth=$(".youth_select").data("code");
                var senior=$(".senior_select").data("code");
            	var person = adult+senior+youth;
			    if(person==0)
                	$(":checkbox").attr("disabled", "disabled");
			    else
			    	html += '<div class="black_boxt6" id="person_text"><div class="black_Btext1">'+person+'명</div></div>';
                $('#person_text').empty();
                $('#person_text').append(html);
                $('#seat_text').empty();
                if(youth==0&&senior==0)
                {
                	for(var i=0; i<adult; i++)
                	{
                		var j=6-i;
                		$('#youth'+j).attr('class','dis'); 
                    	$('#senior'+j).attr('class','dis');
                	} 
                }
                else if(!youth==0&&senior==0)
                {
                	for(var i=0; i<adult+youth; i++)
                	{
                		var j=6-i;
                    	$('#senior'+j).attr('class','dis');
                	} 
                	for(var i=0; i<adult; i++)
                	{
                		var j=6-i;
                		$('#youth'+j).attr('class','dis'); 
                	} 
                }
                else if(!senior==0&&youth==0)
                {
                	for(var i=0; i<adult; i++)
                	{
                		var j=6-i;
                    	$('#senior'+j).attr('class','dis');
                	} 
                	for(var i=0; i<adult+senior; i++)
                	{
                		var j=6-i;
                		$('#youth'+j).attr('class','dis'); 
                	} 
                }
                else
                {
                  	for(var i=0; i<adult+youth; i++)
                	{
                		var j=6-i;
                    	$('#senior'+j).attr('class','dis');
                	} 
                	for(var i=0; i<adult+senior; i++)
                	{
                		var j=6-i;
                		$('#youth'+j).attr('class','dis'); 
                	} 
                }	
          	});
          	//청소년 클릭
            $(document).on('click', '.youth', function(){ 
            	$('#select_btn2').attr('class','select_btn');
            	for(var i=1; i<7; i++)
            	{
            		if($('#adult'+i).hasClass("adult_select")==false)
            			$('#adult'+i).attr('class','adult'); 
            		if($('#senior'+i).hasClass("senior_select")==false)
            			$('#senior'+i).attr('class','senior');	
            	} 
        		$(this).attr('class', 'youth_select');
        		$('.youth_select').not($(this)).attr('class', 'youth');
                $(":checkbox").removeAttr("disabled");
                $(":checkbox").prop("checked", false);
                var html = '';
                var adult=$(".adult_select").data("code");
                var youth=$(".youth_select").data("code");
                var senior=$(".senior_select").data("code");
            	var person = adult+senior+youth;
			    if(person==0)
                	$(":checkbox").attr("disabled", "disabled");
			    else
			    	html += '<div class="black_boxt6" id="person_text"><div class="black_Btext1">'+person+'명</div></div>';
                $('#person_text').empty();
                $('#person_text').append(html);
                $('#seat_text').empty();
                if(adult==0&&senior==0)
                {
                	for(var i=0; i<youth; i++)
                	{
                		var j=6-i;
                		$('#adult'+j).attr('class','dis'); 
                    	$('#senior'+j).attr('class','dis');
                	} 
                }
                else if(!adult==0&&senior==0)
                {
                	for(var i=0; i<youth+adult; i++)
                	{
                		var j=6-i;
                    	$('#senior'+j).attr('class','dis');
                	} 
                	for(var i=0; i<youth; i++)
                	{
                		var j=6-i;
                		$('#adult'+j).attr('class','dis'); 
                	} 
                }
                else if(!senior==0&&adult==0)
                {
                	for(var i=0; i<youth; i++)
                	{
                		var j=6-i;
                    	$('#senior'+j).attr('class','dis');
                	} 
                	for(var i=0; i<youth+senior; i++)
                	{
                		var j=6-i;
                		$('#adult'+j).attr('class','dis'); 
                	} 
                }
                else
                {
                  	for(var i=0; i<youth+adult; i++)
                	{
                		var j=6-i;
                    	$('#senior'+j).attr('class','dis');
                	} 
                	for(var i=0; i<youth+senior; i++)
                	{
                		var j=6-i;
                		$('#adult'+j).attr('class','dis'); 
                	} 
                }
          	});
          	//우대 클릭
            $(document).on('click', '.senior', function(){ 
            	$('#select_btn2').attr('class','select_btn');
            	//클래스 초기화
            	for(var i=1; i<7; i++)
            	{
            		if($('#adult'+i).hasClass("adult_select")==false)
            			$('#adult'+i).attr('class','adult'); 
            		if($('#youth'+i).hasClass("youth_select")==false)
            			$('#youth'+i).attr('class','youth');	
            	} 
            	//클릭한거 클릭 클래스로 변경
        		$(this).attr('class', 'senior_select');
            	//클릭한거 제외 나머지 클래스 변경
        		$('.senior_select').not($(this)).attr('class', 'senior');
                //좌석선택 가능하게
            	$(":checkbox").removeAttr("disabled");
                //좌석 체크 되어있는거 초기화
                $(":checkbox").prop("checked", false);
                var html = '';
                var adult=$(".adult_select").data("code");
                var youth=$(".youth_select").data("code");
                var senior=$(".senior_select").data("code");
            	var person = adult+senior+youth;
			    if(person==0)
                	$(":checkbox").attr("disabled", "disabled");
			    else
			    	html += '<div class="black_boxt6" id="person_text"><div class="black_Btext1">'+person+'명</div></div>';
                $('#person_text').empty();
                $('#person_text').append(html);
                $('#seat_text').empty();
                if(adult==0&&youth==0)
                {
                	for(var i=0; i<senior; i++)
                	{
                		var j=6-i;
                		$('#adult'+j).attr('class','dis'); 
                    	$('#youth'+j).attr('class','dis');
                	} 
                }
                else if(!adult==0&&youth==0)
                {
                	for(var i=0; i<senior+adult; i++)
                	{
                		var j=6-i;
                    	$('#youth'+j).attr('class','dis');
                	} 
                	for(var i=0; i<senior; i++)
                	{
                		var j=6-i;
                		$('#adult'+j).attr('class','dis'); 
                	} 
                }
                else if(!youth==0&&adult==0)
                {
                	for(var i=0; i<senior; i++)
                	{
                		var j=6-i;
                    	$('#youth'+j).attr('class','dis');
                	} 
                	for(var i=0; i<senior+youth; i++)
                	{
                		var j=6-i;
                		$('#adult'+j).attr('class','dis'); 
                	} 
                }
                else
                {
                  	for(var i=0; i<senior+adult; i++)
                	{
                		var j=6-i;
                    	$('#youth'+j).attr('class','dis');
                	} 
                	for(var i=0; i<senior+youth; i++)
                	{
                		var j=6-i;
                		$('#adult'+j).attr('class','dis'); 
                	} 
                }
          	});
            function fillZero(width, str){
                return str.length >= width ? str:new Array(width-str.length+1).join('0')+str;//남는 길이만큼 0으로 채움
            }
          	
         	// 좌석 클릭
            $(":checkbox").change(function() {
                var adult=$(".adult_select").data("code");
                var youth=$(".youth_select").data("code");
                var senior=$(".senior_select").data("code");
            	var cnt = adult+senior+youth;
                // 셀렉트박스의 값과 체크박스중 체크된 갯수가 같을때, 다른 체크박스들을 disable 처리
                if( cnt==$(":checkbox:checked").length ) {
                	$('#select_btn2').attr('class','select_btn2');
                    $(":checkbox:not(:checked)").attr("disabled", "disabled");
                	
                }
                
                // 체크된 갯수가 다르면 활성화 시킴
                else {
                	$('#select_btn2').attr('class','select_btn');
                    $(":checkbox").removeAttr("disabled");
                }
                let seat = [];

                $(":checkbox:checked").each(function() {
                	var val=$(this).val();
                	seat.push(val);
                });
                var html = '';
                html += '<div class="black_boxt7">좌석</div>';
                html += '<div class="black_Btext2">'+seat+'</div>';
                if(adult>0)
                {
                	var old="일반";
                	var price=12000;
                	html += '<div class="black_Btext3">'+old+'</div>';
                    html += '<div class="black_Btext4">'+price+' x '+adult+'</div>';
                }
                if(youth>0)
                {
                	var old="청소년";
                	var price=10000;
                	html += '<div class="black_Btext5">'+old+'</div>';
                    html += '<div class="black_Btext6">'+price+' x '+youth+'</div>';
                }
                if(senior>0)
                {
                	var old="우대";
                	var price=8000;
                	html += '<div class="black_Btext7">'+old+'</div>';
                    html += '<div class="black_Btext8">'+price+' x '+senior+'</div>';
                }
                var price=8000*senior+10000*youth+12000*adult;

                html += '<div class="black_Btext9">총금액</div>';
                html += '<div class="black_Btext10">'+price+' 원</div>';
                $('#seat_text').empty();
                $('#seat_text').append(html);
                
            });
            //영화선택 버튼 클릭
            $(document).on('click', '#cancel_btn', function(){ 
            	location.href="bookPage";
          	});
            //결제하기 버튼 클릭
            $(document).on('click', '#select_btn2', function(){ 
            	var seat_name = [];
                $(":checkbox:checked").each(function() {
                	var val=$(this).val();
                	seat_name.push(val);
                });
                var adult=$(".adult_select").data("code");
                var youth=$(".youth_select").data("code");
                var senior=$(".senior_select").data("code");
            	var cnt = adult+senior+youth;
            	var price=8000*senior+10000*youth+12000*adult;
                if(cnt==$(":checkbox:checked").length&&cnt>0 ) 
                {
                	var scr_start=${scr_start};
                	scr_start=scr_start.toString().padStart(4, '0');
                	location.href="paymentPage?cinema_code="+${cinema_code}+"&theater_name="+${theater_name}+"&movie_code="+${movie_code}+"&scr_date="+${scr_date}+"&scr_start="+scr_start+"&seat_name="+seat_name+"&price="+price;
                }
                else
                {
                	alert('좌석을 선택해 주세요');
                }
          	});
        });
    </script>
	<jsp:include page="menu.jsp">
         <jsp:param name="param1" value="1"/>
    </jsp:include>

	<div class="main">
		<section class="chart">
		<button class="reset" id=reset_btn onClick="window.location.reload()">좌석선택 다시하기</button>
		<img class="reset_pic" src="resources/img/reset.png" alt="">
		<div class="title_boxT">인원 / 좌석</div>
		<div class="title_box">
		<div class="rank_text">일반<br>청소년<br>우대</div>

   		<c:forEach var="i" begin="0" end="6">
  			<c:if test="${i == 0 }">
  			<span class="adult_select" data-code="${i}" id="adult${i}">
    		<span>${i}</span></span>
    		</c:if>
    		<c:if test="${i > 0 }">
  			<span class="adult" data-code="${i}" id="adult${i}">
    		<span>${i}</span></span>
    		</c:if>
  		</c:forEach><br>
  		
		<c:forEach var="i" begin="0" end="6">
			<c:if test="${i == 0 }">
  			<span class="youth_select" data-code="${i}" id="youth${i}">
    		<span>${i}</span></span>
    		</c:if>
    		<c:if test="${i > 0 }">
  			<span class="youth" data-code="${i}" id="youth${i}">
    		<span>${i}</span></span>
    		</c:if>
  		</c:forEach><br>
    
    	<c:forEach var="i" begin="0" end="6">
    		<c:if test="${i == 0 }">
  			<span class="senior_select" data-code="${i}" id="senior${i}">
    		<span>${i}</span></span>
    		</c:if>
    		<c:if test="${i > 0 }">
  			<span class="senior" data-code="${i}" id="senior${i}">
    		<span>${i}</span></span>
    		</c:if>
  		</c:forEach><br>

	</div>
	<span class="right_text">선택하신 상영관/시간<br>${MAP.THEATER.theater_name }관 (총 ${MAP.SEATTIME.seat_count }석) ${MAP.SEATTIME.scr_start.substring(0,2) }:${MAP.SEATTIME.scr_start.substring(2,4) } - ${MAP.SEATTIME.scr_end.substring(0,2)}:${MAP.SEATTIME.scr_end.substring(2,4)} (잔여 ${MAP.SEATTIME.empty_seat }석)</span>
	<div class="icon_sel"></div>
	<div class="icon_tic"></div>
	<div class="icon_normal"></div>
	<div class="icon_disa"></div>
	<div class="icon_text">선택<br>예매완료<br>일반석<br>장애인석</div>
	
	</section>
		<div class="screen">SCREEN</div>
		<div class="main_box">
			<table class="ch_table">
			<c:set var="x" value="${MAP.THEATER.seat_y}" />
			<c:set var="y" value="0"/>
				<c:forEach var="list" items="${MAP.SEATLIST}">
					<c:if test="${y%x == 0 }">
					<tr>
					</c:if>
						<td>
							<label class="butt_obj">
									<c:if test="${y%x == 0 }">
										<span class="chairT">${list.seat_name.substring(0,1)}</span>
									</c:if>
									<c:if test="${list.use_check eq 'N'.charAt(0) }">
										<span class="seat_ghost"></span>
									</c:if>
									<c:if test="${list.use_check eq 'Y'.charAt(0) }">
										<input type="checkbox" value="${list.seat_name}">
										<c:if test="${list.grade eq '1'.charAt(0) }">
											<span class="seat" id="${list.seat_name}">${list.seat_name.substring(1)}</span>
										</c:if>
										<c:if test="${list.grade eq '2'.charAt(0) }">
											<span class="disability" id="${list.seat_name}">${list.seat_name.substring(1)}</span>
										</c:if>
									</c:if>
									
							</label>
						</td>
					<c:if test="${y%x == x-1 }">	
					</tr>
					</c:if>
					<c:set var="y" value="${y+1 }" />
				</c:forEach>
			</table>
			<br>
		</div>
		<section class="black_box">
	<div class="cancel_btn" id="cancel_btn"><br><br><br>영화선택</div>
	<img class="pic" src="${MAP.MOVIE_POSTER }" alt="">
	<div class="black_boxt1"><div class="black_Btext1"><br>${MAP.MOVIE_NAME }<br><br><br>${MAP.MOVIE_GRADE } 관람가</div></div>
	<div class="black_boxt2"><div class="black_Btext1"><br>극장<br>일시<br>상영관<br>인원</div></div>
	<div class="black_boxt3"><div class="black_Btext1"><br> CGV 대구스타디움<br> ${scr_date.substring(0,4)}.${scr_date.substring(4,6)}.${scr_date.substring(6,8)} ${scr_start.substring(0,2)}:${scr_start.substring(2,4)}<br> ${theater_name}관<br></div></div>
	<div id="person_text"><div class="black_Btext1"></div></div>
	<img class="pic2" src="resources/img/arrow.png" alt="">
	<div class="black_boxt4" id="seat_text">좌석선택</div>
	<img class="pic4" src="resources/img/arrow.png" alt="">
	<img class="pic5" src="resources/img/arrow.png" alt="">
	<img class="pic6" src="resources/img/arrow.png" alt="">
	<img class="pic7" src="resources/img/arrow.png" alt="">
	<img class="pic8" src="resources/img/arrow.png" alt="">
	<img class="pic9" src="resources/img/arrow.png" alt="">
	<div class="select_btn" id="select_btn2"><br><br><br>결제선택</div>
	
	</section>
</div>
			
</body>
</html>