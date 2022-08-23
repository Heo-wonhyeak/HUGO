package kr.co.hugo.event.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.hugo.event.dao.EventDAO;
import kr.co.hugo.event.dto.EventDTO;
import kr.co.hugo.event.dto.EventImageDTO;
import kr.co.hugo.event.dto.EventReplyDTO;

@Service("eventService")
@Transactional(propagation = Propagation.REQUIRED)
public class EventServiceImpl implements EventService {
	
	@Autowired
	private EventDAO eventDAO;

	//이벤트 새글쓰기 
	@Override
	public int addNewEvent(Map eventMap) throws Exception {
		int event_idx = eventDAO.insertNewEvent(eventMap);
		System.out.println("service event_idx" + event_idx);
		eventMap.put("event_idx", event_idx);
		eventDAO.insertNewImage(eventMap);
		
		return event_idx;
	}
	
	@Override
	public void addEventReply(Map replyMap) throws Exception {
		eventDAO.insertNewReply(replyMap);
		
	}

	@Override
	public int addNewCoupon(Map eventMap) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	//이벤트 목록
	@Override
	public List<EventDTO> listEvent() throws Exception {
		List<EventDTO> eventList = eventDAO.selectAllEvent();
		return eventList;
	}

	@Override
	public void updateOfile(Map eventMap) throws Exception {
		eventDAO.updateOfile(eventMap);
	}

	@Override
	public Map<String, Object> viewEvent(Map<String, Object> viewMap) throws Exception {
		
		int event_idx = (int)viewMap.get("event_idx");
		String id = (String)viewMap.get("id");
		
		Map<String, Object> eventMap = new HashMap<>();
		
		// 게시글 정보 & 이미지 정보 받아오기
		EventDTO eventDTO = eventDAO.selectEvent(event_idx);
		List<EventImageDTO> images = eventDAO.selectEventImages(event_idx);
		
		String WriterId = eventDTO.getId();
		if(id == null || !(id.equals(WriterId))) {
			eventDAO.updateViewCount(event_idx);
			eventDTO = eventDAO.selectEvent(event_idx);
		}
		
		eventMap.put("event", eventDTO);
		eventMap.put("images", images);
		
		// 댓글 정보 가져오기
		List<EventReplyDTO> reples = eventDAO.selectEventReples(event_idx);
		int replyCount = reples.size();
		eventMap.put("reples", reples);
		eventMap.put("replyCount", replyCount);
		
		return eventMap;
	}

	@Override
	public void removeEvent(int event_idx) throws Exception {
		eventDAO.removeEvent(event_idx);
		
	}

	@Override
	public void modEvent(Map<String, Object> eventMap,List<String> fileList) throws Exception {
		if(fileList != null || fileList.size() != 0) {
			eventDAO.insertNewImage(eventMap);
		}
		eventDAO.modEvent(eventMap);
	}



}
