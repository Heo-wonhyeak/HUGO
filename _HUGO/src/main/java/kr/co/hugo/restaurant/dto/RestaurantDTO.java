package kr.co.hugo.restaurant.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class RestaurantDTO {
	
	private int rest_idx;
	private String rest_name;
	private String rest_address;
	private String rest_jibunAddress;
	private String rest_phone;
	private String rest_menu;
	private String rest_price;
	private String rest_park;
	private String rest_open;
	private String rest_menu_list;
	private Date rest_update_date;
	private String rest_tag;
	private int rest_starAvg;
	private int rest_visitCount;
	private int rest_reviewCount;
	private int rest_jjim;
	private int hotplace_idx;
	public RestaurantDTO() {
		
	}
	public RestaurantDTO(int rest_idx, String rest_name, String rest_address, String rest_jibunAddress,
			String rest_phone, String rest_menu, String rest_price, String rest_park, String rest_open,
			String rest_menu_list, Date rest_update_date, String rest_tag, int rest_starAvg, int rest_visitCount,
			int rest_reviewCount, int rest_jjim, int hotplace_idx) {
		this.rest_idx = rest_idx;
		this.rest_name = rest_name;
		this.rest_address = rest_address;
		this.rest_jibunAddress = rest_jibunAddress;
		this.rest_phone = rest_phone;
		this.rest_menu = rest_menu;
		this.rest_price = rest_price;
		this.rest_park = rest_park;
		this.rest_open = rest_open;
		this.rest_menu_list = rest_menu_list;
		this.rest_tag = rest_tag;
	
	}
	public int getRest_idx() {
		return rest_idx;
	}
	public void setRest_idx(int rest_idx) {
		this.rest_idx = rest_idx;
	}
	public String getRest_name() {
		return rest_name;
	}
	public void setRest_name(String rest_name) {
		this.rest_name = rest_name;
	}
	public String getRest_address() {
		return rest_address;
	}
	public void setRest_address(String rest_address) {
		this.rest_address = rest_address;
	}
	public String getRest_jibunAddress() {
		return rest_jibunAddress;
	}
	public void setRest_jibunAddress(String rest_jibunAddress) {
		this.rest_jibunAddress = rest_jibunAddress;
	}
	public String getRest_phone() {
		return rest_phone;
	}
	public void setRest_phone(String rest_phone) {
		this.rest_phone = rest_phone;
	}
	public String getRest_menu() {
		return rest_menu;
	}
	public void setRest_menu(String rest_menu) {
		this.rest_menu = rest_menu;
	}
	public String getRest_price() {
		return rest_price;
	}
	public void setRest_price(String rest_price) {
		this.rest_price = rest_price;
	}
	public String getRest_park() {
		return rest_park;
	}
	public void setRest_park(String rest_park) {
		this.rest_park = rest_park;
	}
	public String getRest_open() {
		return rest_open;
	}
	public void setRest_open(String rest_open) {
		this.rest_open = rest_open;
	}
	public String getRest_menu_list() {
		return rest_menu_list;
	}
	public void setRest_menu_list(String rest_menu_list) {
		this.rest_menu_list = rest_menu_list;
	}
	public Date getRest_update_date() {
		return rest_update_date;
	}
	public void setRest_update_date(Date rest_update_date) {
		this.rest_update_date = rest_update_date;
	}
	public String getRest_tag() {
		return rest_tag;
	}
	public void setRest_tag(String rest_tag) {
		this.rest_tag = rest_tag;
	}
	public int getRest_starAvg() {
		return rest_starAvg;
	}
	public void setRest_starAvg(int rest_starAvg) {
		this.rest_starAvg = rest_starAvg;
	}
	public int getRest_visitCount() {
		return rest_visitCount;
	}
	public void setRest_visitCount(int rest_visitCount) {
		this.rest_visitCount = rest_visitCount;
	}
	public int getRest_reviewCount() {
		return rest_reviewCount;
	}
	public void setRest_reviewCount(int rest_reviewCount) {
		this.rest_reviewCount = rest_reviewCount;
	}
	public int getRest_jjim() {
		return rest_jjim;
	}
	public void setRest_jjim(int rest_jjim) {
		this.rest_jjim = rest_jjim;
	}
	public int getHotplace_idx() {
		return hotplace_idx;
	}
	public void setHotplace_idx(int hotplace_idx) {
		this.hotplace_idx = hotplace_idx;
	}
	
	
	
}

