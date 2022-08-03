package kr.co.hugo.common.crawler.restinfo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.hugo.common.crawler.restinfo.dto.RestInfoDTO;

@Repository("restInfoDAO")
public class RestInfoDAO {
	
	
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<RestInfoDTO> selectAllUrlList() throws Exception {
		List<RestInfoDTO> restInfoList = sqlSession.selectList("crawler.selectAllRestURL");
		return restInfoList;
		
	}
}
