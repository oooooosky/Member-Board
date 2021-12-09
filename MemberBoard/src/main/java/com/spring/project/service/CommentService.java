package com.spring.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.dto.CommentDTO;
import com.spring.project.repository.CommentRepository;



@Service
public class CommentService {

	@Autowired
	private CommentRepository cr;
	
	public void save(CommentDTO comment) {
		cr.save(comment);
	}
	
	public List<CommentDTO> findAll(long b_number) {
		return cr.findAll(b_number);
	}

	public String delete(long c_number, long b_number, int page) {
		int result = cr.delete(c_number);
		if(result>0) {
			return "redirect:/board/detail?b_number="+b_number+"&page="+page;
		} else {
			return "/board/paging";
		}
	}
	
}
