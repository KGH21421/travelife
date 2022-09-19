package kr.ac.travelife.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.travelife.dao.LandmarkDao;
import kr.ac.travelife.model.Landmark;
import kr.ac.travelife.util.Pager;

@Service
public class LandmarkServiceImpl implements LandmarkService {

	@Autowired
	LandmarkDao dao;
	
	@Override
	public List<Landmark> list(Pager pager) {
		int total=dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Override
	public void add(Landmark notice) {
		dao.add(notice);
	}

	@Override
	public Landmark notice(int code) {
		return dao.notice(code);
	}

	@Override
	public void updateviews(int code) {
		dao.updateviews(code);
	}

	@Override
	public void delete(int code) {
		dao.delete(code);
	}

	@Override
	public void update(Landmark notice) {
		dao.update(notice);
	}

}
