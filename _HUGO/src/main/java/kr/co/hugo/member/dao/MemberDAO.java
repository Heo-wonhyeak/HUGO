package kr.co.hugo.member.dao;

import org.springframework.dao.DataAccessException;

import kr.co.hugo.member.dto.MemberDTO;

public interface MemberDAO {

	public int insertMember(MemberDTO memberDTO) throws DataAccessException;
	public String selectDuplicateCheck(String id) throws DataAccessException;
	public MemberDTO loginById(MemberDTO member) throws DataAccessException;
	
}
