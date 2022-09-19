package kr.ac.travelife.service;

import java.util.List;

import kr.ac.travelife.model.Hotel;
import kr.ac.travelife.util.Pager;

public interface HotelService {

	List<Hotel> list(Pager pager);

	void add(Hotel notice);

	Hotel notice(int code);

	void updateviews(int code);

	void delete(int code);

	void update(Hotel notice);


}
