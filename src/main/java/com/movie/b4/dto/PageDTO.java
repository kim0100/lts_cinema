package com.movie.b4.dto;

public class PageDTO {

	//DB
	private int curPage; //현재 페이지 번호
	private int perPage; //페이지 당 글의 개수
	
	private int startRow; //페이지의 시작 글 번호
	private int lastRow; //페이지의 마지막 글 번호
	
	//DB Screening, Seat 전용
	private String cinema_code; // 극장코드
	private String theater_name; // 상영관이름
	
	//View (JSP)
	private boolean prev = false; // 이전페이지 존재 여부
	private boolean next = false; // 다음페이지 존재 여부
	private int startNum; //블럭 시작번호
	private int lastNum; //블럭 마지막 번호
	
	private int curBlock; //현재 블럭번호
	private int totalBlock; //전체 블럭 개수

	public int getCurPage() {
		if(curPage == 0) {
			curPage = 1;
		}
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	
	public int getPerPage() {
		if(perPage == 0) {
			perPage = 10;
		}
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getLastRow() {
		return lastRow;
	}

	public void setLastRow(int lastRow) {
		this.lastRow = lastRow;
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

	public boolean getPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean getNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getStartNum() {
		return startNum;
	}
	
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	
	public int getLastNum() {
		return lastNum;
	}
	
	public void setLastNum(int lastNum) {
		this.lastNum = lastNum;
	}
	
	public int getCurBlock() {
		return curBlock;
	}
	
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	
	public int getTotalBlock() {
		return totalBlock;
	}
	
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}	

	public void makeRow() {
		this.startRow = (this.getCurPage()-1)*this.getPerPage() + 1;
		this.lastRow = this.getCurPage() * this.getPerPage();
	}
	

	public void makePager(int count) {
		//1. 전체 글 개수 가져오기 totalCount
		
		//2. 전체 페이지 개수 가져오기 totalPage	
		int totalPage = count / this.getPerPage();
		if(count % this.getPerPage() != 0) {
			totalPage++;
		}
		
		//3. 전체 블럭 개수 가져오기 totalBlock
		int perBlock = 10;
		totalBlock = totalPage / perBlock;
		if(totalPage % perBlock != 0) {
			totalBlock++;
		}
		
		//4. 현재 블럭 번호 구하기 curBlock <- 현재페이지로 현재블록번호 구하기
		curBlock = this.getCurPage() / perBlock;
		if(this.getCurPage() % perBlock != 0) {
			curBlock++;
		}
		
		//5. 현재 블럭의 시작페이지번호와 마지막페이지번호 구하기 
		startNum = (curBlock-1) * perBlock + 1;
		lastNum = curBlock * perBlock;
		
		//6. 현재블럭번호가 총블럭번호와 같다면, 그 블럭의 마지막번호는 총 페이지번호와 같다.
		if(curBlock == totalBlock) {
			lastNum = totalPage;
		}
		
		// 7. 이전페이지, 다음페이지 여부
		if(curPage > 1) {
			prev = true;
		}
		
		if(curPage < totalPage) {
			next = true;
		}
		
	}

}