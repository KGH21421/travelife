package kr.ac.travelife.dao;

import kr.ac.travelife.model.Member;

public interface MemberDao {

	void add(Member member);

	int checkId(String id);

	Member item(Member member);

	Member info();

	void update(Member member);

	int checkNick(String nick);

}
