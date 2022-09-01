package com.movie.b4.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.movie.b4.dao.IMainPageDAO;
import com.movie.b4.dao.IMovieDAOm;
import com.movie.b4.dao.IMoviePageDAO;
import com.movie.b4.dto.MovieDTO;

@Service("movieSvc")
public class MovieServiceImpl implements IMovieService{
	
	@Autowired
	IMoviePageDAO moviePageDao;
	
	@Autowired
	IMovieDAOm movieDaom;
	
	@Autowired
	IMainPageDAO mainPageDao;
	
	 // 메인페이지 현재,미래
	@Override
	public String mainMovieListPF(Model model) {
		int rownum = 20;
		List<MovieDTO> li = mainPageDao.movieListPF(rownum);
		model.addAttribute("LIST", li);
		return "main";
	}
	
	// 메인페이지 상영예정작 차트
	@Override
	public String mainMovieListFU(Model model) {
		int rownum = 20;
		List<MovieDTO> li = mainPageDao.movieListFU(rownum);
		model.addAttribute("LIST", li);
		return "main";
	}
	
	// 영화페이지 현재,미래
	@Override
	public String movieListPF(Model model) {
		int rownum = 50;
		List<MovieDTO> li = moviePageDao.movieListPF(rownum);
		model.addAttribute("LIST", li);
		return "movie";
	}
	
	// 영화페이지 현재상영작
	@Override
	public String movieListPR(Model model) {
		int rownum = 50;
		List<MovieDTO> li = moviePageDao.movieListPR(rownum);
		model.addAttribute("MovieList", li);
		return "movie";
	}
	
	// 영화포스터 클릭 -> 영화소개
	@Override
	public String movieOne(String movie_code,Model model) {
		 MovieDTO dto = movieDaom.movieOne(movie_code);
		 model.addAttribute("movie", dto);
		return "story";
	}

}
