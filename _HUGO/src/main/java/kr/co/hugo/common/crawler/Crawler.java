package kr.co.hugo.common.crawler;

import java.io.IOException;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawler {
	public static void main(String[] args) {
		
		try {
			String url = "https://www.mangoplate.com/restaurants/exXLrKifzVdx";
			Connection conn = Jsoup.connect(url);
			
			Document html = conn.get();
			// 식당이름
			Element _restaurant_name = html.getElementsByClass("restaurant_name").get(0);
			String restaurant_name = _restaurant_name.text();
			
			// 주소
			Element address_info = html.getElementsByClass("only-desktop").get(0);
			// 도로명 주소
			String address = address_info.getElementsByTag("td").get(0).text().split("지번")[0];
			
			// 지번
			String jibunAddress = address_info.getElementsByTag("span").get(1).text();
		
			
			// 전화번호
			Element phone_info = html.getElementsByClass("only-desktop").get(1);
			String phone = phone_info.getElementsByTag("td").get(0).text();
			
			
			// 음식 종류
			Element menu_info = html.getElementsByTag("tr").get(2);
			String menu = menu_info.getElementsByTag("span").get(0).text();
			
			// 영업 시간
			Element open_info = html.getElementsByTag("tr").get(5);
			String open = open_info.getElementsByTag("td").get(0).text();
			
			// 음식 메뉴
			Elements menu_size = html.getElementsByClass("Restaurant_MenuItem");
			String menu1 ="";
			if(!menu_size.isEmpty()) {
				for(int i=0;i<menu_size.size();i++) {
					menu1 += menu_size.get(i).text()+"|";
				}
			}
			System.out.print(restaurant_name+" | "+address+" | "+jibunAddress+" | "+phone+" | "+menu+" | "+open+" | "+menu1);
			
			
		}catch(IOException e){
			e.printStackTrace();
		}
	}
}
