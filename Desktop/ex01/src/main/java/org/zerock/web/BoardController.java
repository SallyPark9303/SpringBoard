package org.zerock.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.model.BoardServiceImpl;

import jdk.internal.org.jline.utils.Log;



@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Autowired
	private BoardServiceImpl service;
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	//전체보기
	@GetMapping("/list")
	public void list(Model model, Criteria cri ) {
		//List<BoardVO> list =service.getList(cri);
		List<BoardVO> list =service.getList(cri);
		int total=service.getTotal();
		model.addAttribute("list",service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri,total));
		model.addAttribute("total",total);
		
	}
	
	//추가
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		
		service.register(board);
		rttr.addFlashAttribute("result",board.getBno());
		return "redirect:/board/list";
	}
	
	//조회 (상세보기)
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") Long bno, Model model, @ModelAttribute("cri") Criteria cri){
		//Log.info("/get or modify");
		System.out.println("cri.pageNum" + cri.getPageNum());
		model.addAttribute("board",service.get(bno));
	}
	
	//modify
	@PostMapping("/modify")
		public String modify(BoardVO board) {
		System.out.println(board.getBno());
			
			service.modify(board);
			return "redirect:/board/list";
		}
	
	//삭제
	@PostMapping("/delete")
	public String delete(long bno) {
		System.out.println("del :"+bno);
		service.delete(bno);
		return "redirect:/board/list";
	}
	
}
