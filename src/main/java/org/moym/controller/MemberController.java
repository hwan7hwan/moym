package org.moym.controller;



import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.moym.domain.AuthVO;
import org.moym.domain.BoardAttachVO;
import org.moym.domain.Criteria;
import org.moym.domain.MemberVO;
import org.moym.domain.PageDTO;
import org.moym.service.AuthService;
import org.moym.service.BoardService;
import org.moym.service.GalleryBoardService;
import org.moym.service.MemberService;
import org.moym.service.NoticeBoardService;
import org.moym.service.StorageBoardService;
import org.moym.service.StudioBoardService;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/member/*")	//memoByHwan basic route
@AllArgsConstructor
public class MemberController {
	
	private MemberService memberService; // It's injected by MemberserviceImpl
	private AuthService authService; // It's from AuthServiceImpl
	//asd
	private BoardService chatService;
	private NoticeBoardService noticeService;
	private StorageBoardService storageService;
	private StudioBoardService studioService;
	private GalleryBoardService galleryService;
	
		

	
	//@Autowired
    private JavaMailSender mailSender;  //for dependency injection
    
  
	
	@GetMapping("/createAccount")	//memoByHwan cafe page connect
	public void goToPage() {
		log.info("go to signup page");
	}
	
	
	@PostMapping("/createAccount")	//register action
	public String createAccount(MemberVO member, AuthVO auth, RedirectAttributes rttr) {
		
		memberService.insert(member);
		authService.insert(auth);
		
		rttr.addFlashAttribute("result", "Congratulation to join us!");
		
		log.info("create : " + member);
		log.info("create : " + auth);
		return "redirect:/"; // I changed return type to void
	}
	
	@PostMapping("/memberIdChk")
	@ResponseBody
	public String memberIdChkPOST(String userid) {		//ID duplication Check
		
		int result = memberService.idCheck(userid);
		
		log.info("result = " + result);
		
		if(result != 0) {
			return "fail";	// duplication
		} else {
			return "success";	// No duplication
		}
	}
	
	@PostMapping("/emailChk")
	@ResponseBody
	public String emailChkPOST(String email) {		//ID duplication Check
		
		int result = memberService.emailChk(email);
		
		log.info("result = " + result);
		
		if(result != 0) {
			return "fail";	// duplication
		} else {
			return "success";	// No duplication
		}
	}
	
	@PostMapping("/idMatchChk")
	@ResponseBody
	public String idMatchChkPOST(String email, String userid) {		//ID Match Check 
		
		String idFromBack = memberService.findIdByEmail(email);
		
		String idFromFront = userid;
		
		log.info("id in DB = " + idFromBack);
		log.info("id in Web = " + idFromFront);
		
		
		
		if(idFromBack.equals(idFromFront)) {
			return "success";	// match
		} else {
			return "fail";	// not match
		}
	}
	
	
	
	/*Certifying email*/
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheckGET(String email) {
        
        /* check data from view */
        log.info("Send the number to this email : " + email);
                
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        log.info("Certification number " + checkNum);
        
        
        /* Send email */
        String setForm = "khyeonghwan@gmail.com";
        String toMail = email;
        String title = "This is email for certifying to register new account";
        String content = 
                "Thank you for visiting MOYM" +
                "<br><br>" + 
                "The certification number is " + checkNum  + 
                "<br>" + 
                "Please type this number on the blank";
        

        //It's for sending email
        try {    
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setForm);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
        
    }
	
	
	
	
	/*Certifying email for forgotAccount*/
	@GetMapping("/mailCheckFgAcc")
	@ResponseBody
	public String mailCheckGETFgAcc(String email) {
        
        /* check data from view */
        log.info("To this email : " + email);
                
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        log.info("Certication number " + checkNum);
        
        /*find ID by email*/
        
        String idByEmail;
        idByEmail = memberService.findIdByEmail(email);

        
        /* Send email */
        String setForm = "khyeonghwan@gmail.com";
        String toMail = email;
        String title = "Welcome to MOYM. This email is to confirm ID and Password.";
        String content = 
                "Thank you for visiting MOYM" +
                "<br><br>" + 
                "Your ID :" + idByEmail +
                "<br><br>" + 
                "If you remember your password, go to sign in page. " + 
                "<br><br>" + 
                "If you don't remember password, type the following number and change your password on the page" + 
                "<br><br>" + 
                "The certification number : " + checkNum  + 
                "<br>";
        
        
        //It's for sending email
        try {    
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setForm);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
        
    }
	
	/*Certifying email for forgotAccount*/
	@GetMapping("/mailChkForChgPw")
	@ResponseBody
	public String mailChkForChgPw(String email) {
        
        /* check data from view */
        log.info("email to send : " + email);
                
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        log.info("certification number " + checkNum);
        
        /*find ID by email*/
        
        String idByEmail;
        idByEmail = memberService.findIdByEmail(email);

        
        /* Send email */
        String setForm = "khyeonghwan@gmail.com";
        String toMail = email;
        String title = "Welcome to MOYM. This email is for change Password.";
        String content = 
                "Thank you for visiting MOYM" +
                "<br><br>" + 
                "Please type the following number on the blank" + 
                "<br><br>" + 
                "The certification number : " + checkNum  + 
                "<br>";
        
        
        //It's for sending email
        try {    
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setForm);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
        
    }
	
	
	
	@GetMapping("/forgotAccount")
	public void goToForgotAccount() {
		log.info("go to forgotAccount page");
	}
	
	
	@PostMapping("/forgotAccount")
	public String changePW(MemberVO member, RedirectAttributes rttr) {
		
		log.info("change Password : " + member);
		
		if(memberService.changePW(member)) {
			rttr.addFlashAttribute("result", "Success to change password.");
		}
		
		
		return "redirect:/";
	}
	
	
	@GetMapping("/myPageAccount")
	@PreAuthorize("isAuthenticated()")
	public void goToMyPageAccount(Principal principal, Model model) {
		
		log.info("move to myPageAccount");
	
		String idOnSession = principal.getName();
		
		log.info("ID on Session right now : " + idOnSession);
		
		model.addAttribute("memberInfo", memberService.get(idOnSession));
		
		
	}
	
	
	@GetMapping("/myPageChangePW")
	@PreAuthorize("isAuthenticated()")
	public void goToMyPageChangePW(Principal principal, Model model) {
		
		log.info("move to myPageChangePW");
		String idOnSession = principal.getName();
		
		log.info("ID on Session rigt now : " + idOnSession);
		
		model.addAttribute("memberInfo", memberService.get(idOnSession));

	}
	

	@PostMapping("/myPageChangePW")
	@PreAuthorize("isAuthenticated()")
	public String myPagechangePW(MemberVO member, RedirectAttributes rttr) {
		
		if(memberService.changePW(member)) {
			rttr.addFlashAttribute("result", "Success to change password");
			log.info("Password changed");
		}
		
		return "redirect:/member/myPageAccount";
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/deleteAcc")
	public String remove(RedirectAttributes rttr, Principal principal) {
		
		log.info("delete account");
		
		String idOnSession = principal.getName();
		
		MemberVO member = memberService.get(idOnSession);
		
		log.info("Info about Account to delete : " + member);
		
		if(memberService.remove(idOnSession)) {
			rttr.addFlashAttribute("result", "Success to delete account. Thank you for supporting us.");
			SecurityContextHolder.clearContext();		// sign out after delete account
		}
		
		
		return "redirect:/";
	}
	
	
	@GetMapping("/myPost")
	public String getPostList(Criteria cri,Model model,Principal principal) {
		

		
		String idSignedOn = principal.getName();
		
		log.info("로그인된 아이디 : " + idSignedOn);		
		
		cri.setWriter(idSignedOn);

		
		model.addAttribute("list", memberService.myPostGetList(cri));
		
		int total = memberService.getTotalMyPostCnt(cri);
		log.info("total: " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		
		
		return "member/myPost";
	}
	
	
	private void deleteFiles(List<BoardAttachVO> attachList,String dlPath) {
		
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("delete attach files .......................");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			
			try {
				
				Path file = Paths.get(dlPath+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get(dlPath+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
					
					Files.delete(thumbNail);
					
				}
			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
				
			}
		});
		
	}
	
	private void deleteFilesTh(List<BoardAttachVO> thumbList,String dlThPath) {
		
		if(thumbList == null || thumbList.size() == 0) {
			return;
		}
		
		log.info("delete Thumb files .......................");
		log.info(thumbList);
		
		thumbList.forEach(attach -> {
			
			try {
				
				Path file = Paths.get(dlThPath+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get(dlThPath+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
					
					Files.delete(thumbNail);
					
				}
			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
				
			}
		});
		
	}
	
	
	//asd
	@PostMapping("/member/removeChosenMP")
	public String ajaxTest(HttpServletRequest request,RedirectAttributes rttr) throws Exception {
        
        String[] ajaxMsg = request.getParameterValues("valueArr");
        String[] ajaxMsgP = request.getParameterValues("valueArrP");
        
        String chatDl = "C:\\upload\\";
        String noticeDl = "C:\\upload\\notice\\";
        String galleryDl = "C:\\upload\\gallery\\";
        String galleryDlTh = "C:\\upload\\gallery\\thumbn\\";
        String studioDl = "C:\\upload\\studio\\";
        String studioDlTh = "C:\\upload\\studio\\thumbn\\";
        String storageDl = "C:\\upload\\storage\\";
        String storageDlTh = "C:\\upload\\storage\\thumbn\\";
        
        
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	
        	
        	Long qnoC = Long.parseLong(ajaxMsg[i]);
        	String pageC = ajaxMsgP[i];
        	log.info("여기까지"+ajaxMsgP[i]);
        	if(pageC.equals("chat")) {
        		List<BoardAttachVO> attachList = chatService.getAttachList(qnoC);
        		
        		if(chatService.remove(qnoC)) {
        			deleteFiles(attachList,chatDl);
        			rttr.addFlashAttribute("result", "success to remove");
        		}
        		
        	} else if(pageC.equals("notice")) {
        		List<BoardAttachVO> attachList = noticeService.getAttachList(qnoC);
        		
        		if(noticeService.remove(qnoC)) {
        			deleteFiles(attachList,noticeDl);
        			rttr.addFlashAttribute("result", "success to remove");
        		}
        	} else if(pageC.equals("studio")) {
        		List<BoardAttachVO> thumbList = studioService.getThumbList(qnoC);
        		List<BoardAttachVO> attachList = studioService.getAttachList(qnoC);
        		
        		if(studioService.remove(qnoC)) {
        			deleteFilesTh(thumbList,studioDlTh);
        			deleteFiles(attachList,studioDl);
        			
        			rttr.addFlashAttribute("result", "success to remove");
        		}
        		
        	} else if(pageC.equals("storage")) {
        		List<BoardAttachVO> thumbList = storageService.getThumbList(qnoC);
        		List<BoardAttachVO> attachList = storageService.getAttachList(qnoC);
        		
        		if(storageService.remove(qnoC)) {
        			deleteFilesTh(thumbList,storageDlTh);
        			deleteFiles(attachList,storageDl);
        			
        			rttr.addFlashAttribute("result", "success to remove");
        		}
        		
        	} else if(pageC.equals("gallery")) {
        		List<BoardAttachVO> thumbList = galleryService.getThumbList(qnoC);
        		List<BoardAttachVO> attachList = galleryService.getAttachList(qnoC);
        		
        		if(galleryService.remove(qnoC)) {
        			deleteFilesTh(thumbList,galleryDlTh);
        			deleteFiles(attachList,galleryDl);
        			
        			rttr.addFlashAttribute("result", "success to remove");
        		}
        	}
        	
        	//managerService.remove(qnoC);
        }
        return "redirect:/member/myPost";
    }
	
	
	
	
}//MemberController end
