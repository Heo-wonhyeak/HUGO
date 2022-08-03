package kr.co.hugo.common.crawler.restinfo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hugo.common.crawler.restinfo.dao.RestInfoDAO;
import kr.co.hugo.common.crawler.restinfo.dto.RestInfoDTO;

@Service("restInfoService")
public class RestInfoService {
	
	RestInfoDAO dao;
	public RestInfoService() {
		dao = new RestInfoDAO();
	}
	
	public List<RestInfoDTO> listURL() throws Exception {
		List<RestInfoDTO> URLList = dao.selectAllUrlList();
		return URLList;
	}
}
