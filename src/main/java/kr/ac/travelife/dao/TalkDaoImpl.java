package kr.ac.travelife.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.travelife.model.Talk;
import kr.ac.travelife.util.Pager;

@Repository
public class TalkDaoImpl implements TalkDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Talk> list(Pager pager) {
		return sql.selectList("talk.list",pager);//hotel>mapper 파일명 list > mapper 안에 id
	}
   
	@Override
	public void add(Talk notice) {
		sql.insert("talk.add",notice);
	}

	@Override
	public Talk notice(int code) {
		return sql.selectOne("talk.notice",code);
	}

	@Override
	public void updateviews(int code) {
		sql.update("talk.updateViews",code);
	}

	@Override
	public void delete(int code) {
		sql.delete("talk.delete",code);
	}

	@Override
	public int total(Pager pager) {
		return sql.selectOne("hotel.total",pager);
	}

	@Override
	public void update(Talk notice) {
		sql.update("talk.update",notice);	
	}

}
