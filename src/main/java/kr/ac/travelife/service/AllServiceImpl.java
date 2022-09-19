package kr.ac.travelife.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.travelife.dao.AllDao;
import kr.ac.travelife.model.All;
import kr.ac.travelife.util.Pager;
import kr.ac.travelife.util.Pagersm;

@Service
public class AllServiceImpl implements AllService {

	@Autowired
	AllDao dao;
	
	@Override
	public List<All> list(Pagersm pagersm) {
		int total = dao.total(pagersm);
		
		pagersm.setTotal(total);
		
		return dao.list(pagersm);
	}

	@Override
	public List<All> list(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.list(pager);
	}

}
