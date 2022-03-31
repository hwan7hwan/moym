package org.moym.service;

import java.util.List;

import org.moym.domain.BoardAttachVO;
import org.moym.domain.BoardVO;
import org.moym.domain.Criteria;


public interface StudioBoardService {
	
	public void register(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
	//public List<BoardVO> getList();
	
	public List<BoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public List<BoardAttachVO> getAttachList(Long bno);
	
	public List<BoardAttachVO> getThumbList(Long bno);
	
	public void updateViewCnt(Long bno);
	
	public void updateFileCallPath(BoardVO board);
	

}
