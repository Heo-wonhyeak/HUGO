package com.example.hugo.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.hugo.dto.HotSpotDTO;
import com.example.hugo.service.HotSpotService;
import com.example.hugo.util.Header;

@Controller
public class HotSpotController {
	
	@Inject
	private HotSpotService hotSpotService;

	@GetMapping("/hotSpotListPage")
	public String hotSpotListPage(Model model) {
		return "contents/index";
	}
	
	@PostMapping("/hotSpotList")
	@ResponseBody
	public Header<List<HotSpotDTO>> hotSpotList(HotSpotDTO dto) {
		Header<List<HotSpotDTO>> result = hotSpotService.selectHotSpotList(dto);
//		int totalCount = hotSpotService.selectHotSpotListCount(dto);
		
		return result;
	}
}
