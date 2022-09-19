package kr.ac.travelife.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.travelife.dao.MemberDao;
import kr.ac.travelife.model.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	@Override
	public void add(Member member) {
		dao.add(member); 
	}

	@Override
	public boolean checkId(String id) {
		if(dao.checkId(id)==0)
			return true;
		else
			return false;
	}

	@Override
	public boolean login(Member member) {
		Member item = dao.item(member);
		
		if(item != null) {
			member.setNick(item.getNick());
			member.setPasswd(null);
			member.setName(item.getName());
			member.setTel(item.getTel());
			member.setId(item.getId());
			member.setEmail(item.getEmail());
			member.setAuthority(item.getAuthority());
			
			return true;
		}
		return false;
	}

	@Override
	public Member info() {
		return dao.info();
	}

	@Override
	public void update(Member myinfo) {
		dao.update(myinfo);
	}

	@Override
	public boolean checkNick(String nick) {
		if(dao.checkNick(nick)==0)
			return true;
		else
			return false;
	}


}
