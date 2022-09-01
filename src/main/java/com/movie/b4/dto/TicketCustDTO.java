package com.movie.b4.dto;

public class TicketCustDTO {
	private String cust_code;
	private String tk_code ;
	private String cinema_code ;
	private String cinema_name ;
	private String theater_name ;
	private String movie_code ;
	private String movie_name ;
	private String movie_poster ;
	private String scr_date ;
	private String scr_start ;
	private int price ;
	private String seat_name;
	
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
	public String getCinema_name() {
		return cinema_name;
	}
	public void setCinema_name(String cinema_name) {
		this.cinema_name = cinema_name;
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
	public String getMovie_name() {
		return movie_name;
	}
	public String getMovie_poster() {
		return movie_poster;
	}
	public void setMovie_poster(String movie_poster) {
		this.movie_poster = movie_poster;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
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
	public String getSeat_name() {
		return seat_name;
	}
	public void setSeat_name(String seat_name) {
		this.seat_name = seat_name;
	}
	@Override
	public String toString() {
		return "TicketCustDTO [cust_code=" + cust_code + ", tk_code=" + tk_code + ", cinema_code=" + cinema_code
				+ ", cinema_name=" + cinema_name + ", theater_name=" + theater_name + ", movie_code=" + movie_code
				+ ", movie_name=" + movie_name + ", scr_date=" + scr_date + ", scr_start=" + scr_start + ", price="
				+ price + ", seat_name=" + seat_name + "]";
	}
	
	

	
	
	
	

	
	
	
}
