package com.movie.b4.dto;

public class BookSeatDTO {
	
	private String cinema_code;
	private String theater_name;
	private String scr_date;
	private String scr_start;
	private String seat_name;
	private String movie_code;
	
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
	public String getSeat_name() {
		return seat_name;
	}
	public void setSeat_name(String seat_name) {
		this.seat_name = seat_name;
	}
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	@Override
	public String toString() {
		return "BookSeatDTO [cinema_code=" + cinema_code + ", theater_name=" + theater_name + ", scr_date=" + scr_date
				+ ", scr_start=" + scr_start + ", seat_name=" + seat_name + ", movie_code=" + movie_code + "]";
	}
	
}
