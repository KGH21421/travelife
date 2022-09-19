package kr.ac.travelife.service;

import java.util.List;

import kr.ac.travelife.model.Notice;
import kr.ac.travelife.util.Pager;
import kr.ac.travelife.util.Pagersm;

public interface NoticeService {

	List<Notice> list(Pager pager);

	void add(Notice notice);

	Notice notice(int code);

	void delete(int code);

	void updateviews(int code);

	void update(Notice notice);

	List<Notice> list(Pagersm pagersm);

}
