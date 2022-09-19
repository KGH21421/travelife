package kr.ac.travelife.service;

import java.util.List;

import kr.ac.travelife.model.Mypage;
import kr.ac.travelife.util.Pager;
import kr.ac.travelife.util.Pagersm;

public interface MypageService {

	List<Mypage> list(Pagersm pagersm, String id);

	Mypage notice();

	List<Mypage> list(Pager pager, String id);

}
