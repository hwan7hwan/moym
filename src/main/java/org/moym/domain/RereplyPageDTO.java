package org.moym.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;


@Data
@AllArgsConstructor
@Getter
public class RereplyPageDTO {
	
	private int rereplyCnt;
	private List<RereplyVO> list;  
	

}
