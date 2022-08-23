package kr.co.hugo.memberInfo.dao;

import org.springframework.dao.DataAccessException;

import kr.co.hugo.member.dto.MemberDTO;

public interface MemberInfoDAO {
	
	public void updateMemberInfo(MemberDTO memberDTO) throws DataAccessException;

	public MemberDTO viewMemberInfo(String id);


}
