package kr.co.hugo.jjim.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface JjimDAO {
	
	// 상세보기 진입시 찜체크
	int jjimCheckCount(Map<Object, Object> jjimCheckMap) throws DataAccessException;
	// 찜 삭제
	int deleteJjim(Map<Object, Object> jjimMap) throws DataAccessException;
	// 찜 추가
	int addJjim(Map<Object, Object> jjimMap) throws DataAccessException;
	// 찜 전체 카운트 조회
	int selectJjimCount() throws DataAccessException;
	// 매장 전체 찜 - 1
	void deleteResJjim(int restIdx) throws DataAccessException;
	// 매장 전체 찜 + 1
	void addResJjim(int restIdx) throws DataAccessException;


}
