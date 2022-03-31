package org.moym.service;



import java.util.List;

import org.moym.domain.BoardVO;
import org.moym.domain.Criteria;
import org.moym.domain.MemberVO;		//this one
import org.moym.mapper.MemberMapper;	//this one

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)	//  this one make this service inject to Controller!!! 서비스 객체를 컨트롤러에 자동주입
	private MemberMapper memberMapper;	
	
	
	
	
	
	@Override
	public void insert(MemberVO member) {
		
	    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	    
	    String securePw = passwordEncoder.encode(member.getUserpw());
	    member.setUserpw(securePw);
		
		
		log.info("create...." + member);
		memberMapper.insert(member);
	}
	
	
	@Override
	public int idCheck(String userid) {
		
		return memberMapper.idCheck(userid);
	}


	@Override
	public String findIdByEmail(String email) {
		
		return memberMapper.findIdByEmail(email);
	}

	@Transactional
	@Override
	public boolean changePW(MemberVO member) {
		
		//before change, you should make the password to token.  setter&gettter
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String securePw = passwordEncoder.encode(member.getUserpw());
		member.setUserpw(securePw);
		
		
		
		
		log.info("Change Password " + member);
		
		boolean changePwResult = memberMapper.changePW(member) == 1;
		
		return changePwResult;
	}


	@Override
	public int emailChk(String email) {
		
		return memberMapper.emailChk(email);
	}


	@Override
	public MemberVO get(String userid) {
		
		log.info("get from member table by " + userid);
		
		return memberMapper.read(userid);
	}


	@Override
	public boolean remove(String userid) {
		
		memberMapper.deleteMemAuth(userid);
		
		return memberMapper.deleteMem(userid) == 1;
	}
	
	
	
	@Override
	public List<BoardVO> myPostGetList(Criteria cri) {
		log.info("로그인된 아이디 서비스에서 : " + cri);
		return memberMapper.myPostGetList(cri);
	}


	@Override
	public int getTotalMyPostCnt(Criteria cri) {
		log.info("get total count on my Page");
		return memberMapper.getTotalMyPost(cri);
	}


	@Override
	public List<BoardVO> recentPostHome() {
		return memberMapper.recentPostHome();
	}


	@Override
	public List<BoardVO> recentNotice() {
		return memberMapper.recentNotice();
	}
	
	
	
}








