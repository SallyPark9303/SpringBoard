package org.zerock.model;


import java.util.List;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;



public interface BoardService {
	
	
public void register(BoardVO board); //등록
public void modify(BoardVO board); //수정
public void delete(Long bno); //삭제
public List<BoardVO>getList(Criteria cri); //전체보기
public int getTotal(); //개수
public BoardVO get(Long bno); //상세보기

}
