package org.zerock.web;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.spi.LoggerFactoryBinder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.SampleDTO;

@Controller
@RequestMapping("/sample/*")
public class SampleController {
	private static final Logger log 
	= LoggerFactory.getLogger(SampleController.class);
	@GetMapping("/ex04")
	public String ex04(SampleDTO dto, @ModelAttribute("page") int page) {
		log.info("dto:",dto);
		log.info("page:",page);
		
		return "/sample/ex04";
	}
	

}
