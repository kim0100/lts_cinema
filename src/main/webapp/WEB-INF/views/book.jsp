<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="resources/img/icon72x72.png" type="image/png" />
<title>무비 차트</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="resources/css/style.css">
<link type="text/css" rel="stylesheet" href="resources/css/button.css">
<link type="text/css" rel="stylesheet" href="resources/css/ico.css">
<link type="text/css" rel="stylesheet" href="resources/css/page/book.css">
</head>
<body>
	<jsp:include page="menu.jsp">
         <jsp:param name="param1" value="1"/>
    </jsp:include>

	<div class="main">
		<section class="chart">
		<a href="bookPage"><button class="reset" id=reset_btn>예매 다시하기</button>
		<img class="reset_pic" src="resources/img/reset.png" alt=""></a>	
		<div class="movie_boxT">영화</div>
		<ul class="movie_box">
    	
    	<c:forEach var="movielist" items="${BOOKLIST.MOVIELIST}">
    	<li class="movie" id="mv${movielist.movie_code}" data-code="${movielist.movie_code}">
    		<c:if test="${movielist.movie_grade eq 12 }"><span id="ico_12" >12</span></c:if>
		    <c:if test="${movielist.movie_grade eq 15 }"><span id="ico_15" >15</span></c:if>
			<c:if test="${movielist.movie_grade eq 19 }"><span id="ico_18" >청불</span></c:if>
			<c:if test="${movielist.movie_grade eq 0 }"><span id="ico_all" >전체</span></c:if>
			${movielist.movie_name}
    	</li>
    	</c:forEach>					

		</ul>
		
		<div class="theater_boxT">극장</div>
		<ul class="theater_box">
		<c:forEach var="cinemalist" items="${BOOKLIST.CINEMALIST}">
		<li class="theater" id="ci${cinemalist.cinema_code}" data-name="${cinemalist.cinema_name}" data-code="${cinemalist.cinema_code}">
    		${cinemalist.cinema_name}
    	</li>	
		</c:forEach>
		</ul>
		<div class="date_boxT">날짜</div>
		<ul class="date_box">
		<c:set var="year" value="2022"/>
		<c:set var="month" value="02"/>
		<c:forEach var="datelist" items="${BOOKLIST.DATELIST}" varStatus="status">
		<c:if test="${status.count==1}">
		<div class="date_year" >
    		 ${datelist.substring(0,4)}
    	</div>
    	<div class="date_month" >
    		 ${datelist.substring(4,6)}
    	</div>
		</c:if>
		<c:if test="${datelist.substring(0,4) ne year}">
			<div class="date_year" >
    		 	${datelist.substring(0,4)}
    		</div>
		</c:if>
		<c:if test="${datelist.substring(4,6) ne month}">
			<div class="date_month" >
    		 ${datelist.substring(4,6)}
    		</div>
		</c:if>
		<li class="date" id="da${datelist}" data-code="${datelist}">
    		 ${datelist.substring(6,8)}
    	</li>
    	<c:set var="year" value="${datelist.substring(0,4)}"/>
    	<c:set var="month" value="${datelist.substring(4,6)}"/>
    	</c:forEach>		

		</ul>
		<script type="text/javascript">
			
			$(document).ready(function(){
				$("#mv${movie_code}").trigger('click');
				$("#ci${cinema_code}").trigger('click');
				$("#da${scr_date}").trigger('click');
				setTimeout(function(){
					$("#ti${scr_start}").trigger('click');
				},200)
			});
			//영화클릭
			$(document).on('click', '.movie', function(){ 
				$(this).attr('class', 'movie_select');
				$('.movie_select').not($(this)).attr('class', 'movie');
				var movie_code = $('.movie_select').data("code");
			    var cinema_code = $('.theater_select').data("code");
			    var scr_date = $('.date_select').data("code");
			    var url = "movieSlt";

				$.getJSON(url, {"movie_code":movie_code,"cinema_code":cinema_code, "scr_date":scr_date }, function(json) {
			  		//결과가 전달되는 파라미터에 읽어온 데이터가 담겨 있으며
			   		//JSON 이므로 별도의 추출 과정 없이 점(.) 으로 데이터 계층을 연결하여 사용할수 있다.
			   		var movie_code = json.movie_code;
			   		var movie_name = json.movie_name;
			   		var movie_poster = json.movie_poster;	
			   		var movie_grade = json.movie_grade;
			   		var html = '';
			   		html += '<img class="pic" src="'+movie_poster+'" alt="">';
			   		html += '<div class="black_boxt1"><div class="black_Btext1" ><br><a href="movieOne?movie_code='+movie_code+'" style="color: white">'+movie_name+'</a><br><br><br>'+movie_grade+'관람가</div></div>';
			   		$('#movieInfo *').remove();
			   		$('#movieInfo').append(html);
			   		var cinemaList = json.cinema_list;
			   		var dateList = json.date_list;
			   		
			   		$('.theater_box li').each( function() {
			   			if($(this).attr('class')!='theater_select')
		   				{
			   				$(this).attr('class', 'theater_ghost');
		   				}
				   		for(var i=0; i<cinemaList.length; i++)
			   			{
			   				if($(this).data("code")==cinemaList[i])
			   				{
			   					if($(this).attr('class')!='theater_select')
				   				{
			   						$(this).attr('class', 'theater');
				   				}
			   				}
			   			}
			   	    });
			   			
			   		$('.date_box li').each( function() {
			   			if($(this).attr('class')!='date_select')
		   				{
			   				$(this).attr('class', 'date_ghost');
		   				}
				   		for(var i=0; i<dateList.length; i++)
			   			{
			   				if($(this).data("code")==dateList[i])
			   				{
			   					if($(this).attr('class')!='date_select')
				   				{
			   						$(this).attr('class', 'date');
				   				}
			   				}
			   			}
			   	    });
			   		
			   		if($('.theater_box li').hasClass('theater_select')&&$('.date_box li').hasClass('date_select'))
					{
			   			var list = json.List;
			   			var h = '';
			   			h += '<ul>';
			   			for(var i=0; i<list.length; i++)
			   			{
			   				h += '<li class="movie_room"> '+list[i].THEATER.theater_name+'관 <span class="total_chair">(총 '+list[i].THEATER.seatcount+'석)</span>'
			   				h += '<ul>'
			   				for(var j=0; j<list[i].TIME.length; j++)
			   				{
			   					var hour = list[i].TIME[j].scr_start.toString().substring(0,2)
			   					var minute = list[i].TIME[j].scr_start.toString().substring(2,4)
			   					h += '<li class="movie_tb"> <span class="movie_time" id="ti'+list[i].TIME[j].scr_start+'" data-code="'+list[i].THEATER.theater_name+'" data-time="'+list[i].TIME[j].scr_start+'">'+hour+':'+minute+'</span><span class="movie_time_chair">'+list[i].TIME[j].empty_seat+'석</span></li>'
			   				}
			   				h += '</ul>'
			   				h += '</li>'
			   			}
			   			h += '</ul>';
			   			$('#time_box').empty();
			   			$('#time_box').append(h);
					}
			   	});
		   	});
			//극장클릭
			$(document).on('click', '.theater', function(e){ 

				$(this).attr('class', 'theater_select');
			    $('.theater_select').not($(this)).attr('class', 'theater');
			    var cinema_code = $('.theater_select').data("code");
			    var cinema_name = $('.theater_select').data("name");
			    var movie_code = $('.movie_select').data("code");
			    var scr_date = $('.date_select').data("code");
			    var url = "cinemaSlt";

				$.getJSON(url, {"movie_code":movie_code,"cinema_code":cinema_code, "scr_date":scr_date}, function(json) {
		   			//html 뿌리기
		   			var html = '';
		   			html += '<div class="black_boxt2"><div class="black_Btext1" id="row_text"><br>극장<br>일시<br>상영관<br>인원</div></div>';
		   			html += '<div class="black_boxt3"><div class="black_Btext1" id="cinema_text"><br><a href="cinemaPage?cinema_code='+cinema_code+'" style="color: white"> '+cinema_name+'</a></div></div>';
		   			$('.black_boxt7').remove();
		   			$('#cinemaInfo #cinema_text').remove();
		   			$('#cinemaInfo #row_text').remove();
		   			$('#cinemaInfo').append(html);
			   		
		   			var movieList = json.movie_list;
		   			var dateList = json.date_list;
		   		
		   			$('.movie_box li').each( function() {
		   				if($(this).attr('class')!='movie_select')
		   					{
		   						$(this).attr('class', 'movie_ghost');
		   					}
			   			for(var i=0; i<movieList.length; i++)
		   				{
		   					if($(this).data("code")==movieList[i])
		   					{
		   						if($(this).attr('class')!='movie_select')
			   					{
		   							$(this).attr('class', 'movie');
			   					}
		   					}
		   				}
		   	        });
		   			
		   			$('.date_box li').each( function() {
		   				if($(this).attr('class')!='date_select')
	   					{
		   					$(this).attr('class', 'date_ghost');
	   					}
			   			for(var i=0; i<dateList.length; i++)
		   				{
		   					if($(this).data("code")==dateList[i])
		   					{
		   						if($(this).attr('class')!='date_select')
			   					{
		   							$(this).attr('class', 'date');
			   					}
		   					}
		   				}
		   	        });
		   			if($('.movie_box li').hasClass('movie_select')&&$('.date_box li').hasClass('date_select'))
					{
			   			var list = json.List;
			   			var h = '';
			   			h += '<ul>';
			   			for(var i=0; i<list.length; i++)
			   			{
			   				h += '<li class="movie_room"> '+list[i].THEATER.theater_name+'관 <span class="total_chair">(총 '+list[i].THEATER.seatcount+'석)</span>'
			   				h += '<ul>'
			   				for(var j=0; j<list[i].TIME.length; j++)
			   				{
			   					var hour = list[i].TIME[j].scr_start.toString().substring(0,2)
			   					var minute = list[i].TIME[j].scr_start.toString().substring(2,4)
			   					h += '<li class="movie_tb"> <span class="movie_time" id="ti'+list[i].TIME[j].scr_start+'" data-code="'+list[i].THEATER.theater_name+'" data-time="'+list[i].TIME[j].scr_start+'">'+hour+':'+minute+'</span><span class="movie_time_chair">'+list[i].TIME[j].empty_seat+'석</span></li>'
			   				}
			   				h += '</ul>'
			   				h += '</li>'
			   			}
			   			h += '</ul>';
			   			$('#time_box').empty();
			   			$('#time_box').append(h);
					}
		   		});
			});
			//날짜클릭
			$(document).on('click', '.date', function(e){ 
				$(this).attr('class', 'date_select');
				$('.date_select').not($(this)).attr('class', 'date');
			    var scr_date = $('.date_select').data("code");
				var movie_code = $('.movie_select').data("code");
				var cinema_code = $('.theater_select').data("code");
				//년
			    var year = scr_date.toString().substring(0,4);
			    //월
			    var month = scr_date.toString().substring(4,6);
			    //일
			    var day = scr_date.toString().substring(6,8);
				   
			    var url = "dateSlt";

				$.getJSON(url, {"movie_code":movie_code,"cinema_code":cinema_code, "scr_date":scr_date}, function(json) {
					//html 뿌리기
				    var html = '';
				    html += '<div class="black_boxt2"><div class="black_Btext1" id="row_text"><br>극장<br>일시<br>상영관<br>인원</div></div>';
				    html += '<div class="black_boxt3"><div class="black_Btext1" id="date_text"><br><br> '+year+'.'+month+'.'+day+'</div></div>';
				    $('.black_boxt7').remove();
			 	    $('#cinemaInfo #date_text').remove();
				    $('#cinemaInfo #row_text').remove();
				    $('#cinemaInfo').append(html);
				   		
			   		var movieList = json.movie_list;
			   		var cinemaList = json.cinema_list;
			   		
			   		$('.movie_box li').each( function() {
			   			if($(this).attr('class')!='movie_select')
			   			{
			   				$(this).attr('class', 'movie_ghost');
			   			}
				   		for(var i=0; i<movieList.length; i++)
			   			{
			   				if($(this).data("code")==movieList[i])
			   				{
			   					if($(this).attr('class')!='movie_select')
				   				{
			   						$(this).attr('class', 'movie');
				   				}
			   				}
			   			}
			   	    });
			   		$('.theater_box li').each( function() {
			   			if($(this).attr('class')!='theater_select')
		   				{
			   				$(this).attr('class', 'theater_ghost');
		   				}
				   		for(var i=0; i<cinemaList.length; i++)
			   			{
			   				if($(this).data("code")==cinemaList[i])
			   				{
			   					if($(this).attr('class')!='theater_select')
				   				{
			   						$(this).attr('class', 'theater');
				   				}
			   				}
			   			}
			   	    });
			   		if($('.theater_box li').hasClass('theater_select')&&$('.movie_box li').hasClass('movie_select'))
					{
			   			var list = json.List;
			   			var h = '';
			   			h += '<ul>';
			   			for(var i=0; i<list.length; i++)
			   			{
			   				h += '<li class="movie_room"> '+list[i].THEATER.theater_name+'관 <span class="total_chair">(총 '+list[i].THEATER.seatcount+'석)</span>'
			   				h += '<ul>'
			   				for(var j=0; j<list[i].TIME.length; j++)
			   				{
			   					var hour = list[i].TIME[j].scr_start.toString().substring(0,2)
			   					var minute = list[i].TIME[j].scr_start.toString().substring(2,4)
			   					h += '<li class="movie_tb"> <span class="movie_time" id="ti'+list[i].TIME[j].scr_start+'" data-code="'+list[i].THEATER.theater_name+'" data-time="'+list[i].TIME[j].scr_start+'">'+hour+':'+minute+'</span><span class="movie_time_chair">'+list[i].TIME[j].empty_seat+'석</span></li>'
			   				}
			   				h += '</ul>'
			   				h += '</li>'
			   				
			   			}
			   			h += '</ul>';
			   			$('#time_box').empty();
			   			$('#time_box').append(h);
					}
			   	});
			});

		</script>
		<div class="time_boxT">시간</div>
		<div class="time_box" id="time_box">
			<span class="time_text">영화, 극장, 날짜를 선택해주세요.</span>
		</div>
	
	</section>
	<section class="black_box">
	<div id="movieInfo">
	<div class="black_boxt6">영화선택</div>
	</div>
	<div id="cinemaInfo">
	<div class="black_boxt7">극장선택</div>
	</div>
	
	<img class="pic2" src="resources/img/arrow.png" alt="">
	<div class="black_boxt4">좌석선택</div>
	<img class="pic3" src="resources/img/arrow.png" alt="">
	<span class="black_boxt5">결제</span>
	<img class="pic4" src="resources/img/arrow.png" alt="">
	<img class="pic5" src="resources/img/arrow.png" alt="">
	<img class="pic6" src="resources/img/arrow.png" alt="">
	<div class="select_btn" id="select_btn"><br><br><br>좌석선택</div>
	<script type="text/javascript">
	$(document).on('click', '.movie_time', function(e){ 
		$(this).attr('class', 'movie_time_sel');
		$('.movie_time_sel').not($(this)).attr('class', 'movie_time');
		$("#select_btn").attr('class', 'select_btn2');
		var therater = $('.movie_time_sel').data("code");
		var html = '';
	    html += '<div class="black_boxt2"><div class="black_Btext1" id="row_text"><br>극장<br>일시<br>상영관<br>인원</div></div>';
	    html += '<div class="black_boxt3"><div class="black_Btext1" id="theater_text"><br><br><br> '+therater+'관<br></div></div>';
	    $('.black_boxt7').remove();
 	    $('#cinemaInfo #theater_text').remove();
	    $('#cinemaInfo #row_text').remove();
	    $('#cinemaInfo').append(html);

	});
	$(document).on('click', '#select_btn', function(e){ 
		if($(this).hasClass('select_btn'))
		{
			if(!$('.movie_box li').hasClass('movie_select'))
			{
				alert('영화를 선택해 주세요');
			}
			else if(!$('.theater_box li').hasClass('theater_select'))
			{
				alert('극장을 선택해 주세요');
			}
			else if(!$('.date_box li').hasClass('date_select'))
			{
				alert('날짜를 선택해 주세요');
			}
			else if(!$('.movie_time span').hasClass('date_select'))
			{
				alert('시간을 선택해 주세요');
			}	
		}
		
		else if($(this).hasClass('select_btn2'))
		{
			<c:if test="${empty cust}">
			 	if (confirm("로그인이 필요한 서비스 입니다. 로그인 페이지로 이동하시겠습니까?") == true){    //확인
			 		location.href = "loginPage";
			 	}else{   //취소
			     	return false;
			 	}
			</c:if>
			<c:if test="${not empty cust}">
				var scr_date = $('.date_select').data("code");
				var movie_code = $('.movie_select').data("code");
				var cinema_code = $('.theater_select').data("code");
				var theater_name = $('.movie_time_sel').data("code");
				var scr_start = $('.movie_time_sel').data("time");
				location.href = "seatPage?cinema_code="+cinema_code+"&movie_code="+movie_code+"&theater_name="+theater_name+"&scr_date="+scr_date+"&scr_start="+scr_start;
			</c:if>
		}
		
	});

	</script>
	</section>

	
</div>
			
</body>
</html>