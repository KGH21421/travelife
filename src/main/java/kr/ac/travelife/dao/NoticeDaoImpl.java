package kr.ac.travelife.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.travelife.model.Notice;
import kr.ac.travelife.util.Pager;
import kr.ac.travelife.util.Pagersm;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public int total(Pager pager) {
		return sql.selectOne("notice.total",pager);
	}

	@Override
	public List<Notice> list(Pager pager) {
		return sql.selectList("notice.list",pager);
	}

	@Override
	public void add(Notice notice) {
		sql.insert("notice.add",notice);
	}

	@Override
	public Notice notice(int code) {
		return sql.selectOne("notice.notice",code);
	}

	@Override
	public void delete(int code) {
		sql.delete("notice.delete",code);
	}

	@Override
	public void updateviews(int code) {
		sql.update("notice.updateViews",code);
	}

	@Override
	public void update(Notice notice) {
		sql.update("notice.update",notice);
	}

	@Override
	public int total(Pagersm pagersm) {
		return sql.selectOne("notice.total",pagersm);
	}

	@Override
	public List<Notice> list(Pagersm pagersm) {
		return sql.selectList("notice.list",pagersm);
	}

}
