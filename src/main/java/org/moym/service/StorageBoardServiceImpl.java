package org.moym.service;

import java.util.List;

import org.moym.domain.BoardAttachVO;
import org.moym.domain.BoardVO;
import org.moym.domain.Criteria;

import org.moym.mapper.StorageBoardAttachMapper;
import org.moym.mapper.StorageBoardMapper;
import org.moym.mapper.StorageReplyMapper;
import org.moym.mapper.StorageRereplyMapper;
import org.moym.mapper.StorageThumbimgMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class StorageBoardServiceImpl implements StorageBoardService{
	
	@Setter(onMethod_ = @Autowired)
	private StorageBoardMapper mapper;			//memoByHwan  define mapper object
	
	@Setter(onMethod_ = @Autowired)
	private StorageBoardAttachMapper attachMapper;
	
	@Setter(onMethod_ = @Autowired)		//memoByHwan before u remove board, u need to delete reply fisrt!!!
	private StorageReplyMapper replyMapper;
	
	@Setter(onMethod_ = @Autowired)		//memoByHwan before u remove board, u need to delete reply fisrt!!!
	private StorageRereplyMapper rereplyMapper;
	
	@Setter(onMethod_ = @Autowired)		//memoByHwan before u remove board, u need to delete reply fisrt!!!
	private StorageThumbimgMapper thumbMapper;

	@Transactional
	@Override
	public void register(BoardVO board) {
		
		log.info("register...." + board);
		
		//board.setContent(board.getContent().replace("\r\n", "<br>"));
		
		//mapper.insert(board);
		mapper.insertSelectKey(board);
		
		
		//Thumb
		/*
		if(board.getThumbList() == null || board.getThumbList().size() <= 0) {
				return;
		}
		*/
		board.getThumbList().forEach(attach ->{
			attach.setBno(board.getBno());
			thumbMapper.insert(attach);
		});
		
		board.getBno();
		
		board.getThumbList().forEach(attach ->{
			attach.setBno(board.getBno());
			BoardAttachVO thmVo =thumbMapper.findByBno2(board.getBno());
			log.info("???????????? ???????????? ????????? ????????? ??????"+thmVo);
			
			//fileCallPath = encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid+"_"+obj.fileName);
			String tUploadPath, tUuid, tFileName;
			tUploadPath = thmVo.getUploadPath();
			tUuid = thmVo.getUuid();
			tFileName = thmVo.getFileName();
			
			String beforeEncoding = tUploadPath+"/"+tUuid+"_"+tFileName;
			
			try {
				String fileCallPath = URLEncoder.encode(beforeEncoding, "UTF-8");
				log.info("???????????????"+fileCallPath);//??? ?????? ?????? update??? ??????
				
				BoardVO finalVO = mapper.read(board.getBno());
				finalVO.setFileCallPath(fileCallPath);
				mapper.updateFileCallPath(finalVO);
				
				
				
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		});

		
		

		//attach
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		board.getAttachList().forEach(attach ->{
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
		
		
		

		
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
		thumbMapper.deleteAll(board.getBno());
		
		boolean modifyResult = mapper.update(board) == 1;
		
		if(modifyResult && board.getThumbList() != null && board.getThumbList().size() > 0) {
			
			board.getThumbList().forEach(attach -> {
				attach.setBno(board.getBno());
				thumbMapper.insert(attach);
			});
		}
		
		
		board.getBno();
		
		board.getThumbList().forEach(attach ->{
			attach.setBno(board.getBno());
			BoardAttachVO thmVo =thumbMapper.findByBno2(board.getBno());
			log.info("????????????  ????????? ????????? "+thmVo);
			
			//fileCallPath = encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid+"_"+obj.fileName);
			String tUploadPath, tUuid, tFileName;
			tUploadPath = thmVo.getUploadPath();
			tUuid = thmVo.getUuid();
			tFileName = thmVo.getFileName();
			
			String beforeEncoding = tUploadPath+"/"+tUuid+"_"+tFileName;
			
			try {
				String fileCallPath = URLEncoder.encode(beforeEncoding, "UTF-8");
				log.info("???????????????"+fileCallPath);//??? ?????? ?????? update??? ??????
				
				BoardVO finalVO = mapper.read(board.getBno());
				finalVO.setFileCallPath(fileCallPath);
				mapper.updateFileCallPath(finalVO);
				
				
				
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		});
		
		
		
		
		
		
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
		
		
		// Order of delete is important because of foreign key
		thumbMapper.deleteAll(bno);		
		attachMapper.deleteAll(bno);	//????????? ????????? ?????? ???????????? ??????
		rereplyMapper.deleteAll(bno);	//????????? ????????? ??????????????????..
		replyMapper.deleteAll(bno);		//????????? ????????? ?????? ?????? ??????.
		
		
		return mapper.delete(bno) == 1;	//????????? ??????.
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
	public List<BoardAttachVO> getThumbList(Long bno) {
		log.info("get thumb list by bno" + bno);
		return thumbMapper.findByBno(bno);
	}


	@Override
	public void updateViewCnt(Long bno) {
		mapper.updateViewCnt(bno);
		
	}


	@Override
	public void updateFileCallPath(BoardVO board) {
		mapper.updateFileCallPath(board);
		
	}


	
	
	
	
	

}
