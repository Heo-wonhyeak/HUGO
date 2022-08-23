package kr.co.hugo.memberInfo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.hugo.member.dto.MemberDTO;

@Repository("memberInfoDAO")
public class MemberInfoDAOImpl implements MemberInfoDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberDTO viewMemberInfo(String id) {
		return sqlSession.selectOne("mapper.memberInfo.viewMemberInfo", id);
	}
	@Override
	public void updateMemberInfo(MemberDTO memberDTO) throws DataAccessException {
		sqlSession.update("mapper.memberInfo.updateMemberInfo", memberDTO);
		
	}
	

}
