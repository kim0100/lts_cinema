package com.movie.b4.service;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.movie.b4.controller.AdminController;
import com.movie.b4.dao.IAdminPageDAO;
import com.movie.b4.dao.ICinemaDAOm;
import com.movie.b4.dao.ICinemaPageDAO;
import com.movie.b4.dao.ICustBookDAOm;
import com.movie.b4.dao.ICustomerDAOm;
import com.movie.b4.dao.ILoginPageDAO;
import com.movie.b4.dao.IMovieDAOm;
import com.movie.b4.dao.IMyPageDAO;
import com.movie.b4.dao.IScreeningDAOm;
import com.movie.b4.dao.ISeatDAOm;
import com.movie.b4.dao.ITheaterDAOm;
import com.movie.b4.dao.ITicketDAOm;
import com.movie.b4.dto.CinemaDTO;
import com.movie.b4.dto.CountDTO;
import com.movie.b4.dto.CustomerDTO;
import com.movie.b4.dto.PageDTO;
import com.movie.b4.dto.ScreenListDTO;
import com.movie.b4.dto.ScreeningDTO;
import com.movie.b4.dto.SeatDTO;
import com.movie.b4.dto.TheaterDTO;
import com.movie.b4.dto.TicketCustDTO;
import com.movie.b4.dto.TicketDTO; 
@Service("adminService")
public class AdminServiceImpl implements IAdminService {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
//	private static final String HOST = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp?collection=kmdb_new"; 
	
	@Autowired
	IMovieDAOm movieDAOm;
	@Autowired
	ICinemaPageDAO cinemaPageDAO;
	@Autowired
	ICinemaDAOm cinemaDAOm;
	@Autowired
	IScreeningDAOm screeningDAOm;
	@Autowired
	ITheaterDAOm theaterDAOm;
	@Autowired
	ISeatDAOm seatDAOm;
	@Autowired
	ICustomerDAOm customerDAOm;
	@Autowired
	ITicketDAOm ticketDAOm;
	@Autowired
	ICustBookDAOm custBookDAOm;
	@Autowired
	IAdminPageDAO adminPageDAO;
	@Autowired
	IMyPageDAO myPageDAO;
	@Autowired
	ILoginPageDAO loginDAO;
	/////////////////???????????? API ???????????? ???????????????/////////////////////
	/////////////////???????????? API ???????????? ???????????????/////////////////////
	/////////////////???????????? API ???????????? ???????????????/////////////////////
	
	// ?????????????????? ??????????????????(???????????????)
	@Override
	public ModelAndView moviePageList(PageDTO pageDTO) {
		
		ModelAndView mav = new ModelAndView();
		
		pageDTO.makeRow();
		mav.addObject("MOVIELIST", adminPageDAO.moviePageList(pageDTO));
		
		CountDTO countDTO = new CountDTO();
		countDTO.setTable("MOVIE");
		int count = adminPageDAO.count(countDTO);
		
		pageDTO.makePager(count);
		
		mav.addObject("PAGEDTO", pageDTO);
		mav.setViewName("admin/admin_movie");
		
		return mav;
	}
	
