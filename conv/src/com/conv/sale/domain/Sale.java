package com.conv.sale.domain;

public class Sale {
	private String productName;
	private String imageURL;
	private int price;
	private String option;
	private String convName;
	
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getConvName() {
		return convName;
	}
	public void setConvName(String convName) {
		this.convName = convName;
	}
	
}
