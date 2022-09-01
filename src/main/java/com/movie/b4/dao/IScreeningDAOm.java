package com.movie.b4.dao;

import com.movie.b4.dto.ScreeningDTO;

public interface IScreeningDAOm {
	
	ScreeningDTO screeningOne(ScreeningDTO screeningDTO);
	
	void screeningInsert(ScreeningDTO screeningDTO) throws Exception;
	
	void screeningDelete(ScreeningDTO screeningDTO) throws Exception;
}
