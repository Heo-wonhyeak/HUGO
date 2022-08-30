package kr.co.hugo.restaurant.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hugo.boarder.dto.ImageDTO;
import kr.co.hugo.boarder.service.BoardService;
import kr.co.hugo.member.dto.MemberDTO;
import kr.co.hugo.restaurant.dto.RestaurantDTO;
import kr.co.hugo.restaurant.service.ResService;

@Controller("resController")
public class ResContorollerImpl implements ResController {

	@Autowired
	ResService resService;

	@Autowired
	BoardService boardService;

	@RequestMapping(value="/restaurants/restaurantView.do" , method= {RequestMethod.GET,RequestMethod.POST})
	@Override
	public ModelAndView restaurantView(@RequestParam("restIdx") int restIdx,@RequestParam("array") int list,
									HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 상세보기 진입시 조회수 1증가
		resService.resPlusVisitCount(restIdx);
		
		String viewName = (String)request.getAttribute("viewName");	
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		String id = null;
		String nickName = null;
		if (memberDTO != null) {
			id = memberDTO.getId();
			nickName=memberDTO.getNickname();
			
		}
		Map<String, Object> viewMap = new HashMap<>();
		viewMap.put("restIdx", restIdx);
		viewMap.put("id", id);	
		viewMap.put("nickName", nickName);	
		// 상세보기 이미지, 정보 요청
		Map<String, Object> restMap = resService.restaurantView(viewMap);
		// 상세보기 리뷰 이미지 정보 요청.
		Map<Object,Object> reviewsMap = new HashMap<>();
		reviewsMap = boardService.listReviews(restIdx,list,nickName); 	
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		reviewsMap.put("id", id);
		mav.addObject("reviewsMap", reviewsMap);
		mav.addObject("restMap", restMap);
		
		return mav;
	}
	@Override
	@RequestMapping(value = "/restaurants/restaurantsReviewInfo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView restaurantsReviewInfo(@RequestParam("articleNO") int reviewIdx, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		// 세션에서 id 가져옴
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		String id = null;
		if (memberDTO != null) {
			id = memberDTO.getId();
		}
		// 레스트랑 리뷰 상세보기 정보 요청
		Map<Object,Object> reviewsMap = new HashMap<>();
		reviewsMap = boardService.reviewInfo(reviewIdx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("reviewsMap", reviewsMap);
		mav.setViewName(viewName);

		return mav;
	}

	@RequestMapping(value = "/restaurants/restaurantsReviewWrite.do", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView restaurantsReviewWrite(String id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);

		return mav;
	}

	@RequestMapping(value = "/restaurants/restaurantsPhoto.do", method = { RequestMethod.GET, RequestMethod.POST })
	@Override
	public ModelAndView restaurantsPhoto(@RequestParam("restIdx") int restIdx, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		Map<String, Object> viewMap = new HashMap<>();
		viewMap.put("restIdx", restIdx);
		Map<String, Object> restMap = resService.restaurantView(viewMap);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("restMap", restMap);
		return mav;
	}

	@RequestMapping(value = "/restaurants/restaurantsReviewMod.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView restaurantsReviewMod(String id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);

		return mav;
	}
	@Override
	@RequestMapping(value = "/restaurants/restaurantTOP50.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView restaurantTop50(@RequestParam("array") int list, HttpServletRequest request,
			HttpServletResponse response) {
		Map<Object, Object> top50List = new HashMap<>();
		System.out.println("restaurantTop50 호출" + list);
		// 요청이 star top 50이라면
		try {
			if (list == 1) {
				System.out.println("starList 호출!");
				top50List = new HashMap<>();
				List<RestaurantDTO> lists = resService.resStarList();
				List<ImageDTO> listImg = new ArrayList<>();
				for (int i = 0; i < lists.size(); i++) {
					int restaurantIdx = lists.get(i).getRestIdx();
					ImageDTO starImg = resService.resImgList(restaurantIdx);
					listImg.add(starImg);
				}
				top50List.put("lists", lists);
				top50List.put("listImg", listImg);
			}
			// 요청이 visit top 50이라면
			else if (list == 2) {
				top50List = new HashMap<>();
				List<RestaurantDTO> lists = resService.resVisitList();
				List<ImageDTO> listImg = new ArrayList<>();
				for (int i = 0; i < lists.size(); i++) {
					int restaurantIdx = lists.get(i).getRestIdx();
					ImageDTO visitImg = resService.resImgList(restaurantIdx);
					listImg.add(visitImg);
				}
				top50List.put("lists", lists);
				top50List.put("listImg", listImg);
			} else if (list == 3) {
				top50List = new HashMap<>();
				List<RestaurantDTO> lists = resService.resSteamList();
				List<ImageDTO> listImg = new ArrayList<>();
				for (int i = 0; i < lists.size(); i++) {
					int restaurantIdx = lists.get(i).getRestIdx();
					ImageDTO steamdImg = resService.resImgList(restaurantIdx);
					listImg.add(steamdImg);
				}
				top50List.put("lists", lists);
				top50List.put("listImg", listImg);
			} else if (list == 4) {
				top50List = new HashMap<>();
				List<RestaurantDTO> lists = resService.resDistanceList();
				List<ImageDTO> listImg = new ArrayList<>();
				for (int i = 0; i < lists.size(); i++) {
					int restaurantIdx = lists.get(i).getRestIdx();
					ImageDTO steamdImg = resService.resImgList(restaurantIdx);
					listImg.add(steamdImg);
				}
				top50List.put("lists", lists);
				top50List.put("listImg", listImg);
			} else if (list == 5) {
				top50List = new HashMap<>();
				List<RestaurantDTO> lists = resService.resFamousList();
				List<ImageDTO> listImg = new ArrayList<>();
				for (int i = 0; i < lists.size(); i++) {
					int restaurantIdx = lists.get(i).getRestIdx();
					ImageDTO steamdImg = resService.resImgList(restaurantIdx);
					listImg.add(steamdImg);
				}
				top50List.put("lists", lists);
				top50List.put("listImg", listImg);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		mav.addObject("top50List", top50List);
		return mav;
	}

}
