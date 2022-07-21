package kr.co.ezenac.model1.board;

import java.sql.Date;	

public class BoardDTO {
	//멤버 변수
	private String num;		
	private String title;	
	private String content; 
	private String id;		
	private Date postdate;	
	private String visitcount;
	private String name;
	private String upfile;
	private String answerWrite;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	public String getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUpfile() {
		return upfile;
	}
	public void setUpfile(String upfile) {
		this.upfile = upfile;
	}
	public String getAnswerWrite() {
		return answerWrite;
	}
	public void setAnswerWrite(String answerWrite) {
		this.answerWrite = answerWrite;
	}
	
	

	
	
}
