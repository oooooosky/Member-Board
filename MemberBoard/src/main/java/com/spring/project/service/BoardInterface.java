package com.spring.project.service;

import java.io.IOException;
import java.util.List;

import org.springframework.ui.Model;

import com.spring.project.dto.BoardDTO;
import com.spring.project.dto.PageDTO;

public interface BoardInterface {

	public List<BoardDTO> findAll();

	public BoardDTO detail(long b_number);

	public String delete(long b_number);

	public String update(BoardDTO board, Model model, int page) throws IllegalStateException, IOException;

	public BoardDTO findById(long b_number);

	public List<BoardDTO> pagingList(int page);

	public PageDTO paging(int page);

	public List<BoardDTO> search(String searchtype, String keyword);

	public void saveFile(BoardDTO board) throws IllegalStateException, IOException;

}
