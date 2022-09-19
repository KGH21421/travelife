package kr.ac.travelife.dao;

import java.util.List;

import kr.ac.travelife.model.Talk;
import kr.ac.travelife.util.Pager;

public interface TalkDao {

	int total(Pager pager);

	List<Talk> list(Pager pager);

	void add(Talk notice);

	Talk notice(int code);

	void updateviews(int code);

	void delete(int code);

	void update(Talk notice);

}
