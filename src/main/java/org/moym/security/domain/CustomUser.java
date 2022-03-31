package org.moym.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.moym.domain.MemberVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;


@Getter
public class CustomUser extends User{
	
	private static final long serialVersionUID = 1L;
	
	private MemberVO member;
	
	//memoByHwan Originally, User Class has just three(username, password, and authorities). 
	//			  But if you want to add more, You have to put them below here!!!!
	
	private String job;

	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		
	}
	
	public CustomUser(MemberVO vo) {
		
		super(vo.getUserid(), vo.getUserpw(), vo.getAuthList().stream().map(auth-> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		
		this.member = vo;
		
		
		
	}
	

}
