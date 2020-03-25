package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {
	
	//@Select("select * from tb1_board where bno >0")
	public List<BoardVO> getList();
	public void insert(BoardVO board);
	public Integer insertSelectKey(BoardVO board);//시퀀스구하기
	public BoardVO get(Long bno);
	public void modify(BoardVO board);
	public void delete(Long bno);
	public int getCount();
	public List<BoardVO> getListWithPaging(Criteria cri);

}
