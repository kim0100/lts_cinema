package com.movie.b4.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.movie.b4.dto.CustomerDTO;
import com.movie.b4.dto.TicketCustDTO;


public interface ICustomerService {
	//고객정보 변경
	String custUpdate(CustomerDTO customerDTO) throws Exception;
	//예매내역출력
	String resHistory(Model model, HttpSession session);
	//예매취소
	String resCancle(TicketCustDTO ticketCustDTO) throws Exception;
	//회원탈퇴
	String withdrawal(HttpSession session)throws Exception;
	//가입,정보변경시 메일 중복체크
	String custEmail(String cust_email);
}
