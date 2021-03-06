package org.moym.service;

import java.util.List;

import org.moym.domain.BoardAttachVO;
import org.moym.domain.BoardVO;
import org.moym.domain.Criteria;
import org.moym.mapper.NoticeBoardAttachMapper;
import org.moym.mapper.NoticeBoardMapper;
import org.moym.mapper.NoticeReplyMapper;
import org.moym.mapper.NoticeRereplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeBoardServiceImpl implements NoticeBoardService{
	
	@Setter(onMethod_ = @Autowired)
	private NoticeBoardMapper mapper;			//memoByHwan  define mapper object
	
	@Setter(onMethod_ = @Autowired)
	private NoticeBoardAttachMapper attachMapper;
	
	@Setter(onMethod_ = @Autowired)		//memoByHwan before u remove board, u need to delete reply fisrt!!!
	private NoticeReplyMapper replyMapper;
	
	@Setter(onMethod_ = @Autowired)		//memoByHwan before u remove board, u need to delete reply fisrt!!!
	private NoticeRereplyMapper rereplyMapper;
	

	@Transactional
	@Override
	public void register(BoardVO board) {
		
		log.info("register...." + board);
		
		//board.setContent(board.getContent().replace("\r\n", "<br>"));
		
		//mapper.insert(board);
		mapper.insertSelectKey(board);

		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		
		log.info("비엔오 : " + board.getBno());
		
		board.getAttachList().forEach(attach ->{
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
		log.info("비엔오 어태치 쿼리 후 : " + board.getBno());
	}


	@Override
	public BoardVO get(Long bno) {
		
		log.info("get....." + bno);
		
		//mapper.updateViewCnt(bno);
		
		return mapper.read(bno);
	}

	@Transactional
	@Override
	public boolean modify(BoardVO board) {
		
		log.info("modify..." + board);
		
		attachMapper.deleteAll(board.getBno());	
		
		boolean modifyResult = mapper.update(board) == 1;
		
		if(modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {
			
			board.getAttachList().forEach(attach -> {
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}
		
		return modifyResult;
	}

	// remove board
	@Override
	public boolean remove(Long bno) {	//memoByHwan To remove a Board, U need to delete attach files and replies,	
												// Because of foreign key!!
		log.info("remove..." + bno);
		
		attachMapper.deleteAll(bno);	//게시글 지우기 전에 첨부파일 삭제
		rereplyMapper.deleteAll(bno);	//대댓글 지우고 댓글지워야함..
		replyMapper.deleteAll(bno);		//게시글 지우기 전에 댓글 삭제.
		
		
		return mapper.delete(bno) == 1;	//게시글 삭제.
	}

	/*
	@Override
	public List<BoardVO> getList() {
		
		log.info("getList.....");
		
		return mapper.getList();
	}
	*/
	
	@Override
	public List<BoardVO> getList(Criteria cri){
		log.info("get List With criteria : " + cri);
		return mapper.getListWithPaging(cri);
	}
	
	
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		
		log.info("get Attach list by bno" + bno);
		
		return attachMapper.findByBno(bno);
	}


	@Override
	public void updateViewCnt(Long bno) {
		mapper.updateViewCnt(bno);
		
	}
	
	
	
	

}
