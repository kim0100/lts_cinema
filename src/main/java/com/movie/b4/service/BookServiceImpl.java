package com.movie.b4.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.movie.b4.dao.IBookPageDAO;
import com.movie.b4.dao.ICinemaPageDAO;
import com.movie.b4.dao.IMovieDAOm;
import com.movie.b4.dto.CinemaDTO;
import com.movie.b4.dto.MovieDTO;
import com.movie.b4.dto.ScreeningDTO;
import com.movie.b4.dto.TheaterSltDTO;
import com.movie.b4.dto.TimeSeatDTO;

@Service("bookService")
public class BookServiceImpl implements IBookService{

	@Autowired
	IBookPageDAO bookPageDAO;
	
	@Autowired
	IMovieDAOm movieDAO;
	
	@Autowired
	ICinemaPageDAO cinemaPageDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerServiceImpl.class);
	
	@Override
	public String bookPage(String movie_code, Model model) {
		model.addAttribute("movie_code",movie_code);
		logger.info("bookList called ===========");
		Map<String, Object> bookHm = new HashMap<String, Object> ();
		List<MovieDTO> movieList = bookPageDAO.movieList();
		List<CinemaDTO> cinemaList = bookPageDAO.cinemaList();
		List<String> dateList = bookPageDAO.dateList();
		
		bookHm.put("MOVIELIST", movieList);
		bookHm.put("CINEMALIST", cinemaList);
		bookHm.put("DATELIST", dateList);
		
		model.addAttribute("BOOKLIST", bookHm);
		return "book";
	}

	@Override
	public String bookPage(String movie_code, String cinema_code, String theater_name, String scr_date,
		String scr_start, Model model) {
		logger.info("bookList called ===========");
		model.addAttribute("movie_code",movie_code);
		model.addAttribute("cinema_code",cinema_code);
		model.addAttribute("theater_name",theater_name);
		model.addAttribute("scr_date",scr_date);
		model.addAttribute("scr_start",scr_start);
		
		Map<String, Object> bookHm = new HashMap<String, Object> ();
		List<MovieDTO> movieList = bookPageDAO.movieList();
		List<CinemaDTO> cinemaList = bookPageDAO.cinemaList();
		List<String> dateList = bookPageDAO.dateList();
		
		bookHm.put("MOVIELIST", movieList);
		bookHm.put("CINEMALIST", cinemaList);
		bookHm.put("DATELIST", dateList);
		
		model.addAttribute("BOOKLIST", bookHm);
		
		return "book";
	}

	@Override
	public String bookList(Model model) {
		logger.info("bookList called ===========");
		Map<String, Object> bookHm = new HashMap<String, Object> ();
		List<MovieDTO> movieList = bookPageDAO.movieList();
		List<CinemaDTO> cinemaList = bookPageDAO.cinemaList();
		List<String> dateList = bookPageDAO.dateList();
		
		bookHm.put("MOVIELIST", movieList);
		bookHm.put("CINEMALIST", cinemaList);
		bookHm.put("DATELIST", dateList);
		
		model.addAttribute("BOOKLIST", bookHm);
		
		return "book";
	}

	@Override
	public String movieSlt(String movie_code, String cinema_code, String scr_date) {
		logger.info("movieSlt called ===========");
		MovieDTO dto = movieDAO.movieOne(movie_code);
		ScreeningDTO screeningDto = null;
		String cinemaCode = null;
		String scrDate = null;
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("movie_code", dto.getMovie_code());
		jsonObj.put("movie_name", dto.getMovie_name());
		jsonObj.put("movie_poster", dto.getMovie_poster());
		String movie_grade = String.valueOf(dto.getMovie_grade());
		if("0".equals(movie_grade))
		{
			movie_grade = "전체";
		}
		else
		{
			movie_grade += "세";
		}
			
		jsonObj.put("movie_grade", movie_grade);
		//둘다 선택x
		if("".equals(cinema_code)&&"".equals(scr_date))
		{
			screeningDto = bookPageDAO.sltMovie(movie_code);
			cinemaCode = screeningDto.getCinema_code();
			scrDate = screeningDto.getScr_date();
		}
		//둘다 선택돼있을 경우
		else if(!"".equals(cinema_code)&&!"".equals(scr_date))
		{
			ScreeningDTO sDto = new ScreeningDTO();
			sDto.setCinema_code(cinema_code);
			sDto.setMovie_code(movie_code);
			sDto.setScr_date(scr_date);
			
			screeningDto = bookPageDAO.sltMC(sDto);
			scrDate = screeningDto.getScr_date();
			
			screeningDto = bookPageDAO.sltMD(sDto);
			cinemaCode = screeningDto.getCinema_code();
			
			List<HashMap<String, Object>> screeningList2 = new ArrayList<HashMap<String, Object>>();
			List<TheaterSltDTO> theaterList = cinemaPageDAO.theaterList(sDto);//극장,날짜,영화 선택했을때 상영관 리스트
			for(int j = 0; j<theaterList.size(); j++)
			{
				HashMap<String, Object> hm2 = new HashMap<String, Object>();//상영관 dto, 날짜리스트를 담은 맵
				hm2.put("THEATER", theaterList.get(j));//한개의 상영관 정보 저장
				sDto.setTheater_name(theaterList.get(j).getTheater_name());//상영관 선택
				
				List<TimeSeatDTO> timeList = cinemaPageDAO.timeList(sDto);//극장,날짜,영화,상영관 선택했을때 상영시간 리스트
				hm2.put("TIME", timeList);
				screeningList2.add(hm2);
			}
			JSONArray json_array = new JSONArray(screeningList2);
			jsonObj.put("List",json_array);
			
		}
		//극장만 선택돼있을 경우
		else if(!"".equals(cinema_code))
		{
			ScreeningDTO sDto = new ScreeningDTO();
			sDto.setCinema_code(cinema_code);
			sDto.setMovie_code(movie_code);
			
			screeningDto = bookPageDAO.cSltMovieCinema(movie_code);
			cinemaCode = screeningDto.getCinema_code();
			
			screeningDto = bookPageDAO.sltMC(sDto);
			scrDate = screeningDto.getScr_date();
		}
		//날짜만 선택돼있을 경우
		else if(!"".equals(scr_date))
		{
			ScreeningDTO sDto = new ScreeningDTO();
			sDto.setScr_date(scr_date);
			sDto.setMovie_code(movie_code);
			
			screeningDto = bookPageDAO.dSltMovieDate(movie_code);
			scrDate = screeningDto.getScr_date();
			
			screeningDto = bookPageDAO.sltMD(sDto);
			cinemaCode = screeningDto.getCinema_code();
		}
		
		JSONArray cinemaArr = new JSONArray();
		JSONArray dateArr = new JSONArray();
		
		String cinema[] = cinemaCode.split(",");
		for(int i=0; i<cinema.length; i++)
		{
			cinemaArr.put(cinema[i]);
		}
		jsonObj.put("cinema_list", cinemaArr);
		
		String date[] = scrDate.split(",");
		for(int i=0; i<date.length; i++)
		{
			dateArr.put(date[i]);
		}
		jsonObj.put("date_list", dateArr);
		
		String jsonOut = jsonObj.toString();
		System.out.println("====" + jsonOut);
		
		return jsonOut;
	}
	
	@Override
	public String cinemaSlt(String movie_code, String cinema_code, String scr_date) {
		logger.info("cinemaSlt called ===========");
		JSONObject jsonObj = new JSONObject();

		ScreeningDTO screeningDto = null;
		String movieCode = null;
		String scrDate = null;
		//둘다 선택x
		if("".equals(movie_code)&&"".equals(scr_date))
		{
			screeningDto = bookPageDAO.sltCinema(cinema_code);
			movieCode = screeningDto.getMovie_code();
			scrDate = screeningDto.getScr_date();
		}
		//둘다 선택돼있을 경우
		else if(!"".equals(movie_code)&&!"".equals(scr_date))
		{
			ScreeningDTO sDto = new ScreeningDTO();
			sDto.setCinema_code(cinema_code);
			sDto.setMovie_code(movie_code);
			sDto.setScr_date(scr_date);
			
			screeningDto = bookPageDAO.sltMC(sDto);
			scrDate = screeningDto.getScr_date();
			
			screeningDto = bookPageDAO.sltCD(sDto);
			movieCode = screeningDto.getMovie_code();
			
			List<HashMap<String, Object>> screeningList2 = new ArrayList<HashMap<String, Object>>();
			List<TheaterSltDTO> theaterList = cinemaPageDAO.theaterList(sDto);//극장,날짜,영화 선택했을때 상영관 리스트
			for(int j = 0; j<theaterList.size(); j++)
			{
				HashMap<String, Object> hm2 = new HashMap<String, Object>();//상영관 dto, 날짜리스트를 담은 맵
				hm2.put("THEATER", theaterList.get(j));//한개의 상영관 정보 저장
				sDto.setTheater_name(theaterList.get(j).getTheater_name());//상영관 선택
				
				List<TimeSeatDTO> timeList = cinemaPageDAO.timeList(sDto);//극장,날짜,영화,상영관 선택했을때 상영시간 리스트
				hm2.put("TIME", timeList);
				screeningList2.add(hm2);
			}
			JSONArray json_array = new JSONArray(screeningList2);
			jsonObj.put("List",json_array);
		}
		//영화만 선택돼있을 경우
		else if(!"".equals(movie_code))
		{
			ScreeningDTO sDto = new ScreeningDTO();
			sDto.setCinema_code(cinema_code);
			sDto.setMovie_code(movie_code);
			
			screeningDto = bookPageDAO.mSltCinemaMovie(cinema_code);
			movieCode = screeningDto.getMovie_code();
			
			screeningDto = bookPageDAO.sltMC(sDto);
			scrDate = screeningDto.getScr_date();
		}
		//날짜만 선택돼있을 경우
		else if(!"".equals(scr_date))
		{
			ScreeningDTO sDto = new ScreeningDTO();
			sDto.setScr_date(scr_date);
			sDto.setCinema_code(cinema_code);
			
			screeningDto = bookPageDAO.dSltCinemaDate(cinema_code);
			scrDate = screeningDto.getScr_date();
			
			screeningDto = bookPageDAO.sltCD(sDto);
			movieCode = screeningDto.getMovie_code();
		}
		
		JSONArray movieArr = new JSONArray();
		JSONArray dateArr = new JSONArray();
		
		String movie[] = movieCode.split(",");
		for(int i=0; i<movie.length; i++)
		{
			movieArr.put(movie[i]);
		}
		jsonObj.put("movie_list", movieArr);
		
		String date[] = scrDate.split(",");
		for(int i=0; i<date.length; i++)
		{
			dateArr.put(date[i]);
		}
		jsonObj.put("date_list", dateArr);
		
		String jsonOut = jsonObj.toString();
		System.out.println("====" + jsonOut);
		
		return jsonOut;
	}
	
	@Override
	public String dateSlt(String movie_code, String cinema_code, String scr_date) {
		logger.info("dateSlt called ===========");
		JSONObject jsonObj = new JSONObject();

		ScreeningDTO screeningDto = null;
		String movieCode = null;
		String cinemaCode = null;
		//둘다 선택 x
		if("".equals(movie_code)&&"".equals(cinema_code))
		{
			screeningDto = bookPageDAO.sltDate(scr_date);
			movieCode = screeningDto.getMovie_code();
			cinemaCode = screeningDto.getCinema_code();
		}
		//둘다 선택돼있을 경우
		else if(!"".equals(movie_code)&&!"".equals(cinema_code))
		{
			ScreeningDTO sDto = new ScreeningDTO();
			sDto.setCinema_code(cinema_code);
			sDto.setMovie_code(movie_code);
			sDto.setScr_date(scr_date);
			
			screeningDto = bookPageDAO.sltMD(sDto);
			cinemaCode = screeningDto.getCinema_code();
			
			screeningDto = bookPageDAO.sltCD(sDto);
			movieCode = screeningDto.getMovie_code();
			
			List<HashMap<String, Object>> screeningList2 = new ArrayList<HashMap<String, Object>>();
			List<TheaterSltDTO> theaterList = cinemaPageDAO.theaterList(sDto);//극장,날짜,영화 선택했을때 상영관 리스트
			for(int j = 0; j<theaterList.size(); j++)
			{
				HashMap<String, Object> hm2 = new HashMap<String, Object>();//상영관 dto, 날짜리스트를 담은 맵
				hm2.put("THEATER", theaterList.get(j));//한개의 상영관 정보 저장
				sDto.setTheater_name(theaterList.get(j).getTheater_name());//상영관 선택
				
				List<TimeSeatDTO> timeList = cinemaPageDAO.timeList(sDto);//극장,날짜,영화,상영관 선택했을때 상영시간 리스트
				hm2.put("TIME", timeList);
				screeningList2.add(hm2);
			}
			JSONArray json_array = new JSONArray(screeningList2);
			jsonObj.put("List",json_array);
		}
		//영화만 선택돼있을 경우
		else if(!"".equals(movie_code))
		{
			ScreeningDTO sDto = new ScreeningDTO();
			sDto.setScr_date(scr_date);
			sDto.setMovie_code(movie_code);
			
			screeningDto = bookPageDAO.mSltDateMovie(scr_date);
			movieCode = screeningDto.getMovie_code();
			
			screeningDto = bookPageDAO.sltMD(sDto);
			cinemaCode = screeningDto.getCinema_code();
		}
		//극장만 선택돼있을 경우
		else if(!"".equals(cinema_code))
		{
			ScreeningDTO sDto = new ScreeningDTO();
			sDto.setScr_date(scr_date);
			sDto.setCinema_code(cinema_code);
			
			screeningDto = bookPageDAO.cSltDateCinema(scr_date);
			cinemaCode = screeningDto.getCinema_code();
			
			screeningDto = bookPageDAO.sltCD(sDto);
			movieCode = screeningDto.getMovie_code();
		}
		
		JSONArray movieArr = new JSONArray();
		JSONArray cinemaArr = new JSONArray();
		
		String movie[] = movieCode.split(",");
		for(int i=0; i<movie.length; i++)
		{
			movieArr.put(movie[i]);
		}
		jsonObj.put("movie_list", movieArr);
		
		String cinema[] = cinemaCode.split(",");
		for(int i=0; i<cinema.length; i++)
		{
			cinemaArr.put(cinema[i]);
		}
		jsonObj.put("cinema_list", cinemaArr);
		
		String jsonOut = jsonObj.toString();
		System.out.println("====" + jsonOut);
		
		return jsonOut;
	}
	

}
