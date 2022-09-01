package com.movie.b4.dto;

public class ScreenListDTO {
	
	private String cinema_code;
	private String theater_name;
	private String movie_code;
	private String scr_date;
	private String scr_start;
	private String scr_end;
	private String cinema_name;
	private String movie_name;
	
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
	public String getScr_end() {
		return scr_end;
	}
	public void setScr_end(String scr_end) {
		this.scr_end = scr_end;
	}
	public String getCinema_name() {
		return cinema_name;
	}
	public void setCinema_name(String cinema_name) {
		this.cinema_name = cinema_name;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	@Override
	public String toString() {
		return "ScreenListDTO [cinema_code=" + cinema_code + ", theater_name=" + theater_name + ", movie_code="
				+ movie_code + ", scr_date=" + scr_date + ", scr_start=" + scr_start + ", scr_end=" + scr_end
				+ ", cinema_name=" + cinema_name + ", movie_name=" + movie_name + "]";
	}
}
