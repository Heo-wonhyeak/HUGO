package com.example.hugo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.hugo.dao.HotSpotDAO;
import com.example.hugo.dto.HotSpotDTO;
import com.example.hugo.util.Header;
import com.example.hugo.util.Pagination;

@Service
public class HotSpotServiceImpl implements HotSpotService{
	
	@Inject
	private HotSpotDAO dao;

	@Override
	public Header<List<HotSpotDTO>> selectHotSpotList(HotSpotDTO dto) {

		//기본표출 카테고리는 맛집으로 생성.
		if(dto.getHotspot_cd() == null) {
			dto.setHotspot_cd("R");
		}
		
		if(dto.getPage() == 0) {
			dto.setPage(1);
		}
		dto.setPageSize(8);
		List<HotSpotDTO> result = dao.selectHotSpotList(dto);
		int totalCount = dao.selectHotSpotListCount(dto);
		
		Pagination pagination = new Pagination(
				totalCount,
				dto.getPage(),
				dto.getPageSize(),
				8
				);
		return Header.OK(result, pagination);
	}

	@Override
	public int selectHotSpotListCount(HotSpotDTO dto) {
		
		//기본표출 카테고리는 맛집으로 생성.
		if(dto.getHotspot_cd() == null) {
			dto.setHotspot_cd("R");
		}
		
		int totalCount = dao.selectHotSpotListCount(dto);
		
		return totalCount;
	}

}
