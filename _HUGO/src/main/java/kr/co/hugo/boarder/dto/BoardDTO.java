package kr.co.hugo.boarder.dto;

import org.springframework.stereotype.Component;
/*
 articleNO number(10) PRIMARY KEY
	,cate varchar2(10) NOT NULL
	,title varchar2(100) NOT NULL
	,nickname varchar2(20) NOT NULL
	,content varchar2(1000) NOT NULL
	,regDate DATE DEFAULT sysdate
 */
@Component("boardDTO")
public class BoardDTO {
	private String articleNO;
	private String cate;
	private String title;
	private String nickname;
	private String content;
	private String regDate;
	
	public BoardDTO() {}

	public BoardDTO(String articleNO, String cate, String title, String nickname, String content) {
//		super();
		this.articleNO = articleNO;
		this.cate = cate;
		this.title = title;
		this.nickname = nickname;
		this.content = content;
	}

	public String getArticleNO() {
		return articleNO;
	}

	public void setArticleNO(String articleNO) {
		this.articleNO = articleNO;
	}

	public String getCate() {
		return cate;
	}

	public void setCate(String cate) {
		this.cate = cate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
	
	
}
