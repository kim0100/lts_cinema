package com.movie.b4.dao;

import com.movie.b4.dto.PaymentDTO;

public interface IPaymentDAOm {
	
	PaymentDTO payOne(String cust_code);	//결제 내역조회
	
	void payInsert(PaymentDTO paymentDto)throws Exception;  //결제후 인서트 페이dto, 티켓dto
	
	void payRefund(String merchant_uid)throws Exception;	//환불
	
	
}
