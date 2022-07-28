package kr.co.lentcar.member.dto;

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
	private String pw;
	private String nickname;
	private String name;
	private String birth;
	private String gender;
	private String phonenum;
	private String email;
	
	public MemberDTO() {}
	
	public MemberDTO(String id, String pw,String name, String nickname, String phonenum, String email) {
//		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.phonenum = phonenum;
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

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
