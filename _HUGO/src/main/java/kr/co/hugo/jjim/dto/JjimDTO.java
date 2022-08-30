package kr.co.hugo.jjim.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class JjimDTO {
		
	private int jjimNO;
	private int restaurantIdx;
	private String id;
	private String nickName;
	private Date regDate;
	
	public JjimDTO() {}
	public JjimDTO(int jjimNO, int restaurantIdx, String id, String nickName,Date regDate) {
		this.jjimNO = jjimNO;
		this.restaurantIdx = restaurantIdx;
		this.id = id;
		this.nickName = nickName;
		this.regDate = regDate;
	}
	public int getJjimNO() {
		return jjimNO;
	}
	public void setJjimNO(int jjimNO) {
		this.jjimNO = jjimNO;
	}
	public int getRestaurantIdx() {
		return restaurantIdx;
	}
	public void setRestaurantIdx(int restaurantIdx) {
		this.restaurantIdx = restaurantIdx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}

