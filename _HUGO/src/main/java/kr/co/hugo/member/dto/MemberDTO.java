package kr.co.hugo.member.dto;

import org.springframework.stereotype.Component;

/*
 id varchar2(20) PRIMARY KEY
	,pw varchar2(20) NOT NULL
	,nickname varchar2(20) NOT NULL
	,birth DATE 
	,gender varchar2(10)
	,phonenum varchar2(20) NOT NULL
	,email varchar2(100) NOT NULL	
 */
@Component("memberDTO")
public class MemberDTO {
	private String id;
	private String pwd;
	private String nickname;
	private String name;
	private String birthday;
	private String gender;
	private String callnum;
	private String email;
	
	public MemberDTO() {}
	
	public MemberDTO(String id, String pwd,String name, String nickname, String callnum, String email) {
//		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nickname = nickname;
		this.callnum = callnum;
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCallnum() {
		return callnum;
	}

	public void setCallnum(String callnum) {
		this.callnum = callnum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
