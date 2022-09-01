package com.movie.b4.dto;

public class CinemaDTO {
	private String cinema_code;
	private String cinema_name;
	private String cinema_adres;
	private String cinema_tel;
	private String cinema_image;
	private int theater_count;
	private int seat_count;
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
	public String getCinema_adres() {
		return cinema_adres;
	}
	public void setCinema_adres(String cinema_adres) {
		this.cinema_adres = cinema_adres;
	}
	public String getCinema_tel() {
		return cinema_tel;
	}
	public void setCinema_tel(String cinema_tel) {
		this.cinema_tel = cinema_tel;
	}
	public String getCinema_image() {
		return cinema_image;
	}
	public void setCinema_image(String cinema_image) {
		this.cinema_image = cinema_image;
	}
	
	public int getTheater_count() {
		return theater_count;
	}
	public void setTheater_count(int theater_count) {
		this.theater_count = theater_count;
	}
	public int getSeat_count() {
		return seat_count;
	}
	public void setSeat_count(int seat_count) {
		this.seat_count = seat_count;
	}
	@Override
	public String toString() {
		return "CinemaDTO [cinema_code=" + cinema_code + ", cinema_name=" + cinema_name + ", cinema_adres="
				+ cinema_adres + ", cinema_tel=" + cinema_tel + ", cinema_image=" + cinema_image + "]";
	}
}