	/*	//?????????????????? ??????????????????
	@Transactional
	public ModelAndView movieInsert() throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
		Date today = new Date();
		String time = format.format(today);
		String year = time.substring(0, 4);
		String month = time.substring(4, 6);
		String date = time.substring(6, 8);
		String lastRelease = "20201231";
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		c.setTime(format2.parse(lastRelease));
		c.add(Calendar.DATE, 1);
		lastRelease = format2.format(c.getTime());
		String year2 = lastRelease.substring(0, 4);
		String month2 = lastRelease.substring(5, 7);
		String date2 = lastRelease.substring(8, 10);
		lastRelease = year2 + month2 + date2;
		time = year + month + date; 

		int count = 0;
		
		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();

		String serviceKey = "235H810D461QXCLRX81D";

		map.add("ServiceKey", serviceKey);
		map.add("ratedYn", "Y"); // ???????????? Y
//		map.add("releaseDts", "20220222"); // ??????????????? ????????? ?????? ?????????
//		map.add("releaseDte", "20220225"); // ?????? ?????? ?????? ???????????? -> ??????
		map.add("title", "??????");
//		map.add("listCount", "100");

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);

		
			String str = restTemplate.postForObject(new URI(HOST), request, String.class);
			JSONObject obj = new JSONObject(str);
			JSONArray data = (JSONArray) obj.get("Data");

			for (int j = 0; j < data.length(); j++) {
				JSONObject resultObject = (JSONObject) data.get(j);
				JSONArray result = (JSONArray) resultObject.get("Result");
				for (int i = 0; i < result.length(); i++) {
					MovieDTO movieDTO = new MovieDTO();
					int grade = 0; // ?????????
					
					JSONObject resultObject2 = (JSONObject) result.get(i);
					JSONArray rating = (JSONArray) resultObject2.get("ratings");
					String ratingGrade = null; // ????????????
					String releaseDate = null; // ?????????
					
					String name = resultObject2.get("title").toString().trim(); // ??????
					System.out.println(name);
					String genre = resultObject2.get("genre").toString().trim(); // ??????
					System.out.println(genre);
					String gmgr = resultObject2.get("directorNm").toString().trim(); // ??????
					String act = resultObject2.get("actorNm").toString().trim(); // ??????
					String runtime = resultObject2.get("runtime").toString().trim(); // ?????????
					ratingGrade = resultObject2.get("ratingGrade").toString().trim(); // ????????????
					releaseDate = resultObject2.get("releaseDate").toString().trim(); // ?????????
					String intrcn = resultObject2.get("plot").toString().trim(); // ?????????
					String posters = resultObject2.get("posters").toString().trim(); // ????????? ????????? ??????
					String teaser = resultObject2.get("vodUrl").toString().trim(); // ?????????
					
					for (int x = 0; x < rating.length(); x++) {
						JSONObject ratingObject = (JSONObject) rating.get(x);
						ratingGrade = ratingObject.get("ratingGrade").toString().trim();
						releaseDate = ratingObject.get("releaseDate").toString().trim(); 
					} 
					if (ratingGrade.contains("|")) { // ratingGrade??? 15????????????||15???????????? ????????? ???????????? ????????? ??????
						int idx = ratingGrade.indexOf("|");
						ratingGrade = ratingGrade.substring(0, idx);
					}
					if (releaseDate.contains("|")) { // ????????????
						int idx = releaseDate.indexOf("|");
						releaseDate = releaseDate.substring(0, idx);
					}
					if (posters.contains("|")) { // poster??? ???????????? ?????? |??? ?????? ????????? ?????? ????????? ????????? ????????????
						int idx = posters.indexOf("|");
						posters = posters.substring(0, idx);
					}
					if (ratingGrade.equals("18????????????(?????????????????????)")) {
						grade = 19;
					} else if (ratingGrade.equals("???????????????")) {
						grade = 0;
					} else if (ratingGrade.equals("15????????????")) {
						grade = 15;
					} else if (ratingGrade.equals("12????????????")) {
						grade = 12;
					}

					if (!posters.equals("") && !ratingGrade.equals("") && !releaseDate.equals("0")) { // ?????????, ???????????????
																										// null??? ?????????
						if (!releaseDate.substring(6, 8).equals("00")) { // ??????????????? ???????????? ??? ??? ????????????
							if (i % 50 == 0) {
								Thread.sleep(1000);
							}
							movieDTO.setMovie_name(name);
							movieDTO.setMovie_genre(genre);
							movieDTO.setMovie_gmgr(gmgr);
							movieDTO.setMovie_act(act);
							movieDTO.setMovie_time(runtime);
							movieDTO.setMovie_grade(grade);
							movieDTO.setMovie_date(releaseDate);
							movieDTO.setMovie_intrcn(intrcn);
							movieDTO.setMovie_poster(posters);
							movieDTO.setMovie_teaser(teaser);
							
							movieDAOm.movieInsert(movieDTO);
							count++;
						}
					}

				}
			}
		JSONObject check = new JSONObject();
			boolean result = false;
			String msg = "??????????????? ?????????????????????.";
			if(count>0) {
				result = true;
				msg = count+"?????? ????????? ?????? ???????????????.";
			}
			check.put("RESULT", result);
			check.put("MSG", msg);
			check.put("PATH", "movieList");
			String jsonOut = check.toString(); 
			mav.setViewName("redirect:/movieList");
		return mav;
	} */
	
	// ?????????????????? ???????????? ??????
	@Transactional
	public ModelAndView movieUpdate() throws Exception {
		
		ModelAndView mav = new ModelAndView();
		List<String> codes = adminPageDAO.movieUpcode();
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@"+codes.size());
		
		if(codes.size() > 0) { 
			for(int i = 0; i < codes.size(); i++) {
				String code = codes.get(i);
				System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@"+code);
				movieDAOm.movieRateUpdate(code);
			}
		}
		
		mav.setViewName("redirect:/movieList");
		return mav;
	}
	
