package org.moym.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;



public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	
    private RequestCache requestCache = new HttpSessionRequestCache();
    private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();

    
    private String loginidname;
    private String defaultUrl;
 
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
    	
    	
    	resultRedirectStrategy(request, response, authentication);
    }
    
    
    
    protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        
        SavedRequest savedRequest = requestCache.getRequest(request, response);
        
        if(savedRequest!=null) {	//세션에 이동할 url의 정보가 담겨져 있을때 즉, 인증 권한이 필요한 페이지에 접근했을 경우를 뜻한다.
            String targetUrl = savedRequest.getRedirectUrl();	//savedRequest 객체를 통해 getRedirectUrl (로그인화면을 보기 전에 갔던 url)을 가져온다.
            redirectStratgy.sendRedirect(request, response, targetUrl);
        } else {														//직접 로그인 화면으로 이동했을 경우를 뜻한다.
            redirectStratgy.sendRedirect(request, response, defaultUrl);	//화면 이동을 위해 redirectStratgy 의 sendRedirect 를 재정의 각각에 알맞은 url 정보를 넣어주면 된다.
        }
        
    }
    
    
    public String getLoginidname() {
        return loginidname;
    }
 
    public void setLoginidname(String loginidname) {
        this.loginidname = loginidname;
    }
 
    public String getDefaultUrl() {
        return defaultUrl;
    }
 
    public void setDefaultUrl(String defaultUrl) {
        this.defaultUrl = defaultUrl;
    }
     
}