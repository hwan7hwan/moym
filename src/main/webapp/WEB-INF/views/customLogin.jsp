<%@include file="/WEB-INF/views/includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="java.util.*" %>

<!-- --------------------------------------   memoByHwan  Cut here for Header   --------------------------------------   -->
 
    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs overlay loginPageImaHwan">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">Login</h1>
                    </div>
                    <ul class="breadcrumb-nav">
                        <li><a href="../index.html">Home</a></li>
                        <li><a href="account_register.html" class="noMargin">Create an Account</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
    
    
    

    <!-- start login section -->
    <section class="login section">  
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-12">
                    <div class="form-head">
                        <h4 class="title">Login</h4> <h4 class="loginErrorEditH"><c:out value="${error}"/></h4>
                        <!-- action /login -->
                        <form id="login_form_cusH" method="post">
                        <fieldset>
                            <div class="form-group">
                                <label>Username or email</label>
                                <input class="margin-5px-bottom" name="username" type="text" placeholder="Username or email" autofocus>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input class="margin-5px-bottom" name="password" type="password"  placeholder="Password" value="">
                            </div>
                            
                            <div class="check-and-pass">
                                <div class="row align-items-center">
                                    <div class="col-lg-6 col-12">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input width-auto" name="remember-me">
                                            <label class="form-check-label">Remember me</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <a href="/member/forgotAccount" class="lost-pass">Lost your password?</a>
                                    </div>
                                </div>
                            </div>
                            <div class="button login_btn_cusH">
                            	<div class='btn'>
                            		<span>Sign In</span>
                            	</div>
                            </div>
                            <!-- 
                            <div class="button">
                            	<button type="submit" class="btn signinHH">Sign in</button>
                            </div>
                             -->
                            <p class="outer-link">Don't have an account? <a href="/member/createAccount">Register here</a></p>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            </fieldset>
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end login section -->








    
<!-- --------------------------------------   memoByHwan  Cut here for Footer   --------------------------------------   -->
<c:if test="${param.logout !=null}">
		<script>
			$(document).ready(function(){
				history.back();	//to keep the page u were
			});


		</script>
</c:if>
	
<script>
$(document).ready(function(){
	
	
	$(".login_btn_cusH").click(function(){
		$("#login_form_cusH").attr("action", "/login");
		$("#login_form_cusH").submit();
	});
	
});

</script>
	

<%@include file="/WEB-INF/views/includes/footer.jsp" %>