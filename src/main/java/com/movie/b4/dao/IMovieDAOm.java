package com.movie.b4.dao;

import com.movie.b4.dto.MovieDTO;

public interface IMovieDAOm {
	
	MovieDTO movieOne(String movie_code);//영화페이지 상세조회
	
	int movieInsert(MovieDTO movieDTO)throws Exception;
	
	void movieRateUpdate(String movie_code)throws Exception;
	
	void movieAudienceUpdate(MovieDTO movieDTO)throws Exception;
	
	void movieDelete(String movie_code)throws Exception;
	
}
