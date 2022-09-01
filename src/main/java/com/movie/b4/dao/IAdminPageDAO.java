package com.movie.b4.dao;

import java.util.List;

import com.movie.b4.dto.CinemaDTO;
import com.movie.b4.dto.CountDTO;
import com.movie.b4.dto.CustomerDTO;
import com.movie.b4.dto.MovieDTO;
import com.movie.b4.dto.PageDTO;
import com.movie.b4.dto.ScreenListDTO;
import com.movie.b4.dto.ScreeningDTO;
import com.movie.b4.dto.SeatDTO;
import com.movie.b4.dto.TheaterDTO;

public interface IAdminPageDAO {

	List<CinemaDTO> cinemaPageList(PageDTO pageDTO); //관리자페이지 극장 전체조회 (페이징처리)
	
	List<CinemaDTO> cinemaList();// 극장페이지 극장 리스트
	
	List<CustomerDTO> cstList(PageDTO pageDTO);//관리자페이지 고객 전체조회(페이징처리)
	
	List<ScreenListDTO> screeningList(PageDTO pageDTO, ScreeningDTO screeningDTO);// 극장,상영관 선택 후 관리자페이지 상영일정 전체출력
	
	List<MovieDTO> moviePageList(PageDTO pageDTO);//관리자에서 전부 출력  수정해야함!!!!!!(페이징)
	
	List<MovieDTO> movieList();// 상영일정페이지 영화이름,코드 추출
	
	List<String> movieUpcode(); // 영화업데이트시 어제날짜 예약 영화 추출
	
	List<TheaterDTO> theaterList(String cinema_code);//관리자페이지 전체조회
	
	List<SeatDTO> seatList(SeatDTO seatDTO);//극장, 상영관코드로 좌석출력(좌석페이지, 관리자페이지)
	
	List<CustomerDTO> sltCust(String cust_id); // 관리자페이지  id로 고객정보 찾기
	
	void seatAlldelete(SeatDTO seatDTO);  // 상영관 행열 변경시 삭제;
	
	int count(CountDTO countDTO); // 전체회원수   페이징처리시 
	
	int conditionCount(CountDTO countDTO); // 극장, 상영관 선택 후 상영일정수 페이징처리
	
	int deleteCinemaAjax(String cinema_code); // 극장삭제시 상영관존재여부 확인용
	
	int deleteTheaterAjax(String theater_name); // 상영관 삭제시 좌석 존재 여부 확인용
	
	int deleteScrAjax(ScreeningDTO screeningDTO); // 상영일정 삭제시 예약여부 확인용
}
