package com.movie.b4.dao;

import java.util.List;

import com.movie.b4.dto.BookSeatDTO;
import com.movie.b4.dto.ScreeningDTO;
import com.movie.b4.dto.SeatDTO;
import com.movie.b4.dto.SeatTimeDTO;
import com.movie.b4.dto.TheaterDTO;

public interface ISeatPageDAO {
	
	List<SeatDTO> seatList(TheaterDTO seatDTO);//극장, 상영관코드로 좌석출력(좌석페이지, 관리자페이지)
	
	List<String> sltSeat(BookSeatDTO bookDTO);//현재 예매되어있는 좌석 색바꾸기(좌석페이지)
	
	SeatTimeDTO seatTime(ScreeningDTO screeningDto);//총 좌석수, 시작시간, 종료시간, 현재 좌석수
}
