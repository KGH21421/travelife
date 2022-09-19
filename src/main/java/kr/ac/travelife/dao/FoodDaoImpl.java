package kr.ac.travelife.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.travelife.model.Food;
import kr.ac.travelife.util.Pager;

@Repository
public class FoodDaoImpl implements FoodDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Food> list(Pager pager) {
		return sql.selectList("food.list",pager);//hotel>mapper 파일명 list > mapper 안에 id
	}
   
	@Override
	public void add(Food notice) {
		sql.insert("food.add",notice);
	}

	@Override
	public Food notice(int code) {
		return sql.selectOne("food.notice",code);
	}

	@Override
	public void updateviews(int code) {
		sql.update("food.updateViews",code);
	}

	@Override
	public void delete(int code) {
		sql.delete("food.delete",code);
	}

	@Override
	public int total(Pager pager) {
		return sql.selectOne("food.total",pager);
	}

	@Override
	public void update(Food notice) {
		sql.update("food.update",notice);	
	}

}
