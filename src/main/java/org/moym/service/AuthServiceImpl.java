package org.moym.service;

import org.moym.domain.AuthVO;
import org.moym.mapper.AuthMapper;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class AuthServiceImpl implements AuthService{
	
	
	
	@Setter(onMethod_ = @Autowired)	//  this one make this service inject to Controller!!! 서비스 객체를 컨트롤러에 자동주입
	private AuthMapper authMapper;	
	
	@Override
	public void insert(AuthVO auth) {
		
		log.info("create...." + auth);
		authMapper.insert(auth);
		
	}
	

}
