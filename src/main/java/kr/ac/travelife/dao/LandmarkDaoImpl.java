package kr.ac.travelife.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.travelife.model.Landmark;
import kr.ac.travelife.util.Pager;

@Repository
public class LandmarkDaoImpl implements LandmarkDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public int total(Pager pager) {
		return sql.selectOne("landmark.total",pager);
	}

	@Override
	public List<Landmark> list(Pager pager) {
		return sql.selectList("landmark.list",pager);
	}

	@Override
	public void add(Landmark notice) {
		sql.insert("landmark.add",notice);
	}

	@Override
	public Landmark notice(int code) {
		return sql.selectOne("landmark.notice",code);
	}

	@Override
	public void updateviews(int code) {
		sql.update("landmark.updateViews",code);
	}

	@Override
	public void delete(int code) {
		sql.delete("landmark.delete",code);
	}

	@Override
	public void update(Landmark notice) {
		sql.update("landmark.update",notice);
	}

}
