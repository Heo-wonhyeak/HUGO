package kr.co.lentcar.member.service;

import org.springframework.dao.DataAccessException;

import kr.co.lentcar.member.dto.MemberDTO;

public interface MemberService {

	public int addMember(MemberDTO memberDTO) throws DataAccessException;

	public String duplicateCheck(String id) throws Exception;

}
