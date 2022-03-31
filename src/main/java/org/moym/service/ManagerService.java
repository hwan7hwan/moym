package org.moym.service;

import java.util.List;

import org.moym.domain.Criteria;
import org.moym.domain.QnaVO;


public interface ManagerService {
	
	
	
	public void register(QnaVO qna);
	
	public QnaVO get(Long qno);
	
	public boolean answer(QnaVO qna);
	
	public boolean remove(Long qno);
	
	public List<QnaVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	

}
