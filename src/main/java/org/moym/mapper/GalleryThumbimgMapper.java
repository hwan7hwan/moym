package org.moym.mapper;

import java.util.List;

import org.moym.domain.BoardAttachVO;

public interface GalleryThumbimgMapper {
	
	public void insert(BoardAttachVO vo);
	public void delete(String uuid);
	public List<BoardAttachVO> findByBno(Long bno);
	public void deleteAll(Long bno);
	public BoardAttachVO findByBno2(Long bno);// it's for encoing and put in the gallery table
	public List<BoardAttachVO> getOldFiles();
	
}
