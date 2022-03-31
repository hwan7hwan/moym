package org.moym.service;

import java.util.List;

import org.moym.domain.Criteria;
import org.moym.domain.RereplyPageDTO;
import org.moym.domain.RereplyVO;

import org.moym.mapper.GalleryBoardMapper;
import org.moym.mapper.GalleryReplyMapper;
import org.moym.mapper.GalleryRereplyMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class GalleryRereplyServiceImpl implements GalleryRereplyService{
	
	
	@Setter(onMethod_ = @Autowired)
	private GalleryReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private GalleryBoardMapper boardMapper;
	
	@Setter(onMethod_ = @Autowired)
	private GalleryRereplyMapper rereplyMapper;
	
	
	@Transactional
	@Override
	public int register(RereplyVO vo) {
		
		log.info("register..... rereply" + vo);
		
		mapper.updateRereplyCnt(vo.getRno(), 1);   
		
		return rereplyMapper.insert(vo);
	}

	@Override
	public RereplyVO get(Long rrno) {
		log.info("get....rereply" + rrno);
		
		return rereplyMapper.read(rrno);
	}

	@Override
	public int modify(RereplyVO vo) {
		
		log.info("modify....rereply" + vo);
		
		return rereplyMapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(Long rrno) {
		
		log.info("remove......rereply" + rrno);
		
		RereplyVO vo = rereplyMapper.read(rrno);
		
		mapper.updateRereplyCnt(vo.getRno(), -1); 
		
		return rereplyMapper.delete(rrno);
	}

	@Override
	public List<RereplyVO> getList(Criteria cri, Long rno) { 
		
		log.info("get Reply List of a Board " + rno);
		
		return rereplyMapper.getListWithPaging(cri, rno);
	}

	@Override
	public RereplyPageDTO getListPage(Criteria cri, Long rno) {
		
		return new RereplyPageDTO(rereplyMapper.getCountByRno(rno), rereplyMapper.getListWithPaging(cri, rno));
	}

}
