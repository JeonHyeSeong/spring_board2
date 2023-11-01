package com.myweb.www.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.security.MemberVO;
import com.myweb.www.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/**")
@RequiredArgsConstructor
public class MemberController {
	private final MemberService msv;
	
	private final BCryptPasswordEncoder bcEncoder;
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String register(MemberVO mvo) {
		mvo.setPwd(bcEncoder.encode(mvo.getPwd()));
		log.info("mvo : {}",mvo);
		int isOk = msv.register(mvo);
		log.info(isOk > 0 ? "OK" : "Fail");
		return "index";
	}
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String loginPost(HttpServletRequest request, RedirectAttributes re) {
		// 로그인 실패시 다시 로그인 페이지로 돌아와 오류 메시지 전송
		// 다시 로그인 유도
		re.addAttribute("email", request.getAttribute("email"));
		re.addAttribute("errorMsg", request.getAttribute("errorMsg"));
		return "redirect:/member/login";
	}
	
	@GetMapping("/list")
	public String memberGetList(Model model) {
		List<MemberVO> list = msv.getList();
		model.addAttribute("list", list);
		return "/member/list";
	}
	
	@GetMapping("/detail")
	public String memberGetDetail(Model model, @RequestParam("email") String email) {
		MemberVO mvo = msv.getDetail(email);
		model.addAttribute("mvo", mvo);
		return "/member/detail";
	}
	
	@PostMapping("/detail")
	public String memberModify(MemberVO mvo, Model model,
			HttpServletRequest req, HttpServletResponse res) {
		if(mvo.getPwd().isEmpty()) {
			int isOk = msv.memberUpdate(mvo);
			log.info(isOk > 0 ? "OK" : "Fail");
			logout(req, res);
			return "index";
		}
		mvo.setPwd(bcEncoder.encode(mvo.getPwd()));
		int isOk = msv.memberUp(mvo);
		log.info(isOk > 0 ? "OK" : "Fail");
		logout(req, res);
		return "index";
	}
	
	@GetMapping("/remove")
	public String memberRemove(@RequestParam("email") String email,
			HttpServletRequest req, HttpServletResponse res) {
		int isOk = msv.remove(email);
		log.info(isOk > 0 ? "OK" : "Fail");
		logout(req, res);
		return "index";
	}
	
	private void logout(HttpServletRequest req, HttpServletResponse res) {
		Authentication authentication = SecurityContextHolder
				.getContext().getAuthentication();
		new SecurityContextLogoutHandler().logout(req, res, authentication);
	}
}
