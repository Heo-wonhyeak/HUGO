package kr.co.hugo.crawler.restinfo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.hugo.crawler.restinfo.dto.RestInfoDTO;
import kr.co.hugo.crawler.restinfo.service.RestInfoService;

@Controller
public class ResInfoController {

	@Autowired
	RestInfoService restInfoService;

	@RequestMapping(value = "/crawler/doing", method = { RequestMethod.GET, RequestMethod.POST })
	public void listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<RestInfoDTO> lists = restInfoService.listURL();
		System.out.println(lists.size()); // 2708
			// 혹시 몰라서 20개씩 끊어서 하는중
		for (int i = 0; i < lists.size(); i++) {

			try {
				String url = lists.get(i).getUrl();
				int restIdx = lists.get(i).getUrlNO();
				Connection conn = Jsoup.connect(url);

				Document html = conn.get();
				// 식당이름
				Element _restaurant_name = html.getElementsByClass("restaurant_name").get(0);
				String restName = _restaurant_name.text();

				// 주소
				String restAddress = "";
				String restJibunAddress = "";
				String restPhone = "";
				if (!(html.getElementsByClass("only-desktop")).isEmpty()) {
					Element address_info = html.getElementsByClass("only-desktop").get(0);
					// 도로명 주소
					restAddress = address_info.getElementsByTag("td").get(0).text().split("지번")[0];
					// 지번
					restJibunAddress = address_info.getElementsByTag("span").get(1).text();

					// 전화번호
					Element phone_info = html.getElementsByClass("only-desktop").get(1);
					restPhone = phone_info.getElementsByTag("td").get(0).text();
				}

				// 음식 종류
				String restMenu = "";
				if (!(html.getElementsByTag("tr")).isEmpty()) {
					Element menu_info = html.getElementsByTag("tr").get(2);
					restMenu = menu_info.getElementsByTag("span").get(0).text();
				}
				// 가격대
				String restPrice = " ";
				String restPark = " ";
				String restOpen = " ";
				int size = html.getElementsByTag("tr").size();
				for (int j = 0; j < size; j++) {
					if (j >= 3) {
						if ((html.getElementsByTag("tr").get(3)).childrenSize() != 0) {
							Element price_info = html.getElementsByTag("tr").get(3);
							restPrice = price_info.getElementsByTag("td").get(0).text();
						}
					}
					// 주차가능여부
					if (j == 4) {
						if ((html.getElementsByTag("tr").get(4)).children().size() != 0) {
							Element park_ok = html.getElementsByTag("tr").get(4);
							restPark = park_ok.getElementsByTag("td").get(0).text();
						}
					}
					// 영업 시간
					if (j == 5) {
						if ((html.getElementsByTag("tr").get(5)).children().size() != 0) {
							Element open_info = html.getElementsByTag("tr").get(5);
							restOpen = open_info.getElementsByTag("td").get(0).text();
						}
					}
				}
				// 음식 리스트 / 가격
				String restMenuList = " ";
				Elements _menu_list = html.getElementsByClass("Restaurant_MenuItem");
				if (!_menu_list.isEmpty()) {
					for (int j = 0; j < _menu_list.size(); j++) {
						restMenuList += _menu_list.get(j).text() + "cut";
					}
				}
				// 태그
				String restTag = " ";
				Elements tag_info = html.getElementsByClass("tag-item");
				if (!tag_info.isEmpty()) {
					for (int j = 0; j < tag_info.size(); j++) {
						restTag += tag_info.get(j).text() + " ";
					}
				}
				// DAO에 보내기
				Map<String,Object> RestInfoMap = new HashMap<>();
				RestInfoMap.put("restIdx", restIdx);
				RestInfoMap.put("restName", restName);
				RestInfoMap.put("restAddress", restAddress);
				RestInfoMap.put("restJibunAddress", restJibunAddress);
				RestInfoMap.put("restPhone", restPhone);
				RestInfoMap.put("restMenu", restMenu);
				RestInfoMap.put("restPrice", restPrice);
				RestInfoMap.put("restPark", restPark);
				RestInfoMap.put("restOpen", restOpen);
				RestInfoMap.put("restMenuList", restMenuList);
				RestInfoMap.put("restTag", restTag);
				
				
				int result = restInfoService.insertRestInfo(RestInfoMap);
				if(result == 1) {
					System.out.println(restIdx+" 번 성공");
				}
				else {
					System.out.println(restIdx+" 번 실패");
				}
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Thread.sleep(2000);
		}

	}
}
