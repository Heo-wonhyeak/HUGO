package kr.co.hugo.memberInfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hugo.member.dto.MemberDTO;
import kr.co.hugo.memberInfo.dao.MemberInfoDAO;

@Service("memberInfoService")
public class MemberInfoServiceImpl implements MemberInfoService{
	@Autowired
	private MemberInfoDAO memberInfoDAO;
	
	@Override
	public void updateMemberInfo(MemberDTO memberDTO) throws Exception {
		memberInfoDAO.updateMemberInfo(memberDTO);
	}
	
	@Override
	public MemberDTO viewMemberInfo(String id) {
		return memberInfoDAO.viewMemberInfo(id);
	}
}
