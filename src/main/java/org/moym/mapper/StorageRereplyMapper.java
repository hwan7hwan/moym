package org.moym.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.moym.domain.Criteria;
import org.moym.domain.RereplyVO;

public interface StorageRereplyMapper {
	
public int insert(RereplyVO vo);	//Create	
	
	public RereplyVO read(Long rno); //Read
	
	public int delete(Long rrno);	//Delete
	
	public int update(RereplyVO rereply); //update
	
	public int getCountByRno(Long rno);
	
	public List<RereplyVO> getListWithPaging(	//for list to show
			@Param("cri") Criteria cri,
			@Param("rno") Long rno);	// Be cafeful!
	
	public int getTotalCount(Criteria cri);
	
	public void deleteAll(Long bno);//Delete all reply before delete a board	//when you remove board.
	
	public void deleteAllByRno(Long rno);

}
