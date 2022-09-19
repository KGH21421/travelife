package kr.ac.travelife.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.ac.travelife.dao.HotelDao;
import kr.ac.travelife.model.Hotel;
import kr.ac.travelife.util.Pager;

@Service
public class HotelServiceImpl implements HotelService {

	@Autowired
	HotelDao dao;
	
	@Override
	public List<Hotel> list(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.list(pager); 
	}

	@Override
	public void add(Hotel notice) {
		dao.add(notice);
	}

	@Override
	public Hotel notice(int code) {
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
	public void update(Hotel notice) {
		dao.update(notice);
	}
	
}
