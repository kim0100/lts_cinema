package com.movie.b4.dto;

public class PaymentDTO {
	private String cust_code;
	private String merchant_uid;
	private String pay_date;
	private String imp_uid;
	private int refund;
	private int amount;
	public String getCust_code() {
		return cust_code;
	}
	public void setCust_code(String cust_code) {
		this.cust_code = cust_code;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public int getRefund() {
		return refund;
	}
	public void setRefund(int refund) {
		this.refund = refund;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "PaymentDTO [cust_code=" + cust_code + ", merchant_uid=" + merchant_uid + ", pay_date=" + pay_date
				+ ", imp_uid=" + imp_uid + ", refund=" + refund + ", amount=" + amount + "]";
	}
	
}
