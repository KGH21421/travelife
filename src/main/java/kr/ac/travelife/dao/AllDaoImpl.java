package kr.ac.travelife.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.travelife.model.All;
import kr.ac.travelife.util.Pager;
import kr.ac.travelife.util.Pagersm;

@Repository
public class AllDaoImpl implements AllDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public int total(Pagersm pagersm) {
		return sql.selectOne("all.total", pagersm);
	}

	@Override
	public List<All> list(Pagersm pagersm) {
		return sql.selectList("all.list",pagersm);
	}

	@Override
	public int total(Pager pager) {
		return sql.selectOne("all.total",pager);
	}

	@Override
	public List<All> list(Pager pager) {
		return sql.selectList("all.alist",pager);
	}

}
