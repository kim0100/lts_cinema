package com.movie.b4.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movie.b4.service.ISeatService;

@Controller
public class BookController{


	@Autowired
	private ISeatService seatService;
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
		
	//무비차트에서 예매페이지로 이동
	@RequestMapping(value="seatPage")
	public String seatPage(@ModelAttribute("movie_code") String movie_code, @ModelAttribute("cinema_code") String cinema_code, 
							 @ModelAttribute("theater_name") String theater_name, @ModelAttribute("scr_date") String scr_date, 
							 @ModelAttribute("scr_start") String scr_start, Model model) {
		logger.info("seatPage called =========");
		String view = seatService.seatPage(movie_code, cinema_code, theater_name, scr_date, scr_start, model);
		return view;
	}
	
	
}
