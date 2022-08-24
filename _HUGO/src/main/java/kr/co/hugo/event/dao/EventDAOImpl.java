package kr.co.hugo.event.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.hugo.event.dto.EventDTO;
import kr.co.hugo.event.dto.EventImageDTO;
import kr.co.hugo.event.dto.EventReplyDTO;

@Repository("eventDAO")
public class EventDAOImpl implements EventDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertNewEvent(Map eventMap) throws Exception {
		//새글번호 가져옴
		int event_idx = selectNewEventIdx();
		System.out.println("DAO event_idx : " +event_idx);
		eventMap.put("event_idx", event_idx);
		System.out.println("eventMap" + eventMap);
		
		//새글 등록
		sqlSession.insert("mapper.event.insertNewEvent",eventMap);
		return event_idx;
	}
	
	@Override
	public void insertNewReply(Map replyMap) throws Exception {
		
		int event_reply_idx = selectNewReplyIdx();
		System.out.println("insertNewReply - event_reply_idx : " + event_reply_idx);
		replyMap.put("event_reply_idx", event_reply_idx);
		
		sqlSession.insert("mapper.event.insertNewReply", replyMap);
		
	}


	private int selectNewReplyIdx() {
		return sqlSession.selectOne("mapper.event.selectNewReplyIdx");
	}

	public int selectNewEventIdx() {
		return sqlSession.selectOne("mapper.event.selectNewEventIdx");
	}

	@Override
	public void insertNewImage(Map eventMap) throws Exception {
		List<EventImageDTO> imageFileList = (List<EventImageDTO>) eventMap.get("imageFileList");
		int event_idx = Integer.parseInt(eventMap.get("event_idx").toString());
		int imageFileNO = selectNewImageFileNO();
		System.out.println("insertNewImage imageFileNO : "+imageFileNO);
		
		if(imageFileList != null && imageFileList.size() != 0) {
			for(EventImageDTO imageDTO : imageFileList) {
				imageDTO.setImg_idx(++imageFileNO);
				imageDTO.setEvent_idx(event_idx);
			}
			System.out.println("DAO imageFIleList" + imageFileList);
			//T_IMAGEFILE 테이블에 INSERT
			sqlSession.insert("mapper.event.insertNewImage", imageFileList);
		}
		
	}

	//이미지 파일 번호 받기
	public int selectNewImageFileNO() {
		return sqlSession.selectOne("mapper.event.selectNewImageFileNO");
	}

	//이벤트 목록
	@Override
	public List<EventDTO> selectAllEvent(String boarder) throws Exception {
		List<EventDTO> eventList = sqlSession.selectList("mapper.event.selectAllEvent",boarder);
		return eventList;
	}

	@Override
	public void updateOfile(Map eventMap) throws Exception {
		sqlSession.update("mapper.event.updateOfile", eventMap);
		
	}

	@Override
	public EventDTO selectEvent(int event_idx) throws Exception {
		return sqlSession.selectOne("mapper.event.selectEvent", event_idx);
	}

	@Override
	public List<EventImageDTO> selectEventImages(int event_idx) throws Exception {
		return sqlSession.selectList("mapper.event.selectEventImages", event_idx);
	}

	@Override
	public void updateViewCount(int event_idx) throws Exception {
		sqlSession.update("mapper.event.updateViewCount", event_idx);
	}

	@Override
	public void removeEvent(int event_idx) throws Exception {
		sqlSession.delete("mapper.event.deleteEvent",event_idx);
		
	}

	@Override
	public void modEvent(Map<String, Object> eventMap) throws Exception {
		sqlSession.update("mapper.event.modEvent", eventMap);
		
	}

	@Override
	public List<EventReplyDTO> selectEventReples(int event_idx) throws Exception {
		return sqlSession.selectList("mapper.event.selectEventReples", event_idx);
	}

	@Override
	public int selectEventLike(Map likeMap) throws Exception {
		return sqlSession.selectOne("mapper.event.selectEventLike", likeMap);
	}

	@Override
	public void insertLike(Map likeMap) throws Exception {
		int like_idx = selectNewLikeIdx();
		likeMap.put("like_idx", like_idx);
		sqlSession.insert("mapper.event.insertLike", likeMap);
	}

	private int selectNewLikeIdx() {
		return sqlSession.selectOne("mapper.event.selectNewLikeIdx");
	}

	@Override
	public void deleteLike(Map likeMap) throws Exception {
		sqlSession.delete("mapper.event.deleteLike", likeMap);
	}

	@Override
	public void updateLikeCountUp(Map likeMap) throws Exception {
		sqlSession.update("mapper.event.updateLikeCountUp", likeMap);
	}

	@Override
	public void updateLikeCountDown(Map likeMap) throws Exception {
		sqlSession.update("mapper.event.updateLikeCountDown", likeMap);
	}

	@Override
	public List<EventReplyDTO> selectEventReplesD(int event_idx) throws Exception {
		return sqlSession.selectList("mapper.event.selectEventReplesD", event_idx);
	}


}
