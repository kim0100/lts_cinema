package com.movie.b4.dao;

import com.movie.b4.dto.SeatDTO;

public interface ISeatDAOm {
	
	SeatDTO seatOne(SeatDTO seatDTO);
	
	void seatInsert(SeatDTO seatDTO) throws Exception;
	
	void seatUpdate(SeatDTO seatDTO) throws Exception;
	
	void seatDelete(SeatDTO seatDTO) throws Exception;//극장이랑 상영관코드로 삭제
	
}
