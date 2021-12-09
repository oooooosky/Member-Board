package com.spring.project.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.project.dto.MemberDTO;
import com.spring.project.repository.MemberRepository;

@Service
public class MemberService {

	@Autowired
	private MemberRepository mr;
	
	@Autowired
	private HttpSession session;
	
	public String join(MemberDTO member) throws IllegalStateException, IOException {
		MultipartFile m_file = member.getM_file();
		String m_filename = m_file.getOriginalFilename();
		m_filename = System.currentTimeMillis() + "-" + m_filename;
		String savePath = "/Users/sky/EclipseJava/source/Spring/MemberBoard/src/main/webapp/resources/upload/"+m_filename;
		if(!m_file.isEmpty()) {
			m_file.transferTo(new File(savePath));
		}
		member.setM_filename(m_filename);
		System.out.println("S : "+member);
		int result = mr.join(member);
		if(result>0) {
			return "index";
		} else {			
			return "member/join";
		}
	}

	public String idDuplicate(String m_id) {
		String result = mr.idDuplicate(m_id);
		if(result == null) {
			return "ok";
		} else {
			return "no";
		}
	}

	public String login(MemberDTO check) {
		MemberDTO result = mr.login(check);
		if(result != null) {
			if(result.getM_id().equals("admin")) {
				session.setAttribute("loginId", check.getM_id());
				session.setAttribute("loginNumber", result.getM_number());
				return "member/main";
			}
			session.setAttribute("loginId", check.getM_id());
			session.setAttribute("loginNumber", result.getM_number());
			return "redirect:/board/paging";
		} else {
			return "member/login";
		}
	}

	public MemberDTO findById(String m_id) {
		return mr.findById(m_id);
	}

	public String update(MemberDTO member) throws IllegalStateException, IOException {
		int result = 0;
		if(!member.getM_file().isEmpty()) {
			MultipartFile m_file = member.getM_file();
			String m_filename = m_file.getOriginalFilename();
			m_filename = System.currentTimeMillis() + "-" + m_filename;
			String savePath = "/Users/sky/EclipseJava/source/Spring/MemberBoard/src/main/webapp/resources/upload/"+m_filename;
			if(!m_file.isEmpty()) {
				m_file.transferTo(new File(savePath));
			}
			member.setM_filename(m_filename);
			result = mr.updateFile(member);			
		} else {
			result = mr.update(member);
		}
		if(result>0) {
			return "redirect:/board/paging";
		} else {
			return "redirect:/board/paging";
		}
		
	}

	public List<MemberDTO> findAll() {
		return mr.findAll();
	}

	public MemberDTO detail(long m_number) {
		return mr.detail(m_number);
	}

	public String delete(long m_number) {
		int result = mr.delete(m_number);
		if(result>0) {
			return "redirect:/member/memberView";			
		} else {
			return "member/memberView";
		}
	}


}
