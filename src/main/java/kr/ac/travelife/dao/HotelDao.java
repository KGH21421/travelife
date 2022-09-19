package kr.ac.travelife.dao;

import java.util.List;

import kr.ac.travelife.model.Hotel;
import kr.ac.travelife.util.Pager;

public interface HotelDao {

	List<Hotel> list(Pager pager);

	void add(Hotel notice);

	Hotel notice(int code);

	void updateviews(int code);

	void delete(int code);

	int total(Pager pager);

	void update(Hotel notice);
	
}
