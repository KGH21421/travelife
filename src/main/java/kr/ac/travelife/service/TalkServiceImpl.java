package kr.ac.travelife.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.travelife.dao.TalkDao;
import kr.ac.travelife.model.Talk;
import kr.ac.travelife.util.Pager;

@Service
public class TalkServiceImpl implements TalkService {

	@Autowired
	TalkDao dao;
	
	@Override
	public List<Talk> list(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.list(pager); 
	}

	@Override
	public void add(Talk notice) {
		dao.add(notice);
	}

	@Override
	public Talk notice(int code) {
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
	public void update(Talk notice) {
		dao.update(notice);
	}
}
