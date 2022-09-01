package com.movie.b4.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movie.b4.service.IBookService;
import com.movie.b4.service.ICinemaService;
import com.movie.b4.service.ICustomerService;
import com.movie.b4.service.IMovieService;

@Controller
public class MainController{

	@Autowired
	private IMovieService movieSvc;
	@Autowired
	private ICustomerService customerService;
	@Autowired
	private ICinemaService cinemaService;
	@Autowired
	private IBookService bookService;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value="/")
	public String main(Model model) {
		logger.info("main called =========");
		String view = movieSvc.mainMovieListPF(model);
		return view;
	}
	
	//메인페이지로 이동 (로고 클릭할때 사용)
	@RequestMapping(value="main")
	public String goMain(Model model) {
		logger.info("goMain called =========");
		String view = movieSvc.mainMovieListPF(model);
		return view;
	}
	
	//로그인페이지로 이동
	@RequestMapping(value="loginPage")
	public String loginPage() {
		logger.info("loginPage called =========");
		return "login";
	}
	
	//마이페이지로 이동
	@RequestMapping(value="myPage")
	public String myPage(Model model, HttpSession session) {
		logger.info("myPage called =========");
		String view = customerService.resHistory(model, session);
		return view;
	}
	
	//로그아웃
	@RequestMapping("logOut")
	public String logOut(HttpSession session) {
		logger.info("logOut called =========");
		session.invalidate();
		return "redirect:/main";
	}
	
	//영화페이지로 이동
	@RequestMapping(value="moviePage")
	public String moviePage(Model model) {
		logger.info("moviePage called =========");
		String view = movieSvc.movieListPR(model);
		return view;
	}
	
	//극장페이지로 이동
	@RequestMapping(value="cinemaPage")
	public String cinemaPage(@ModelAttribute("cinema_code") String cinema_code, @ModelAttribute("scr_date") String scr_date, Model model) {
		logger.info("cinemaPage called =========");
		String view = cinemaService.cinemaMulti(cinema_code,scr_date, model);
		return view;
	}
	
	//예매페이지로 이동 
	@RequestMapping(value="bookPage")
	public String bookPage(Model model) {
		logger.info("bookPage called =========");
		String view = bookService.bookList(model);
		return view;
	}
	
	//무비차트에서 예매페이지로 이동
	@RequestMapping(value="movieChart")
	public String movieChart(@ModelAttribute("movie_code") String movie_code,Model model) {
		logger.info("movieChart called =========");
		String view = bookService.bookPage(movie_code, model);
		return view;
	}
	
	
}
