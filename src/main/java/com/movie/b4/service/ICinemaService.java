package com.movie.b4.service;

import org.springframework.ui.Model;


public interface ICinemaService {
	
	String cinemaMulti(String cinema_code,String scr_date,Model model);
	
}
