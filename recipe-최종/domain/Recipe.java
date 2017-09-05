package com.conv.recipe.domain;

public class Recipe {

	private int no ;
	private String id;
	private String title ;
	private String content;
	private String manage  ;
	private int hist;
	private String photo;
	
	public int getHist() {
		return hist;
	}
	public void setHist(int hist) {
		this.hist = hist;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getHits() {
		return hist;
	}
	public void setHits(int hist) {
		this.hist = hist;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getManage() {
		return manage;
	}
	public void setManage(String manage) {
		this.manage = manage;
	}
}
