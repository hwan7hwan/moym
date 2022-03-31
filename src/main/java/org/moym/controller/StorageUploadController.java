package org.moym.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.moym.domain.AttachFileDTO;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;


@Controller
@Log4j
public class StorageUploadController {
	
	@GetMapping("/storageUploadForm")
	public void uploadForm() {
		log.info("upload form");
	}	
	
	@PostMapping("/storageUploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		
		String uploadFolder = "C:\\upload\\storage";
		
		for (MultipartFile multipartFile : uploadFile) {
			
			log.info("-----------------------------------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}//end catch 
		}//end for
		
	}
	
	@GetMapping("/storageUploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}
	
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	

	
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
			
		} catch (IOException e) {
			// TODO: Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/storageUploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload\\storage";
		
		String uploadFolderPath = getFolder();
		
		//make folder ------------
		
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		//make yyyy/MM/dd folder

		for (MultipartFile multipartFile : uploadFile) {
			
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			
			//IE has file path
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			
			log.info("only file name: " + uploadFileName);
			attachDTO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				// check image type file 
				if (checkImageType(saveFile)) {
					
					attachDTO.setImage(true);
					
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail,100,100);
					
					thumbnail.close();
				}
				//add to List
				list.add(attachDTO);
				
				
			} catch (Exception e) {
				e.printStackTrace();
			} // end catch
		} // end for
		return new ResponseEntity<>(list,HttpStatus.OK);
		
		
	}
	
	@GetMapping("/storageDisplay")
		@ResponseBody
		public ResponseEntity<byte[]> getFile(String fileName){
			
			log.info("fileName: " + fileName);
			
			File file = new File("c:\\upload\\storage\\" + fileName);
			
			log.info("file: " + file);
			
			ResponseEntity<byte[]> result = null;
			
			try {
				HttpHeaders headers = new HttpHeaders();
				
				headers.add("Content-Type", Files.probeContentType(file.toPath()));
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),headers,HttpStatus.OK);
				
			} catch (IOException e) {
				// TODO: Auto-generated catch block
				e.printStackTrace();
			}
			return result;
			
			
		}
		
		@GetMapping(value = "/storageDownload", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
		@ResponseBody
		public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName){
			
			
			Resource resource = new FileSystemResource("c:\\upload\\storage\\" + fileName);
			
			if(resource.exists() == false) {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			
			String resourceName = resource.getFilename();
			
			//remove UIDD
			String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
			
			
			HttpHeaders headers = new HttpHeaders();
			
			try {
				
				String downloadName = null;
				
				if(userAgent.contains("Trident")) {
					log.info("IE browser");
					
					downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");
				
				} else if(userAgent.contains("Edge")) {
					
					log.info("Edge browser");
					
					downloadName = URLEncoder.encode(resourceOriginalName,"UTF-8");
					
					log.info("Edge name: " + downloadName);
					
				}else {
					log.info("chrome browser");
					downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
				}
				
				log.info("downloadName : " + downloadName);
				headers.add("Content-Disposition", "attachment; filename=" + downloadName);
				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				
			}
			
			
			return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
			
		}
		
		@PreAuthorize("isAuthenticated()")
		@PostMapping("/storageDeleteFile")
		@ResponseBody
		public ResponseEntity<String> deleteFile(String fileName, String type){
			
			log.info("deleteFile: " + fileName);
			
			File file;
			
			try {
				file = new File("c:\\upload\\storage\\" + URLDecoder.decode(fileName,"UTF-8"));
				file.delete();
				
				if(type.equals("image")) {
					
					String largeFileName = file.getAbsolutePath().replace("s_", "");
					
					log.info("largeFileName: " + largeFileName);
					
					file = new File(largeFileName);
					
					file.delete();
					
				}
				
				
				
				
			} catch (UnsupportedEncodingException e) {
				// TODO: handle exception
				e.printStackTrace();
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
			
			
			
		}
		
		
		
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}