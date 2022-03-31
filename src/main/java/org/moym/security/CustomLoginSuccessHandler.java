package org.moym.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	@Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, 
    	Authentication authentication) throws ServletException, IOException {
		
		log.warn("Login Success");
		
		//get role from query
		
		List<String> roleNames = new ArrayList<String>();
		
		authentication.getAuthorities().forEach(authority ->{
			
			roleNames.add(authority.getAuthority());
			
		});
		
		log.warn("ROLE NAMES: " + roleNames);
		
		
		
		//To move page back before login
        HttpSession session = request.getSession();
        if (session != null) {
            String redirectUrl = (String) session.getAttribute("prevPage");		//if you reload, redirectUrl becomes null
            
            String loginFailUrl1 = "http://localhost:8080/customLogin?error";	//you hava to chage when you use your domain
            String loginFailUrl2 = "http://localhost:8080/customLogin";
           
 
            if (redirectUrl != null) {				
            	
            	if(redirectUrl.equals(loginFailUrl1) || redirectUrl.equals(loginFailUrl2)) {
            		//super.onAuthenticationSuccess(request, response, authentication);
            		session.removeAttribute("prevPage");
            		log.info(redirectUrl);
                    getRedirectStrategy().sendRedirect(request, response, "/");
            	} else {
            		session.removeAttribute("prevPage");
                    getRedirectStrategy().sendRedirect(request, response, redirectUrl);
            	}
            	
                
            } else {
                super.onAuthenticationSuccess(request, response, authentication);
            }
        } else {
            super.onAuthenticationSuccess(request, response, authentication);
        }
        
        
        
    }//onAuthenticationSuccess
	
}
