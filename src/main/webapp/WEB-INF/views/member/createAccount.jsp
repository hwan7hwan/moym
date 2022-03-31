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
                        <h1 class="page-title">Create an Account</h1>
                    </div>
                    <ul class="breadcrumb-nav">
                        <li><a href="../index.html">Home</a></li>
                        <li><a href="account_register.html" class="noMargin">Sign In</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
    
    
    
    <!-- start Registration section -->
    <section class="login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-12">
                    <div class="form-head">
                        <h4 class="title">Register</h4>
                        
                        <form id="join_form" method="post">
                        	<!-- have to use it against csrf in every form tag, if not 403error  -->
                       		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
                            <div class="form-group">
                                <label>ID</label>
                                <span class="final_id_ck">아이디를 입력해주세요.</span>
                                <span class="final_id_ck2">아이디는 영문 대소문자와 숫자 6~12자리로 입력해야합니다.</span>
                                <span class="id_input_re_1">중복되지 않는 아이디입니다.</span>
								<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
                                <input class="margin-5px-bottom id_input" type="text" name="userid">
                            </div>
                            
							
							
                            <div class="form-group">
                                <label>Name</label><span class="final_name_ck">이름을 입력해주세요.</span>
                                <input class="margin-5px-bottom name_input" type="text" name="userName">
                            </div>
                            
                            
                            <div class="form-group">
                                <label>Password</label><span class="final_pw_ck">비밀번호를 입력해주세요.</span>
                                <span class="pwFormTest">비밀번호는 영문 대소문자와 숫자 8~12자리로 입력해야합니다.</span>
                                <input class="margin-5px-bottom pw_input" type="password" name="userpw">
                            </div>
                            
                            
                            <div class="form-group">
                                <label>Confrim Password</label>
                                <span class="final_pwck_ck">비밀번호 확인을 위해 입력해주세요.</span>
                                <span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                				<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
                                <input class="margin-5px-bottom pw_input_chk" type="password"  name=""><!-- name is unnecessary -->
                            </div>
                            
                            
                            <div class="form-group">
                                <label>Choose Who You Are</label><span class="final_job_ck">다음의 카테고리를 선택해주세요.</span>
                                <select class="select job_input" name="job">  
                                    <option value=""></option>
                                    <option value="artist">Artist</option>
                                    <option value="audience">Audience</option>
                                    <option value="spaceOwner">Space Owner</option>
                                </select>
                            </div>
                            
                            
                            <div class="mail_wrap row">
                            
                            	<div class="form-group mail_input_box">
                                	<label>Email</label><span class="final_mail_ck">이메일을 입력해주세요.</span><span class="mail_input_box_warn warnCustomspan"></span>
                                	<input class="margin-5px-bottom email_input" type="email" name="email">
                                	<span class="email_input_re_1">사용가능한 이메일입니다.</span>
									<span class="email_input_re_2">이미 가입된 이메일입니다.</span>
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
                            		<div class="mail_check_button btnForSpanCustom">
                            	    	<span>인증번호<br>전송</span>
                            		</div>
                            	</div> 
                            	
                            </div>
                            
                            
                            
                            <input type="hidden" name="auth" value="ROLE_USER">
                            
                            <div class="button join_button">
                            	<div class='btn'>
                            		<span>가입하기</span>
                            	</div>
                            </div>
                             
                            <p class="outer-link">Already have an account? <a href="/customLogin">Login</a></p>
                            
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Registration section -->
    



<!-- -------------------------------------------------Javascript------------------------------------------------------------ -->
<script>

var code = ""; 	// it's to save certification number

// for availability check
var idCheck = false;            
var idckCheck = false;           
var pwCheck = false;          
var pwckCheck = false;        
var pwckcorCheck = false;    
var nameCheck = false;
var jobCheck = false;
var mailCheck = false;
var mailnumCheck = false;
var emailckCheck = false;