	// ?????????????????? ???????????? ??????
	/*	@Transactional
	public String movieDelete(String movie_code) throws Exception {
		
		String msg = "???????????? ??????????????? ????????????.";
		MovieDTO checkDTO = movieDAOm.movieOne(movie_code);
		
		if(checkDTO != null) {
			movieDAOm.movieDelete(movie_code);
			msg = "????????? ?????? ???????????????.";
			return msg;
		}
		return msg;
	}
	*/
	// ?????????????????? ?????????,????????????,?????????????????? ????????? ???????????? ?????? ??????!!
	@Override
	public List<CinemaDTO> cinemaList() {
		return adminPageDAO.cinemaList();
	}
	
	//?????????????????? ??????????????????(???????????????)
	@Override
	public ModelAndView cinemaPageList(PageDTO pageDTO){
		
		ModelAndView mav = new ModelAndView();
		
		pageDTO.makeRow(); // ?????? pageDTO??? ????????? startRow, endRow ????????????
		mav.addObject("CINEMALIST", adminPageDAO.cinemaPageList(pageDTO));
		
		CountDTO countDTO = new CountDTO();
		countDTO.setTable("CINEMA"); // ????????? ??????????????? set
		int count = adminPageDAO.count(countDTO); // ??????????????? ??? ?????????
		
		// ??????????????? ?????? startNum, lastNum , prev, next ?????????
		pageDTO.makePager(count); 
		
		mav.addObject("PAGEDTO", pageDTO);
		mav.setViewName("admin/admin_cinema");
		
		return mav;
	}
	
	// ?????????????????? ????????????
	@Override
	@Transactional
	public ModelAndView cinemaInsert(CinemaDTO cinemaDTO) throws Exception {
		ModelAndView mav = new ModelAndView();
		cinemaDAOm.cinemaInsert(cinemaDTO);
		mav.setViewName("redirect:/adminPage"); // ??????????????? ???????????????????????? ??????!!
		
		return mav;
	}
	
	// ?????????????????? ????????????
	@Override
	@Transactional
	public ModelAndView cinemaUpdate(CinemaDTO cinemaDTO, PageDTO pageDTO) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		cinemaDAOm.cinemaUpdate(cinemaDTO);
		
		mav.addObject("curPage", pageDTO.getCurPage());
		mav.setViewName("redirect:/adminPage");
		
		return mav;
	}
	
	// ?????????????????? ????????????
	@Override
	@Transactional
	public ModelAndView cinemaDelete(CinemaDTO cinemaDTO, PageDTO pageDTO) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		cinemaDAOm.cinemaDelete(cinemaDTO.getCinema_code());
		
		mav.addObject("curPage", pageDTO.getCurPage());
		mav.setViewName("redirect:/adminPage");
		
		return mav;
	}
	
	// ?????????????????? ?????? ?????? ??? ????????? ????????????
	@Override
	public ModelAndView theaterList(String cinema_code) {
		ModelAndView mav = new ModelAndView();
		
		if(cinema_code == null) {
			String code = "1";
			mav.addObject("CINEMALIST", adminPageDAO.cinemaList());
			mav.addObject("CINEMACODE", code);
			mav.addObject("THEATERLIST", adminPageDAO.theaterList(code));
		
		}
		else {
			mav.addObject("CINEMALIST", adminPageDAO.cinemaList());
			mav.addObject("CINEMACODE", cinema_code);
			mav.addObject("THEATERLIST", adminPageDAO.theaterList(cinema_code));
		}
		
		mav.addObject("RESULT", true);
		mav.setViewName("admin/admin_theater");
		return mav;
	}
	
	// ?????????????????? ????????? ????????????
