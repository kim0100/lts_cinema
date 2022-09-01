package com.movie.b4.service;

import org.springframework.ui.Model;

public interface IMovieService {

	// 메인페이지 현재,미래
	String mainMovieListPF(Model model);

	// 메인페이지 상영예정작 차트
	String mainMovieListFU(Model model);

	// 영화페이지 현재,미래
	String movieListPF(Model model);

	// 영화페이지 현재상영작
	String movieListPR(Model model);

	String movieOne(String movie_code,Model model);

}