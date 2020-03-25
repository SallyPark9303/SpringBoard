package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardService {
	//추가
	//전체보기
	//상세보기
	//수정
	//삭제
	public void register(BoardVO board);
	public List<BoardVO> getList();
	public BoardVO get(Long bno);
	public void modify(BoardVO board);
	public void delete(Long bno);
	//개수
	public int getTotal();
	
	
	
	
	
	
	
	

}
