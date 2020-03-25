package com.zerock.mapper;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.zerock.mapper.BoardMapper;

import lombok.Setter;

public class BoardMapperTests {
	
	@Setter(onMethod_ = @Autowired )
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		
		mapper.getList().forEach(board -> System.out.println(board));
	}

}
