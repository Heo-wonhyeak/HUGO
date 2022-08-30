package kr.co.hugo.jjim.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.hugo.jjim.dao.JjimDAO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class JjimServiceImpl implements JjimService{

	@Autowired
	JjimDAO jjimDAO;
	
	@Override
	public int resJjimCheck(Map<Object, Object> jjimCheckMap) throws Exception {
		int count = jjimDAO.jjimCheckCount(jjimCheckMap);
		return count;
	}

	@Override
	public int deleteJjim(Map<Object, Object> jjimMap) throws Exception {
		int count = jjimDAO.deleteJjim(jjimMap);
		return count;
	}

	@Override
	public int AddJjim(Map<Object, Object> jjimMap) throws Exception {
		int count = jjimDAO.addJjim(jjimMap);
		return count;
	}

	@Override
	public int jjimCount() throws Exception {
		int count = jjimDAO.selectJjimCount();
		return count;
	}

	@Override
	public void deleteResJjim(int restIdx) throws Exception {
		jjimDAO.deleteResJjim(restIdx);	
	}

	@Override
	public void addResJjim(int restIdx) throws Exception {
		jjimDAO.addResJjim(restIdx);
		
	}
	
}
