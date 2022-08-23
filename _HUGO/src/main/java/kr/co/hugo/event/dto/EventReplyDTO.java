package kr.co.hugo.event.dto;

public class EventReplyDTO {
	private int event_reply_idx;
	private String nickname;
	private String writedate;
	private String content;
	private int event_idx;
	public int getEvent_reply_idx() {
		return event_reply_idx;
	}
	public void setEvent_reply_idx(int event_reply_idx) {
		this.event_reply_idx = event_reply_idx;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getEvent_idx() {
		return event_idx;
	}
	public void setEvent_idx(int event_idx) {
		this.event_idx = event_idx;
	}
}
