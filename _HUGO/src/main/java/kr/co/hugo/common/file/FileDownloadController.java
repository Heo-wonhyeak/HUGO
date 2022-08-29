package kr.co.hugo.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownloadController {
	// 파일 저장 위치 지정
	private static final String CURR_IMAGE_PEPO_PATH = "/Users/jeong-won-yeong/Documents/HUGO/RestaurantImage";

	@RequestMapping("/download.do") // 다운로드할 이미지 파일 이름을 전달함
	public void download(@RequestParam("imageFileNO") int imageFileNO,@RequestParam("imageFileName") String imageFileName,
					@RequestParam("restaurantIdx") int restaurantIdx,HttpServletResponse response)
			throws Exception {

		OutputStream out = response.getOutputStream();
		
		// 글번호와 파일 이름으로 다운로드할 파일 경로를 설정
		String downFile = CURR_IMAGE_PEPO_PATH + "/" + restaurantIdx +"/"+ imageFileNO+".jpg";
		// 다운로드될 파일 객체 생성
		File file = new File(downFile);
		
		response.setHeader("Cache-Control", "no-cache");
		// 헤더에 파일이름 설정
		response.addHeader("Content-disposition", "attachment; imageFileNO=" + imageFileNO);

		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8]; // 버퍼를 이용해 한꺼번에 8kbyte씩 브라우저에 전송됨
		while (true) {
			int count = in.read(buffer);
			if (count == -1)
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
}
