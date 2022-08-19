package kr.co.hugo.memberInfo.service;

import kr.co.hugo.member.dto.MemberDTO;

public interface MemberInfoService {
	
	public void updateMemberInfo(MemberDTO memberDTO) throws Exception;

	public MemberDTO viewMemberInfo(String id);

}
