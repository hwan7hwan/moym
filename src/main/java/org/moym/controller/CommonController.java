package org.moym.controller;


import java.security.Principal;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.moym.domain.BoardAttachVO;
import org.moym.domain.BoardVO;
import org.moym.domain.Criteria;
import org.moym.domain.PageDTO;
import org.moym.domain.QnaVO;
import org.moym.mapper.ManagerMapper;
import org.moym.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@Log4j
public class CommonController {
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		
		log.info("access Denied : " + auth);
		
		model.addAttribute("msg", "You do not have sufficient permissions to access this page.");
	}
	
	
	@GetMapping("/customLogin")
	public String loginInput(String error, String logout, Model model, HttpServletRequest request) {
		
		log.info("error : " + error);
		log.info("logout : " + logout);
		
		if (error != null) {
			model.addAttribute("error", "Check your account again!!");
		}
		if (logout != null) {
			model.addAttribute("logout", "Logout!!!");
				
		}
		
		
		String referrer = request.getHeader("Referer");
	    request.getSession().setAttribute("prevPage", referrer);
	    return "customLogin";
		
		
	} 
	
	@GetMapping("/menu/moym/aboutMoym")
	public void aboutMoym() {
		log.info("about Moym page");
	}
	
	
	@PostMapping("/qnaSend")
	public String qnaSend(QnaVO qna, RedirectAttributes rttr,HttpServletRequest request) {
		log.info("질문사항 : " + qna);
		
		managerService.register(qna);
		rttr.addFlashAttribute("resultQna", "Success to send question");
		log.info("유알엘 : " + request.getRequestURI());
		return "redirect:/member/createAccount";
	}
	
	
	@GetMapping("/member/manageQnA")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')")
	public String getQnAList(Criteria cri,Model model,Principal principal) {
		
		
		
		
		model.addAttribute("list", managerService.getList(cri));
		
		int total = managerService.getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));  
		 
		return "member/manageQnA";
	}
	
	@GetMapping("/member/manageQnAAnswer")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')")
	public void getForModify(@RequestParam("qno") Long qno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("QnA Answer Page");
		model.addAttribute("board",managerService.get(qno));
	}
	
	@PostMapping("/member/manageQnAAnswer")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')")
	public String answer(QnaVO qna, Criteria cri, RedirectAttributes rttr) {
		
		
		if(managerService.answer(qna)) {
			rttr.addFlashAttribute("result", "Success to Answer");
		}
		
		/* Send email */
        String setForm = "khyeonghwan@gmail.com";
        String toMail = qna.getEmailq();
        String title = "Thank you for visiting MOYM. This is the answer to your question.";
        String content = "Thank you for visiting MOYM. Thoes are your question and our answer.<br><br> "
        				+"[Question] <br>"
        				+qna.getContentq() +"<br><br>"
        				+"[Answer] <br>"
        				+qna.getAnswer() +"<br><br>";
						
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
		
		
		String bnoForParam = "&qno="+qna.getQno();

		return "redirect:/member/manageQnA" +cri.getListLink()+ bnoForParam;	
	
	}
	
	@PostMapping("/member/remove")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')")
	public String remove(@RequestParam("qno") Long qno, Criteria cri, RedirectAttributes rttr) {
		
		
		
		if(managerService.remove(qno)) {
			
			rttr.addFlashAttribute("result", "success to remove");
		}
		
		return "redirect:/member/manageQnA" + cri.getListLink();
	}
	
	@PostMapping("/member/removeChosen")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')")
	public String ajaxTest(HttpServletRequest request) throws Exception {
        
        String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	Long qnoC;
        	qnoC = Long.parseLong(ajaxMsg[i]);
        	managerService.remove(qnoC);
        }
        return "redirect:/member/manageQnA";
    }
	
	

}
