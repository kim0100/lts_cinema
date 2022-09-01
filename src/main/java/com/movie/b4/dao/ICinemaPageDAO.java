package com.movie.b4.dao;

import java.util.List;

import com.movie.b4.dto.*;


public interface ICinemaPageDAO {
		
	List<CinemaDTO> cinemaMulti();// 극장페이지 극장 리스트
	
	CinemaDTO cinemaOne(String cinema_code);//극장페이지 극장 정보
	
	List<TheaterSltDTO> theaterSlt(ScreeningDTO screeningDTO); // 극장, 날짜 선택시 영화리스트 // 극장페이지
	
	List<String> dateList(String cinema_code);//극장페이지 영화가 있는 날짜만 뽑는 날짜리스트 
	
	List<MovieDTO> movieSlt(ScreeningDTO screeningDTO);//극장, 날짜로 영화리스트 출력
	
	List<TheaterSltDTO> theaterList(ScreeningDTO screeningDTO);//영화, 극장, 날짜로 상영관 리스트 출력
	
	List<TimeSeatDTO> timeList(ScreeningDTO screeningDTO);// 영화 상영시간 뽑기
}
