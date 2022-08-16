package kr.co.hugo.member.service;

import org.springframework.dao.DataAccessException;

import kr.co.hugo.member.dto.MemberDTO;

public interface MemberService {

	public int addMember(MemberDTO memberDTO) throws DataAccessException;

	public String duplicateCheck(String id) throws Exception;

	public MemberDTO login(MemberDTO member)throws DataAccessException;

}
