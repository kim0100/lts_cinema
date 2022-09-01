package com.movie.b4.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.movie.b4.dao.*;
import com.movie.b4.dto.*;


@Service("cinemaService")
public class CinemaServiceImpl implements ICinemaService {
	
	@Autowired
	ICinemaPageDAO cinemaPageDAO;

	@Override
	public String cinemaMulti(String cinema_code,String scr_date,Model model) {
		
		Map<String, Object> cinemaHm = new HashMap<String, Object>();
		List<CinemaDTO> cinemaList = cinemaPageDAO.cinemaMulti();
		int slide=0;
		int button=0;
		
		if("".equals(cinema_code))
			cinema_code="1"; //극장페이지로 이동하면 자동으로 맨처음에있는 극장선택
		cinemaHm.put("cinema_code",cinema_code);
		
		cinemaHm.put("CINEMALIST", cinemaList);// 극장 정보가담긴 리스트
		
		CinemaDTO cinemaDTO = cinemaPageDAO.cinemaOne(cinema_code);
		cinemaHm.put("CINEMAINFO", cinemaDTO);//ㄴ한 극장의 정보를 저장시킨거
		
		List<String> dateList = cinemaPageDAO.dateList(cinema_code);
		cinemaHm.put("DATELIST", dateList);//오늘부터 시작하는 날짜리스트
		int datesize=dateList.size();
		
		//사이즈에따라서 버튼 활성화 여부
		if(datesize>8)
			button=8;
		cinemaHm.put("BUTTON", button);//버튼 활성화 여부
		//나중에 오늘날짜로 바꿔야함 매핑도
		//나중에 오늘날짜로 바꿔야함 매핑도
		//나중에 오늘날짜로 바꿔야함 매핑도
		if("".equals(scr_date))
			scr_date="20201212"; //극장페이지로 이동하면 자동으로 날짜가 오늘으로 설정 
		cinemaHm.put("scr_date", scr_date);
		//나중에 오늘날짜로 바꿔야함 매핑도
		//나중에 오늘날짜로 바꿔야함 매핑도
		//나중에 오늘날짜로 바꿔야함 매핑도
		
		//슬라이드 위치 정해주기
		int scr_date1=Integer.parseInt(scr_date);
		if(scr_date1>=20201212+8)//오늘날짜+8로 바꿔야함//오늘날짜+8로 바꿔야함//오늘날짜+8로 바꿔야함
		{
			slide=9;
		}
		cinemaHm.put("SLIDE", slide);//몇번째 슬라이드 부터 시작할지
		
		List<HashMap<String, Object>> screeningList = new ArrayList<HashMap<String, Object>>();//모델로 보내줄거
		ScreeningDTO screeningDTO = new ScreeningDTO();
		screeningDTO.setCinema_code(cinema_code);//극장선택
		screeningDTO.setScr_date(scr_date);//날짜선택
		
		List<MovieDTO> movieList = cinemaPageDAO.movieSlt(screeningDTO);//극장,날짜 선택했을때 영화 리스트
		for(int i = 0; i<movieList.size(); i++)
		{
			List<HashMap<String, Object>> screeningList2 = new ArrayList<HashMap<String, Object>>();
			HashMap<String, Object> hm1 = new HashMap<String, Object>();//영화dto, 상영시간 리스트를 담은 맵
			MovieDTO movieDTO = movieList.get(i);//영화 리스트 하나씩 뽑기
			hm1.put("MOVIE", movieDTO);//영화 하나의 정보 저장
			
			screeningDTO.setMovie_code(movieDTO.getMovie_code());//영화 선택
			List<TheaterSltDTO> theaterList = cinemaPageDAO.theaterList(screeningDTO);//극장,날짜,영화 선택했을때 상영관 리스트
			for(int j = 0; j<theaterList.size(); j++)
			{
				HashMap<String, Object> hm2 = new HashMap<String, Object>();//상영관 dto, 날짜리스트를 담은 맵
				hm2.put("THEATER", theaterList.get(j));//한개의 상영관 정보 저장
				screeningDTO.setTheater_name(theaterList.get(j).getTheater_name());//상영관 선택
				
				List<TimeSeatDTO> timeList = cinemaPageDAO.timeList(screeningDTO);//극장,날짜,영화,상영관 선택했을때 상영시간 리스트
				hm2.put("TIME", timeList);
				screeningList2.add(hm2);
			}
			hm1.put("TTLIST", screeningList2);
			screeningList.add(hm1);
		}

		model.addAttribute("LIST",screeningList);
		model.addAttribute("Cinema", cinemaHm);
		return "Cinema";
	}
	

}
