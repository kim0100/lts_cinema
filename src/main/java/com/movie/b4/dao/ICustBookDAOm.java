package com.movie.b4.dao;

import java.util.List;

import com.movie.b4.dto.CustBookDTO;
import com.movie.b4.dto.TicketCustDTO;

public interface ICustBookDAOm {
	
	List<String> custBookSeat(TicketCustDTO ticketCustDTO);//TicketRes실행후 실행해서 한dto에 담기 고객의 한개티켓에 좌석이름출력
	
	CustBookDTO custBookOne(CustBookDTO custbookDTO);//인서트 딜리트용
	
	void custBookInsert(CustBookDTO custbookDTO)throws Exception; //
	
	void custBookDelete(TicketCustDTO ticketCustDTO)throws Exception;//고객이 예매취소
	
	void custDelete(String cust_code)throws Exception;//고객회원탈퇴
}
