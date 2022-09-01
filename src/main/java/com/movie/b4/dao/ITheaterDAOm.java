package com.movie.b4.dao;

import com.movie.b4.dto.TheaterDTO;

public interface ITheaterDAOm {
	
	TheaterDTO theaterOne(TheaterDTO theaterDTO);
	
	void theaterInsert(TheaterDTO theaterDTO);
	
	void theaterUpdate(TheaterDTO theaterDTO);
	
	void theaterDelete(TheaterDTO theaterDTO);
	
	int cstMax(); // 회원가입시 회원코드 자동증가
}
