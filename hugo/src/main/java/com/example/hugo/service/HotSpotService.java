package com.example.hugo.service;

import java.util.List;

import com.example.hugo.dto.HotSpotDTO;
import com.example.hugo.util.Header;

public interface HotSpotService {
	
	public Header<List<HotSpotDTO>> selectHotSpotList(HotSpotDTO dto);
	
	public int selectHotSpotListCount(HotSpotDTO dto);

}
