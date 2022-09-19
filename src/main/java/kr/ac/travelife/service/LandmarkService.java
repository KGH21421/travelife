package kr.ac.travelife.service;

import java.util.List;

import kr.ac.travelife.model.Landmark;
import kr.ac.travelife.util.Pager;

public interface LandmarkService {

	List<Landmark> list(Pager pager);

	void add(Landmark notice);

	Landmark notice(int code);

	void updateviews(int code);

	void delete(int code);

	void update(Landmark notice);
}
