package com.spring.project.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.spring.project.dto.BoardDTO;
import com.spring.project.dto.PageDTO;
import com.spring.project.repository.BoardRepository;

@Service
public class BoardService {
	
	public List<BoardDTO> findAll() {
		return br.findAll();
	}
	
	public BoardDTO detail(long b_number) {
		BoardDTO board = br.detail(b_number);
		return board;
	}
	
	public String delete(long b_number) {
		int result = br.delete(b_number);
		if(result>0) {
			return "redirect:/board/paging";
		} else {
			return "board/findAll";			
		}
	}
	
	public String update(BoardDTO board, Model model, int page) throws IllegalStateException, IOException {
		int result = 0;
		if(!board.getB_file().isEmpty()) {
			MultipartFile b_file = board.getB_file();
			String b_filename = b_file.getOriginalFilename();
			b_filename = System.currentTimeMillis() + "-" + b_filename;
			String savePath = "/Users/sky/EclipseJava/source/Spring/MemberBoard/src/main/webapp/resources/upload/"+b_filename;
			if(!b_file.isEmpty()) {
				b_file.transferTo(new File(savePath));
			}
			board.setB_filename(b_filename);
			result = br.updateFile(board);
		} else {
			result = br.update(board);
		}
		if(result>0) {
			model.addAttribute("board", board);
			return "redirect:/board/detail?b_number="+board.getB_number()+"&page="+page;
		} else {
			return "board/update";
		}
	}
	
	public BoardDTO findById(long b_number) {
		BoardDTO board = br.findByID(b_number);
		return board;
	}
	
	private static int PAGE_LIMIT = 5; // 한페이지에 보여질 글 개수 
	private static final int BLOCK_LIMIT = 3; // 한화면에 보여질 페이지 개수

	@Autowired
	private BoardRepository br;
	
	public List<BoardDTO> pagingList(int page) {
		int pagingStart = (page-1) * PAGE_LIMIT;
		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", pagingStart);
		pagingParam.put("limit", PAGE_LIMIT);
		List<BoardDTO> pagingList = br.pagingList(pagingParam);
		return pagingList;
	}

	public PageDTO paging(int page) {
		int boardCount = br.boardCount();
		// ceil : 소수점이 있으면 다음 정수로 올림해줌.
		int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT));
		// 2페이지를 요청했으면 1페이지, 4페이지를 요청했으면 4페이지, 8페이지를 요청했으면 7페이지의 값을 갖도록 계산
		int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if(endPage > maxPage)
			endPage = maxPage; 
		PageDTO paging = new PageDTO();
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		
		return paging;
	}

	public List<BoardDTO> search(String searchtype, String keyword) {
		Map<String, String> searchParam = new HashMap<String, String>();
		searchParam.put("type", searchtype);
		searchParam.put("word", keyword);
		List<BoardDTO> bList = br.search(searchParam);
		return bList;
	}

	public void saveFile(BoardDTO board) throws IllegalStateException, IOException {
		MultipartFile b_file = board.getB_file();
		String b_filename = b_file.getOriginalFilename();
		b_filename = System.currentTimeMillis() + "-" + b_filename;
		String savePath = "/Users/sky/EclipseJava/source/Spring/MemberBoard/src/main/webapp/resources/upload/"+b_filename;
		if(!b_file.isEmpty()) {
			b_file.transferTo(new File(savePath));
		}
		board.setB_filename(b_filename);
		
		br.saveFile(board);
	}

}
