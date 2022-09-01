package com.movie.b4.dto;

public class SeatListDTO {
	
	private String cinema_code;
	private String theater_name;
	private String seat_name;
	private char grade;
	private char use_check;
	private String cinema_name;
	
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
	public String getSeat_name() {
		return seat_name;
	}
	public void setSeat_name(String seat_name) {
		this.seat_name = seat_name;
	}
	public char getGrade() {
		return grade;
	}
	public void setGrade(char grade) {
		this.grade = grade;
	}
	public char getUse_check() {
		return use_check;
	}
	public void setUse_check(char use_check) {
		this.use_check = use_check;
	}
	public String getCinema_name() {
		return cinema_name;
	}
	public void setCinema_name(String cinema_name) {
		this.cinema_name = cinema_name;
	}
	
	
}
