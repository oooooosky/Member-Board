package com.spring.project.service;

import java.util.List;

import com.spring.project.dto.CommentDTO;

public interface CommentInterface {

	public void save(CommentDTO comment);

	public List<CommentDTO> findAll(long b_number);

	public String delete(long c_number, long b_number, int page);

}
