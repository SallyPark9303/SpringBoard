package org.zerock.model;


import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;





@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
private BoardMapper mapper;

	@Override
	public void register(BoardVO board) {
		// TODO Auto-generated method stub
		mapper.insertSelectKey(board);
		
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
		// TODO Auto-generated method stub
		return mapper.getCount();
	}

	@Override
	public BoardVO get(Long bno) {
		// TODO Auto-generated method stub
		return mapper.get(bno);
	}

	@Override

	public List<BoardVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
	//Log.info("get List with criteria:" + cri);
		return mapper.getListWithPaging(cri);
	
	}
	
	public List<BoardVO> getList(){
		return mapper.getList();
	}
	}


