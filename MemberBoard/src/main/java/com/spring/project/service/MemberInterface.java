package com.spring.project.service;

import java.io.IOException;
import java.util.List;

import com.spring.project.dto.MemberDTO;

public interface MemberInterface {

	public String join(MemberDTO member) throws IllegalStateException, IOException;

	public String idDuplicate(String m_id);

	public String login(MemberDTO check);

	public MemberDTO findById(String m_id);

	public String update(MemberDTO member) throws IllegalStateException, IOException;

	public List<MemberDTO> findAll();

	public MemberDTO detail(long m_number);

	public String delete(long m_number);

}
