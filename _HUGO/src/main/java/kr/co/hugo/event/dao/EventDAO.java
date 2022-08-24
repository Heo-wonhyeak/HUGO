package kr.co.hugo.event.dao;

import java.util.List;
import java.util.Map;

import kr.co.hugo.event.dto.EventDTO;
import kr.co.hugo.event.dto.EventImageDTO;
import kr.co.hugo.event.dto.EventReplyDTO;

public interface EventDAO {

	//새로운 이벤트 등록
	public int insertNewEvent(Map eventMap) throws Exception;
	// 새로운 이미지 등록
	public void insertNewImage(Map eventMap) throws Exception;
	//이벤트 리스트 받기
	public List<EventDTO> selectAllEvent() throws Exception;
	//파일이름 받아오기
	public void updateOfile(Map eventMap) throws Exception;
	//상세보기 이벤트 찾기
	public EventDTO selectEvent(int event_idx) throws Exception;
	//상세보기 이미지 받아오기
	public List<EventImageDTO> selectEventImages(int event_idx) throws Exception;
	//게시글 뷰 카운터 증가
	public void updateViewCount(int event_idx) throws Exception;
	//게시글 삭제
	public void removeEvent(int event_idx) throws Exception;
	// 글 수정
	public void modEvent(Map<String, Object> eventMap) throws Exception;
	// 댓글 등록
	public void insertNewReply(Map replyMap) throws Exception;
	//상세보기 댓글 가져오기
	public List<EventReplyDTO> selectEventReples(int event_idx) throws Exception;
	//좋아요 여부 확인
	public int selectEventLike(Map likeMap) throws Exception;
	// 좋아요 입력
	public void insertLike(Map likeMap) throws Exception;
	// 좋아요 취소
	public void deleteLike(Map likeMap) throws Exception;
	// 게시글에 좋아요 카운트 증가
	public void updateLikeCountUp(Map likeMap) throws Exception;
	// 게시글에 좋아요 카운트 다운
	public void updateLikeCountDown(Map likeMap) throws Exception;
	// 댓글 최신순
	public List<EventReplyDTO> selectEventReplesD(int event_idx) throws Exception;

}
