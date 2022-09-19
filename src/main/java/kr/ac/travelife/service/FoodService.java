package kr.ac.travelife.service;

import java.util.List;

import kr.ac.travelife.model.Food;
import kr.ac.travelife.util.Pager;

public interface FoodService {

	List<Food> list(Pager pager);

	void add(Food notice);

	Food notice(int code);

	void updateviews(int code);

	void delete(int code);

	void update(Food notice);

}
