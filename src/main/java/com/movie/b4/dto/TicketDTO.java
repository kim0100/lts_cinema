package com.movie.b4.dto;

public class TicketDTO {
	private String cust_code;
	private String tk_code ;
	private String cinema_code ;
	private String theater_name ;
	private String movie_code ;
	private String scr_date ;
	private String scr_start ;
	private int price ;
	
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
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	public String getScr_date() {
		return scr_date;
	}
	public void setScr_date(String scr_date) {
		this.scr_date = scr_date;
	}
	public String getScr_start() {
		return scr_start;
	}
	public void setScr_start(String scr_start) {
		this.scr_start = scr_start;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "TicketDTO [cust_code=" + cust_code + ", tk_code=" + tk_code + ", cinema_code=" + cinema_code
				+ ", theater_name=" + theater_name + ", movie_code=" + movie_code + ", scr_date=" + scr_date
				+ ", scr_start=" + scr_start + ", price=" + price + "]";
	}
	
}
