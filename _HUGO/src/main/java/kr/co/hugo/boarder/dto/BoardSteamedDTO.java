package kr.co.hugo.boarder.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class BoardSteamedDTO {
	
	public int steamedIdx;
	public int articleIdx;
	public int restIdx;
	public String id;
	private Date regDate;
	
	public BoardSteamedDTO() {}
	public BoardSteamedDTO(int steamedIdx, int articleIdx, int restIdx,String id, Date regDate) {
		this.steamedIdx = steamedIdx;
		this.articleIdx = articleIdx;
		this.restIdx = restIdx;
		this.id = id;
		this.regDate = regDate;
	}



	public int getSteamedIdx() {
		return steamedIdx;
	}
	public void setSteamedIdx(int steamedIdx) {
		this.steamedIdx = steamedIdx;
	}
	public int getArticleIdx() {
		return articleIdx;
	}
	public void setArticleIdx(int articleIdx) {
		this.articleIdx = articleIdx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getRestIdx() {
		return restIdx;
	}
	public void setRestIdx(int restIdx) {
		this.restIdx = restIdx;
	}
	
}
