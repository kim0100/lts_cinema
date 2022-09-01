package com.movie.b4.dao;

import com.movie.b4.dto.BookSeatDTO;

public interface IBookSeatDAOm {
	
	BookSeatDTO bookSeatOne(BookSeatDTO bookDTO);
	
	void bookSeatInsert(BookSeatDTO bookDTO) throws Exception;
	
	void bookSeatDelete(BookSeatDTO bookDTO) throws Exception;// 고객이 예매취소, 고객탈퇴

}
