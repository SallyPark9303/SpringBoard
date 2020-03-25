package org.zerock.model;


import java.util.List;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;



public interface BoardService {
	
	
public void register(BoardVO board); //���
public void modify(BoardVO board); //����
public void delete(Long bno); //����
public List<BoardVO>getList(Criteria cri); //��ü����
public int getTotal(); //����
public BoardVO get(Long bno); //�󼼺���

}
