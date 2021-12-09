package com.spring.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project.dto.CommentDTO;
import com.spring.project.service.CommentService;

@Controller
@RequestMapping("/comment/*")
public class CommentController {

	@Autowired
	private CommentService cs;
	
	@RequestMapping(value="save", method=RequestMethod.POST)
	public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO comment) {
		cs.save(comment);
		List<CommentDTO> commentList = cs.findAll(comment.getB_number());
		return commentList;
	}
	
	@RequestMapping(value="delete",method=RequestMethod.GET)
	public String delete(@RequestParam("c_number") long c_number, @RequestParam("b_number") long b_number, @RequestParam(value="page", required=false, defaultValue="1")int page) {
		String result = cs.delete(c_number, b_number, page);
		return result;
	}
	
}
