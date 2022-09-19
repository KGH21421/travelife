package kr.ac.travelife.service;

import java.util.List;

import kr.ac.travelife.model.All;
import kr.ac.travelife.util.Pager;
import kr.ac.travelife.util.Pagersm;

public interface AllService {

	List<All> list(Pagersm pagersm);

	List<All> list(Pager pager);

}
