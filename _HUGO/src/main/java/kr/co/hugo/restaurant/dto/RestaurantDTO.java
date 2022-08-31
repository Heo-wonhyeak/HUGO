package kr.co.hugo.restaurant.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("restaurantDTO")
public class RestaurantDTO {
	
	private int restIdx;
	private String restName;
	private String restAddress;
	private String restJibunAddress;
	private String restPhone;
	private String restMenu;
	private String restPrice;
	private String restPark;
	private String restOpen;
	private String restMenuList;
	private Date restUpdateDate;
	private String restTag;
	private double restStarAvg;
	private int restVisitCount;
	private int restReviewCount;
	private int restJjim;
	private int hotplaceIdx;
	public RestaurantDTO() {
		
	}
	public RestaurantDTO(int restIdx, String restName, String restAddress, String restJibunAddress, String restPhone,
			String restMenu, String restPrice, String restPark, String restOpen, String restMenuList,
			Date restUpdateDate, String restTag, double restStarAvg, int restVisitCount, int restReviewCount, int restJjim,
			int hotplaceIdx) {
		this.restIdx = restIdx;
		this.restName = restName;
		this.restAddress = restAddress;
		this.restJibunAddress = restJibunAddress;
		this.restPhone = restPhone;
		this.restMenu = restMenu;
		this.restPrice = restPrice;
		this.restPark = restPark;
		this.restOpen = restOpen;
		this.restMenuList = restMenuList;
		this.restUpdateDate = restUpdateDate;
		this.restTag = restTag;
		this.restStarAvg = restStarAvg;
		this.restVisitCount = restVisitCount;
		this.restReviewCount = restReviewCount;
		this.restJjim = restJjim;
		this.hotplaceIdx = hotplaceIdx;
	}
	public int getRestIdx() {
		return restIdx;
	}
	public void setRestIdx(int restIdx) {
		this.restIdx = restIdx;
	}
	public String getRestName() {
		return restName;
	}
	public void setRestName(String restName) {
		this.restName = restName;
	}
	public String getRestAddress() {
		return restAddress;
	}
	public void setRestAddress(String restAddress) {
		this.restAddress = restAddress;
	}
	public String getRestJibunAddress() {
		return restJibunAddress;
	}
	public void setRestJibunAddress(String restJibunAddress) {
		this.restJibunAddress = restJibunAddress;
	}
	public String getRestPhone() {
		return restPhone;
	}
	public void setRestPhone(String restPhone) {
		this.restPhone = restPhone;
	}
	public String getRestMenu() {
		return restMenu;
	}
	public void setRestMenu(String restMenu) {
		this.restMenu = restMenu;
	}
	public String getRestPrice() {
		return restPrice;
	}
	public void setRestPrice(String restPrice) {
		this.restPrice = restPrice;
	}
	public String getRestPark() {
		return restPark;
	}
	public void setRestPark(String restPark) {
		this.restPark = restPark;
	}
	public String getRestOpen() {
		return restOpen;
	}
	public void setRestOpen(String restOpen) {
		this.restOpen = restOpen;
	}
	public String getRestMenuList() {
		return restMenuList;
	}
	public void setRestMenuList(String restMenuList) {
		this.restMenuList = restMenuList;
	}
	public Date getRestUpdateDate() {
		return restUpdateDate;
	}
	public void setRestUpdateDate(Date restUpdateDate) {
		this.restUpdateDate = restUpdateDate;
	}
	public String getRestTag() {
		return restTag;
	}
	public void setRestTag(String restTag) {
		this.restTag = restTag;
	}
	public double getRestStarAvg() {
		return restStarAvg;
	}
	public void setRestStarAvg(double restStarAvg) {
		this.restStarAvg = restStarAvg;
	}
	public int getRestVisitCount() {
		return restVisitCount;
	}
	public void setRestVisitCount(int restVisitCount) {
		this.restVisitCount = restVisitCount;
	}
	public int getRestReviewCount() {
		return restReviewCount;
	}
	public void setRestReviewCount(int restReviewCount) {
		this.restReviewCount = restReviewCount;
	}
	public int getRestJjim() {
		return restJjim;
	}
	public void setRestJjim(int restJjim) {
		this.restJjim = restJjim;
	}
	public int getHotplaceIdx() {
		return hotplaceIdx;
	}
	public void setHotplaceIdx(int hotplaceIdx) {
		this.hotplaceIdx = hotplaceIdx;
	}
	
	
	
	
	
}

