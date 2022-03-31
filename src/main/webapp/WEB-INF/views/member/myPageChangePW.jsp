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
                        <h4 class="title">Change Password </h4>
                        <form id="chgPW_form" method="post">
                        <!-- have to use it against csrf in every form tag, if not 403error  -->
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
                        		
                            <div class="mail_wrap row">
                            	<div class="form-group mail_input_box">
                                	<label>인증 후 가능합니다. 이메일을 입력해주세요</label>
                                	<span class="final_mail_ck">이메일을 입력해주세요.</span><span class="mail_input_box_warn warnCustomspan"></span>
                                	<input class="margin-5px-bottom email_input" type="email" name="email">
                            	</div>
                            	
                            	<div class='col-7'>
                            		<div class="mail_check_wrap">
                            			<div class="form-group mail_check_input_box" id="mail_check_input_box_false">
                            		    	<input class="margin-5px-bottom mail_check_input" type="text"  disabled="disabled" placeholder="Type the number!"><!-- name is unnecessary -->
                            			</div>
                            			<div class="clearfix"></div>
                    					<span id="mail_check_input_box_warn"></span>
                            		</div> 
                            	</div>
                            	
                            	<div class='col-5'>
                            		<div class="mail_check_button idMatchChkBt btnForSpanCustom">
                            	    	<span>인증번호<br>전송</span>
                            		</div>
                            	</div> 
                            </div>
                            
                            <div class="form-group">
                                <label>New Password</label><span class="final_pw_ck">비밀번호를 입력해주세요.</span>
                                <span class="pwFormTest">비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다.</span>
                                <input class="margin-5px-bottom pw_input" type="password" name="userpw">
                            </div>
                            
                            <div class="form-group">
                                <label>Confrim Password</label>
                                <span class="final_pwck_ck">비밀번호 확인을 위해 입력해주세요.</span>
                                <span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                				<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
                                <input class="margin-5px-bottom pw_input_chk" type="password"  name=""><!-- name is unnecessary -->
                            </div>
                            <sec:authorize access="isAuthenticated()">
                            	<input class="id_input" type="hidden" name="userid" value="<sec:authentication property="principal.username"/>">
                            </sec:authorize>
                            <input type="hidden" name="auth" value="ROLE_MEMBER">
                            <div class="button chgPW_button">
                            	<div class='btn'>
                            		<span>Change</span>
                            	</div>
                            </div>
                             
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>



<!-- --------------------------------------   memoByHwan  Cut here for Footer   --------------------------------------   -->


<script>


$(document).ready(function(){
	
	
	
	
	
	// Change ID Btn
	$(".chgPW_button").click(function(e){
		
		//availability for Change Password Form
		var id = $('.id_input').val(); 
		var pw = $('.pw_input').val();   
        var pwck = $('.pw_input_chk').val();
        var mail = $('.email_input').val();  
        var password1RegExp = /^[a-zA-z0-9]{4,12}$/;
        
     	// PW availability
        if(pw == ""){
            $('.final_pw_ck').css('display','block');
            $(".pw_input").focus();
            pwCheck = false;
        }else{
            $('.final_pw_ck').css('display', 'none');
            pwCheck = true;
        }
        if (!password1RegExp.test(pw)) {
        	$('.pwFormTest').css('display','block');
        	$(".pw_input").focus();
            return false;
        }
        
   		// PW Check availability
        if(pwck == ""){
            $('.final_pwck_ck').css('display','block');
            $(".pw_input_chk").focus();
            pwckCheck = false;
        }else{
            $('.final_pwck_ck').css('display', 'none');
            pwckCheck = true;
        }
   		
        /* email availability */
        if(mail == ""){
            $('.final_mail_ck').css('display','block');
            $(".email_input").focus();
            mailCheck = false;
        }else{
            $('.final_mail_ck').css('display', 'none');
            mailCheck = true;
        }
		
		if(!idckCheck){	//Final Check
			$(".email_input").focus();
			alert("해당 아이디와 연동된 이메일이 아닙니다. 아이디와 이메일을 다시 확인해주세요");
			return;
		}
		
		if(!idckCheck){	//Final Check
			$(".email_input").focus();
			alert("해당 아이디와 연동된 이메일이 아닙니다. 아이디와 이메일을 다시 확인해주세요");
			return;
		}
		
		
		if(pwCheck&&pwckCheck&&pwckcorCheck&&mailCheck&&mailnumCheck&&idckCheck){
			$("#chgPW_form").attr("action", "/member/myPageChangePW");
			$("#chgPW_form").submit();
		}
		
		return false;
		
		
	});//End Of Change PW
});	//End Of Document Ready

// Id match test same button with certify email
$('.idMatchChkBt').on("click", function(){
	
	
	//Ajax spring security header...
	$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
		});

	
	var userid = $('.id_input').val();
	var email = $('.email_input').val();
	var data = {userid : userid, email : email};		// name to send to controller : data from input value
	
	$.ajax({
		type : "post",
		url : "/member/idMatchChk",
		data : data,
		success : function(result){
			if(result != 'fail'){
				console.log("ID match!");
				idckCheck = true;
				
			} else {
				console.log("The email doen't match with Id on sign on");
				idckCheck = false;
			}
		}// success end
	}); // ajax end
	
	
	
});



/* Send certification number to the email in the input */
$(".mail_check_button").click(function(){
	
	//Ajax spring security header...
	$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
		});
    
    var email = $(".email_input").val();        
    var cehckBox = $(".mail_check_input");       
    var boxWrap = $(".mail_check_input_box");  
    var warnMsg = $(".mail_input_box_warn");
    
    /* Test availability for email form */
    if(mailFormCheck(email)){
        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
        warnMsg.css("display", "inline-block");
    } else {
        warnMsg.html("올바르지 못한 이메일 형식입니다.");
        warnMsg.css("display", "inline-block");
        return false;
    } 
    
    
    
 	$.ajax({
        type:"GET",
        url:"mailChkForChgPw?email=" + email,
		success:function(data){
			
			//console.log("data : " + data);
			cehckBox.attr("disabled",false);
			boxWrap.attr("id", "mail_check_input_box_true");	// To change CSS
			code = data;
        
		}
 	
    });
    
});


/* Compare certification number */
$(".mail_check_input").blur(function(){
    
    var inputCode = $(".mail_check_input").val();        // from input  
    var checkResult = $("#mail_check_input_box_warn");    // result of comparing
    
    if(inputCode == code){                            
        checkResult.html("인증번호가 일치합니다.");
        checkResult.attr("class", "correct");
        mailnumCheck = true;
    } else {                                        
        checkResult.html("인증번호를 다시 확인해주세요.");
        checkResult.attr("class", "incorrect");
        mailnumCheck = false;
    } 
        
});



/*Test to Compare PW*/
$('.pw_input_chk').on("propertychange change keyup paste input", function(){
	
	var pw1 = $('.pw_input').val();
    var pwck1 = $('.pw_input_chk').val();
    $('.final_pwck_ck').css('display', 'none');
    
    if(pw1 == pwck1){
        $('.pwck_input_re_1').css('display','block');
        $('.pwck_input_re_2').css('display','none');
        pwckcorCheck = true;
    }else{
        $('.pwck_input_re_1').css('display','none');
        $('.pwck_input_re_2').css('display','block');
        pwckcorCheck = false;
    }
    
}); 


/* Test to check email form */
function mailFormCheck(email){
	var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return form.test(email);
}






</script>


<%@include file="/WEB-INF/views/includes/footer.jsp" %>