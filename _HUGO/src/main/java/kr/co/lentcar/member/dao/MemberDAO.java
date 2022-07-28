package kr.co.lentcar.member.dao;

import org.springframework.dao.DataAccessException;

import kr.co.lentcar.member.dto.MemberDTO;

public interface MemberDAO {

	public int insertMember(MemberDTO memberDTO) throws DataAccessException;
	public String selectDuplicateCheck(String id) throws DataAccessException;
	
}
