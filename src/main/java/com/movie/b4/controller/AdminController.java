package com.movie.b4.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.movie.b4.dto.CinemaDTO;
import com.movie.b4.dto.CustomerDTO;
import com.movie.b4.dto.PageDTO;
import com.movie.b4.dto.ScreeningDTO;
import com.movie.b4.dto.SeatDTO;
import com.movie.b4.dto.TheaterDTO;
import com.movie.b4.dto.TicketCustDTO;
import com.movie.b4.service.IAdminService;

@Controller
public class AdminController {

	@Autowired
	IAdminService adminService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	// 극장관리버튼 눌렀을때 극장관리페이지로 이동.
	@RequestMapping(value="adminPage")
	public ModelAndView cinemaList(PageDTO pageDTO) {
		logger.info("cinemaList called =========");
		return adminService.cinemaPageList(pageDTO);
	}
	
	// 극장추가하기 버튼 눌렀을때 극장관리페이지로 이동.
	@RequestMapping(value="cinemaInsertOK")
	public ModelAndView cinemaInsertOK(CinemaDTO cinemaDTO) throws Exception {
		logger.info("cinemaInsertOK called =========");
		return adminService.cinemaInsert(cinemaDTO);
	}
	
	// 극장수정하기 버튼을 눌렀을때 극장관리페이지로 이동.
	@RequestMapping(value="cinemaUpdateOK")
	public ModelAndView cinemaUpdateOK(CinemaDTO cinemaDTO, PageDTO pageDTO) throws Exception {
		logger.info("cunemaUpdateOK called =========");
		return adminService.cinemaUpdate(cinemaDTO, pageDTO);
	}
	
	// 극장삭제 버튼을 눌렀을때 삭제하기.
	@RequestMapping(value="cinemaDeleteOK")
	public ModelAndView cinemaDeleteOK(CinemaDTO cinemaDTO, PageDTO pageDTO) throws Exception {
		logger.info("cinemaDeleteOK called =========");
		return adminService.cinemaDelete(cinemaDTO, pageDTO);
		
	}
	
/*	// 상영관 관리 버튼 눌렀을때 상영관 관리 페이지로 이동. ++ 이때 극장리스트 보내줘야함!!!
	@RequestMapping(value="theaterAdmin")
	public String theaterAdmin(Model model) {
		logger.info("theaterAdmin called =========");
		model.addAttribute("CINEMALIST", adminService.cinemaList());
		return "admin/admin_theater";
	} */
	
	// 극장선택 후 검색누르면 선택한 극장의 상영관리스트 출력.
	@RequestMapping(value="theaterList")
	public ModelAndView theaterList(TheaterDTO theaterDTO) {
		logger.info("theaterList called =========");
		return adminService.theaterList(theaterDTO.getCinema_code());
	}
	
	@RequestMapping(value="theaterInsertOK")
	public ModelAndView theaterInsertOK(TheaterDTO theaterDTO) throws Exception {
		logger.info("theaterInsertOK called =========");
		return adminService.theaterInsert(theaterDTO);
	}
	
	@RequestMapping(value="theaterUpdateOk")
	public ModelAndView theaterUpdateOK(TheaterDTO theaterDTO) throws Exception {
		logger.info("theaterUpdateOK called =========");
		return adminService.theaterUpdate(theaterDTO);
	}
	
	@RequestMapping(value="theaterDeleteOK")
	public ModelAndView theaterDeleteOK(TheaterDTO theaterDTO) throws Exception {
		logger.info("theaterDeleteOK called =========");
		return adminService.theaterDelete(theaterDTO);
	}
	
	// 영화관리버튼 눌렀을때 영화관리페이지로 이동 (영화리스트페이징출력)
	@RequestMapping(value="movieList")
	public ModelAndView movieList(PageDTO pageDTO) { //
		logger.info("movieList called =========");
		return  adminService.moviePageList(pageDTO);
	}
	
/*	@RequestMapping(value="movieInsertOK")
	public ModelAndView movieInsertOK() throws Exception {
		logger.info("movieInsert called =========");
		return adminService.movieInsert();
	} */
	
