package kr.ac.travelife.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.travelife.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public void add(Member member) {
		sql.insert("member.add",member);
	}

	@Override
	public int checkId(String id) {
		return sql.selectOne("member.check_id",id);
	}

	@Override
	public Member item(Member member) {
		return sql.selectOne("member.login",member);
	}

	@Override
	public Member info() {
		return sql.selectOne("member.info");
	}

	@Override
	public void update(Member myinfo) {
		sql.update("member.update",myinfo);
	}

	@Override
	public int checkNick(String nick) {
		return sql.selectOne("member.check_nick",nick);
	}

}
