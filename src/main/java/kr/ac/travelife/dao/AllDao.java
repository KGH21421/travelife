package kr.ac.travelife.dao;

import java.util.List;

import kr.ac.travelife.model.All;
import kr.ac.travelife.util.Pager;
import kr.ac.travelife.util.Pagersm;

public interface AllDao {

	int total(Pagersm pagersm);

	List<All> list(Pagersm pagersm);

	int total(Pager pager);

	List<All> list(Pager pager);

}
