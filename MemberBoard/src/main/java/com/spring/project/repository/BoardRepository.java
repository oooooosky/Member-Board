package com.spring.project.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.dto.BoardDTO;

@Repository
public class BoardRepository {

	@Autowired
	private SqlSessionTemplate sql;
	
	public List<BoardDTO> findAll() {
		return sql.selectList("Board.findAll");
	}
	
	public BoardDTO detail(long b_number) {
		sql.update("Board.hits",b_number);
		BoardDTO board = sql.selectOne("Board.detail",b_number);
		return board;
	}
	
	public int delete(long b_number) {
		return sql.delete("Board.delete", b_number);
	}
	
	public int update(BoardDTO board) {
		return sql.update("Board.update",board);
	}

	public BoardDTO findByID(long b_number) {
		return sql.selectOne("Board.detail",b_number);
	}
	
	public int boardCount() {
		return sql.selectOne("Board.count");
	}
	
	public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) {
		return sql.selectList("Board.pagingList", pagingParam);
	}
	
	public List<BoardDTO> search(Map<String, String> searchParam) {
		return sql.selectList("Board.search", searchParam);
	}

	public void saveFile(BoardDTO board) {
		sql.insert("Board.saveFile",board);
	}

	public int updateFile(BoardDTO board) {
		return sql.update("Board.updateFile",board);
	}
	
}
