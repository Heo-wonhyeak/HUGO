package kr.co.hugo.event.dao;

import java.util.Map;

public interface EventDAO {

	public int insertNewEvent(Map eventMap) throws Exception;

	public void insertNewImage(Map eventMap) throws Exception;

}
