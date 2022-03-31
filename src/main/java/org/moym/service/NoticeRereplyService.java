package org.moym.service;

import java.util.List;

import org.moym.domain.Criteria;
import org.moym.domain.RereplyPageDTO;
import org.moym.domain.RereplyVO;


public interface NoticeRereplyService {
	
	/**/
	public int register(RereplyVO vo);

	public RereplyVO get(Long rrno);

	public int modify(RereplyVO vo);

	public int remove(Long rrno);

	public List<RereplyVO> getList(Criteria cri, Long rno);
	
	public RereplyPageDTO getListPage(Criteria cri, Long rno);

}
