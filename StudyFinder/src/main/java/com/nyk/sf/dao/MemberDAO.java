package com.nyk.sf.dao;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.nyk.sf.vo.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSession sqlSession;

	public int signup(MemberVO vo) {
		int result = 0;
		try {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			result = mapper.signup(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean login(MemberVO vo, HttpSession session) {
		MemberVO member = null;
		try {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			member = mapper.login(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (member != null) {
			session.setAttribute("userid", member.getUserid());
			session.setAttribute("member", member);
			return true;
		}
		return false;
	}

	public void logout(HttpSession session) {
		session.removeAttribute("userid");
		session.removeAttribute("loginMember");
	}

	public MemberVO searchMember(String userid) {
		MemberVO result = null;
		try {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			result = mapper.searchMember(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void updateMember(HttpSession session, MemberVO vo) {
		String userid = (String) session.getAttribute("userid");
		vo.setUserid(userid);
		try {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			mapper.updateMember(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private final String uploadPath ="C:\\Users\\pieTH\\git\\StudyFinder\\StudyFinder\\src\\main\\webapp\\resources\\imgUpload";
	public void updatePic(HttpSession session, MultipartFile uploadFile) {
		String userid = (String) session.getAttribute("userid");
		MemberVO vo = searchMember(userid);
		
		try {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			if (!uploadFile.isEmpty()) {
				File file = new File(uploadPath + "\\" + vo.getUser_savedFileName());
				if(file.exists()) file.delete();
				
				String originalFileName = uploadFile.getOriginalFilename();
				String savedFileName = UUID.randomUUID().toString();
				String img = uploadPath+ "\\" + savedFileName;
				
				vo.setUser_originalFileName(originalFileName);
				vo.setUser_savedFileName(savedFileName);
				vo.setImg(img);
				try {
					uploadFile.transferTo(new File(uploadPath + "\\" + savedFileName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			mapper.updatePic(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
