package kr.co.hugo.event.dto;

public class EventLikeDTO {
	private int like_idx;
	private int like_yn;
	private int event_idx;
	private String id;
	
	public int getLike_idx() {
		return like_idx;
	}
	public void setLike_idx(int like_idx) {
		this.like_idx = like_idx;
	}
	public int getLike_yn() {
		return like_yn;
	}
	public void setLike_yn(int like_yn) {
		this.like_yn = like_yn;
	}
	public int getEvent_idx() {
		return event_idx;
	}
	public void setEvent_idx(int event_idx) {
		this.event_idx = event_idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
