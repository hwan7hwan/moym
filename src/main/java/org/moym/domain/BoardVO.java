package org.moym.domain;

import java.util.Date;
import java.util.List;
import lombok.Data;

@Data
public class BoardVO {

	private Long bno;
	private String title;
	private String content;
	private String writer;
	private String category;
	private String pageInfo;
	private Date regdate;
	private Date updateDate;
	
	private String ytlink;
	private String fileCallPath;
	private String quocon;
	private String quofrom;

	private int replyCnt;
	private int viewCnt;
	
	private List<BoardAttachVO> attachList;
	private List<BoardAttachVO> thumbList;
}
