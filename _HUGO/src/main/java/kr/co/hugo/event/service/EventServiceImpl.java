package kr.co.hugo.event.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.hugo.event.dao.EventDAO;

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
	public int addNewCoupon(Map eventMap) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
