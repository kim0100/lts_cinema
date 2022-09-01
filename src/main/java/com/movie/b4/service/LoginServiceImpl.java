package com.movie.b4.service;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.movie.b4.dao.ICustomerDAOm;
import com.movie.b4.dao.ILoginPageDAO;
import com.movie.b4.dto.CustomerDTO;


@Service("loginService")
public class LoginServiceImpl implements ILoginService{
	
	@Autowired
	ICustomerDAOm custDaom;
	@Autowired
	ILoginPageDAO loginDAO;
	private static final Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);
	
	@Override
	public ModelAndView login(CustomerDTO dto, HttpSession session) {
		logger.info("login called ===========");
		CustomerDTO custDto = loginDAO.sltCust(dto.getCust_id());
		ModelAndView mav = new ModelAndView();
		if(custDto!=null)
		{
			String id = dto.getCust_id();
			String pw = dto.getCust_pw();
			String userId = custDto.getCust_id();
			String userPw = custDto.getCust_pw();
			
			if(userId.equals(id)&&userPw.equals(pw))
			{
				session.setAttribute("cust", custDto);
		 		mav.setViewName("redirect:/main");
		 		return mav;
			}
		}
		mav.setViewName("login"); 		
		mav.addObject("message", "error");

		return mav;
	}

	@Override
	public String idCk(String cust_id) {
		logger.info("signUp called ===========");
		CustomerDTO dto2=loginDAO.sltCust(cust_id);
		boolean result = false;
		if(dto2==null)
		{
			result = true;
		}
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		
		String jsonOut = jsonObj.toString();
		System.out.println("====" + jsonOut);
		
		return jsonOut;
	}

	@Override
	public String signUp(CustomerDTO dto) throws Exception {
		logger.info("signUp called ===========");
		CustomerDTO dto2=loginDAO.sltCust(dto.getCust_id());
		if(dto2==null)
		{
			custDaom.cstInsert(dto);
			return "login";
		}
		return "register";
	}

	@Override
	public String idFind(String cust_name, String cust_email) {
		logger.info("idFind called ===========");
		CustomerDTO custDto = new CustomerDTO();
		custDto.setCust_name(cust_name);
		custDto.setCust_email(cust_email);
		boolean result = false;
		CustomerDTO custdto=loginDAO.idFind(custDto);
		String id = null;
		if(!(custdto==null))
		{
			id=custdto.getCust_id();
			result = true;
		}
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("cust_id", id);
		jsonObj.put("result", result);
		
		String jsonOut = jsonObj.toString();
		System.out.println("====" + jsonOut);
		
		return jsonOut;
	}

	@Override
	public String pwFind(String cust_id, String cust_name, String cust_email) {
		logger.info("pwFind called ===========");
		CustomerDTO custDto = new CustomerDTO();
		custDto.setCust_id(cust_id);
		custDto.setCust_name(cust_name);
		custDto.setCust_email(cust_email);
		boolean result = false;
		CustomerDTO custdto=loginDAO.pwFind(custDto);
		String pw = null;
		if(!(custdto==null))
		{
			pw=custdto.getCust_pw();
			result = true;
		}
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("cust_pw", pw);
		jsonObj.put("result", result);
		
		String jsonOut = jsonObj.toString();
		System.out.println("====" + jsonOut);
		
		return jsonOut;
	}
	
	

}
