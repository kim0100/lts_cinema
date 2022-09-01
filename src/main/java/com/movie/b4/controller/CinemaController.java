package com.movie.b4.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movie.b4.service.IBookService;

@Controller
public class CinemaController{


	@Autowired
	private IBookService bookService;
	
	private static final Logger logger = LoggerFactory.getLogger(CinemaController.class);
		
	//무비차트에서 예매페이지로 이동
	@RequestMapping(value="cinemaBook")
	public String cinemaBook(@ModelAttribute("movie_code") String movie_code, @ModelAttribute("cinema_code") String cinema_code, 
							 @ModelAttribute("theater_name") String theater_name, @ModelAttribute("scr_date") String scr_date, 
							 @ModelAttribute("scr_start") String scr_start, Model model) {
		logger.info("cinemaBook called =========");
		String view = bookService.bookPage(movie_code, cinema_code, theater_name, scr_date, scr_start, model);
		return view;
	}
	
	
}
