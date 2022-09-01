package com.movie.b4.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.movie.b4.dao.*;
import com.movie.b4.dto.*;

@Service("seatService")
public class SeatServiceImpl implements ISeatService{
	
	@Autowired
	IMovieDAOm movieDao;
	@Autowired
	ITheaterDAOm theaterDao;
	@Autowired
	ISeatPageDAO seatPageDao;
	@Autowired
	ICinemaDAOm cinemaDao;
	
	@Override
	public String seatPage(String movie_code, String cinema_code, 
						   String theater_name, String scr_date,
						   String scr_start, Model model) {
		Map<String, Object> hm = new HashMap<String,Object>();
		model.addAttribute("movie_code", movie_code);
		model.addAttribute("cinema_code", cinema_code);
		model.addAttribute("theater_name", theater_name);
		model.addAttribute("scr_date", scr_date);
		model.addAttribute("scr_start", scr_start);
		
		//극장 정보 저장
		CinemaDTO cinemaDto = cinemaDao.cinemaOne(cinema_code);
		hm.put("CINEMA_NAME", cinemaDto.getCinema_name());
		
		//영화 정보 저장
		MovieDTO movieInfo = movieDao.movieOne(movie_code);
		String movie_grade = String.valueOf(movieInfo.getMovie_grade());
		if("0".equals(movie_grade))
		{
			movie_grade = "전체";
		}
		else
		{
			movie_grade += "세";
		}
		hm.put("MOVIE_NAME", movieInfo.getMovie_name());
		hm.put("MOVIE_POSTER", movieInfo.getMovie_poster());
		hm.put("MOVIE_GRADE", movie_grade);
		
		//상영관 정보 저장
		TheaterDTO theaterDto = new TheaterDTO();
		theaterDto.setCinema_code(cinema_code);
		theaterDto.setTheater_name(theater_name);
		TheaterDTO theaterInfo = theaterDao.theaterOne(theaterDto);
		hm.put("THEATER", theaterInfo);
		//영화 시작 시간, 영화 끝시간, 총 좌석, 남은 좌석
		ScreeningDTO screeningDto = new ScreeningDTO();
		screeningDto.setCinema_code(cinema_code);
		screeningDto.setMovie_code(movie_code);
		screeningDto.setScr_date(scr_date);
		screeningDto.setScr_start(scr_start);
		screeningDto.setTheater_name(theater_name);
		SeatTimeDTO seatTimedto = seatPageDao.seatTime(screeningDto);
		hm.put("SEATTIME", seatTimedto);
		TheaterDTO theaterDto2=new TheaterDTO();
		theaterDto2.setCinema_code(cinema_code);
		theaterDto2.setTheater_name(theater_name);
		//좌석 리스트
		List<SeatDTO> seatList = seatPageDao.seatList(theaterDto2);
		hm.put("SEATLIST", seatList);
		
		//예약된 좌석 리스트
		BookSeatDTO bookSeatDto = new BookSeatDTO();
		bookSeatDto.setCinema_code(cinema_code);
		bookSeatDto.setMovie_code(movie_code);
		bookSeatDto.setScr_date(scr_date);
		bookSeatDto.setScr_start(scr_start);
		bookSeatDto.setTheater_name(theater_name);
		List<String> bookList = seatPageDao.sltSeat(bookSeatDto);
		hm.put("BOOKLIST", bookList);
		
		System.out.println("aa======================================"+bookList);
		model.addAttribute("MAP",hm);
		return "seat";
	}
}
