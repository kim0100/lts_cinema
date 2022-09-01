package com.movie.b4.service;

import com.movie.b4.dto.BookSeatDTO;
import com.movie.b4.dto.CustBookDTO;
import com.movie.b4.dto.PaymentDTO;
import com.movie.b4.dto.TicketDTO;

public interface IPaymentService {
	
	String payInsert(String[] seatName, PaymentDTO paymentDto, TicketDTO ticketDTO, BookSeatDTO bookseatDTO, CustBookDTO custbookDTO) throws Exception;
	
	String payRefund(String merchant_uid) throws Exception;
	
	PaymentDTO payOne(String cust_code);
}
