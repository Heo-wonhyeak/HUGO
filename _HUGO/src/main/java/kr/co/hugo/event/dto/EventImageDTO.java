package kr.co.hugo.event.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

public class EventImageDTO {
	private int img_idx;
	private String img_name;
	private int event_idx;
	
	public int getImg_idx() {
		return img_idx;
	}
	public void setImg_idx(int img_idx) {
		this.img_idx = img_idx;
	}
	public String getImg_name() {
		// 한글 깨짐 방지
		if(img_name != null && img_name.length() != 0) {
			try {
				img_name = URLDecoder.decode(img_name, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}	
		return img_name;
	}
	public void setImg_name(String img_name) {
		//한글 깨짐 방지
		if(img_name != null && img_name.length() != 0) {
			try {
				this.img_name = URLEncoder.encode(img_name, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}		
	}
	public int getEvent_idx() {
		return event_idx;
	}
	public void setEvent_idx(int event_idx) {
		this.event_idx = event_idx;
	}

}
