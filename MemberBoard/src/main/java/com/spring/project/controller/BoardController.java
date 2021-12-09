package com.spring.project.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.project.dto.BoardDTO;
import com.spring.project.dto.CommentDTO;
import com.spring.project.dto.PageDTO;
import com.spring.project.service.BoardService;
import com.spring.project.service.CommentService;

@Controller
@RequestMapping(value="/board/*")
public class BoardController {

	@Autowired
	private BoardService bs;
	@Autowired
	private CommentService cs;
	
	@RequestMapping(value = "save", method = RequestMethod.GET)
	public String saveForm() {
		return "board/save";
	}
	
	@RequestMapping(value="findAll", method=RequestMethod.GET)
	public String findAll(Model model) {
		List<BoardDTO> bList = bs.findAll();
		model.addAttribute("bList",bList);
		return "board/findAll";
	}
	
	@RequestMapping(value="savefile",method=RequestMethod.POST)
	public String saveFile(@ModelAttribute BoardDTO board) throws IllegalStateException, IOException{
		bs.saveFile(board);
		return "redirect:/board/paging";
	}
	
	@RequestMapping(value="detail",method=RequestMethod.GET)
	public String detail(@RequestParam("b_number") long b_number, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page) {
		BoardDTO board = bs.detail(b_number);
		model.addAttribute("board",board);
		model.addAttribute("page", page); // detail.jsp로 갈 때 page도 같이 가져감.
		List<CommentDTO> commentList = cs.findAll(b_number);
		model.addAttribute("commentList",commentList);
		return "board/detail";
	}
	
	@RequestMapping(value="delete",method=RequestMethod.GET)
	public String delete(@RequestParam("b_number") long b_number) {
		String result = bs.delete(b_number);
		return result;
	}
	
	@RequestMapping(value="updateForm",method=RequestMethod.GET)
	public String updateForm(@RequestParam("b_number") long b_number, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page) {
		BoardDTO board = bs.findById(b_number);
		model.addAttribute("board",board);
		model.addAttribute("page", page);
		return "board/update";
	}
	
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String update(@ModelAttribute BoardDTO board, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page) throws IllegalStateException, IOException {
		System.out.println(board);
		String result = bs.update(board, model, page);
		return result;
	}
	
	@RequestMapping(value="paging", method=RequestMethod.GET)
	// value : 파라미터 이름, required : 필수여부, defaultValue : 기본값(page 요청값이 없으면 1로 세팅)
	public String paging(@RequestParam(value="page", required=false, defaultValue="1")int page ,Model model) {
		List<BoardDTO> boardList = bs.pagingList(page);
		PageDTO paging = bs.paging(page);
		model.addAttribute("bList", boardList);
		model.addAttribute("paging", paging);
		return "board/findAll";
	}
	
	@RequestMapping(value="search", method=RequestMethod.GET)
	public String search(@RequestParam("searchtype") String searchtype, @RequestParam("keyword") String keyword, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page) {
		List<BoardDTO> bList = bs.search(searchtype, keyword);
		bs.pagingList(page);
		PageDTO paging = bs.paging(page);
		model.addAttribute("bList", bList);
		model.addAttribute("paging", paging);
		return "board/findAll";
	}
	
	@RequestMapping(value="choice", method=RequestMethod.GET)
	public String choice(@RequestParam("choice") String choice) {
		int result=0;
		if(choice.equals("five")) {
			result=5;
		} else if(choice.equals("ten")) {
			result=10;
		}
		bs.paging(result);
//		return "redirect:/board/paging";
		return null;
	}
}
