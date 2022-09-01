package com.movie.b4.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SeatController{

	
	private static final Logger logger = LoggerFactory.getLogger(SeatController.class);
		
	//무비차트에서 예매페이지로 이동
	@RequestMapping(value="paymentPage")
	public String paymentPage(@ModelAttribute("movie_code") String movie_code, @ModelAttribute("cinema_code") String cinema_code, 
							 @ModelAttribute("theater_name") String theater_name, @ModelAttribute("scr_date") String scr_date, 
							 @ModelAttribute("scr_start") String scr_start, @ModelAttribute("seat_name") String[] seat_name,@ModelAttribute("price") int price,  Model model) {
		logger.info("paymentPage called =========");
		List<String> seat = new ArrayList<String>();
		for(int i=0; i<seat_name.length; i++)
		{
			seat.add(seat_name[i]);
		}
		model.addAttribute("seat_name",seat);
		String view = "payment";
		return view;
	}
	
	
}
