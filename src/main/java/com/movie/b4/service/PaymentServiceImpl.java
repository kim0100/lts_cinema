package com.movie.b4.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.movie.b4.dao.IBookPageDAO;
import com.movie.b4.dao.IBookSeatDAOm;
import com.movie.b4.dao.ICustBookDAOm;
import com.movie.b4.dao.IMovieDAOm;
import com.movie.b4.dao.IPaymentDAOm;
import com.movie.b4.dao.ITicketDAOm;
import com.movie.b4.dto.BookSeatDTO;
import com.movie.b4.dto.CustBookDTO;
import com.movie.b4.dto.CustomerDTO;
import com.movie.b4.dto.MovieDTO;
import com.movie.b4.dto.PaymentDTO;
import com.movie.b4.dto.TicketDTO;


@Service("paymentService")
public class PaymentServiceImpl implements IPaymentService {
	
	@Autowired
	IPaymentDAOm paymentDAOm;
	@Autowired
	ICustBookDAOm custbookDAOm;
	@Autowired
	ITicketDAOm ticketDAOm;
	@Autowired
	IBookSeatDAOm bookseatDAOm;
	@Autowired
	IBookPageDAO bookPageDAO;
	@Autowired
	IMovieDAOm movieDAOm;
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerServiceImpl.class);
	
	@Transactional
	@Override
	public String payInsert(String[] seatName, PaymentDTO paymentDto, TicketDTO ticketDTO, BookSeatDTO bookseatDTO, CustBookDTO custbookDTO) throws Exception {
		logger.info("payInsert called ===========");
		CustomerDTO customerDTO = new CustomerDTO();
		customerDTO.setCust_code(ticketDTO.getCust_code());
		
		MovieDTO movieDTO = movieDAOm.movieOne(ticketDTO.getMovie_code());
		int audience = movieDTO.getMovie_audience() + seatName.length;
		movieDTO.setMovie_audience(audience);
		
		movieDAOm.movieAudienceUpdate(movieDTO);
		
		
		String codeMax = bookPageDAO.tkCodeMax(customerDTO);
		ticketDTO.setTk_code(codeMax);
		custbookDTO.setTk_code(codeMax);
		
		ticketDAOm.ticketInsert(ticketDTO);
		paymentDAOm.payInsert(paymentDto);
		
		for(int i = 0; i < seatName.length; i++) {
			String a = seatName[i];
			custbookDTO.setSeat_name(a);
			bookseatDTO.setSeat_name(a);
			custbookDAOm.custBookInsert(custbookDTO);
			bookseatDAOm.bookSeatInsert(bookseatDTO);
		}
		
		return "redirect:/main";
	}

	@Override
	public String payRefund(String merchant_uid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PaymentDTO payOne(String cust_code) {
		// TODO Auto-generated method stub
		return null;
	}

}
