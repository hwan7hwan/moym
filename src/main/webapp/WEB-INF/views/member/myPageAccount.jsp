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
                        <h1 class="page-title">My Page</h1>
                    </div>
                    <ul class="breadcrumb-nav">
                        <li><a href="/">Home</a></li>
                        <li><a href="/member/myPost" class="noMargin">My Post</a></li>
                        <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')">
                        	<li><a href="/member/manageQnA" class="lastMargin">Manage Q&A</a></li>
                        </sec:authorize>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
    
    
    <!--  myPage Account -->
    <section class="login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-12">
                    <div class="form-head">
                        <h4 class="title">My Account</h4>
                        
                        <form id="sendUserid" method="post">	<!-- No role for this form, but leave it for CSS -->
                        
                            <div class="form-group">
                                <label>ID</label>
								<p><c:out value="${memberInfo.userid}"/></p>
                            </div>
                            
                            <div class="form-group">
                                <label>Name</label>
                                <p><c:out value="${memberInfo.userName}"/></p>
                            </div>
                            <div class="form-group">
                                <label>Registered Date</label>
                                <p><fmt:formatDate pattern="yyyy-MM-dd" value="${memberInfo.regDate}"/></p>
                            </div>
                            
                            
                            <div class="form-group">
                                <label><c:out value="${memberInfo.job}"/></label>
                                <p>Artist</p>
                            </div>
                            
                            
                            <div class="form-group">
                               	<label>Email</label>
                               	<p><c:out value="${memberInfo.email}"/></p>
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <input type='hidden' name='userid' value ="${memberInfo.userid}">
                            
                            <div class="button changePW">
                            	<div class='btn'>
                            		<span>비밀번호 변경</span>
                            	</div>
                            </div>
                            <div class="button delAcc">
                            	<div class='btn'>
                            		<span>회원탈퇴</span>
                            	</div>
                            </div>
                             
                            <p class="outer-link"><a href="/">Home</a></p>
                            
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Of MyPage Account -->
    
    
<!-- --------------------------------------   memoByHwan  Cut here for Footer   --------------------------------------   -->
<script type="text/javascript">
$(document).ready(function(){
	
	var result = '<c:out value="${result}"/>';
	if(result != ""){
		alert(result);
	}
	
	
	$(".changePW").on("click", function(e){
		self.location="/member/myPageChangePW";
	});
	
	
	
	$(".delAcc").click(function(){
		
		if (!confirm("정말 탈퇴 하시겠습니까?")) {
	        return;
	    } else {
			$("#sendUserid").attr("action", "/member/deleteAcc");
			$("#sendUserid").submit();
	    }
		
		
		
	});
});



</script>





<%@include file="/WEB-INF/views/includes/footer.jsp" %>