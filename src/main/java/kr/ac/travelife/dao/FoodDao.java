package kr.ac.travelife.dao;

import java.util.List;

import kr.ac.travelife.model.Food;
import kr.ac.travelife.util.Pager;

public interface FoodDao {

	int total(Pager pager);

	List<Food> list(Pager pager);

	void add(Food notice);

	Food notice(int code);

	void updateviews(int code);

	void delete(int code);

	void update(Food notice);

}
