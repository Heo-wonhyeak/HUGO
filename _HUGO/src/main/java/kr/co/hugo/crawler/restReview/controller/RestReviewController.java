package kr.co.hugo.crawler.restReview.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.jni.Time;
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
			for (int j = 0; j < ReviewLists.size(); j++) {
				if (ReviewLists.size() == 0) {
					break; // 리뷰가 한개도 없는 경우
				}
				int ReviewIdx = ReviewLists.get(j).getArticleIdx();
				String ReviewURL = ReviewLists.get(j).getRestURL();
				Map<Object, Object> reviewMap = new HashMap<>();
				reviewMap.put("RestaurantIdx", RestaurantIdx);
				reviewMap.put("ReviewIdx", ReviewIdx);
				int result = restReviewService.modReviewIdx(reviewMap);
				if (result == 1) {
					System.out.println(ReviewIdx + "번 성공" + ReviewURL + " - " + RestaurantIdx);
				}
			}

		}
	}
	// 크롤링한 리뷰들 imageURL(리뷰에 image없을시 image_url을 메인이미지로 사용) 들 각 매장idx의 articleIdx
	// 폴더에 저장
	@RequestMapping(value = "crawler/imageDoing", method = { RequestMethod.GET, RequestMethod.POST })
	public void downloadURLImage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String FILE_URL = "";
		String OUTPUT_FILE_PATH = "/Users/jeong-won-yeong/Documents/HUGO/RestaurantImage";
		List<BoardDTO> lists = restReviewService.AllReview();

		int imageFileNO = 1;
		System.out.println(lists.size());
		for (int i = 0; i < lists.size(); i++) {
			String imageFileName = "";
			String MainImage = lists.get(i).getMainImage();
			String subImage1 = lists.get(i).getSubImage1();
			String subImage2 = lists.get(i).getSubImage2();
			String subImage3 = lists.get(i).getSubImage3();
			String defaultImage = lists.get(i).getDefaultImage();
			int restaurantIdx = lists.get(i).getRestaurantIdx();
			int articleIdx = lists.get(i).getArticleIdx();
			if (MainImage != null) {
				FILE_URL = MainImage;
				imageFileName = MainImage;
				try (BufferedInputStream in = new BufferedInputStream(new URL(FILE_URL).openStream())) {
					String path = OUTPUT_FILE_PATH + "/" + restaurantIdx;
					Path imagePath = Paths.get(path + "/" + imageFileNO + ".jpg");
					// imageDTO insert
					Files.copy(in, imagePath);
					System.out.println(imageFileNO+"번 이미지 파일이름 = "+MainImage);
					Map<Object,Object> imageInfo = new HashMap<>();
					imageInfo.put("imageFileNO", imageFileNO);
					imageInfo.put("imageFileName",imageFileName);
					imageInfo.put("articleIdx",articleIdx );
					imageInfo.put("restaurantIdx", restaurantIdx);
					int result = restReviewService.addImageList(imageInfo);
					if(result ==1) {
						System.out.println(imageFileNO +"번 디비 삽입 성공");
					}
					imageFileNO++;
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				if(subImage1 !=null) {
					FILE_URL = subImage1;
					imageFileName = subImage1;
					try (BufferedInputStream in = new BufferedInputStream(new URL(FILE_URL).openStream())) {
						String path = OUTPUT_FILE_PATH + "/" + restaurantIdx;
						Path imagePath = Paths.get(path + "/" + imageFileNO + ".jpg");
						// imageDTO insert
						Files.copy(in, imagePath);
						System.out.println(imageFileNO+"번 이미지 파일이름 = "+subImage1);
						
						Map<Object,Object> imageInfo = new HashMap<>();
						imageInfo.put("imageFileNO", imageFileNO);
						imageInfo.put("imageFileName",imageFileName);
						imageInfo.put("articleIdx",articleIdx );
						imageInfo.put("restaurantIdx", restaurantIdx);
						int result = restReviewService.addImageList(imageInfo);
						if(result ==1) {
							System.out.println(imageFileNO +"번 디비 삽입 성공");
						}
						imageFileNO++;
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				else if(subImage2 !=null) {
					FILE_URL = subImage2;
					imageFileName = subImage2;
					try (BufferedInputStream in = new BufferedInputStream(new URL(FILE_URL).openStream())) {
						String path = OUTPUT_FILE_PATH + "/" + restaurantIdx;
						Path imagePath = Paths.get(path + "/" + imageFileNO + ".jpg");
						// imageDTO insert
						Files.copy(in, imagePath);
						System.out.println(imageFileNO+"번 이미지 파일이름 = "+subImage2);
						Map<Object,Object> imageInfo = new HashMap<>();
						imageInfo.put("imageFileNO", imageFileNO);
						imageInfo.put("imageFileName",imageFileName);
						imageInfo.put("articleIdx",articleIdx );
						imageInfo.put("restaurantIdx", restaurantIdx);
						int result = restReviewService.addImageList(imageInfo);
						if(result ==1) {
							System.out.println(imageFileNO +"번 디비 삽입 성공");
						}
						imageFileNO++;
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				else if(subImage3 !=null) {
					FILE_URL = subImage3;
					imageFileName = subImage3;
					try (BufferedInputStream in = new BufferedInputStream(new URL(FILE_URL).openStream())) {
						String path = OUTPUT_FILE_PATH + "/" + restaurantIdx;
						Path imagePath = Paths.get(path + "/" + imageFileNO + ".jpg");
						// imageDTO insert
						Files.copy(in, imagePath);
						System.out.println(imageFileNO+"번 이미지 파일이름 = "+subImage3);
						Map<Object,Object> imageInfo = new HashMap<>();
						imageInfo.put("imageFileNO", imageFileNO);
						imageInfo.put("imageFileName",imageFileName);
						imageInfo.put("articleIdx",articleIdx );
						imageInfo.put("restaurantIdx", restaurantIdx);
						int result = restReviewService.addImageList(imageInfo);
						if(result ==1) {
							System.out.println(imageFileNO +"번 디비 삽입 성공");
						}
						imageFileNO++;
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			else {
				FILE_URL = defaultImage;
				imageFileName = defaultImage;
				try (BufferedInputStream in = new BufferedInputStream(new URL(FILE_URL).openStream())) {
					String path = OUTPUT_FILE_PATH + "/" + restaurantIdx;
					Path imagePath = Paths.get(path + "/" + imageFileNO + ".jpg");
					// imageDTO insert
					Files.copy(in, imagePath);
					System.out.println(imageFileNO+"번 이미지 파일이름 = "+defaultImage);
					
					Map<Object,Object> imageInfo = new HashMap<>();
					imageInfo.put("imageFileNO", imageFileNO);
					imageInfo.put("imageFileName",imageFileName);
					imageInfo.put("articleIdx",articleIdx );
					imageInfo.put("restaurantIdx", restaurantIdx);
					int result = restReviewService.addImageList(imageInfo);
					if(result ==1) {
						System.out.println(imageFileNO +"번 디비 삽입 성공");
					}
					imageFileNO++;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			System.out.println(i+"번 완료!!");
			Thread.sleep(2000);
			
		}
		// 2708개 restIdx 폴더 만들기
//			List<RestInfoDTO> URLLists = restInfoService.listURL();
//			for(int i=0;i<URLLists.size();i++) {
//				int restIdx = URLLists.get(i).getUrlNO();
//				String path = OUTPUT_FILE_PATH + "/" + restIdx;
//				File Folder = new File(path);
//				if(!Folder.exists()) {
//					try {
//						Folder.mkdir();
//						System.out.println(restIdx+"번 폴더 생성");
//					}catch(Exception e) {
//						e.printStackTrace();
//					}
//				}
//			}

//			}

	}

	// username, userTotalReview member에 저장
	// member table 활성화 시 사용
	@RequestMapping(value = "", method = { RequestMethod.GET, RequestMethod.POST })
	public void memberCrawler(HttpServletRequest request, HttpServletResponse response) throws Exception {

	}

}
