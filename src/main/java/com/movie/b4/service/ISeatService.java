package com.movie.b4.service;

import org.springframework.ui.Model;

public interface ISeatService {

	//메인페이지, 영화페이지에서 예메페이지로
	String seatPage(String movie_code,String cinema_code,
					String theater_name,String scr_date,
					String scr_start, Model model);
	
	
}