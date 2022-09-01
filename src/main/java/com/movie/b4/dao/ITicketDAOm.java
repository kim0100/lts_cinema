package com.movie.b4.dao;

import com.movie.b4.dto.TicketCustDTO;
import com.movie.b4.dto.TicketDTO;

public interface ITicketDAOm {
	
	TicketDTO ticketOne(TicketDTO ticketDTO);
	
	void ticketInsert(TicketDTO ticketDTO) throws Exception;
	
	void ticketDelete(TicketCustDTO ticketCustDTO) throws Exception;
	
	void custDelete(String cust_code)throws Exception;//고객회원탈퇴
	
}
