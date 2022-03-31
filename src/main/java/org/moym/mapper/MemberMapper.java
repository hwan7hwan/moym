package org.moym.mapper;

import java.util.List;

import org.moym.domain.BoardVO;
import org.moym.domain.Criteria;
import org.moym.domain.MemberVO;


public interface MemberMapper {
	
	public MemberVO read(String userid);
	
	public void insert(MemberVO member);

	public int idCheck(String userid);
	
	public int emailChk(String email);
	
	public String findIdByEmail(String email);
	
	public int changePW(MemberVO member);
	
	public int deleteMem(String userid);
	
	public int deleteMemAuth(String userid);
	
	public List<BoardVO> myPostGetList(Criteria cri);	//for my post
	
	public int getTotalMyPost(Criteria cri);
	
	public List<BoardVO> recentPostHome();
	
	public List<BoardVO> recentNotice();
	
}
