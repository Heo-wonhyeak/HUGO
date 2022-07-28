package kr.co.lentcar.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.lentcar.member.dto.MemberDTO;

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
}
