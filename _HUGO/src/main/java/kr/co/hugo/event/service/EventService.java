package kr.co.hugo.event.service;

import java.util.List;
import java.util.Map;

import kr.co.hugo.event.dto.EventDTO;
import kr.co.hugo.event.dto.EventImageDTO;

public interface EventService {

	//이벤트 게시글 추가
	public int addNewEvent(Map eventMap) throws Exception;
	//미정의
	public int addNewCoupon(Map eventMap) throws Exception;
	//이벤트 게시글 리스트
	public List<EventDTO> listEvent() throws Exception;
	//이벤트 이미지이름 받아오기
	public void updateOfile(Map eventMap) throws Exception;
	// 이벤트 상세보기
	public Map<String, Object> viewEvent(Map<String, Object> viewMap) throws Exception;
	// 이벤트 삭제
	public void removeEvent(int event_idx) throws Exception;
	// 이벤트 수정
	public void modEvent(Map<String, Object> eventMap, List<String> fileList) throws Exception;
	// 이벤트 댓글 등록
	public void addEventReply(Map replyMap) throws Exception;
	// 좋아요 등록
	public void insertLike(Map likeMap) throws Exception;
	// 좋아요 취소
	public void deleteLike(Map likeMap) throws Exception;

}