//	@Override
//	public TheaterDTO theaterOne(TheaterDTO theaterDTO) {
//		return theaterDAOm.theaterOne(theaterDTO);
//	}
	
	// ?????????????????? ????????? ??????
	@Override
	@Transactional
	public ModelAndView theaterInsert(TheaterDTO theaterDTO) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		SeatDTO seatDTO = new SeatDTO();
		seatDTO.setCinema_code(theaterDTO.getCinema_code());
		seatDTO.setTheater_name(theaterDTO.getTheater_name());
		
		theaterDAOm.theaterInsert(theaterDTO);
		
		int x = theaterDTO.getSeat_x();
		int y = theaterDTO.getSeat_y();
		char xname = 'A';
		for (int i = 1; i <= x; i++) {
			for(int j = 1; j <= y; j++) {
				String seatName = Character.toString(xname)+j;
				seatDTO.setSeat_name(seatName);
				seatDAOm.seatInsert(seatDTO);
			}
			xname++;
		}
		
		mav.addObject("cinema_code", theaterDTO.getCinema_code());
		mav.setViewName("redirect:/theaterList");
		
		return mav;
	}
	
	// ?????????????????? ????????? ??????
	@Override
	@Transactional
	public ModelAndView theaterUpdate(TheaterDTO theaterDTO) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		TheaterDTO makeDTO = new TheaterDTO();
		makeDTO.setCinema_code(theaterDTO.getCinema_code());
		makeDTO.setTheater_name(theaterDTO.getTheater_name());
		
		TheaterDTO checkDTO = theaterDAOm.theaterOne(makeDTO);
		int check_x = checkDTO.getSeat_x();
		int check_y = checkDTO.getSeat_y();
		
		SeatDTO seatDTO = new SeatDTO();
		seatDTO.setCinema_code(theaterDTO.getCinema_code());
		seatDTO.setTheater_name(theaterDTO.getTheater_name());
		
		theaterDAOm.theaterUpdate(theaterDTO);
		
		if(check_x != theaterDTO.getSeat_x() || check_y != theaterDTO.getSeat_y())
		adminPageDAO.seatAlldelete(seatDTO);
		
		int x = theaterDTO.getSeat_x();
		int y = theaterDTO.getSeat_y();
		char xname = 'A';
		for (int i = 1; i <= x; i++) {
			for(int j = 1; j <= y; j++) {
				String seatName = Character.toString(xname)+j;
				seatDTO.setSeat_name(seatName);
				seatDAOm.seatInsert(seatDTO);
			}
			xname++;
		}
		
		mav.addObject("CINEMALIST", adminPageDAO.cinemaList());
		mav.addObject("cinema_code", theaterDTO.getCinema_code());
		mav.addObject("THEATERDTO", theaterDTO);
		mav.setViewName("redirect:/theaterList");
		
		return mav;
	}
	
	// ?????????????????? ????????? ??????
	@Override
	@Transactional
	public ModelAndView theaterDelete(TheaterDTO theaterDTO) throws Exception {
		
		ModelAndView mav = new ModelAndView();

		theaterDAOm.theaterDelete(theaterDTO);
			
		mav.addObject("cinema_code", theaterDTO.getCinema_code());
		mav.setViewName("redirect:/theaterList");
		
		return mav;
	}
	
	// ?????????????????? ??????,????????? ?????? ??? ???????????? ????????????
	@Override
	public ModelAndView screeningList(PageDTO pageDTO, ScreeningDTO screeningDTO) {
		
		logger.info("cinemaList called =========");
		
		ModelAndView mav = new ModelAndView();
 		String code = screeningDTO.getCinema_code();
 		
 		if(code == null) {
 			code = "1";
 			String name = "1";
 			ScreeningDTO makedto = new ScreeningDTO();
 			makedto.setCinema_code(code);
 			makedto.setTheater_name(name);
 			
 			pageDTO.makeRow();
 	 		mav.addObject("SCREENINGLIST", adminPageDAO.screeningList(pageDTO, makedto));
 	 		
 	 		CountDTO countDTO = new CountDTO();
 	 		countDTO.setTable("SCREENING");
 	 		countDTO.setCinema_code(code);
 	 		countDTO.setTheater_name(name);
 	 		
 	 		int count = adminPageDAO.conditionCount(countDTO);
 	 		
 	 		pageDTO.makePager(count);
 	 		
 	 		mav.addObject("MOVIELIST", adminPageDAO.movieList());
 	 		mav.addObject("CINEMALIST", adminPageDAO.cinemaList());
 	 		mav.addObject("THEATERLIST", adminPageDAO.theaterList(code));
 	 		mav.addObject("CINEMACODE", code);
 	 		mav.addObject("THEATERNAME", name);
 	 		mav.addObject("PAGEDTO", pageDTO);
 		}
 		else {
	 		pageDTO.makeRow();
	 		mav.addObject("SCREENINGLIST", adminPageDAO.screeningList(pageDTO, screeningDTO));
	 		
	 		CountDTO countDTO = new CountDTO();
	 		countDTO.setTable("SCREENING");
	 		countDTO.setCinema_code(screeningDTO.getCinema_code());
	 		countDTO.setTheater_name(screeningDTO.getTheater_name());
	 		
	 		int count = adminPageDAO.conditionCount(countDTO);
	 		
	 		pageDTO.makePager(count);
	 		
	 		mav.addObject("MOVIELIST", adminPageDAO.movieList());
	 		mav.addObject("CINEMALIST", adminPageDAO.cinemaList());
	 		mav.addObject("THEATERLIST", adminPageDAO.theaterList(screeningDTO.getCinema_code()));
	 		mav.addObject("CINEMACODE", screeningDTO.getCinema_code());
	 		mav.addObject("THEATERNAME", screeningDTO.getTheater_name());
	 		mav.addObject("PAGEDTO", pageDTO);
	 		
 		}
 		
 		mav.addObject("RESULT", true);
 		mav.setViewName("admin/admin_screening");
		return mav;
	}
	
	// ?????????????????? ???????????? ??????
	@Override
	@Transactional
	public ModelAndView screeningInsert(ScreeningDTO screeningDTO) throws Exception {
		
		logger.info("cinemaList called =========");
		
		ModelAndView mav = new ModelAndView();
		
		ScreeningDTO changeDTO = screeningDTO;
		
		changeDTO.setScr_date(screeningDTO.getScr_date().replace("-", ""));
		changeDTO.setScr_start(screeningDTO.getScr_start().replace(":", ""));
		changeDTO.setScr_end(screeningDTO.getScr_end().replace(":", ""));
		
		screeningDAOm.screeningInsert(changeDTO);
		
 		mav.addObject("cinema_code", screeningDTO.getCinema_code());
 		mav.addObject("theater_name", screeningDTO.getTheater_name());
		mav.setViewName("redirect:/screeningList");
		
		return mav;
	}
	
	// ?????????????????? ???????????? ??????
