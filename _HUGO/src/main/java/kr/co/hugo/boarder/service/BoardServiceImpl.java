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
import kr.co.hugo.boarder.dto.BoardSteamedDTO;
import kr.co.hugo.boarder.dto.ImageDTO;
import kr.co.hugo.restaurant.dao.ResDAO;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;

	@Autowired
	private ResDAO resDAO;

	@Override
	public int addNewArticle(Map articleMap) throws Exception {
		// 글 정보를 저장한 후 글 번호를 가져옴
		int articleIdx = boardDAO.insertNewArticle(articleMap);
		// 글번호를 articleMap에 저장한 후
		articleMap.put("articleIdx", articleIdx);

		boardDAO.insertNewImage(articleMap);
		return articleIdx;
	}

	/* 매장 상세페이지 모든 리뷰 불러오기 default */
	@Override
	public Map<Object, Object> listReviews(int restIdx, int list, String nickname, String id) throws Exception {
		Map<Object, Object> reviewsMap = new HashMap<>();
		List<ImageDTO> imgList = new ArrayList<>();
		List<BoardDTO> reviewList = new ArrayList<>();
		// 최신순 호출
		if (list == 11) {
			reviewList = boardDAO.selectAllReviewsList(restIdx);
		}
		// 별점순 호출
		else if (list == 12) {
			reviewList = boardDAO.selectAllSteamList(restIdx);
		}
		// 방문순 호출
		else if (list == 13) {
			reviewList = boardDAO.selectAllVisitList(restIdx);
		}
		// 내가쓴 리뷰 호출
		else if (list == 14) {
			Map<Object, Object> myReview = new HashMap<>();
			myReview.put("restIdx", restIdx);
			myReview.put("id", id);
			myReview.put("nickname", nickname);
			reviewList = boardDAO.selectMyReviewList(myReview);
		}
		for (int i = 0; i < reviewList.size(); i++) {
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
		Map<Object, Object> reviewsMap = new HashMap<>();
		List<ImageDTO> imgList = new ArrayList<>();
		BoardDTO review = boardDAO.selectReview(reviewIdx);
		imgList = boardDAO.selectReviewImageOne(reviewIdx);
		int imgListSize = imgList.size();
		reviewsMap.put("review", review);
		reviewsMap.put("imgList", imgList);
		reviewsMap.put("imgListSize", imgListSize);
		return reviewsMap;
	}

	/* 파일이름 변환할 모든 이미지 갯수 가져오기 */
	@Override
	public int allImageCount() {
		int count = boardDAO.selectAllImageCount();
		return count;
	}

	/* 리뷰 추가시 해당 매장 별점 평균 업데이트 */
	@Override
	public void calResStarAvg(int restaurantIdx) throws Exception {
		List<BoardDTO> reviewList = new ArrayList<>();
		Map<Object, Object> resMap = new HashMap<>();
		reviewList = boardDAO.selectAllReviewsList(restaurantIdx);
		int totalAvg = 0;
		for (int i = 0; i < reviewList.size(); i++) {
			totalAvg += reviewList.get(i).getStarCount();
		}
		int reviewTotalCount = reviewList.size();
		double Avg = (Math.round((double) totalAvg / reviewTotalCount * 100) / 100.0);
		resMap.put("restaurantIdx", restaurantIdx);
		resMap.put("Avg", Avg);
		resDAO.updateStarAvg(resMap);
	}

	/* 리뷰 추천해요 중복 체크 */
	@Override
	public List<BoardSteamedDTO> reviewSteamedCount(Map<Object, Object> steamedCheckMap) throws Exception {
		List<BoardSteamedDTO> lists = new ArrayList<>();
		lists = boardDAO.selectReviewSteamedCount(steamedCheckMap);
		return lists;
	}

	/* 리뷰 추천해요 새로운 번호 가져오기 */
	@Override
	public int reviewNewSteamCount() throws Exception {
		int count = boardDAO.selectNewSteamedCount();
		return count;
	}

	/* 리뷰 추천해요 찜 추가 */
	@Override
	public int AddSteamed(Map<Object, Object> steamedMap) throws Exception {
		int result = 0;
		result = boardDAO.addNewSteamed(steamedMap);
		return result;
	}

	/* 리뷰 추천해요 1 증가 */
	@Override
	public int updateReviewSteamed(int articleIdx) throws Exception {
		int result = 0;
		result = boardDAO.updateReviewSteamed(articleIdx);
		return result;
	}

	@Override
	public List<ImageDTO> selectModImg(int articleIdx) throws Exception {
		List<ImageDTO> imgList = boardDAO.selectModImg(articleIdx);
		return imgList;
	}

	@Override
	public int deleteModImg(int fileName) throws Exception {
		int result = boardDAO.deleteModImg(fileName);
		int imageFileNo = boardDAO.selectAllImageCount();
		return imageFileNo;
	}

	@Override
	public int modArticle(Map<Object, Object> articleMap) throws Exception {
		// 글 정보를 저장한 후 글 번호를 가져옴
		int result = 0;
		// 글,이미지 업데이트
		boardDAO.insertNewImage(articleMap);
		result = boardDAO.updateModArticle(articleMap);
		return result;

	}

	@Override
	public int deleteImg(int fileName) throws Exception {
		int result = 0;
		result = boardDAO.deleteImg(fileName);
		return result;
	}

	@Override
	public int deleteArticle(int articleIdx) throws Exception {
		int result = 0;
		result = boardDAO.deleteGoodCheck(articleIdx);
		if(result == 1)
			result = boardDAO.deleteArticle(articleIdx);
		return result;
	}

}
