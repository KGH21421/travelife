package kr.ac.travelife.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.travelife.dao.NoticeDao;
import kr.ac.travelife.model.Notice;
import kr.ac.travelife.util.Pager;
import kr.ac.travelife.util.Pagersm;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao dao;
	
	@Override
	public List<Notice> list(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);
				
		return dao.list(pager);
	}

	@Override
	public void add(Notice notice) {
		dao.add(notice);
	}

	@Override
	public Notice notice(int code) {
		return dao.notice(code);
	}

	@Override
	public void delete(int code) {
		dao.delete(code);
	}

	@Override
	public void updateviews(int code) {
		dao.updateviews(code);
	}

	@Override
	public void update(Notice notice) {
		dao.update(notice);
	}

	@Override
	public List<Notice> list(Pagersm pagersm) {
		int total = dao.total(pagersm);
	
		pagersm.setTotal(total);
			
	return dao.list(pagersm);
	}

}
