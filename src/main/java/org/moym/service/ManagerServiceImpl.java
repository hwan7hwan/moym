package org.moym.service;

import java.util.List;

import org.moym.domain.QnaVO;
import org.moym.domain.Criteria;
import org.moym.mapper.ManagerMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ManagerServiceImpl implements ManagerService{
	
	
	@Setter(onMethod_ = @Autowired)		
	private ManagerMapper managerMapper;
	

	@Transactional
	@Override
	public void register(QnaVO qna) {
		
		log.info("register...." + qna);
		
		managerMapper.insertQnA(qna);
		
	}


	@Override
	public QnaVO get(Long qno) {
		
		log.info("get....." + qno);
		
		
		return managerMapper.read(qno);
	}

	@Transactional
	@Override
	public boolean answer(QnaVO qna) {
		
		log.info("answer..." + qna);
		
		
		boolean modifyResult = managerMapper.answerQnA(qna) == 1;
		
		
		return modifyResult;
	}

	// remove board
	@Override
	public boolean remove(Long qno) {	//memoByHwan To remove a Board, U need to delete attach files and replies,	
												// Because of foreign key!!
		log.info("remove..." + qno);
		
		
		
		return managerMapper.deleteQnA(qno) == 1;	//게시글 삭제.
	}

	
	@Override
	public List<QnaVO> getList(Criteria cri){
		log.info("get List With criteria : " + cri);
		return managerMapper.readQnA(cri);
	}
	
	
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return managerMapper.getTotalCntQnA(cri);
	}
	

}
