package org.moym.mapper;

import java.util.List;

import org.moym.domain.BoardAttachVO;

public interface StudioBoardAttachMapper {
	
	public void insert(BoardAttachVO vo);
	public void delete(String uuid);
	public List<BoardAttachVO> findByBno(Long bno);
	public void deleteAll(Long bno);
	
	public List<BoardAttachVO> getOldFiles();
	
}
