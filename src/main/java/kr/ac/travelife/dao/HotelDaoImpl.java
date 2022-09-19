package kr.ac.travelife.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.ac.travelife.model.Hotel;
import kr.ac.travelife.util.Pager;

@Repository
public class HotelDaoImpl implements HotelDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Hotel> list(Pager pager) {
		return sql.selectList("hotel.list",pager);//hotel>mapper 파일명 list > mapper 안에 id
	}
   
	@Override
	public void add(Hotel notice) {
		sql.insert("hotel.add",notice);
	}

	@Override
	public Hotel notice(int code) {
		return sql.selectOne("hotel.notice",code);
	}

	@Override
	public void updateviews(int code) {
		sql.update("hotel.updateViews",code);
	}

	@Override
	public void delete(int code) {
		sql.delete("hotel.delete",code);
	}

	@Override
	public int total(Pager pager) {
		return sql.selectOne("hotel.total",pager);
	}

	@Override
	public void update(Hotel notice) {
		sql.update("hotel.update",notice);	
	}
	
}
