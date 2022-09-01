package com.movie.b4.dto;

public class TheaterDTO {
	
	private String cinema_code;
	private String theater_name;
	private int seat_x;
	private int seat_y;
	public String getCinema_code() {
		return cinema_code;
	}
	public void setCinema_code(String cinema_code) {
		this.cinema_code = cinema_code;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String therter_name) {
		this.theater_name = therter_name;
	}
	public int getSeat_x() {
		return seat_x;
	}
	public void setSeat_x(int seat_x) {
		this.seat_x = seat_x;
	}
	public int getSeat_y() {
		return seat_y;
	}
	public void setSeat_y(int seat_y) {
		this.seat_y = seat_y;
	}
	@Override
	public String toString() {
		return "TheaterDTO [cinema_code=" + cinema_code + ", theater_name=" + theater_name + ", seat_x=" + seat_x
				+ ", seat_y=" + seat_y + "]";
	}
	

	

}
