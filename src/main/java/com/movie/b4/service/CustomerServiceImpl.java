package com.movie.b4.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.movie.b4.dao.IBookSeatDAOm;
import com.movie.b4.dao.ICustBookDAOm;
import com.movie.b4.dao.ICustomerDAOm;
import com.movie.b4.dao.IMyPageDAO;
import com.movie.b4.dao.ITicketDAOm;
import com.movie.b4.dto.CustomerDTO;
import com.movie.b4.dto.TicketCustDTO;

@Service("customerService")
public class CustomerServiceImpl implements ICustomerService{
	
	@Autowired
	IMyPageDAO myPageDAO;
	@Autowired
	ICustBookDAOm custBookDAOm;
	@Autowired
	ICustomerDAOm customerDAOm;
	@Autowired
	IBookSeatDAOm bookSeatDAOm;
	@Autowired
	ITicketDAOm ticketDAOm;
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerServiceImpl.class);
	
	@Override//고객정보 변경
	public String custUpdate(CustomerDTO customerDTO) throws Exception {
		logger.info("custUpdate called ===========");
		customerDAOm.cstUpdate(customerDTO);
		return null;
	}

	@Override//예매내역출력
	public String resHistory(Model model, HttpSession session) {
		logger.info("resHistory called ===========");
		String view="";
		CustomerDTO cust = (CustomerDTO) session.getAttribute("cust");
		List<TicketCustDTO> li = new ArrayList<TicketCustDTO>();// 고객 예매내역 리스트
		List<String> li2 = new ArrayList<String>();
		String a;
		if(cust!=null)
		{
			li = myPageDAO.ticketRes(cust.getCust_code());
			for(int i =0; i<li.size(); i++)
			{
				li2 = custBookDAOm.custBookSeat(li.get(i));//티켓에 좌석 리스트
				a="";
				for(int j = 0; j<li2.size(); j++)
				{
					if(j<li2.size()-1)
						a+=li2.get(j)+",";
					else
						a+=li2.get(j);
				}
				li.get(i).setSeat_name(a); // 예매내역 좌석 넣어주기
			}
			model.addAttribute("resHist", li);
			view= "myPage";
		}
		else
			view= "login";
		return view;
		
	}

	@Override
	@Transactional//예매취소
	public String resCancle(TicketCustDTO ticketCustDTO) throws Exception {
		logger.info("resCancle called ===========");
		custBookDAOm.custBookDelete(ticketCustDTO);//CustBook 테이블에 있는 한 고객의 한 티켓에 모든좌석삭제
		ticketDAOm.ticketDelete(ticketCustDTO);// Ticket 테이블에 있는 한 고객의 한 티켓 삭제
		return "redirect:/myPage";
	}

	@Override
	@Transactional//회원탈퇴
	public String withdrawal(HttpSession session) throws Exception {
		logger.info("withdrawal called ===========");
		CustomerDTO cust = (CustomerDTO) session.getAttribute("cust");
		custBookDAOm.custDelete(cust.getCust_code());//CustBook 테이블에 있는 한 고객의 모든 좌석 삭제
		ticketDAOm.custDelete(cust.getCust_code());// Ticket 테이블에 있는 한 고객의 모든 티켓 삭제
		customerDAOm.cstDelete(cust.getCust_code());//Customer 테이블에 고객삭제
		return "redirect:/main";
	}
	
	@Override//회원가입,정보변경 시 이메일중복체크
	public String custEmail(String cust_email) {
		
		logger.info("custEmail called ===========");
		CustomerDTO dto = myPageDAO.cstEmail(cust_email);
		boolean result = false;
		if(dto == null)
		{
			result = true;
		}
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		
		String jsonOut = jsonObj.toString();
		System.out.println("====" + jsonOut);
		
		return jsonOut;
		
	}


}
