package org.moym.service;

import java.util.List;

import org.moym.domain.Criteria;
import org.moym.domain.ReplyPageDTO;
import org.moym.domain.ReplyVO;

import org.moym.mapper.StorageBoardMapper;
import org.moym.mapper.StorageReplyMapper;
import org.moym.mapper.StorageRereplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class StorageReplyServiceImpl implements StorageReplyService{

	@Setter(onMethod_ = @Autowired)
	private StorageReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private StorageBoardMapper boardMapper;
	
	@Setter(onMethod_ = @Autowired)
	private StorageRereplyMapper rereplyMapper;
	
	@Transactional
	@Override
	public int register(ReplyVO vo) {

		log.info("register....." + vo);
		
		boardMapper.updateReplyCnt(vo.getBno(), 1);

		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		
		log.info("get...." + rno);
		
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("modify...." + vo);
		
		return mapper.update(vo);
	}

	
	@Transactional
	@Override
	public int remove(Long rno) {

		log.info("remove......" + rno);
		
		ReplyVO vo = mapper.read(rno);					// 댓글 총갯수 줄이기 위함..
		boardMapper.updateReplyCnt(vo.getBno(), -1);	// 댓글 총갯수 줄이기 위함..
		
		
		
		
		rereplyMapper.deleteAllByRno(rno);
		
		
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {

		log.info("get Reply List of a Board " + bno);
		
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		
		return new ReplyPageDTO(mapper.getCountByBno(bno), mapper.getListWithPaging(cri, bno));
	}

	
	
	
	
	
	
}
