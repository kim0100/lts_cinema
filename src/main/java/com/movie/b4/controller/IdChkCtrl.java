package com.movie.b4.controller;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.b4.dto.CustomerDTO;
import com.movie.b4.service.IBookService;
import com.movie.b4.service.ICustomerService;
import com.movie.b4.service.ILoginService;
import com.movie.b4.service.ISendMailService;

@Controller
public class IdChkCtrl {

	@Autowired
	private ILoginService loginService;
	
	@Autowired
	private	ICustomerService customerService;
	
	@Autowired
	private IBookService bookService;
	
	@Autowired
	private ISendMailService sendmailService;
	
	@RequestMapping(value = "IdChkCtrl", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String idChk(@ModelAttribute("cust_id")String cust_id)
	{
		String id = loginService.idCk(cust_id);
		return id;
	}
	@RequestMapping(value = "PwChkCtrl", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String pwChk(HttpSession session,@ModelAttribute("cust_pw")String cust_pw)
	{
		CustomerDTO cust = (CustomerDTO) session.getAttribute("cust");
		String pw = cust.getCust_pw();
		boolean result = false;
		if(pw.equals(cust_pw))
		{
			result = true;
		}
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		
		String jsonOut = jsonObj.toString();
		System.out.println("====" + jsonOut);
		
		return jsonOut;
		
	}
	
	@RequestMapping(value = "EmailChkctrl", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String emailChk(@ModelAttribute("cust_email")String cust_email)
	{
		String jsonOut = customerService.custEmail(cust_email);
		return jsonOut;
	}
	
	//예매페이지 영화선택
	@RequestMapping(value = "movieSlt", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String movieSlt(@ModelAttribute("movie_code")String movie_code, @ModelAttribute("cinema_code")String cinema_code, @ModelAttribute("scr_date")String scr_date)
	{
		String jsonOut = bookService.movieSlt(movie_code, cinema_code, scr_date);
		return jsonOut;
	}
	//예매페이지 극장선택
	@RequestMapping(value = "cinemaSlt", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String cinemaSlt(@ModelAttribute("movie_code")String movie_code, @ModelAttribute("cinema_code")String cinema_code, @ModelAttribute("scr_date")String scr_date)
	{
		String jsonOut = bookService.cinemaSlt(movie_code, cinema_code, scr_date);
		return jsonOut;
	}
	//예매페이지 날짜선택
	@RequestMapping(value = "dateSlt", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String dateSlt(@ModelAttribute("movie_code")String movie_code, @ModelAttribute("cinema_code")String cinema_code, @ModelAttribute("scr_date")String scr_date)
	{
		String jsonOut = bookService.dateSlt(movie_code, cinema_code, scr_date);
		return jsonOut;
	}
	
	@RequestMapping(value = "EmailGetctrl", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String emailGet(@ModelAttribute("cust_email")String cust_email) 
	{
		String email = sendmailService.sendMail(cust_email);
		return email;
	}
	
	@RequestMapping(value = "idFind", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String idFind(@ModelAttribute("cust_email")String cust_email,@ModelAttribute("cust_name")String cust_name) 
	{
		String jsonOut = loginService.idFind(cust_name, cust_email);
		return jsonOut;
	}
	
	@RequestMapping(value = "pwFind", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String pwFind(@ModelAttribute("cust_email")String cust_email,@ModelAttribute("cust_name")String cust_name,@ModelAttribute("cust_id")String cust_id) 
	{
		String jsonOut = loginService.pwFind(cust_id,cust_name, cust_email);
		return jsonOut;
	}
}
