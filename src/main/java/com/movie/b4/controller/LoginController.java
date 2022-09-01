package com.movie.b4.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.movie.b4.dto.CustomerDTO;
import com.movie.b4.service.ILoginService;

@Controller
public class LoginController{

	@Autowired
	private ILoginService loginService;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@RequestMapping("loginCk.do")
	public ModelAndView login_check(CustomerDTO customerDto, HttpSession session) {
		logger.info("login_check called =========");
		ModelAndView mav = loginService.login(customerDto, session);
		return mav;
	}
	
	@RequestMapping(value="signUpPage")
	public String signUpPage() {
		logger.info("signUpPage called =========");
		return "register";
	}
	
	@RequestMapping(value="signUp")
	public String signUp(CustomerDTO dto) throws Exception {
		logger.info("signUp called =========");
		String view = loginService.signUp(dto);
		return view;
	}
	
	@RequestMapping(value="idFindPage")
	public String idFindPage() {
		logger.info("idFindPage called =========");
		String view = "idFind";
		return view;
	}
	@RequestMapping(value="pwFindPage")
	public String pwFindPage() {
		logger.info("pwFindPage called =========");
		String view = "pwFind";
		return view;
	}
}