/*	@Override
	@Transactional
	public ModelAndView screeningDelete(ArrayList<String> scrArr) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		for(int i = 0; i < scrArr.size(); i++) {
			ScreeningDTO screeningDTO = new ScreeningDTO();
			String scrData = scrArr.get(i);
			screeningDTO.setCinema_code(scrData.split("-")[0]);
			screeningDTO.setTheater_name(scrData.split("-")[1]);
			screeningDTO.setMovie_code(scrData.split("-")[2]);
			screeningDTO.setScr_date(scrData.split("-")[3]);
			screeningDTO.setScr_start(scrData.split("-")[4]);
			
			ScreeningDTO checkDTO = screeningDAOm.screeningOne(screeningDTO);
			if(checkDTO != null) {
				screeningDAOm.screeningDelete(screeningDTO);
			}
		}
		
		String cinema_code = scrArr.get(0).split("-")[0];
		String theater_name = scrArr.get(0).split("-")[1];
		String page = scrArr.get(0).split("-")[5];
			
		mav.addObject("cur_Page", page);
		mav.addObject("cinema_code",cinema_code);
		mav.addObject("theater_name",theater_name);
		mav.setViewName("redirect:/screeningList");
		
		return mav;
	}*/
/*		ModelAndView mav = new ModelAndView();
		ScreeningDTO checkDTO = screeningDAOm.screeningOne(screeningDTO);
			
		if(checkDTO != null) {
			screeningDAOm.screeningDelete(screeningDTO);
		}
			
		mav.addObject("cur_Page", pageDTO.getCurPage());
		mav.addObject("cinema_code",screeningDTO.getCinema_code());
		mav.addObject("theater_name",screeningDTO.getTheater_name());
		mav.setViewName("redirect:/screeningList");
			
 */	
	
	// ?????????????????? ??????,????????? ?????? ??? ??????????????????
	@Override
	public ModelAndView seatList(SeatDTO seatDTO) {
		
		ModelAndView mav = new ModelAndView();
 		String code = seatDTO.getCinema_code();
 		
 		if(code == null) {
 			code = "1";
 			String name = "1";
 			SeatDTO makeDTO = new SeatDTO();
 			makeDTO.setCinema_code(code);
 			makeDTO.setTheater_name(name);
 			
 			TheaterDTO theaterDTO = new TheaterDTO();
 			theaterDTO.setCinema_code(code);
 			theaterDTO.setTheater_name(name);

	 		mav.addObject("SEATLIST", adminPageDAO.seatList(makeDTO));
	 		mav.addObject("CINEMALIST", adminPageDAO.cinemaList());
	 		mav.addObject("THEATERLIST", adminPageDAO.theaterList(code));
	 		mav.addObject("CINEMACODE", code);
	 		mav.addObject("THEATERONE", theaterDAOm.theaterOne(theaterDTO));
	 		
 		}
 		else {
 			TheaterDTO theaterDTO = new TheaterDTO();
 			theaterDTO.setCinema_code(seatDTO.getCinema_code());
 			theaterDTO.setTheater_name(seatDTO.getTheater_name());
 			
	 		mav.addObject("SEATLIST", adminPageDAO.seatList(seatDTO));
	 		mav.addObject("CINEMALIST", adminPageDAO.cinemaList());
	 		mav.addObject("THEATERLIST", adminPageDAO.theaterList(seatDTO.getCinema_code()));
	 		mav.addObject("CINEMACODE", seatDTO.getCinema_code());
	 		mav.addObject("THEATERONE", theaterDAOm.theaterOne(theaterDTO));
 		}
 		
 		mav.setViewName("admin/admin_seat");
		return mav; 
		
	}
	
	// ?????????????????? ?????? ????????????
	@Override
	public SeatDTO seatOne(SeatDTO seatDTO) {
		return seatDAOm.seatOne(seatDTO);
	}
	
