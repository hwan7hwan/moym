package org.moym.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



public class Criteria {
	
	private int pageNum;	//now page
	private int amount;		//amount of posts on a page
	private int skip;		//amount of posts to skip (pageNum-1) * amount ) 
	
	private String writer;
	

	


	private String type;
	private String keyword;
	
	public Criteria(int pageNum, int amount) {
		 
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum-1)*amount;
		
		/*
		this.pageNum = pageNum;		//--> 이렇게 했을때 페이지 버튼을 누르면 그만큼 더나옴
		this.amount = pageNum * amount;
		this.skip = 0;
		*/
		
	}
	
	
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.skip = (pageNum-1)*amount;
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.skip = (pageNum-1)*amount;
		this.amount = amount;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}

	public Criteria() {
		this(1,10); 
		this.skip = 0;
		
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", skip=" + skip + ", type=" + type
				+ ", keyword=" + keyword + "]";
	}
	
	
	
	
	
	
	
	public String[] getTypeArr() {
		
		return type == null? new String[] {}: type.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
	}
	
	
	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}
	

}
