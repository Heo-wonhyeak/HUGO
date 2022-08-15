package kr.co.hugo.restaurant.service;

import java.util.HashMap;
import java.util.Map;

public class ResServiceImpl implements ResService{

	@Override
	public Map<String, Object> viewArticle(Map<String, Object> viewMap) throws Exception {
		
		Map<String,Object> articleMap = new HashMap<>();
//		ArticleDTO articleDTO = boardDAO.selectArticle(articleNO);
//		
//		// 이미지 부분 정보 요청
//		List<ImageDTO> imageFileList = boardDAO.selectImageFileLIst(articleNO);
//		
//		articleMap.put("article", articleDTO);
//		articleMap.put("imageFileList", imageFileList);
//		return articleMap;
		return null;
	}

}
