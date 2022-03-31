package org.moym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.moym.domain.BoardVO;
import org.moym.domain.Criteria;

public interface StudioBoardMapper {
	
	//@Select("select * from tbl_board where bno > 0")
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);
	
	
	public int getTotalCount(Criteria cri);

	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
	public void updateViewCnt(Long bno);
	
	public void updateFileCallPath(BoardVO board);
	
}