$(document).ready(function(){
	
	var resultQna = '<c:out value="${resultQna}"/>';
	if(resultQna != ""){
		alert(resultQna);
	}
	
	
	//push join_button
	$(".join_button").click(function(){
		
		//--------------------------------------availability for new account form
		var id = $('.id_input').val();        
        var pw = $('.pw_input').val();   
        var pwck = $('.pw_input_chk').val();
        var name = $('.name_input').val();
        var job = $('.job_input').val();
        var mail = $('.email_input').val();  
        var password1RegExp = /^[a-zA-z0-9]{8,12}$/; 
        var id1RegExp = /^[a-zA-z0-9]{6,12}$/;
		
        // ID availability
        if(id ==""){
            $('.final_id_ck').css('display','block');
            $(".id_input").focus();
            idCheck = false;
        }else{
            $('.final_id_ck').css('display', 'none');
            idCheck = true;
        }
        if (!id1RegExp.test(id)) {
        	$('.final_id_ck2').css('display','block');
        	$(".id_input").focus();
            return false;
        }
        if (id1RegExp.test(id)) {
        	$('.final_id_ck2').css('display','none');
        }
        
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
        if (password1RegExp.test(pw)) {
        	$('.pwFormTest').css('display','none');
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
     	
        /* name availability */
        if(name == ""){
            $('.final_name_ck').css('display','block');
            $(".name_input").focus();
            nameCheck = false;
        }else{
            $('.final_name_ck').css('display', 'none');
            nameCheck = true;
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
        
        /* job availability */
        if(job == ""){
            $('.final_job_ck').css('display','block');
            $(".job_input").focus();
            jobCheck = false;
        }else{
            $('.final_job_ck').css('display', 'none');
            jobCheck = true;
        }
        
		//-------------------------------------- END OF availability for new account form
		
        /* Final availability test */
        if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&mailnumCheck&&jobCheck&&emailckCheck){
        	$("#join_form").attr("action", "/member/createAccount");
    		$("#join_form").submit();
    		
        }   
		return false;
		
		
		
	});// when you push join_button
	
});//document



//Ajax spring security header...
$(document).ajaxSend(function(e,xhr,options){
	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
});

//ID Duplication Test
$('.id_input').on("propertychange change keyup paste input", function(){
	
	//Ajax spring security header...
	$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
		});

	/*console.log("keyup 테스트");*/
	
	var userid = $('.id_input').val();			// .id_input에 입력되는 값
	var data = {userid : userid};				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url : "/member/memberIdChk",
		data : data,
		success : function(result){
			if(result != 'fail'){
				$('.id_input_re_1').css("display","inline-block");
				$('.id_input_re_2').css("display", "none");
				idckCheck = true;
			} else {
				$('.id_input_re_2').css("display","inline-block");
				$('.id_input_re_1').css("display", "none");
				idckCheck = false;
			}
		}// success end
		
	}); // ajax end
	
	
});//End Of ID Duplication Test

//Email duplication Test
$('.email_input').on("propertychange change keyup paste input", function(){
	
	//Ajax spring security header...
	$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
		});
	
	var email = $('.email_input').val();
	var data = {email : email};			// name to send to controller : data from input value'
	
	$.ajax({
		type : "post",
		url : "/member/emailChk",
		data : data,
		success : function(result){
			if(result != 'fail'){
				$('.email_input_re_1').css("display","inline-block");
				$('.email_input_re_2').css("display", "none");
				emailckCheck = true;
			} else {
				
				$('.email_input_re_2').css("display","inline-block");
				$('.email_input_re_1').css("display", "none");
				emailckCheck = false;
			}
		}// success end
	}); // ajax end
	
	
});
//End Of Email duplication Test




/* Send certification number to the email in the input */
$(".mail_check_button").click(function(){
	
	//Ajax spring security header...
	$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
		});
    
    var email = $(".email_input").val();        // 입력한 이메일
    var cehckBox = $(".mail_check_input");        // 인증번호 입력란
    var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
    var warnMsg = $(".mail_input_box_warn");
    
    /* Test availability for email form */
    if(mailFormCheck(email)){
        warnMsg.html("인증번호가 전송 되었습니다. 이메일을 확인해주세요.");
        warnMsg.css("display", "inline-block");
    } else {
        warnMsg.html("올바르지 못한 이메일 형식입니다.");
        warnMsg.css("display", "inline-block");
        return false;
    } 
    
    
    
 	$.ajax({
        type:"GET",
        url:"mailCheck?email=" + email,
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








<!-- --------------------------------------   memoByHwan  Cut here for Footer   --------------------------------------   -->

<%@include file="/WEB-INF/views/includes/footer.jsp" %>