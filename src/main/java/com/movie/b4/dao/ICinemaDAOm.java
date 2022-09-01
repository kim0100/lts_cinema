package com.movie.b4.dao;

import com.movie.b4.dto.CinemaDTO;

public interface ICinemaDAOm {
	
	CinemaDTO cinemaOne(String cinema_code);
	
	void cinemaInsert(CinemaDTO cinemaDTO)throws Exception;
	
	void cinemaUpdate(CinemaDTO cinemaDTO)throws Exception;
	
	void cinemaDelete(String cinema_code)throws Exception;
	
}
