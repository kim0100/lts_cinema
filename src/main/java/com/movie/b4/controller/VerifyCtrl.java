package com.movie.b4.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.b4.dao.ITicketDAOm;
import com.movie.b4.dto.BookSeatDTO;
import com.movie.b4.dto.CustBookDTO;
import com.movie.b4.dto.PaymentDTO;
import com.movie.b4.dto.TicketDTO;
import com.movie.b4.service.IPaymentService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import ch.qos.logback.classic.Logger;

//결제 시 서버로보내 금액이 맞는지 검증 ,환불을 하기위한 단계
@Controller
public class VerifyCtrl{
	
	@Autowired
	IPaymentService paymentService;
	@Autowired
	ITicketDAOm ticketDAOm;
	
	private IamportClient api;
	
	private static final Logger logger = (Logger) LoggerFactory.getLogger(LoginController.class);
	
	@ResponseBody
	@RequestMapping(value="verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid
	(Model model, Locale locale, HttpSession session, @PathVariable(value= "imp_uid") String imp_uid)
	throws IamportResponseException, IOException{
		
		this.api = new IamportClient
				("3302778972338837"
				, "63dfb4884292bb85d8cf3eb7e527786091963c3139196747280b09af5aeee166c52acf252d2b8c22");
		
		return api.paymentByImpUid(imp_uid);
	}
	
	@RequestMapping(value="payOk")
	public String payOk(@ModelAttribute("seat_name")String[] seatName, PaymentDTO paymentDto, TicketDTO ticketDTO, BookSeatDTO bookseatDTO, CustBookDTO custbookDTO) throws Exception{
		
		logger.info("call===");
		String view = paymentService.payInsert(seatName,paymentDto,ticketDTO,bookseatDTO,custbookDTO);
		return view;
	}
}
