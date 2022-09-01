package com.movie.b4.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movie.b4.service.IBookService;
import com.movie.b4.service.IMovieService;

@Controller
public class MovieController{

	@Autowired
	private IMovieService movieSvc;
	@Autowired
	private IBookService bookService;
	
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@RequestMapping(value="movieOne")
	public String movieOne(@ModelAttribute("movie_code") String movie_code, Model model) {
		logger.info("movieOne called =========");
		String view = movieSvc.movieOne(movie_code, model);
		return view;
	}
	
	//영화페이지에서 예매페이지로 이동
	@RequestMapping(value="movieBook")
	public String movieBook(@ModelAttribute("movie_code") String movie_code,Model model) {
		logger.info("movieBook called =========");
		String view = bookService.bookPage(movie_code, model);
		return view;
	}
	
}
