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
	public Map<Object,Object> listReviews(int restIdx,int list,String nickname) throws Exception {
		Map<Object,Object> reviewsMap = new HashMap<>();
		List<ImageDTO> imgList = new ArrayList<>();
		List<BoardDTO> reviewList = new ArrayList<>();
		// 최신순 호출 
		if(list ==11) {
			reviewList = boardDAO.selectAllReviewsList(restIdx);
		}
		// 별점순 호출
		else if(list ==12) {
			reviewList = boardDAO.selectAllSteamList(restIdx);
		}
		// 방문순 호출
		else if(list ==13) {
			reviewList = boardDAO.selectAllVisitList(restIdx);
		}
		// 내가쓴 리뷰 호출
		else if(list == 14) {
			List<BoardDTO> reviewListIdx = new ArrayList<>();
			reviewListIdx = boardDAO.selectAllReviewsList(restIdx);
			for(int i=0;i<reviewListIdx.size();i++) {
				String _nickName = reviewListIdx.get(i).getNickName();
				if(nickname == _nickName) {
					boardDAO.selectMyReviewList(restIdx,nickname);
				}
			}
		}	
		for(int i=0;i<reviewList.size();i++) {
			int reviewIdx = reviewList.get(i).getArticleIdx();
			ImageDTO reviewImg = boardDAO.selectReviewImage(reviewIdx);
			imgList.add(reviewImg);
		}
		
		reviewsMap.put("reviewList", reviewList);
		reviewsMap.put("imgList", imgList);
		return reviewsMap;
	}
	/* 리뷰 상세보기 가져오기 */
	@Override
	public Map<Object, Object> reviewInfo(int reviewIdx) throws Exception {
		Map<Object,Object> reviewsMap = new HashMap<>();
		List<ImageDTO> imgList = new ArrayList<>();
		BoardDTO review = boardDAO.selectReview(reviewIdx);
		imgList = boardDAO.selectReviewImageOne(reviewIdx);
		reviewsMap.put("review", review);
		reviewsMap.put("imgList", imgList);
		return reviewsMap;
	}


}
