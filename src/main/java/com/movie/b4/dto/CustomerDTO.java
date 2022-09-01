package com.movie.b4.dto;

public class CustomerDTO {
	private String cust_code;
	private String cust_id ;
	private String cust_pw ;
	private String cust_name ;
	private String cust_email;
	private String cust_tel ;
	private String cust_birth ;
	private String manager_check ;
	
	public String getCust_code() {
		return cust_code;
	}
	public void setCust_code(String cust_code) {
		this.cust_code = cust_code;
	}
	public String getCust_id() {
		return cust_id;
	}
	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}
	public String getCust_pw() {
		return cust_pw;
	}
	public void setCust_pw(String cust_pw) {
		this.cust_pw = cust_pw;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getCust_tel() {
		return cust_tel;
	}
	public void setCust_tel(String cust_tel) {
		this.cust_tel = cust_tel;
	}
	public String getCust_birth() {
		return cust_birth;
	}
	public void setCust_birth(String cust_birth) {
		this.cust_birth = cust_birth;
	}
	public String getManager_check() {
		return manager_check;
	}
	public void setManager_check(String manager_check) {
		this.manager_check = manager_check;
	}
	public String getCust_email() {
		return cust_email;
	}
	public void setCust_email(String cust_email) {
		this.cust_email = cust_email;
	}
	@Override
	public String toString() {
		return "CustomerDTO [cust_code=" + cust_code + ", cust_id=" + cust_id + ", cust_pw=" + cust_pw + ", cust_name="
				+ cust_name + ", cust_email=" + cust_email + ", cust_tel=" + cust_tel + ", cust_birth=" + cust_birth
				+ ", manager_check=" + manager_check + "]";
	}
	
	
}
