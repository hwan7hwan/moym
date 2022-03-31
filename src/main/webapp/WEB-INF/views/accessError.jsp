<%@include file="/WEB-INF/views/includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="java.util.*" %>

<!-- --------------------------------------   memoByHwan  Cut here for Header   --------------------------------------   -->



<section class="login section">  
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-12">
                    <div class="form-head">
                        <h4 class="title"><c:out value="${msg}"/></h4>
                        <h4 class="title"><c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"/></h4>
                        <!-- action /login -->
                        <form id="login_form_cusH" method="post">
                        <fieldset>
                            
                            <div class="button login_btn_cusH goBackPP">
                            	<div class='btn'>
                            		<span>Go back to previous page</span>
                            	</div>
                            </div>
                            </fieldset>
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>


<!-- --------------------------------------   memoByHwan  Cut here for Footer   --------------------------------------   -->
<script>
$(document).ready(function(){
	
	
	$(".goBackPP").click(function(){
		history.back();
	});
	
});

</script>
<%@include file="/WEB-INF/views/includes/footer.jsp" %>