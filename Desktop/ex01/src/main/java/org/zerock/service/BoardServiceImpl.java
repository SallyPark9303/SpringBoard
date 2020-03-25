package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;
@Service
public class BoardServiceImpl  implements BoardService{
  @Autowired 
  private BoardMapper mapper;
	@Override
	public void register(BoardVO board) {
		mapper.insertSelectKey(board);
	}
	@Override
	public List<BoardVO> getList() {
		return mapper.getList();
	}
	@Override
	public BoardVO get(Long bno) {
		// TODO Auto-generated method stub
		return mapper.get(bno);
	}
	@Override
	public void modify(BoardVO board) {
		// TODO Auto-generated method stub
		mapper.modify(board);
	}
	@Override
	public void delete(Long bno) {
		// TODO Auto-generated method stub
		mapper.delete(bno);
	}
	@Override
	public int getTotal() {
		return mapper.getCount();
	}

}
