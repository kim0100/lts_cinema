package com.movie.b4.dao;

import java.util.List;

import com.movie.b4.dto.*;

public interface IMyPageDAO {

	List<TicketCustDTO> ticketRes(String cust_code);//한고객의 예매내역 좌석이름까지 뽑기          마이페이지
	
	int sltMax(String cust_code);// 결제완료시 티켓번호 증가 
	
	int cstMax();
	
	CustomerDTO cstEmail(String cust_email); //이메일 체크
}
