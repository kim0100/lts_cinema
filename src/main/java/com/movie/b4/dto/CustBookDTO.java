package com.movie.b4.dto;

public class CustBookDTO {
	
	private String cust_code;
	private String tk_code;
	private String seat_name;
	private String cinema_code;
	private String theater_name;

	public String getCust_code() {
		return cust_code;
	}
	public void setCust_code(String cust_code) {
		this.cust_code = cust_code;
	}
	public String getTk_code() {
		return tk_code;
	}
	public void setTk_code(String tk_code) {
		this.tk_code = tk_code;
	}
	public String getSeat_name() {
		return seat_name;
	}
	public void setSeat_name(String seat_name) {
		this.seat_name = seat_name;
	}
	public String getCinema_code() {
		return cinema_code;
	}
	public void setCinema_code(String cinema_code) {
		this.cinema_code = cinema_code;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	@Override
	public String toString() {
		return "CustBookDTO [cust_code=" + cust_code + ", tk_code=" + tk_code + ", seat_name=" + seat_name
				+ ", cinema_code=" + cinema_code + ", theater_name=" + theater_name + "]";
	}
}
