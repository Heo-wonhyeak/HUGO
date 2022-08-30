package kr.co.hugo.jjim.service;

import java.util.Map;

public interface JjimService {
	
	// 처음 상세보기 진입시 찜체크 
	int resJjimCheck(Map<Object, Object> jjimCheckMap) throws Exception;
	// 찜 삭제
	int deleteJjim(Map<Object, Object> jjimMap) throws Exception;
	// 찜 추가
	int AddJjim(Map<Object, Object> jjimMap) throws Exception;
	// 전체 찜 카운트 조회 + 1
	int jjimCount () throws Exception;
	// 레스토랑 전체 찜 - 1
	void deleteResJjim(int restIdx) throws Exception;
	void addResJjim(int restIdx) throws Exception;

}
