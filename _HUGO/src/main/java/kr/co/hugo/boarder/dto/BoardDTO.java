package kr.co.hugo.boarder.dto;

import org.springframework.stereotype.Component;

@Component("boardDTO")
public class BoardDTO {
	private int articleIdx;
	private String hotplaceIdx;
	private String contents;
	private String nickName;
	private int userTotalReview;
	private String restURL;
	private String regDate;
	private int reviewStamp;
	private String mainImage;
	private String subImage1;
	private String subImage2;
	private String subImage3;
	private String defaultImage;
	private int restaurantIdx;
	private int starCount;
	private String title;

	public BoardDTO() {
	}

	public BoardDTO(int articleIdx, String hotplaceIdx, String contents, String nickName, int userTotalReview,
			String restURL, String regDate, int reviewStamp, String mainImage, String subImage1, String subImage2,
			String subImage3, String defaultImage, int restaurantIdx, int starCount, String title) {
		this.articleIdx = articleIdx;
		this.hotplaceIdx = hotplaceIdx;
		this.contents = contents;
		this.nickName = nickName;
		this.userTotalReview = userTotalReview;
		this.restURL = restURL;
		this.regDate = regDate;
		this.reviewStamp = reviewStamp;
		this.mainImage = mainImage;
		this.subImage1 = subImage1;
		this.subImage2 = subImage2;
		this.subImage3 = subImage3;
		this.defaultImage = defaultImage;
		this.restaurantIdx = restaurantIdx;
		this.starCount = starCount;
		this.title = title;
	}

	public int getArticleIdx() {
		return articleIdx;
	}

	public void setArticleIdx(int articleIdx) {
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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getUserTotalReview() {
		return userTotalReview;
	}

	public void setUserTotalReview(int userTotalReview) {
		this.userTotalReview = userTotalReview;
	}

	public String getRestURL() {
		return restURL;
	}

	public void setRestURL(String restURL) {
		this.restURL = restURL;
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

	public String getMainImage() {
		return mainImage;
	}

	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}

	public int getStarCount() {
		return starCount;
	}

	public void setStarCount(int starCount) {
		this.starCount = starCount;
	}

	public String getSubImage1() {
		return subImage1;
	}

	public void setSubImage1(String subImage1) {
		this.subImage1 = subImage1;
	}

	public String getSubImage2() {
		return subImage2;
	}

	public void setSubImage2(String subImage2) {
		this.subImage2 = subImage2;
	}

	public String getSubImage3() {
		return subImage3;
	}

	public void setSubImage3(String subImage3) {
		this.subImage3 = subImage3;
	}

	public String getDefaultImage() {
		return defaultImage;
	}

	public void setDefaultImage(String defaultImage) {
		this.defaultImage = defaultImage;
	}

	public int getRestaurantIdx() {
		return restaurantIdx;
	}

	public void setRestaurantIdx(int restaurantIdx) {
		this.restaurantIdx = restaurantIdx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	

}
