package kr.co.hugo.crawler.restinfo;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class RestInfoCrawler {

	public static void main(String[] args) {

		try {
			String url = "https://www.mangoplate.com/restaurants/nWdsVJ5zukDH";
			Connection conn = Jsoup.connect(url);

			Document html = conn.get();
			// 식당이름
			Element _restaurant_name = html.getElementsByClass("restaurant_name").get(0);
			String restaurant_name = _restaurant_name.text();

			// 주소
			String address = "";
			String jibunAddress = "";
			Element phone_info = null;
			String phone = "";
			if (!(html.getElementsByClass("only-desktop")).isEmpty()) {
				Element address_info = html.getElementsByClass("only-desktop").get(0);
				// 도로명 주소
				address = address_info.getElementsByTag("td").get(0).text().split("지번")[0];
				// 지번
				jibunAddress = address_info.getElementsByTag("span").get(1).text();

				// 전화번호
				phone_info = html.getElementsByClass("only-desktop").get(1);
				phone = phone_info.getElementsByTag("td").get(0).text();
			}

			// 음식 종류
			String menu = "";
			Element menu_info = null;
			if (!(html.getElementsByTag("tr")).isEmpty()) {
				menu_info = html.getElementsByTag("tr").get(2);
				menu = menu_info.getElementsByTag("span").get(0).text();
			}
			// 가격대
			String price =" ";
			String park = " ";
			String open = " ";
			int size = html.getElementsByTag("tr").size();
			for (int i = 0; i < size; i++) {
				if (i >= 3) {
					if ((html.getElementsByTag("tr").get(3)).childrenSize() != 0) {
						Element price_info = html.getElementsByTag("tr").get(3);
						price = price_info.getElementsByTag("td").get(0).text();
					}
				}
				// 주차가능여부
				if (i == 4) {
					if ((html.getElementsByTag("tr").get(4)).children().size() != 0) {
						Element park_ok = html.getElementsByTag("tr").get(4);
						park = park_ok.getElementsByTag("td").get(0).text();
					}
				}
				// 영업 시간
				if (i==5) {
					if((html.getElementsByTag("tr").get(5)).children().size()!=0) {
						Element open_info = html.getElementsByTag("tr").get(5);		
						open = open_info.getElementsByTag("td").get(0).text();
					}
				}
			}
			// 음식 리스트 / 가격
			Elements _menu_list = null;
			String menu_list = " ";
			_menu_list = html.getElementsByClass("Restaurant_MenuItem");
			if (!_menu_list.isEmpty()) {
				for (int i = 0; i < _menu_list.size(); i++) {
					menu += _menu_list.get(i).text() + "|";
				}
			}
			// 태그
			Elements tag_info = null;
			String tag = " ";
			tag_info = html.getElementsByClass("tag-item");
			if (!tag_info.isEmpty()) {
				for (int i = 0; i < tag_info.size(); i++) {
					tag += tag_info.get(i).text() + " ";
				}
			}

			// 각 URL당 하나씩 db에 들어감
			// 이미지 파일은 따로 크롤러 생성 (복잡)
			System.out.print(restaurant_name + " | " + address + " | " + jibunAddress + " | " + phone + " | " + menu
					+ " | " + price + " | " + park + " | " + open + " | " + menu_list + " | " + tag);

		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