/*	// ?????????????????? ?????? ??????
	@Override
	@Transactional
	public ModelAndView seatInsert(SeatDTO seatDTO) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		TheaterDTO theaterDTO = new TheaterDTO();
		
		theaterDTO.setCinema_code(seatDTO.getCinema_code());
		theaterDTO.setTheater_name(seatDTO.getTheater_name());
		
		TheaterDTO dto = theaterDAOm.theaterOne(theaterDTO);
		
		int x = dto.getSeat_x();
		int y = dto.getSeat_y();
		char xname = 'A';
		int  yname = 1;
		for (int i = 1; i <= x; i++) {
			for(int j = 1; j <= y; j++) {
				String seatName = Character.toString(xname)+yname;
				seatDTO.setSeat_name(seatName);
				seatDAOm.seatInsert(seatDTO);
			}
			xname++;
			yname = 1;
		}
		
		mav.addObject("MSG", "????????? ?????? ???????????????.");
		mav.addObject("SEATDTO", seatDTO);
		mav.setViewName("redirect:/seatList");
		
		return mav;
	} */
	
	// ?????????????????? ????????????
	@Override
	@Transactional
	public ModelAndView seatUpdate(ArrayList<String> seatName, SeatDTO seatDTO, String value) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		if(value.equals("check")) {
			for(int i = 0; i < seatName.size(); i++) {
				SeatDTO makeDTO = new SeatDTO();
				makeDTO.setSeat_name(seatName.get(i));
				makeDTO.setCinema_code(seatDTO.getCinema_code());
				makeDTO.setTheater_name(seatDTO.getTheater_name());
				
				SeatDTO checkDTO = new SeatDTO();
				checkDTO = seatDAOm.seatOne(makeDTO);
				char check = checkDTO.getUse_check();
				
				if(check == 'Y') {
					checkDTO.setUse_check('N');
					seatDAOm.seatUpdate(checkDTO);
				}
				else {
					checkDTO.setUse_check('Y');
					seatDAOm.seatUpdate(checkDTO);
				}
			}
		}
		else {
			for(int i = 0; i < seatName.size(); i++) {
				SeatDTO makeDTO = new SeatDTO();
				makeDTO.setSeat_name(seatName.get(i));
				makeDTO.setCinema_code(seatDTO.getCinema_code());
				makeDTO.setTheater_name(seatDTO.getTheater_name());
				
				SeatDTO checkDTO = new SeatDTO();
				checkDTO = seatDAOm.seatOne(makeDTO);
				char check = checkDTO.getGrade();
				
				if(check == '1') {
					checkDTO.setGrade('2');
					seatDAOm.seatUpdate(checkDTO);
				}
				else {
					checkDTO.setGrade('1');
					seatDAOm.seatUpdate(checkDTO);
				}
			}
		}
		mav.addObject("cinema_code", seatDTO.getCinema_code());
		mav.addObject("theater_name", seatDTO.getTheater_name());
		mav.setViewName("redirect:/seatList");
		
		return mav;
	}
	
	// ?????????????????? ????????????
	@Override
	@Transactional
	public ModelAndView seatDelete(SeatDTO seatDTO) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		String msg = "???????????? ??????????????? ????????????.";
		SeatDTO checkDTO = seatDAOm.seatOne(seatDTO);
		
		if(checkDTO != null) {
			seatDAOm.seatDelete(seatDTO);
			msg = "????????? ?????? ???????????????.";
		}
		
		mav.addObject("SEATDTO", seatDTO);
		mav.addObject("MSG", msg);
		mav.setViewName("redirect:/seatList");
		
		return mav;
	}
	
	// ?????????????????? ???????????? ???????????? (???????????? ??????)
	@Override
	public ModelAndView cstOne(String cust_id) {
		
		ModelAndView mav = new ModelAndView();
		CustomerDTO customerDTO = loginDAO.sltCust(cust_id);
		String cust_code = customerDTO.getCust_code();
		
		List<TicketCustDTO> ticketList = myPageDAO.ticketRes(cust_code);// ?????? ???????????? ?????????
		
		String seatName;
		
		for(int i =0; i<ticketList.size(); i++)
		{
			List<String> seatList = custBookDAOm.custBookSeat(ticketList.get(i));//????????? ?????? ?????????
			seatName="";
			
			for(int j = 0; j < seatList.size(); j++)
			{
				if(j < seatList.size()-1)
					seatName += seatList.get(j)+",";
				else
					seatName += seatList.get(j);
			}
			
			ticketList.get(i).setSeat_name(seatName); // ???????????? ?????? ????????????
		}
		
		mav.addObject("TICKETLIST", ticketList);
		mav.addObject("CUSTLIST", adminPageDAO.sltCust(cust_id));
		mav.addObject("ONE","Y");
		mav.setViewName("admin/admin_member");
		return mav;
	}
	
	// ?????????????????? ???????????? ???????????? (10????????? ???????????????)
	@Override
	public ModelAndView cstList(PageDTO pageDTO) {
		
		ModelAndView mav = new ModelAndView();
		
		pageDTO.makeRow();
		mav.addObject("CUSTLIST", adminPageDAO.cstList(pageDTO));
		
		CountDTO countDTO = new CountDTO();
		countDTO.setTable("CUSTOMER");
		int count = adminPageDAO.count(countDTO);
		
		pageDTO.makePager(count);
		
		mav.addObject("PAGEDTO", pageDTO);
		mav.setViewName("admin/admin_member");
		
		return mav;
	}
	
	//?????????????????? ???????????? ????????????(????????????????????? ??????)
	@Override
	@Transactional
	public ModelAndView cstUpdate(PageDTO pageDTO, CustomerDTO customerDTO) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		CustomerDTO oneDTO = customerDAOm.cstOne(customerDTO.getCust_code());
		
		if(customerDTO.getManager_check() == null ) {
			oneDTO.setManager_check("N");
		}
		else {
			oneDTO.setManager_check(customerDTO.getManager_check());
		}
		
		customerDAOm.cstUpdate(oneDTO);
		
		mav.addObject("curPage", pageDTO.getCurPage());
		mav.setViewName("redirect:/cstAdmin");
		
		return mav;
	}
	
	// ?????????????????? ???????????? ??????
	@Override
	@Transactional
	public ModelAndView cstDelete(PageDTO pageDTO, String cust_code) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		custBookDAOm.custDelete(cust_code); //CustBook ???????????? ?????? ??? ????????? ?????? ?????? ??????
		ticketDAOm.custDelete(cust_code); // Ticket ???????????? ?????? ??? ????????? ?????? ?????? ??????
		customerDAOm.cstDelete(cust_code);
		
		mav.addObject("curPage", pageDTO);
		mav.setViewName("redirect:/cstAdmin");
		
		return mav;
	}
	
	// ?????????????????? ????????????
	@Override
	@Transactional
	public ModelAndView ticketDelete(TicketCustDTO ticketCustDTO) throws Exception {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		ModelAndView mav = new ModelAndView();
		
		TicketDTO ticketDTO = new TicketDTO();
		ticketDTO.setCust_code(ticketCustDTO.getCust_code());
		ticketDTO.setTk_code(ticketCustDTO.getTk_code());
		
		CustomerDTO makeDTO = customerDAOm.cstOne(ticketCustDTO.getCust_code());
		String id = makeDTO.getCust_id();
		 
		TicketDTO checkDTO = ticketDAOm.ticketOne(ticketDTO);
		
		if(checkDTO != null) {
			custBookDAOm.custBookDelete(ticketCustDTO);
			ticketDAOm.ticketDelete(ticketCustDTO);
		}
		
		mav.addObject("cust_id", id);
		mav.setViewName("redirect:/cstOne");
		
		return mav;
	}
	
