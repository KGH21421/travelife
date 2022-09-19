package kr.ac.travelife.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.travelife.dao.FoodDao;
import kr.ac.travelife.model.Food;
import kr.ac.travelife.util.Pager;

@Service
public class FoodServiceImpl implements FoodService {

	@Autowired
	FoodDao dao;
	
	@Override
	public List<Food> list(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.list(pager); 
	}

	@Override
	public void add(Food notice) {
		dao.add(notice);
	}

	@Override
	public Food notice(int code) {
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
	public void update(Food notice) {
		dao.update(notice);
	}
}