	@RequestMapping(value="movieUpdateOK")
	public ModelAndView movieUpdateOK() throws Exception {
		logger.info("movieInsert called =========");
		return adminService.movieUpdate();
	} 
	
/*	// 상영일정관리 버튼 누르면 상영관리페이지로 이동  ++ 이때 극장리스트 보내줘야함!!!
 	@RequestMapping(value="screeningAdmin")
	public String screeningAdmin(Model model) {
		logger.info("screeningAdmin called =========");
		model.addAttribute("CINEMALIST", adminService.cinemaList());
		return "admin/admin_screening";
	} */
 	
 	//극장,상영관 선택후 검색 누르면 상영일정리스트 출력
 	@RequestMapping(value="screeningList")
 	public ModelAndView screeningList(PageDTO pageDTO, ScreeningDTO screeningDTO) {
 		logger.info("screeningList called =========");
 		return adminService.screeningList(pageDTO, screeningDTO);
 		
 	}
 	
 	// 추가버튼 누르면 추가하기!
 	@RequestMapping(value="screeningInsertOK")
 	public ModelAndView screeningInsertOK(ScreeningDTO screeningDTO) throws Exception {
 		logger.info("screeningInsertOK called =========");
		return adminService.screeningInsert(screeningDTO);
 	}
 	
/* 	@RequestMapping(value="screeningDeleteOK")
 	public ModelAndView screeningDeleteOK(@RequestParam("scrArr")ArrayList<String> scrArr) throws Exception {
 		logger.info("screeningDeleteOK called =========");
		return adminService.screeningDelete(scrArr);
 	} */
 	
/* 	@RequestMapping(value="seatAdmin")
 	public String seatAdmin(Model model) {
		logger.info("seatAdmin called =========");
		model.addAttribute("CINEMALIST", adminService.cinemaList());
		return "admin/admin_seat";
	} */
 	
 	@RequestMapping(value="seatList")
 	public ModelAndView seatList(SeatDTO seatDTO) {
 		logger.info("seatList called =========");
 		return adminService.seatList(seatDTO);
 		
 	}
 	
/* 	@RequestMapping(value="seatInsertOK")
 	public ModelAndView seatInsertOK(SeatDTO seatDTO) throws Exception {
 		logger.info("searInsertOK called =========");
		return adminService.seatInsert(seatDTO);
 	} */
 	
 	@RequestMapping(value="seatUpdateOK")
 	public ModelAndView seatUpdateOK(@RequestParam("seatList")ArrayList<String> seatName, SeatDTO seatDTO, String value) throws Exception {
 		logger.info("seatUpdateOK called =========");
 		return adminService.seatUpdate(seatName,seatDTO,value);
 	}
 	
 	@RequestMapping(value="seatDeleteOK")
 	public ModelAndView seatDeleteOK(SeatDTO seatDTO) throws Exception {
 		logger.info("seatDeleteOK called =========");
 		return adminService.seatDelete(seatDTO);
 	}
 	
 	@RequestMapping(value="cstAdmin")
 	public ModelAndView cstList(PageDTO pageDTO) {
 		logger.info("cstList called =========");
 		return adminService.cstList(pageDTO);
 	}
 	
 	@RequestMapping(value="cstOne")
 	public ModelAndView cstOne(String cust_id) {
 		logger.info("cstOne called =========");
 		return adminService.cstOne(cust_id);
 	}
 	
 	@RequestMapping(value="cstUpdateOK")
 	public ModelAndView cstUpdateOK(PageDTO pageDTO, CustomerDTO customerDTO) throws Exception {
 		logger.info("cstUpdateOK called =========");
 		return adminService.cstUpdate(pageDTO, customerDTO);
 	}
 	
 	@RequestMapping(value="cstDeleteOK")
 	public ModelAndView cstDeleteOK(PageDTO pageDTO, String cust_code) throws Exception {
 		logger.info("cstDeleteOK called =========");
 		return adminService.cstDelete(pageDTO, cust_code);
 	}
 	
 	@RequestMapping(value="ticketDeleteOK")
 	public ModelAndView cstTicketDelete(TicketCustDTO ticketCustDTO) throws Exception {
 		logger.info("cstTicket called =========");
 		return adminService.ticketDelete(ticketCustDTO);
 	}
 	
}
