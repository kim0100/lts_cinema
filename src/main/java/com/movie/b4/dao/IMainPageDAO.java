package com.movie.b4.dao;

import java.util.List;

import com.movie.b4.dto.MovieDTO;

public interface IMainPageDAO {
	
	List<MovieDTO> movieListPF(int rownum);//영화페이지,메인페이지 현재,미래상영작 무비차트
	
	List<MovieDTO> movieListFU(int rownum);//메인페이지 미래상영작 무비차트
}
