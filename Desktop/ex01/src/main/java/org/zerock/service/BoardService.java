package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardService {
	//�߰�
	//��ü����
	//�󼼺���
	//����
	//����
	public void register(BoardVO board);
	public List<BoardVO> getList();
	public BoardVO get(Long bno);
	public void modify(BoardVO board);
	public void delete(Long bno);
	//����
	public int getTotal();
	
	
	
	
	
	
	
	

}
