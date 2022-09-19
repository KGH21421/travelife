package kr.ac.travelife.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.travelife.dao.MypageDao;
import kr.ac.travelife.model.Mypage;
import kr.ac.travelife.util.Pager;
import kr.ac.travelife.util.Pagersm;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageDao dao;
	
	@Override
	public List<Mypage> list(Pagersm pagersm, String id) {
		int total = dao.total(pagersm, id);
		
		pagersm.setTotal(total);
		
		return dao.list(pagersm, id);
	}

	@Override
	public Mypage notice() {
		return dao.notice();
	}

	@Override
	public List<Mypage> list(Pager pager, String id) {
		int total = dao.total(pager, id);
		
		pager.setTotal(total);
		
		return dao.list(pager, id);
	}

}
