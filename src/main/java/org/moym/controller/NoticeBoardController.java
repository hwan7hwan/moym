package org.moym.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.moym.domain.BoardAttachVO;
import org.moym.domain.BoardVO;
import org.moym.domain.Criteria;
import org.moym.domain.PageDTO;
import org.moym.service.NoticeBoardService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/menu/*")	//memoByHwan basic route
@AllArgsConstructor
public class NoticeBoardController {
	
	private NoticeBoardService service;
	
	
	@GetMapping("/cafe/notice/list")		//memoByHwan  When URL is like that("/~~"), this method act
	public String list(Criteria cri, Model model) {
		log.info("list : " + cri);
		model.addAttribute("list", service.getList(cri));
		
		
		int total = service.getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	
		return "menu/cafe/notice/list";
	}
	
	
	@PostMapping("/cafe/notice/register")	//register action 
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')")
	public String register(BoardVO board, RedirectAttributes rttr) {
		
		log.info("==================================");
		
		log.info("register : " + board);
		
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		
		log.info("==================================");
		
		
		service.register(board);
		rttr.addFlashAttribute("result", "Success to write");
		
		return "redirect:/menu/cafe/notice/list";
		
	}
	
	@GetMapping("/cafe/notice/register") //To move to register page
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')")
	public void register() {
		
	}
	
	
	
	@GetMapping("/cafe/notice/get")
	public String get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model, 
			HttpServletResponse response, HttpServletRequest request) {
		
		// To use HttpServletResponse response in parameter, 
		//you should make the return type of the method to String and have to return same url with the mapping 'menu/cafe/notice/get' (But No '/' at first) 
		
		//cookie for provent unlimited increasement of viewCnt 
		 Cookie oldCookie = null;
		    Cookie[] cookies = request.getCookies();	//get cookie from request
		    if (cookies != null) {
		        for (Cookie cookie : cookies) {
		            if (cookie.getName().equals("viewForNotice")) {
		                oldCookie = cookie;
		            }
		        }
		    }

		    if (oldCookie != null) {						//If some cookies has exist already
		        if (!oldCookie.getValue().contains("[" + bno.toString() + "]")) {
		        	service.updateViewCnt(bno);
		            oldCookie.setValue(oldCookie.getValue() + "_[" + bno + "]");
		            oldCookie.setPath("/");
		            oldCookie.setMaxAge(60 * 60 * 1);
		            response.addCookie(oldCookie);		//send the cookie thought http response to web
		        }
		    } else {								//If some cookies hasn't exist before
		    	service.updateViewCnt(bno);			// update the viewCnt
		        Cookie newCookie = new Cookie("viewForNotice","[" + bno + "]");
		        newCookie.setPath("/");
		        newCookie.setMaxAge(60 * 60 * 1);//1hours //60 * 60 * 24 * 3 is 3days
		        response.addCookie(newCookie);
		    }
		
		
		log.info("/cafe/notice/get");
		model.addAttribute("board",service.get(bno));
		
		return "menu/cafe/notice/get";
	}
	
	
	
	
	@GetMapping("/cafe/notice/modify")
	public void getForModify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/cafe/notice/modify");
		model.addAttribute("board",service.get(bno));
	}
	
	
	@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/cafe/notice/modify")
	public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) {
		log.info("modify: " + board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("resultForMod", "Success to modify");
		}
		
		String bnoForParam = "&bno="+board.getBno();

		return "redirect:/menu/cafe/notice/get" +cri.getListLink()+ bnoForParam;
		//return "redirect:/menu/cafe/notice/list" + cri.getListLink(); // It's for heading to list page after modifying		
	
	}
	
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("delete attach files .......................");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			
			try {
				
				Path file = Paths.get("/upload/gallery/"+attach.getUploadPath()+"/"+attach.getUuid()+"_"+attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get("/upload/gallery/"+attach.getUploadPath()+"/s_"+attach.getUuid()+"_"+attach.getFileName());
					
					Files.delete(thumbNail);
					
				}
			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
				
			}
		});
		
	}
	
	
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/cafe/notice/remove")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr, String writer) {
		
		log.info("remove...." + bno);
		
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		
		if(service.remove(bno)) {
			
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "success to remove");
		}
		
		return "redirect:/menu/cafe/notice/list" + cri.getListLink();
	}
	
	
	
	@GetMapping(value="/cafe/notice/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		log.info("getAttachList" + bno);
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	
	
	
	
}
