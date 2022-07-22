package com.example.hugo.dao;

import java.util.List;

import com.example.hugo.dto.HotSpotDTO;

public interface HotSpotDAO {
	
	public List<HotSpotDTO> selectHotSpotList(HotSpotDTO dto);
	
	public int selectHotSpotListCount(HotSpotDTO dto);

}
