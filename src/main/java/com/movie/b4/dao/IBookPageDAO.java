package com.movie.b4.dao;

import java.util.List;

import com.movie.b4.dto.BookSeatDTO;
import com.movie.b4.dto.CinemaDTO;
import com.movie.b4.dto.CustomerDTO;
import com.movie.b4.dto.MovieDTO;
import com.movie.b4.dto.ScreeningDTO;
import com.movie.b4.dto.TheaterDTO;

public interface IBookPageDAO {
	
	List<MovieDTO> movieList(); // 예매페이지 , 현재,미래 상영일정에 있는 차트 순 영화리스트
	
	List<CinemaDTO> cinemaList();//예매페이지 , 현재, 미래 상영일정에 있는 극장리스트
	
	List<String> dateList();//예매페이지 , 현재,미래 상영일정에 있는 날짜리스트
	
	//아무것도 없을때 리스트
	ScreeningDTO sltCinema(String cinema_code);//극장선택했을때 영화, 날짜 //예매페이지
	ScreeningDTO sltMovie(String movie_code);//영화선택했을때 극장, 날짜 //예매페이지
	ScreeningDTO sltDate(String scr_date);//날짜선택했을때 극장, 영화 //예매페이지

	//영화가 선택됐을때 극장 선택
	ScreeningDTO mSltCinemaMovie(String cinema_code);//영화가 선택된 상황에서 극장선택했을때 영화 리스트 //예매페이지
	
	//영화가 선택됐을때 날짜 선택
	ScreeningDTO mSltDateMovie(String scr_date);//영화가 선택된 상황에서 날짜선택했을때 영화 리스트 //예매페이지
	
	//극장이 선택됐을때 영화 선택
	ScreeningDTO cSltMovieCinema(String movie_code);//극장이 선택된 상황에서 영화선택했을때 극장 리스트 //예매페이지
	
	//극장이 선택됐을때 날짜 선택
	ScreeningDTO cSltDateCinema(String scr_date);//극장이 선택된 상황에서 날짜선택했을때 극장 리스트 //예매페이지
		
	//날짜가 선택됐을때 영화선택
	ScreeningDTO dSltMovieDate(String movie_code);//날짜가 선택된 상황에서 영화선택했을때 날짜 리스트 //예매페이지
		
	//날짜가 선택됐을때 극장선택
	ScreeningDTO dSltCinemaDate(String cinema_code);//날짜가 선택된 상황에서 극장선택했을때 날짜 리스트 //예매페이지
	
	ScreeningDTO sltMC(ScreeningDTO screeningDTO);//영화, 극장선택했을때 날짜 //예매페이지

	ScreeningDTO sltMD(ScreeningDTO screeningDTO);//영화, 날짜선택했을때 극장 //예매페이지
	
	ScreeningDTO sltCD(ScreeningDTO screeningDTO);//극장, 날짜선택했을때 영화  //예매페이지
	
	List<ScreeningDTO> timeList(ScreeningDTO screeningDTO); // 영화,극장,날짜를 선택했을때 시간,상영관 리스트  // 예매페이지
	
	int countSeat1(TheaterDTO seatDTO);//총 좌석수 (예매페이지, 극장페이지)
	
	int countSeat2(BookSeatDTO bookDTO);// 현재 예약되어있는 좌석수 (예매페이지)
	
	String tkCodeMax(CustomerDTO customerDTO); // 고객 티켓번호 최대값+1 (예매페이지)
}
