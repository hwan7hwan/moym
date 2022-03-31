package org.moym.domain;

import lombok.Data;

@Data
public class ThumbFileDTO {
	
	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;

}
