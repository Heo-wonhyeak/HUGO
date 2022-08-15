package kr.co.hugo.crawler.restinfo.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.hugo.crawler.restinfo.dto.RestInfoDTO;

@Repository
public class RestInfoDAO {

	@Autowired
	private SqlSession sqlSession;

	public List<RestInfoDTO> selectAllUrlList() {
		List<RestInfoDTO> restInfoList = sqlSession.selectList("mapper.crawler.selectAllRestURL");
		return restInfoList;
	}

	public int insertRest(Map<String,Object> restInfoMap) {
		int result = 0;
		result=sqlSession.insert("mapper.crawler.insertRestInfo", restInfoMap);
		return result;
	}
}
