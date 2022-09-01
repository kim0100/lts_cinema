package com.movie.b4.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.b4.dto.ScreeningDTO;
import com.movie.b4.dto.TheaterDTO;
import com.movie.b4.service.IAdminService;

@Controller
public class AdminAjaxController {

	@Autowired
	private IAdminService adminService;
	
	//관리자 극장페이지 : 영화관인서트 PK체크용
	@RequestMapping(value="c_insertChk", produces = "application/text;charset=UTF-8") 
	@ResponseBody
	public String c_insertChk(String cinema_code) {
		return adminService.cinemaOne(cinema_code);
	}
	
	//관리자 극장페이지 : 극장삭제시 상영관여부 확인용
	@RequestMapping(value="c_deleteChk", produces = "application/text;charset=UTF-8") 
	@ResponseBody
	public String c_deleteChk(String cinema_code) {
		return adminService.deleteCinemaAjax(cinema_code);
	}
		
	//관리자 상영관페이지 : 상영관인서트 PK체크용 
	@RequestMapping(value="t_insertChk", produces = "application/text;charset=UTF-8") 
	@ResponseBody
	public String t_insertChk(TheaterDTO theaterDTO) {
		return adminService.theaterOne(theaterDTO);
	}
	
	//관리자 극장페이지 : 상영관삭제시 좌석여부 확인용
	@RequestMapping(value="t_deleteChk", produces = "application/text;charset=UTF-8") 
	@ResponseBody
	public String t_deleteChk(String theater_name) {
		return adminService.deleteTheaterAjax(theater_name);
	}
	
	//관리자페이지 상영일정페이지 : 영화관선택시 상영관나오게
	@RequestMapping(value="s_theaterChk", produces = "application/text;charset=UTF-8") 
	@ResponseBody
	public String s_theaterChk(TheaterDTO theaterDTO) {
		return adminService.ajaxTheater(theaterDTO);
		
	}
		
	//관리자 상영일정페이지 : 상영일정인서트 PK체크용
	@RequestMapping(value="s_insertChk", produces = "application/text;charset=UTF-8") 
	@ResponseBody
	public String s_insertChk(ScreeningDTO screeningDTO) {
		return adminService.screeningOne(screeningDTO);
	}
	
/*	//관리자 영화페이지 : 영화 업데이트하기
	@RequestMapping(value="m_insertChk", produces = "application/text;charset=UTF-8") 
	@ResponseBody
	public String m_insertChk() throws Exception {
		return adminService.movieInsert();
	} */
	
	//관리자 상영일정페이지 : 상영일정삭제시 삭제가능여부 확인용
	@RequestMapping(value="s_deleteChk", produces = "application/text;charset=UTF-8") 
	@ResponseBody
	public String s_deleteChk(@RequestParam("scrArr[]")ArrayList<String> scrArr) throws Exception {
		return adminService.screeningDelete(scrArr);
	} 
}
