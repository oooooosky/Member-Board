package com.spring.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project.dto.MemberDTO;
import com.spring.project.service.MemberService;


@Controller
@RequestMapping(value="/member/*") // /member/* 로 요청하는 주소는 다 받겠다 라는 어노테이션
public class MemberController {

	@Autowired
	private MemberService ms;
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String joinForm() {		
		return "member/join";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginForm() {		
		return "member/login";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(@ModelAttribute MemberDTO member) throws IllegalStateException, IOException {
		String result = ms.join(member);
		return result;
	}
	
	@RequestMapping(value="idDuplicate", method=RequestMethod.POST)
	public @ResponseBody String idDuplicate(@RequestParam("m_id") String m_id) {
		String result = ms.idDuplicate(m_id);
		return result;
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute MemberDTO check) {
		String result = ms.login(check);
		return result;
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	@RequestMapping(value="myPageForm", method=RequestMethod.POST)
	public String myPageForm(@RequestParam("m_id") String m_id, Model model) {
		MemberDTO member = ms.findById(m_id);
		model.addAttribute("m",member);
		return "member/myPage";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(@ModelAttribute MemberDTO member) throws IllegalStateException, IOException  {
		String result = ms.update(member);
		return result;
	}
	
	@RequestMapping(value="memberView", method=RequestMethod.GET)
	public String memberView(Model model) {
		List<MemberDTO> mList = ms.findAll();
		model.addAttribute("mList",mList);
		return "member/memberView";
	}
	
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detail(@RequestParam("m_number") long m_number, Model model) {
		MemberDTO member = ms.detail(m_number);
		model.addAttribute("member",member);
		return "member/detail";
	}
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String main() {
		return "member/main";
	}
	
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(@RequestParam("m_number") long m_number) {
		String result = ms.delete(m_number);
		return result;
	}
	
}
