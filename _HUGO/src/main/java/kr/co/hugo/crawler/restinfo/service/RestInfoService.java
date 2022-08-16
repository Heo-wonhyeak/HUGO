package kr.co.hugo.crawler.restinfo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hugo.crawler.restinfo.dao.RestInfoDAO;
import kr.co.hugo.crawler.restinfo.dto.RestInfoDTO;

@Service
public class RestInfoService {
	
	@Autowired
	RestInfoDAO restInfoDAO;
	
	// URL 가져오기
	public List<RestInfoDTO> listURL(){
		System.out.println("check! Service!");
		List<RestInfoDTO> URLList = restInfoDAO.selectAllUrlList();
		
		return URLList;
	}

	// 매장 정보 입력
	public int insertRestInfo(Map<String,Object> RestInfoMap) throws Exception {
		int result = 0;
		result = restInfoDAO.insertRest(RestInfoMap);
		return result;	
	}
}
