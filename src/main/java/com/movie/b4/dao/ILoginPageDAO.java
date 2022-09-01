package com.movie.b4.dao;

import com.movie.b4.dto.CustomerDTO;

public interface ILoginPageDAO {

	CustomerDTO sltCust(String cust_id); // 관리자페이지  id로 고객정보 찾기
	
	CustomerDTO idFind(CustomerDTO customerDto);//아이다 찾기
	
	CustomerDTO pwFind(CustomerDTO customerDto);//아이다 찾기
}
