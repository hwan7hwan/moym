package org.moym.mapper;

import java.util.List;


import org.moym.domain.Criteria;
import org.moym.domain.QnaVO;

public interface ManagerMapper {
	
	public QnaVO read(Long bno);
	
	public void insertQnA(QnaVO qna);
	
	public int answerQnA(QnaVO qna);
		
	public int deleteQnA(Long qno);

	public List<QnaVO> readQnA(Criteria cri);	
	
	public int getTotalCntQnA(Criteria cri);
	
}
