package org.moym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.moym.domain.Criteria;
import org.moym.domain.ReplyVO;





public interface StorageReplyMapper {
	
	public int insert(ReplyVO vo);	//Create	
	
	public ReplyVO read(Long bno); //Read each to refer
	
	public int delete(Long rno);	//Delete
	
	public int update(ReplyVO reply); //update
	
	public List<ReplyVO> getListWithPaging(	//for list to show
		@Param("cri") Criteria cri,
		@Param("bno") Long bno);
	
	public int getCountByBno(Long bno);
	
	public void deleteAll(Long bno);//Delete all reply before delete a board
	
	public int getTotalCount(Criteria cri);

	public void updateRereplyCnt(@Param("rno") Long rno, @Param("amount") int amount);
	
	
}
