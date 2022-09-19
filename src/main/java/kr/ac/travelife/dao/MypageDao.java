package kr.ac.travelife.dao;

import java.util.List;

import kr.ac.travelife.model.Mypage;
import kr.ac.travelife.util.Pager;
import kr.ac.travelife.util.Pagersm;

public interface MypageDao {

	List<Mypage> list(Pagersm pagersm, String id);

	Mypage notice();

	int total(Pagersm pagersm, String id);

	int total(Pager pager, String id);

	List<Mypage> list(Pager pager, String id);

}
