package com.example.hugo.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.hugo.dto.HotSpotDTO;

@Repository
public class HotSpotDAOImpl implements HotSpotDAO{
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<HotSpotDTO> selectHotSpotList(HotSpotDTO dto) {
		List<HotSpotDTO> result = sqlSession.selectList("hotSpotMapper.selectHotSpotList", dto);
		return result;
	}

	@Override
	public int selectHotSpotListCount(HotSpotDTO dto) {
		return sqlSession.selectOne("hotSpotMapper.selectHotSpotListCount", dto);
	}

}
