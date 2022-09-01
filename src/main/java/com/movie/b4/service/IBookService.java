package com.movie.b4.service;

import org.springframework.ui.Model;

public interface IBookService {

	//메인페이지, 영화페이지에서 예메페이지로
	String bookPage(String movie_code,Model model);
	
	//극장페이지에서 예매페이지로
	String bookPage(String movie_code, String cinema_code, String theater_name, String scr_date, String scr_start, Model model);

	//예매페이지 
	String bookList(Model model);
	
	//예매페이지 영화선택
	String movieSlt(String movie_code, String cinema_code, String scr_date);
	
	//예매페이지 극장선택
	String cinemaSlt(String movie_code, String cinema_code, String scr_date);
	
	//예매페이지 극장선택
	String dateSlt(String movie_code, String cinema_code, String scr_date);
	
}