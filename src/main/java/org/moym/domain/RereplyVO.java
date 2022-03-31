package org.moym.domain;

import java.util.Date;
import lombok.Data;

@Data
public class RereplyVO {

	private Long rrno;
	private Long rno;
	private Long bno;
	
	private String rereply;
	private String rereplyer;
	private Date rereplyDate;
	private Date updateDate;

}
