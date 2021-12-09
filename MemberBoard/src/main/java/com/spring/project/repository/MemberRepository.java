package com.spring.project.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.dto.MemberDTO;

@Repository
public class MemberRepository {

	@Autowired
	private SqlSessionTemplate sql;
	
	public int join(MemberDTO member) {
		System.out.println(member);
		return sql.insert("Member.join", member);
	}

	public String idDuplicate(String m_id) {
		return sql.selectOne("Member.idDuplicate",m_id);
	}

	public MemberDTO login(MemberDTO check) {
		return sql.selectOne("Member.login",check);
	}

	public MemberDTO findById(String m_id) {
		return sql.selectOne("Member.findById", m_id);
	}

	public int updateFile(MemberDTO member) {
		return sql.update("Member.updateFile", member);
	}

	public int update(MemberDTO member) {
		return sql.update("Member.update", member);
	}

	public List<MemberDTO> findAll() {
		return sql.selectList("Member.findAll");
	}

	public MemberDTO detail(long m_number) {
		return sql.selectOne("Member.detail", m_number);
	}

	public int delete(long m_number) {
		return sql.delete("Member.delete", m_number);
	}


}