//////////////////////////////ajax???//////////////////////////////////
	
	// ?????????????????? PK????????? ajax
	@Override
	public String cinemaOne(String cinema_code) {
		CinemaDTO checkDTO = cinemaDAOm.cinemaOne(cinema_code);
		JSONObject jsonObj = new JSONObject();
		boolean result = true;
			
		if(checkDTO != null) {
			result = false;
		}
			
		jsonObj.put("RESULT", result);
			
		String jsonOut = jsonObj.toString(); 	
		return jsonOut;
	}
	
	//?????????????????? ?????????????????? PK?????????
	@Override
	public String theaterOne(TheaterDTO theaterDTO) {
		TheaterDTO checkDTO = theaterDAOm.theaterOne(theaterDTO);
		JSONObject jsonObj = new JSONObject();
		boolean result = true;
			
		if(checkDTO != null) {
			result = false;
		}
		
		jsonObj.put("RESULT", result);
		
		String jsonOut = jsonObj.toString(); 	
		return jsonOut;
	}
	
	//
	@Override
	public String ajaxTheater(TheaterDTO theaterDTO) {
		
		List<TheaterDTO> checkList = adminPageDAO.theaterList(theaterDTO.getCinema_code());
		
		JSONArray jsonAry = new JSONArray();
		
		for(int i = 0; i < checkList.size(); i++) {
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("theater_name", checkList.get(i).getTheater_name());
			System.out.println(jsonObj.toString());
			jsonAry.put(jsonObj);
			
		}
		String jsonOut = jsonAry.toString();
		return jsonOut;
	}
	
	@Override
	public String screeningOne(ScreeningDTO screeningDTO) {
		ScreeningDTO checkDTO = screeningDAOm.screeningOne(screeningDTO);
		JSONObject jsonObj = new JSONObject();
		boolean result = true;
			
		if(checkDTO != null) {
			result = false;
		}
		
		jsonObj.put("RESULT", result);
			
		String jsonOut = jsonObj.toString(); 	
		return jsonOut;
	}
	
	@Override
	public String deleteCinemaAjax(String cinema_code) {
		
		int count = adminPageDAO.deleteCinemaAjax(cinema_code);
		JSONObject jsonObj = new JSONObject();
		boolean result = true;
		
		if(count > 0) {
			result = false;
		}
		
		jsonObj.put("RESULT", result);
		String jsonOut = jsonObj.toString();
		
		return jsonOut;
	}
	
	@Override
	public String deleteTheaterAjax(String theater_name) {
		
		int count = adminPageDAO.deleteTheaterAjax(theater_name);
		JSONObject jsonObj = new JSONObject();
		boolean result = true;
		
		if(count > 0) {
			result = false;
		}
		
		jsonObj.put("RESULT", result);
		String jsonOut = jsonObj.toString();
		
		return jsonOut;
	}
	// ?????????????????? ???????????? ??????
	@Override
	@Transactional
	public String screeningDelete(ArrayList<String> scrArr) throws Exception {
		
		JSONObject jsonObj = new JSONObject();
		List<ScreenListDTO> theaterList = new ArrayList<ScreenListDTO>();
		boolean result = true;
		int count = 0;
		for(int i = 0; i < scrArr.size(); i++) {
			ScreeningDTO screeningDTO = new ScreeningDTO();
			String scrData = scrArr.get(i);
			
			screeningDTO.setCinema_code(scrData.split("-")[0]);
			screeningDTO.setTheater_name(scrData.split("-")[1]);
			screeningDTO.setMovie_code(scrData.split("-")[2]);
			screeningDTO.setScr_date(scrData.split("-")[3]);
			screeningDTO.setScr_start(scrData.split("-")[4]);
			
			ScreenListDTO screenListDTO = new ScreenListDTO();
			
			screenListDTO.setCinema_code(scrData.split("-")[0]);
			screenListDTO.setTheater_name(scrData.split("-")[1]);
			screenListDTO.setMovie_code(scrData.split("-")[2]);
			screenListDTO.setScr_date(scrData.split("-")[3]);
			screenListDTO.setScr_start(scrData.split("-")[4]);
			screenListDTO.setMovie_name(scrData.split("-")[6]);
			screenListDTO.setScr_end(scrData.split("-")[7]);
			
			int countData = adminPageDAO.deleteScrAjax(screeningDTO);
			System.out.println("@@@@@@@@@@@@@@@@@@@@"+countData);
			if(countData == 0) {
				ScreeningDTO checkDTO = screeningDAOm.screeningOne(screeningDTO);
				if(checkDTO != null) {
					screeningDAOm.screeningDelete(screeningDTO);
					count++;
				}
				else {
					theaterList.add(screenListDTO);
				}
			}
			else {
				theaterList.add(screenListDTO);
			}
		}
		
		if(count != scrArr.size()) {
			result = false;
			jsonObj.put("THEATERLIST", theaterList);
		}
		
		String cinema_code = scrArr.get(0).split("-")[0];
		String theater_name = scrArr.get(0).split("-")[1];
		String page = scrArr.get(0).split("-")[5];
		
		jsonObj.put("COUNT", count);
		jsonObj.put("CINEMACODE", cinema_code);
		jsonObj.put("THEATERNAME", theater_name);
		jsonObj.put("PAGE", page);
		jsonObj.put("RESULT", result);
		
		String jsonOut = jsonObj.toString();
		
		return jsonOut;
	}
	
}
