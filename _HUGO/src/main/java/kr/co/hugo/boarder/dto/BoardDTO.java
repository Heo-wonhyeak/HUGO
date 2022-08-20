package kr.co.hugo.boarder.dto;

import org.springframework.stereotype.Component;

@Component("boardDTO")
public class BoardDTO {
	private String articleIdx;
	private String hotplaceIdx;
	private String contents;
	private String username;
	private int userTotalReview;
	private int restIdx;
	private String regDate;
	private int reviewStamp;
	
	public BoardDTO() {}

	public BoardDTO(String articleIdx, String hotplaceIdx, String contents, String username, int userTotalReview,
			int restIdx, String regDate, int reviewStamp) {
		this.articleIdx = articleIdx;
		this.hotplaceIdx = hotplaceIdx;
		this.contents = contents;
		this.username = username;
		this.userTotalReview = userTotalReview;
		this.restIdx = restIdx;
		this.regDate = regDate;
		this.reviewStamp = reviewStamp;
	}

	public String getArticleIdx() {
		return articleIdx;
	}

	public void setArticleIdx(String articleIdx) {
		this.articleIdx = articleIdx;
	}

	public String getHotplaceIdx() {
		return hotplaceIdx;
	}

	public void setHotplaceIdx(String hotplaceIdx) {
		this.hotplaceIdx = hotplaceIdx;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getUserTotalReview() {
		return userTotalReview;
	}

	public void setUserTotalReview(int userTotalReview) {
		this.userTotalReview = userTotalReview;
	}

	public int getRestIdx() {
		return restIdx;
	}

	public void setRestIdx(int restIdx) {
		this.restIdx = restIdx;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getReviewStamp() {
		return reviewStamp;
	}

	public void setReviewStamp(int reviewStamp) {
		this.reviewStamp = reviewStamp;
	}

	
	
	
	
}
