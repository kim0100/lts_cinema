package com.movie.b4.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movie.b4.dto.*;
import com.movie.b4.service.ICustomerService;

@Controller
public class MyPageController{

	@Autowired
	private ICustomerService customerService;
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@RequestMapping(value="resCancle")
	public String movieOne(@ModelAttribute("TicketCustDTO") TicketCustDTO dto, Model model) throws Exception {
		logger.info("movieOne called =========");
		String view = customerService.resCancle(dto);
		return view;
	}
	
	@RequestMapping(value="withdrawal")
	public String withdrawal(HttpSession session) throws Exception {
		logger.info("withdrawal called =========");
		String view = customerService.withdrawal(session);
		session.invalidate();
		return view;
	}
	
	@RequestMapping(value="Update")
	public String custUpdate(CustomerDTO customerDTO ,HttpSession session) throws Exception {
		
		logger.info("custUpdate call=========");
		
		customerService.custUpdate(customerDTO);
		
		session.setAttribute("cust", customerDTO);
		
		return "redirect:/myPage";
	}
	
}
