<%@include file="/WEB-INF/views/includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<!-- --------------------------------------   memoByHwan  Cut here for Header   --------------------------------------   -->

<!-- Start Breadcrumbs -->
    <div class="breadcrumbs overlay loginPageImaHwan">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">Q&A</h1>
                    </div>
                    <ul class="breadcrumb-nav">
                        <li><a href="/">Home</a></li>
                        <li><a href="/member/myPageAccount" class="noMargin">My Page</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

<!-- Start Contact Area -->
    <section id="contact-us" class="contact-us section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="form-main">
                        <h3 class="title"><span>Master Of Your Masterpieces</span>
                            Q&A
                        </h3>
                        <form role="form" action="/member/manageQnAAnswer" method="post" id='formForAns'>
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        
                        	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
							<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
							<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
							<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
					
                            <div class="row">
                            	<div class="col-12">
                                    <div class="form-group message">
                                        <label>Question</label>
                                        <textarea name="contentq" row="3" readonly="readonly"><c:out value="${board.contentq}"/></textarea>
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Questioner</label>
                                        <input name="emailq" type="email" value='<c:out value="${board.emailq}"/>' readonly="readonly">
                                    </div>
                                </div>
                                
                                <div class="col-lg-3 col-12">
                                    <div class="form-group">
                                        <label>qno</label>
                                        <input name="qno" type="text" value='<c:out value="${board.qno}"/>' readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-lg-3 col-12">
                                    <div class="form-group">
                                        <label>Respondent</label>
                                        <input name="answerer" type="text" value='<sec:authentication property="principal.username"/>' readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-lg-3 col-12">
                                    <div class="form-group">
                                        <label>Register Date</label>
                                        <div class='regDateDiv'>
                                        	<span>
                                        		<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/>
                                        	</span>
                                    	</div>
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    <div class="form-group message">
                                        <label>Answer</label>
                                        <textarea name="answer" row="3"><c:out value="${board.answer}"/></textarea>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-group button">

                                    	<sec:authorize access="isAuthenticated()">
                                        	<div id='answerBtn' class="btn registerBotMarH"><span>Answer</span></div>
                                        	<div id='removeBtn' class="btn registerBotMarH"><span>Remove</span></div>
										</sec:authorize>
										
                                        <div id='cancelBtn' class="btn registerBotMarH"><span>Cancel</span></div>
                                    
                                    </div>
                                </div>
                            </div>
                        </form>
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/ End Contact Area -->



<!-- --------------------------------------   memoByHwan  Cut here for Footer   --------------------------------------   -->

<%@include file="/WEB-INF/views/includes/footer.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	
	
	
	
	
	var ansForm = $("#formForAns");
	
	$("#answerBtn").on("click", function(e){
		e.preventDefault();
		ansForm.submit();
	
	
	});
	$("#cancelBtn").on("click", function(e){
		
		ansForm.attr("action", "/member/manageQnA").attr("method","get");
		
		var pageNumTag = $("input[name='pageNum']").clone();
		var amountTag = $("input[name='amount']").clone();
		var keywordTag = $("input[name='keyword']").clone();
		var typeTag = $("input[name='type']").clone();
		
		ansForm.empty();
		ansForm.append(pageNumTag);
		ansForm.append(amountTag);
		ansForm.append(keywordTag);
		ansForm.append(typeTag);
		
		ansForm.submit();
	});
	
	$("#removeBtn").on("click", function(e){
		ansForm.attr("action", "/member/remove");
		ansForm.submit();
	});
	
	
	
	/*
	$('.btn').on("click", function(e){
		
		e.preventDefault();
		

		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action", "/member/remove");
		}else if(operation === 'list'){
			//move to list
			formObj.attr("action", "/member/manageQnA").attr("method","get");
			
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			var typeTag = $("input[name='type']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
			
		}else if(operation === 'modify'){
			
			console.log("submit clicked");
			
		formObj.submit();
		}
	});
	*/
});

</script>
