package com.spring.project.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDTO {
// 게시글데이터: 글번호, 제목, 작성자, 내용, 조회수, 작성일자, 첨부파일명
	private long b_number;
	private String b_title;
	private String b_writer;
	private String b_contents;
	private int b_hits;
	private Timestamp b_date;
	
	private MultipartFile b_file;
	private String b_filename;

}
