package kr.co.hugo.boarder.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.hugo.boarder.dao.BoardDAO;
import kr.co.hugo.boarder.dto.BoardDTO;
import kr.co.hugo.boarder.dto.ImageDTO;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;

	@Override
	public int addNewArticle(Map articleMap) throws Exception {
		// 글 정보를 저장한 후 글 번호를 가져옴
		int articleNO = boardDAO.insertNewArticle(articleMap);
		// 글번호를 articleMap에 저장한 후
		articleMap.put("articleNO", articleNO);
		return articleNO;
	}

	/* 매장 상세페이지 모든 리뷰 불러오기 default */
	@Override
	public Map<Object,Object> listReviews(int restIdx) throws Exception {
		Map<Object,Object> reviewsMap = new HashMap<>();
		List<ImageDTO> imgList = new ArrayList<>();
		List<BoardDTO> reviewList = boardDAO.selectAllReviewsList(restIdx);	
		for(int i=0;i<reviewList.size();i++) {
			int reviewIdx = reviewList.get(i).getArticleIdx();
			ImageDTO reviewImg = boardDAO.selectReviewImage(reviewIdx);
			imgList.add(reviewImg);
		}
		
		reviewsMap.put("reviewList", reviewList);
		reviewsMap.put("imgList", imgList);
		return reviewsMap;
	}

}
