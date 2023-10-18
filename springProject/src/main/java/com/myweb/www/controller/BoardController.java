package com.myweb.www.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/*")
@RequiredArgsConstructor
public class BoardController {
	// 폴더명 : board / mapping : board
	// mapping => /board/register
	// 목적지 => /board/register
	
	private final BoardService bsv;
	
	@GetMapping("/register")
	public void register() {
		log.info(">>> start ");
	}
	
	@PostMapping("/register")
	public String resisterPost(BoardVO bvo) {
		log.info("bvo : {}",bvo);
		int isOk = bsv.insert(bvo);
		log.info(">>> board register "+(isOk > 0? "OK" : "Fail"));
		return "index";
	}
	
	@GetMapping("/list")
	public String list(Model model) {
		List<BoardVO> list = bsv.getList();
		model.addAttribute("list",list);
		return "/board/list";
	}
	
	@GetMapping({"/detail","modify"})
	public void detail(Model model, @RequestParam("bno")long bno) {
		BoardVO bvo = bsv.getDetail(bno);
		model.addAttribute("bvo", bvo);
	}
	
	@GetMapping("/cntdetail")
	public String cntdetail(Model model, @RequestParam("bno")long bno) {
		BoardVO bvo = bsv.cntdetail(bno);
		model.addAttribute("bvo", bvo);
		return "/board/detail";
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO bvo) {
		log.info("bvo : {}",bvo);
		int isOk = bsv.modify(bvo);
		log.info(">>> board modify "+(isOk > 0? "OK" : "Fail"));
		return "redirect:/board/detail?bno="+bvo.getBno();
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("bno") long bno) {
		int isOk = bsv.remove(bno);
		log.info(">>> board remove "+(isOk > 0? "OK" : "Fail"));
		return "redirect:/board/list";
	}
	
}
