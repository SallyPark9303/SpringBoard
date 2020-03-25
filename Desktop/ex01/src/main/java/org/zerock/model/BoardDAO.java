package org.zerock.model;

import java.util.HashMap;
import java.util.List;

import org.zerock.domain.BoardVO;



public interface BoardDAO {
	
	
	public void dao_insert(BoardVO board);
	public void dao_update(BoardVO board);
	public void dao_delete(int num);
	public List<BoardVO>dao_list();
	public BoardVO dao_findById(int num);
	public int dao_count(HashMap<String,Object>hm);
	

}
