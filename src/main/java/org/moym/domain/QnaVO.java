package org.moym.domain;

import java.util.Date;
import lombok.Data;

@Data
public class QnaVO {

	private Long qno;
	private String emailq;
	private String contentq;
	private String answerer;
	private String answer;
	private String chk;
	private Date regdate;
	private Date answerDate;
	
}
