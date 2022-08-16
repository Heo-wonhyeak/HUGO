package kr.co.hugo.event.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.hugo.event.dto.EventImageDTO;

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

	public int selectNewEventIdx() {
		return sqlSession.selectOne("mapper.event.selectNewEventIdx");
	}

	@Override
	public void insertNewImage(Map eventMap) throws Exception {
		List<EventImageDTO> imageFileList = (List<EventImageDTO>) eventMap.get("imageFileList");
		int event_idx = (Integer)eventMap.get("event_idx");
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

	public int selectNewImageFileNO() {
		return sqlSession.selectOne("mapper.event.selectNewImageFileNO");
	}

}
