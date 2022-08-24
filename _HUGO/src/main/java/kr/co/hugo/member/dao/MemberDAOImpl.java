package kr.co.hugo.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.hugo.member.dto.MemberDTO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

	@Autowired 
	private SqlSession sqlSession;

	@Override
	public int insertMember(MemberDTO memberDTO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.insertMember", memberDTO);
		return result;
	}

	@Override
	public String selectDuplicateCheck(String id) throws DataAccessException {
		String result = (String)sqlSession.selectOne("mapper.member.duplicatecheck",id);
		
		return result;
	}

	@Override
	public MemberDTO loginById(MemberDTO member) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.loginById", member);
	}
	
	@Override
	public String searchId(MemberDTO member) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.searchId", member);
	}
	
	@Override
	public int searchPw(MemberDTO member) throws DataAccessException {
		int result = (int)sqlSession.selectOne("mapper.member.searchPw", member);
		return result;
	}
	
	@Override
	public void updatePw(MemberDTO member) throws DataAccessException {
		sqlSession.update("mapper.member.updatePw", member);
		
	}
}
