package com.movie.b4.dto;

public class MovieDTO {
	private String movie_code;
	private int movie_audience;
	private String movie_name;
	private String movie_genre;
	private String movie_gmgr;
	private String movie_act;
	private String movie_time;
	private int movie_grade;
	private String movie_date;
	private String movie_intrcn;
	private String movie_poster;
	private String movie_teaser;
	private String movie_rate;
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	public int getMovie_audience() {
		return movie_audience;
	}
	public void setMovie_audience(int movie_audience) {
		this.movie_audience = movie_audience;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getMovie_genre() {
		return movie_genre;
	}
	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}
	public String getMovie_gmgr() {
		return movie_gmgr;
	}
	public void setMovie_gmgr(String movie_gmgr) {
		this.movie_gmgr = movie_gmgr;
	}
	public String getMovie_act() {
		return movie_act;
	}
	public void setMovie_act(String movie_act) {
		this.movie_act = movie_act;
	}
	public String getMovie_time() {
		return movie_time;
	}
	public void setMovie_time(String movie_time) {
		this.movie_time = movie_time;
	}
	public int getMovie_grade() {
		return movie_grade;
	}
	public void setMovie_grade(int movie_grade) {
		this.movie_grade = movie_grade;
	}
	public String getMovie_date() {
		return movie_date;
	}
	public void setMovie_date(String movie_date) {
		this.movie_date = movie_date;
	}
	public String getMovie_intrcn() {
		return movie_intrcn;
	}
	public void setMovie_intrcn(String movie_intrcn) {
		this.movie_intrcn = movie_intrcn;
	}
	public String getMovie_poster() {
		return movie_poster;
	}
	public void setMovie_poster(String movie_poster) {
		this.movie_poster = movie_poster;
	}
	public String getMovie_teaser() {
		return movie_teaser;
	}
	public void setMovie_teaser(String movie_teaser) {
		this.movie_teaser = movie_teaser;
	}
	public String getMovie_rate() {
		return movie_rate;
	}
	public void setMovie_rate(String movie_rate) {
		this.movie_rate = movie_rate;
	}
	@Override
	public String toString() {
		return "MovieDTO [movie_code=" + movie_code + ", movie_audience=" + movie_audience + ", movie_name="
				+ movie_name + ", movie_genre=" + movie_genre + ", movie_gmgr=" + movie_gmgr + ", movie_act="
				+ movie_act + ", movie_time=" + movie_time + ", movie_grade=" + movie_grade + ", movie_date="
				+ movie_date + ", movie_intrcn=" + movie_intrcn + ", movie_poster=" + movie_poster + ", movie_teaser="
				+ movie_teaser + ", movie_rate=" + movie_rate + "]";
	}
}
