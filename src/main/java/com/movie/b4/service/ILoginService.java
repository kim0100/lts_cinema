package com.movie.b4.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.movie.b4.dto.CustomerDTO;

public interface ILoginService {
	//로그인
	ModelAndView login(CustomerDTO dto, HttpSession session);
	
	//회원가입할때 아이디 중복체크
	String idCk(String cust_id);
	
	//회원가입 
	String signUp(CustomerDTO dto) throws Exception;
	
	//아이디 찾기
	String idFind(String cust_name, String cust_email);
	
	//비밀번호 찾기
	String pwFind(String cust_id,String cust_name, String cust_email);
	
}


