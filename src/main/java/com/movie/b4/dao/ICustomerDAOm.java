package com.movie.b4.dao;

import com.movie.b4.dto.CustomerDTO;

public interface ICustomerDAOm {
	
	CustomerDTO cstOne(String cust_code);//로그인 체크
	
	void cstInsert(CustomerDTO customerDTO)throws Exception;//회원가입
	
	void cstUpdate(CustomerDTO customerDTO)throws Exception;//관리자 지정해주거나 마이페이지에서 고객정보수정
	
	void cstDelete(String cust_code)throws Exception;//관리자나 고객이 회원탈퇴
	
}
