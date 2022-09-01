package com.movie.b4.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.movie.b4.dto.CinemaDTO;
import com.movie.b4.dto.CustomerDTO;
import com.movie.b4.dto.PageDTO;
import com.movie.b4.dto.ScreeningDTO;
import com.movie.b4.dto.SeatDTO;
import com.movie.b4.dto.TheaterDTO;
import com.movie.b4.dto.TicketCustDTO;

public interface IAdminService {
	
	//관리자페이지 영화전체조회(페이징처리)
	ModelAndView moviePageList(PageDTO pageDTO);
	
	//관리자페이지 영화정보추가
//	ModelAndView movieInsert() throws Exception; 
	
	// 관리자페이지 영화정보 수정
	ModelAndView movieUpdate() throws Exception;
	
	// 관리자페이지 영화정보 삭제
/*	String movieDelete(String movie_code) throws Exception; */
	
	// 관리자페이지 상영관,상영일정,좌석관리에서 처음에 출력할 극장이름!!
	List<CinemaDTO> cinemaList();
	
	//관리자페이지 극장전체조회(페이징처리)
	ModelAndView cinemaPageList(PageDTO pageDTO);
	
	// 관리자페이지 극장추가
	ModelAndView cinemaInsert(CinemaDTO cinemaDTO) throws Exception;

	// 관리자페이지 극장수정
	ModelAndView cinemaUpdate(CinemaDTO cinemaDTO, PageDTO pageDTO) throws Exception;

	// 관리자페이지 극장삭제
	ModelAndView cinemaDelete(CinemaDTO cinemaDTO, PageDTO pageDTO) throws Exception;

	// 관리자페이지 극장 선택 후 상영관 전체조회
	ModelAndView theaterList(String cinema_code);

	// 관리자페이지 상영관 등록
	ModelAndView theaterInsert(TheaterDTO theaterDTO) throws Exception;

	// 관리자페이지 상영관 수정
	ModelAndView theaterUpdate(TheaterDTO theaterDTO) throws Exception;

	// 관리자페이지 상영관 삭제
	ModelAndView theaterDelete(TheaterDTO theaterDTO) throws Exception;

	// 관리자페이지 극장,상영관 선택 후 상영일정 전체조회
	ModelAndView screeningList(PageDTO pageDTO, ScreeningDTO screeningDTO);

	// 관리자페이지 상영일정 등록
	ModelAndView screeningInsert(ScreeningDTO screeningDTO) throws Exception;
	
	// 관리자페이지 상영일정 삭제
	String screeningDelete(ArrayList<String> scrArr) throws Exception;
	
	// 관리자페이지 극장,상영관 선택 후 좌석전체조회(페이징처리)
	ModelAndView seatList(SeatDTO seatDTO);

	// 관리자페이지 좌석 단건조회
	SeatDTO seatOne(SeatDTO seatDTO);

	// 관리자페이지 좌석 등록
//	ModelAndView seatInsert(SeatDTO seatDTO) throws Exception;

	// 관리자페이지 좌석수정
	ModelAndView seatUpdate(ArrayList<String> seatName, SeatDTO seatDTO, String value) throws Exception;

	// 관리자페이지 좌석삭제
	ModelAndView seatDelete(SeatDTO seatDTO) throws Exception;

	// 관리자페이지 고객정보 단건조회 (아이디로 검색)
	ModelAndView cstOne(String cust_id);

	// 관리자페이지 고객정보 전체조회 (페이징처리)
	ModelAndView cstList(PageDTO pageDTO);

	//관리자페이지 고객정보 업데이트(관리자여부지정 등등)
	ModelAndView cstUpdate(PageDTO pageDTO, CustomerDTO customerDTO) throws Exception;

	// 관리자페이지 고객정보 삭제
	ModelAndView cstDelete(PageDTO pageDTO, String cust_code) throws Exception;

	// 관리자페이지 예매취소
	ModelAndView ticketDelete(TicketCustDTO ticketCustDTO) throws Exception;
	
	/////////////////////////////// ajax용 /////////////////////////////
	
	// 관리자페이지 극장단건조회(PK체크용)
	String cinemaOne(String cinema_code);
	
	// 관리자페이지 상영관 단건조회(PK체크용)
	String theaterOne(TheaterDTO theaterDTO);
	
	// 상영일정관리 영화관 선택 후 상영관이름 뽑기
	String ajaxTheater(TheaterDTO theaterDTO);
	
	// 상영일정등록 PK체크용
	String screeningOne(ScreeningDTO screeningDTO);
	
	// 극장삭제시 상영관존재여부 확인용
	String deleteCinemaAjax(String cinema_code);
	
	// 상영관삭제시 좌석 존재여부 확인용
	String deleteTheaterAjax(String theater_name);


}