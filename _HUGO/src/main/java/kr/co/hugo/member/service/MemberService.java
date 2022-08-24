package kr.co.hugo.member.service;

import org.springframework.dao.DataAccessException;

import kr.co.hugo.member.dto.MemberDTO;

public interface MemberService {

	public int addMember(MemberDTO memberDTO) throws DataAccessException;

	public String duplicateCheck(String id) throws Exception;

	public MemberDTO login(MemberDTO member) throws Exception;
	public String searchId(MemberDTO member) throws Exception;
	public int searchPw(MemberDTO member) throws Exception;
	public void updatePw(MemberDTO member) throws Exception;
}
