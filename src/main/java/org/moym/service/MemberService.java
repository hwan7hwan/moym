package org.moym.service;



import java.util.List;

import org.moym.domain.BoardVO;
import org.moym.domain.Criteria;
import org.moym.domain.MemberVO;


public interface MemberService {
	
	//Create New Account
	public void insert(MemberVO member);
	
	public int idCheck(String userid);
	
	public int emailChk(String email);
	
	public String findIdByEmail(String email);
	
	public boolean changePW(MemberVO member);
	
	public MemberVO get(String userid);
	
	public boolean remove(String userid);

	public List<BoardVO> myPostGetList(Criteria cri);
	
	public int getTotalMyPostCnt(Criteria cri);

	public List<BoardVO> recentPostHome();
	
	public List<BoardVO> recentNotice();
	
}
