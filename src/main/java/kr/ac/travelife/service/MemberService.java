package kr.ac.travelife.service;

import kr.ac.travelife.model.Member;

public interface MemberService {

	void add(Member member);

	boolean checkId(String id);

	boolean login(Member member);

	Member info();

	void update(Member member);

	boolean checkNick(String nick);




}
