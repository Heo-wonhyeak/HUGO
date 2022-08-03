package kr.co.hugo.common.crawler.restinfo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hugo.common.crawler.restinfo.dto.RestInfoDTO;
import kr.co.hugo.common.crawler.restinfo.service.RestInfoService;

@Controller("restInfoController")
public class RestInfoController {

	
	@Autowired
	private RestInfoService restInfoService;
	
	@Autowired
	private RestInfoDTO restInfoDTO;
	
	public List<RestInfoDTO> selectAllURL() throws Exception {
		
			List<RestInfoDTO> list = restInfoService.listURL();
			System.out.println(list);
		
		return list;
	}
}
