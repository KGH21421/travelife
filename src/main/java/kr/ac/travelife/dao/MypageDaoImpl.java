package kr.ac.travelife.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.travelife.model.Mypage;
import kr.ac.travelife.util.Pager;
import kr.ac.travelife.util.Pagersm;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Mypage> list(Pagersm pagersm, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pagersm", pagersm);
		map.put("id", id);
		
		return sql.selectList("mypage.list", map);
	}

	@Override
	public Mypage notice() {
		return sql.selectOne("mypage.notice");
	}

	@Override
	public int total(Pagersm pagersm, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pagersm", pagersm);
		map.put("id", id);
		
		return sql.selectOne("mypage.total", map);
	}

	@Override
	public int total(Pager pager, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pager", pager);
		map.put("id", id);
		
		return sql.selectOne("mypage.total", map);
	}

	@Override
	public List<Mypage> list(Pager pager, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pager", pager);
		map.put("id", id);
		
		return sql.selectList("mypage.list_p", map);
	}

}
