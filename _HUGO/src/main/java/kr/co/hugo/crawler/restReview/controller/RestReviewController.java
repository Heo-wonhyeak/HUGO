package kr.co.hugo.crawler.restReview.controller;

import java.io.BufferedInputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.hugo.boarder.dto.BoardDTO;
import kr.co.hugo.crawler.restReview.service.RestReviewService;
import kr.co.hugo.crawler.restinfo.dto.RestInfoDTO;
import kr.co.hugo.crawler.restinfo.service.RestInfoService;

@Controller
public class RestReviewController {

	@Autowired
	RestReviewService restReviewService;

	@Autowired
	RestInfoService restInfoService;

	// 크롤링한 리뷰들 (Page_URL -> 매장idx)와 articlesIdx 변환
	@RequestMapping(value = "crawler/idxChangeDoing232323", method = { RequestMethod.GET, RequestMethod.POST })
	public void articlesIdxChange(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<RestInfoDTO> lists = restInfoService.listURL();
		System.out.println(lists.size());
		for (int i = 0; i < lists.size(); i++) {
			String ResIdxURL = lists.get(i).getUrl();
			int RestaurantIdx = lists.get(i).getUrlNO();
			List<BoardDTO> ReviewLists = restReviewService.listReview(ResIdxURL);
			System.out.println(ReviewLists.size());
			for(int j=0;j<ReviewLists.size();j++) {				
				if(ReviewLists.size()==0) {
					break;		// 리뷰가 한개도 없는 경우
				}
				int ReviewIdx = ReviewLists.get(j).getArticleIdx();
				String ReviewURL = ReviewLists.get(j).getRestURL();
				Map<Object,Object> reviewMap = new HashMap<>();
				reviewMap.put("RestaurantIdx", RestaurantIdx);
				reviewMap.put("ReviewIdx", ReviewIdx);
				int result = restReviewService.modReviewIdx(reviewMap);
				if(result == 1) {
					System.out.println(ReviewIdx+"번 성공"+ReviewURL+" - "+RestaurantIdx);
				}
			}
			
		}
	}

	// 크롤링한 리뷰들 imageURL(리뷰에 image없을시 image_url을 메인이미지로 사용) 들 각 매장idx의 articleIdx
	// 폴더에 저장
	@RequestMapping(value = "crawler/imageDoing", method = { RequestMethod.GET, RequestMethod.POST })
	public void downloadURLImage(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		List<BoardDTO> lists = restReviewService.AllReview();
//		System.out.println(lists.size());
//		
//		for(int i=0;i<lists.size();i++) {
//			String MainImage = lists.get(i).getMainImage();
//			if(MainImage !=null) {
//				
//			}
//		}
		String FILE_URL = "https://mp-seoul-image-production-s3.mangoplate.com/1937806_1653285997953407.jpg";
		String OUTPUT_FILE_PATH ="/Users/jeong-won-yeong/Documents/HUGO/RestaurantImage/1";
		try(BufferedInputStream in = new BufferedInputStream(new URL(FILE_URL).openStream())) {
			Path imagePath = Paths.get(OUTPUT_FILE_PATH);
			Files.copy(in, imagePath);
		}
	}

	// username, userTotalReview member에 저장
	// member table 활성화 시 사용
	@RequestMapping(value = "", method = { RequestMethod.GET, RequestMethod.POST })
	public void memberCrawler(HttpServletRequest request, HttpServletResponse response) throws Exception {

	}

}
