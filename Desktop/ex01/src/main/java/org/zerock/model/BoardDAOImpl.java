package org.zerock.model;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;




@Repository
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public void dao_insert(BoardVO board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void dao_update(BoardVO board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void dao_delete(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BoardVO> dao_list() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}

	@Override
	public BoardVO dao_findById(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dao_count(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return 0;
	}

}
