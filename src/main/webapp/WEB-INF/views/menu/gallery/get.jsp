<%@include file="/WEB-INF/views/includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- --------------------------------------   memoByHwan  Cut here for Header   --------------------------------------   -->


<!-- Start Breadcrumbs -->
<div class="breadcrumbs overlay galleryPageHwan">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
                <div class="breadcrumbs-content">
                    <h1 class="page-title">Gallery</h1>
                    <p>다양한 작품들을 소개하는 공간입니다. <br> 이곳에서 당신이 모르는 새로운 아티스트 새로운 작품들을 만나보세요.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->




    <!-- Start Blog Singel Area -->
    <section class="section blog-single">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1 col-md-12 col-12">
                    <div class="single-inner">
                        
                        <div class="post-details">
                            <div class="detail-inner">
                            
                                <!-- post meta -->
                                <ul class="custom-flex post-meta">
                                    <li>
                                        <a href="javascript:void(0)">
                                            <i class="lni lni-calendar"></i>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)">
                                            <i class="lni lni-pencil"></i>
                                            Written by <c:out value="${board.writer}"/>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)">
                                            <i class="lni lni-tag"></i>
                                            <c:out value="${board.category}"/>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)">
                                            <i class="lni lni-comments"></i>
                                            <c:out value="${board.replyCnt}"/> Comments
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)">
                                            <i class="lni lni-eye"></i>
                                            <c:out value="${board.viewCnt}"/> Views
                                        </a>
                                    </li>
                                    
                                </ul>
                                <h2 class="post-title">
                                    <a href="javascript:void(0)"><c:out value="${board.title}"/></a>
                                </h2>
                                
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                	<div class='uploadPicCustom'>
                                		<img src='/thgalleryDisplay?fileName=<c:out value="${board.fileCallPath}"/>'>
                                	</div>
                                </div>
                                
                                <div class='quoArea'>
                                </div>
                                
                                
                                
     							
     							<p class='newLineHH'><c:out value="${board.content}"/></p>
     							
     							<!-- asd -->
     							<div class='ytDiv'>
     								
     							</div>
     							
     							
                                <!-- Upload Picture and file. And Show it -->
                                <div class="col-lg-7 col-md-8 col-xs-12">
									<div class='uploadResult uploadPicCustom'>
										<ul>
										</ul>
									</div>
								</div>
                                
                                
                                 
                                
                                <!--post functions -->
                                <div class="post-tags-media">
                                    <div class="post-tags popular-tag-widget mb-xl-40">
                                        <div class="tags">
                                            <div class="button">
                                                <button data-oper='list' class="btn mouse-dir white-bg marginBtnH">list</button>
                                                	<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')">		
														<button data-oper='modify' class="btn mouse-dir white-bg marginBtnH">Modify</button>
													</sec:authorize>
                                            </div>
                                            
                    <form id='operForm' action="/gallery/modify" method="get"><!-- You should check the route!! -->
						<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
						<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
						<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
						<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
						<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
					</form>
                                        </div>
                                    </div>
                                </div>
                            </div><!--End of post functions  -->
                            
                            <!-- Leave Comments -->
                            <div class="comment-form commentC">
                                <h3 class="comment-reply-title">Leave a comment</h3>
                                <form action="/">
                                    <div class="row">
                                    <sec:authorize access="isAuthenticated()">
                                        <div class="col-12">
                                            <div class="form-box form-group">
                                                <textarea name='reply' rows="6" class="form-control form-control-custom replyAreaCH"></textarea>
                                            </div>
                                        </div>
                                   </sec:authorize>
                                   <sec:authorize access="isAnonymous()">
                                   		<div class="col-12">
                                            <div class="form-box form-group">
                                           	    <textarea rows="6" class="form-control form-control-custom replyAreaCH" readonly>You can leave comments after sign in</textarea>
                                           	</div>
                                        </div>
                                   </sec:authorize>
                                        
                                    <div class="form-group">
                                        <sec:authorize access="isAuthenticated()">
                                        	<input type='hidden' class="form-control" name='replyer' 
                                        	value='<sec:authentication property="principal.username"/>'>
                                        </sec:authorize>
                                    </div>
                                    	
                                    	
                                    	<div class="form-group">
                                        	<input type='hidden' class="form-control" name='replyDate' value=''>
                                    	</div>
                                    	
                                    	<sec:authorize access="isAuthenticated()">
                                        <div class="col-12">
                                            <div class="button">
                                                <button id='modalRegisterBtnC' type="button" class="btn mouse-dir white-bg">Post Comment <span
                                                        class="dir-part"></span></button>
                                            </div>
                                        </div>
                                        </sec:authorize>
                                        <sec:authorize access="isAnonymous()">
                                        <div class="col-12">
                                            <div class="button">
                                                <button id='goToLoginPageCH' type="button" class="btn mouse-dir white-bg">Sign In<span
                                                        class="dir-part"></span></button>
                                            </div>
                                        </div>
                                        </sec:authorize>
                                        
                                    </div>
                                </form>
                            </div>
                            <!-- End of Leave Comments -->
                            
                            
                               
                            <!-- Comments -->
                            <div class="post-comments">
                                <h3 class="comment-title">Post comments</h3>
                                <ul class="chat">
                                    <li>
                                        
                                    </li>
                                </ul>
                            </div>
                            <!-- End of Comments -->
                            <!-- Paging for Comments -->
                            <div class="panel-footer">
							</div>
                            <!-- End Paging for Comments -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Blog Singel Area -->



<!-- khh  ---------------------------------------------- Modal---------------------------------------------------- -->
    
        <!-- Modal for Modifying Reply -->
        <div class="modal fade form-modal modalForRep" id="myModal" tabindex="-1" aria-hidden="true" role="dialog">
            <div class="modal-dialog max-width-px-840 position-relative">
                <div class="login-modal-main colorCBH">
                    <div class="row no-gutters">
                        <div class="col-12">
                            <div class="row">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Comments</h5>
                                    <button type="button" class="xCustH" data-bs-dismiss="modal" aria-label="Close" id='modalCloseBtn'><i class="lni lni-cross-circle"></i></button>
                                  </div>
                                <form action="/">
                                    <div class="form-group">
                                        <input type='hidden' class="form-control" name='replyer' value='' readonly>
                                    </div>
                                    <div class="form-group form-box notReadOnlyRep">
                                        <textarea rows="6" class="form-control form-control-custom textareaHwan" 
                                                name='reply' value=''></textarea>
                                    </div>
                                    <div class="form-group form-box readOnlyRep">
                                        <textarea rows="8" class="form-control form-control-custom textareaHwan readonlyCusH" 
                                                name='reply' value='' readonly></textarea>
                                    </div>
                                    <div class="form-group">
                                        <input type='hidden' class="form-control" name='replyDate' value=''>
                                    </div>
                                    <div class="modal-footer">
                                        <div class="form-group mb-8 button">
                                            <button id='modalModBtn' type="button" class="btn hoverChageCBH">Modify</button>
                                        </div>
                                        <div class="form-group mb-8 button">
                                            <button id='modalRemoveBtn' type="button" class="btn hoverChageCBH">Remove</button>
                                        </div>
                                    </div>
                                    
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Modal for Modifying Reply -->
        
        
        <!-- Modal for register Rereply -->
        <div class="modal fade form-modal modalForNewRrep" id="myModal" tabindex="-1" aria-hidden="true" role="dialog">
            <div class="modal-dialog max-width-px-840 position-relative">
                <div class="login-modal-main colorCBH">
                    <div class="row no-gutters">
                        <div class="col-12">
                            <div class="row">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">답글</h5>
                                    <button type="button" class="xCustH" data-bs-dismiss="modal" aria-label="Close" id='modalCloseBtn'><i class="lni lni-cross-circle"></i></button>
                                  </div>
                                <form action="/">
                                        <input type='hidden' class="form-control" name='rereplyer' value='' >
                                        <input type='hidden' class="form-control" name='bno' value='' >
                                        <input type='hidden' class="form-control" name='rno' value='' >
                                    <div class="form-group form-box notReadOnlyRep">
                                        <textarea rows="6" class="form-control form-control-custom textareaHwan rrepTextareaMar" 
                                                name='rereply'></textarea>
                                    </div>
                                    <div class="form-group">
                                        <input type='hidden' class="form-control" name='rereplyDate' value=''>
                                    </div>
                                    <div class="modal-footer">
                                        <div class="form-group mb-8 button">
                                        	<div id='regNewRrep' class="btn hoverChageCBH">
                                        		<span>Register</span>
                                        	</div>
                                        </div>
                                    </div>
                                    
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Of Modal for register Rereply -->
        
        

        <!-- Modal for Modify Rereply -->
        <div class="modal fade form-modal modalForModRrep" id="myModal" tabindex="-1" aria-hidden="true" role="dialog">
            <div class="modal-dialog max-width-px-840 position-relative">
                <div class="login-modal-main colorCBH">
                    <div class="row no-gutters">
                        <div class="col-12">
                            <div class="row">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">답글</h5>
                                    <button type="button" class="xCustH" data-bs-dismiss="modal" aria-label="Close" id='modalCloseBtn'><i class="lni lni-cross-circle"></i></button>
                                  </div>
                                <form action="/">
                                    <input type='hidden' class="form-control" name='bno' value=''>
                                    <input type='hidden' class="form-control" name='rno' value=''>
                                    <input type='hidden' class="form-control" name='rrno' value=''>                                                                        
                                    <input type='hidden' class="form-control" name='rereplyer' value=''>
                                    <input type='hidden' class="form-control" name='rereplyDate' value=''>
                                    
                                    <div class="form-group form-box notReadOnlyRep">
                                        <textarea rows="6" class="form-control form-control-custom textareaHwan rrepTextareaMar" 
                                                name='rereply'></textarea>
                                    </div>
                                    
                                    <div class="modal-footer">
                                        <div class="form-group mb-8 button">
                                            <button id='rRepModalModBtn' type="button" class="btn hoverChageCBH">Modify</button>
                                        </div>
                                        <div class="form-group mb-8 button">
                                            <button id='rRepModalRemoveBtn' type="button" class="btn hoverChageCBH">Remove</button>
                                        </div>
                                    </div>
                                    
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Modal for Modify Rereply -->




<!-- --------------------------------------   memoByHwan  Cut here for Footer   --------------------------------------   -->
	 
<script src="/resources/js/galleryReply.js"></script>
<script src="/resources/js/galleryRereply.js"></script>


<script>
	//This Document Ready is for reply and rereply
	$(document).ready(function() {		// document means As you open this page.
		
		var resultForMod = '<c:out value="${resultForMod}"/>';
		if(resultForMod != ""){
			alert(resultForMod);
		}
		
		var bnoValue = '<c:out value="${board.bno}"/>'; 
		var replyUL = $(".chat");
		
		
		var ytlink = '<c:out value="${board.ytlink}"/>';
		var ytArea = $(".ytDiv");
		var strForYt="";


		if (ytlink != "" && ytlink != null && ytlink != undefined){
			strForYt +="<div class='ratio ratio-16x9'>";
			strForYt +="<iframe src='"+ytlink+"' title='YouTube video' allowfullscreen></iframe>";
			strForYt +="</div>";
		}

		ytArea.html(strForYt);
		
		
		//asd
		var quocon = '<c:out value="${board.quocon}"/>';
		var quofrom = '<c:out value="${board.quofrom}"/>';
		var quoArea = $(".quoArea");
		var strForQ="";
		
		if (quocon != "" && quocon != null && quocon != undefined){
			
			strForQ +="<blockquote><div class='icon'><i class='lni lni-quotation'></i></div>";
			strForQ +="<h4>"+quocon+"</h4>";
			strForQ +="<span>"+quofrom+"</span>";
			strForQ +="</blockquote>";
			
		}
		
		quoArea.html(strForQ);
		
        
		
		//show reply
		showList(1);
		

		function showList(page) {			// this method is for list of replies
			
			console.log("show list " + page);
																
			replyService.getList({bno:bnoValue,page: page|| 1 },
					
			function(replyCnt, list) {
				console.log("replyCnt: " + replyCnt );
				console.log("list: " + list);
				console.log(list);
				
				if(page == -1){
					pageNum = Math.ceil(replyCnt/10.0);
					showList(pageNum);
					return;
				}
				
				var str = "";
				
				
				for (var i = 0, len = list.length || 0; i < len; i++) {
					
                	str += "<li>";
                    str += "<div class='row replyCustomHwan'><div class='col-lg-2 col-md-2 col-xs-12 replyInfoH'>";
                    str += "<h6>"+list[i].replyer+"</h6><span>"+ replyService.displayTime(list[i].replyDate)+ "</span>";
                    str += "<div class='button'><div class='btn modRepBCHH' id='modRepCBH' data-rno='"+list[i].rno+"'><i class='lni lni-cog'></i></div>";
                    str += "<div class='btn modRepBCHH' id='reRepBtnCBH' data-rno='"+list[i].rno+"'><i class='lni lni-comments'></i><span>("+list[i].rereplyCnt+")</span></div>";
                    str += "</div>";
                    str += "</div>";

					str += "<div class='col-lg-10 col-md-10 col-xs-12 replyContentH'><p>"+list[i].reply+"</p>";
 					str += "</div>";
                    str += "</div></li>";
                    
                    str += "<ul class='rerepHH' data-rnoForRrep='"+list[i].rno+"'>";        
                    str += "<li>";
                    str += "</li>";
                    str += "</ul>";
                    
                    str += "";
				}
				
				
				replyUL.html(str);
				
				$(".rerepHH").css('display','none');
				
				
				showReplyPage(replyCnt);
				
				
			}); //end function
			
			
		} //end showList
		
		
						
						
	
						
						

	var writeReply = $(".commentC");
	
	var inputNewReply = writeReply.find("textarea[name='reply']");
	var inputNewReplyer = writeReply.find("input[name='replyer']");
	var inputNewReplDate = writeReply.find("input[name='replyDate']");
	
	var modal = $(".modalForRep");
	var modalInputReply = modal.find("textarea[name='reply']");	
	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");
						
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtnC = $("#modalRegisterBtnC");
	var goToLoginPageCH = $("#goToLoginPageCH");
	
	var replyer = null;
	
	
	
	<sec:authorize access="isAuthenticated()">
		replyer = '<sec:authentication property="principal.username"/>';
	</sec:authorize>
	
	
	var csrfHeaderName ="${_csrf.headerName}";
	var csrfTokenValue="${_csrf.token}";
	
	
	
	//Ajax spring security header...
	$(document).ajaxSend(function(e,xhr,options){
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});
	
	// Go to Login page for reply
	goToLoginPageCH.on("click",function(e){
		self.location="/customLogin";
	});
	
	
	// Register reply
	modalRegisterBtnC.on("click",function(e){
		
		var reply ={		// this varS for replyService.add(reply, function(result){...
				reply: inputNewReply.val(),
				replyer: inputNewReplyer.val(),
				bno:bnoValue
		};
		
		// When u click the button, even if u didn't write anything on the textarea. it's not for error
		if(reply.reply == "" || reply.reply == null || reply.reply == undefined || 
				( reply.reply != null && typeof reply.reply == "object" && !Object.keys(reply.reply).length )){
			console.log('Nothing on the textarea for reply');
			return;
		}
		
		replyService.add(reply, function(result){
			
			alert(result);
			writeReply.find("textarea").val("");	//make the textarea empty after you register
			showList(1);	//show first reply page
		});
		
		
	});
	

	
	//notReadOnlyRep readOnlyRep
	var notReadOnlyRep = $(".notReadOnlyRep");
	var readOnlyRep = $(".readOnlyRep");
	
		// function for Reply(read detail,modify,reply...)	
		$(".chat").on("click", "#modRepCBH", function(e){	// when you push  #modRepCBH button in .Chat
			
			var rno = $(this).data("rno");				// get rno through data-rno on the button(#modRepCBH)
			
			replyService.get(rno, function(reply){
				
				modalInputReply.val(reply.reply);		// inject into value of input or textarea
				modalInputReplyer.val(reply.replyer);
				modalInputReplyDate.val(replyService.displayTime( reply.replyDate)).attr("readonly","readonly");
				modal.data("rno",reply.rno);
				
				modalModBtn.hide();
				modalRemoveBtn.hide();
				notReadOnlyRep.hide();
				
				if (reply.replyer == replyer){
					modalModBtn.show();
					modalRemoveBtn.show();
					notReadOnlyRep.show();
					readOnlyRep.hide();
				} else {
					readOnlyRep.show();
				}
				modal.modal("show");
			});
		});//End of function for Reply(read detail,modify,reply...)	
		
		
		
		//reReply by button
		var rerepHH = $('.rerepHH');
		
		var rnoForNewRep = rerepHH.find("input[name='rno']");
		var bnoForNewRep = rerepHH.find("input[name='bno']");
		var rereplyerForNewRep = rerepHH.find("input[name='rereplyer']");
		var rereplyForNewRep = rerepHH.find("input[textarea='rereply']");
		
		function showRrepList(page, rnoValue) {
			
			rereplyService.getList({rnoValue,page: page|| 1 },
					
					function(rereplyCnt, list) {
				
						console.log("rereplyCnt: " + rereplyCnt );
						console.log("list: " + list);
						console.log(list);
						
						var rStr = "";
				
						if(page == -1){
							pageNum = Math.ceil(replyCnt/10.0);
							return;
						}
						
						// rereply board
						rStr += "<input type='hidden' id='checkOpenClose' data-rno='"+rnoValue+"' name='chkOC' value=''>";

rStr +="<div class='row rrepRowDP'><div class='button'>";
rStr += "<div class='btn rrepBtnC closeFloatHH' id='reRepBtnCBHclose' data-rno='"+rnoValue+"'><i class='lni'>Close</i><i class='lni lni-close'></i></div>";
rStr +="<div class='btn rrepBtnC' id='regNewRrepModal' data-rno='"+rnoValue+"'><i class='lni'>답글</i><i class='lni lni-pencil'></i></div>";
						rStr +="</div></div>";

						for (var i = 0, len = list.length || 0; i < len; i++) {
							
							rStr += "<li id='reloadAfterNew'>";	
							rStr += "<div class='row replyCustomHwan rerepCssHH'>";
							rStr += "<div class='col-lg-2 col-md-2 col-xs-12 replyInfoH'>";
							rStr += "<h6>"+list[i].rereplyer+"</h6>";
							rStr += "</div>";
							rStr += "<div class='col-lg-8 col-md-8 col-xs-12 replyContentH'><p>"+list[i].rereply+"</p></div>";
							rStr += "<div class='col-lg-2 col-md-2 col-xs-12'><div class='button'><div class='btn modRepBCHH' id='modRrepBtn' data-rrno='"+list[i].rrno+"' data-writer='"+list[i].rereplyer+"'><i class='lni lni-cog'></i></div></div>";
							
							rStr += "</div>";
							rStr += "</li>";
							}
						
						
						$(".rerepHH[data-rnoForRrep="+rnoValue+"]").html(rStr);
						
						
						$("#checkOpenClose").val('1');	
						
							
						return;
					}); //End Of function
		}//End Of showRrepList
		

		$(".chat").on("click", "#reRepBtnCBH", function(e){	// when you click #reRepBtnCBH button 
			
			var rno = $(this).data("rno");		//the button has data-rno, and get it
			var rnoValue = rno;
			
			var rereplyUL = $(".rerepHH");		//location for rereply to inject rereplies of  each rno
			
			
			showRrepList(1,rnoValue);
			
			
			
			$(".rerepHH[data-rnoForRrep="+rnoValue+"]").css('display','inline');
			
		});//End of reReply by button
		
		
		
		//Open modal for New Rereply 
		var nRereply = $(".modalForNewRrep").find("textarea[name='rereply']");
		var nRereplyer = $(".modalForNewRrep").find("input[name='rereplyer']");
		var nBno = $(".modalForNewRrep").find("input[name='bno']");
		var nRno = $(".modalForNewRrep").find("input[name='rno']");
		
		
		$(".chat").on("click", "#regNewRrepModal", function(e){
			<sec:authorize access="isAnonymous()">
				alert("로그인 후에 작성할 수 있습니다.");
			</sec:authorize>
			
			<sec:authorize access="isAuthenticated()">
			
				var rno = $(this).data("rno");
				
				$(".modalForNewRrep").find("textarea[name='rereply']").val("");	//make textarea empty
				
				replyService.get(rno, function(reply){	//get rno and bno from replyService.get, and inject to inputs of modal for modify rereply 
					nRno.val(reply.rno);		
					nBno.val(reply.bno);
				});
				
				
				$(".modalForNewRrep").modal("show");
			</sec:authorize>
		});
		// End Of Open modal for New Rereply
		
		// Register on modal for New rereply
		$(".modalForNewRrep").on("click", "#regNewRrep", function(e){
			
			<sec:authorize access="isAnonymous()">
				alert("로그인 후에 작성할 수 있습니다.");
			</sec:authorize>
			
			<sec:authorize access="isAuthenticated()">
			
				var rno = nRno.val();	//get rno from input
				var rereplyerH = '<sec:authentication property="principal.username"/>';
			
				replyService.get(rno, function(reply){	//get rno and bno from replyService.get, and inject to inputs of modal for modify rereply 
					nRno.val(reply.rno);		
					nBno.val(reply.bno);
				});
			
			
				var rereply ={		//put them in the var from 'Leave comments' area
						rereply: nRereply.val(),
						rereplyer: rereplyerH,
						rno: nRno.val(),
						bno: nBno.val()
				};
				
				if(rereply.rereply == "" || rereply.rereply == null || rereply.rereply == undefined || 
						( rereply.rereply != null && typeof rereply.rereply == "object" && !Object.keys(rereply.rereply).length )){
					console.log('Nothing on the textarea for rereply');
					return;
				}
				
			
				rereplyService.add(rereply, function(result){
					alert(result);
					$(".modalForNewRrep").find("textarea[name='rereply']").val("");	//make textarea empty after register
					
					$(".modalForNewRrep").modal("hide");
					//location.reload();
					var rnoValue = rereply.rno;
					showRrepList(1,rnoValue);
					
				});	
			</sec:authorize>
			
		});
		// End Of register on modal for New rereply
		
		
		//reRepBtnCBHclose
		$(".chat").on("click", "#reRepBtnCBHclose", function(e){
			var rno = $(this).data("rno");
			$(".rerepHH[data-rnoForRrep="+rno+"]").css('display','none');
		});
		//End Of reRepBtnCBHclose
		
		
		//Open Modal for Modify rereply
		var mRereply = $(".modalForModRrep").find("textarea[name='rereply']");
		var mRereplyer = $(".modalForModRrep").find("input[name='rereplyer']");
		var mBno = $(".modalForModRrep").find("input[name='bno']");
		var mRno = $(".modalForModRrep").find("input[name='rno']");
		var mRrno = $(".modalForModRrep").find("input[name='rrno']");
		
		$(".chat").on("click", "#modRrepBtn", function(e){
			
			<sec:authorize access="isAnonymous()">
				alert("로그인 후에 수정할 수 있습니다.");
			</sec:authorize>
			
			
			<sec:authorize access="isAuthenticated()">
				
			
				var rrno = $(this).data("rrno");	//get rrno from data-rrno on the modRrepBtn button
				var writer = $(this).data("writer");  //get writer from data-writer on the modRrepBtn button to compare writer and user signed in
				
				var rereplyerM = '<sec:authentication property="principal.username"/>';		
				
				
				if(rereplyerM != writer) {
					alert("작성자만 수정할 수 있습니다.");
					return;
				}
				
				rereplyService.get(rrno, function(reply){	
					mRno.val(reply.rno);		
					mBno.val(reply.bno);
					mRrno.val(reply.rrno);
					mRereply.val(reply.rereply);
				});
				
				mRereplyer.val(rereplyerM); 
				
				$(".modalForModRrep").modal("show");
			
			</sec:authorize>
			
		});
		//End Of Open Modal for Modify
		
		// Modify Rereply on modal
		$(".modalForModRrep").on("click", "#rRepModalModBtn", function(e){
			
			var rereply ={
					rereply: mRereply.val(),
					rereplyer: mRereplyer.val(),
					rno: mRno.val(),
					rrno: mRrno.val(),
					bno: mBno.val()
			};
			
			rereplyService.update(rereply, function(result){
				alert(result);
				$(".modalForModRrep").modal("hide");
				//location.reload();
				var rnoValue = rereply.rno;
				showRrepList(1,rnoValue);
			});
		});
		
		
		// Remove Rereply on modal
		$(".modalForModRrep").on("click", "#rRepModalRemoveBtn", function(e){
			
			var rereply ={
					rereply: mRereply.val(),
					rereplyer: mRereplyer.val(),
					rno: mRno.val(),
					rrno: mRrno.val(),
					bno: mBno.val()
			};
			
			var rrno = rereply.rrno;
			var rereplyer = rereply.rereplyer;
			var rno = rereply.rno;
			
			rereplyService.remove(rrno, rereplyer, function(result){
				alert(result);
				$(".modalForModRrep").modal("hide");
				//location.reload();
				var rnoValue = rereply.rno;
				showRrepList(1,rnoValue);
				
			});
		});
		
	
	// Modify reply on the modal
	modalModBtn.on("click", function(e){
		
		var originalReplyer = modalInputReplyer.val();
		var reply = {rno:modal.data("rno"), reply: modalInputReply.val(), replyer: originalReplyer};
		
		if(!replyer){
			alert("로그인 후 수정이 가능합니다.");
			modal.modal("hide");
			return;
		}
		
		console.log("Original Replyer: " + originalReplyer);  //댓글 원래 작성자
		
		if(replyer != originalReplyer){
			alert("자신이 작성한 댓글만 수정이 가능합니다.");
			modal.modal("hide");
			return;
		}
		
		replyService.update(reply, function(result){	
			alert(result);
			modal.modal("hide");
			showList(pageNum);
		});
	});
	

	//Delete Reply on the modal
	modalRemoveBtn.on("click", function(e){
	
		var rno = modal.data("rno");
		
		console.log("RNO: " +rno);
		console.log("REPLYER: " + replyer);
		
		if(!replyer){
			alert("로그인 후 삭제가 가능합니다.");
			modal.modal("hide");
			return;
		}
		
		var originalReplyer = modalInputReplyer.val();
		
		console.log("Original Replyer: " + originalReplyer);
		
		if(replyer != originalReplyer){
			alert("자신이 작성한 댓글만 삭제 가능합니다.");
			modal.modal("hide");
			return;
		}
		replyService.remove(rno, originalReplyer, function(result){
			alert(result);
			modal.modal("hide");
			//location.reload();
			showList(pageNum);
		});
	});
	
	
	//Paging Number View for Reply
	var pageNum = 1;
	var replyPageFooter = $(".panel-footer");
	
	function showReplyPage(replyCnt){
		
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum - 9;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= replyCnt){
			endNum = Math.ceil(replyCnt/10.0);
		}
		
		if(endNum * 10 < replyCnt){
			next = true;
		}
		
		var str = "<div class='pagination center'><ul class='pagination-list'>";
		
		if(prev){
			str+="<li class='paginate_button'><a href='"+(startNum -1)+"'>Prev</a></li>";
		}
		
		for(var i = startNum; i <= endNum; i++){
			
			var active = pageNum == i? "active":"";
			
			str+="<li class='paginate_button "+active+" '><a href='"+i+"'>"+i+"</a></li>";	
		}
		
		if(next){
			str+="<li class='paginate_button'><a href='"+(endNum + 1)+"'>Next</a></li>";
		}
		
		str +="</ul></div>";
		
		console.log(str);
		
		replyPageFooter.html(str);
		
		
		} // End Of Paging Number View for Reply
	
	replyPageFooter.on("click","li a", function(e){
		
		e.preventDefault();
		console.log("page click");
		
		var targetPageNum = $(this).attr("href");
		
		console.log("targetPageNum: " + targetPageNum);
		
		pageNum = targetPageNum;
		
		showList(pageNum);
		
		});
	
	});	//End Of Document Ready 
</script>


<script type="text/javascript">
//This Document Ready is for btn for board btn
$(document).ready(function(){
	
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action", "/menu/gallery/modify").submit();
		
	});
	
	$("button[data-oper='list']").on("click", function(e){
		
		operForm.find("#bno").remove();
		operForm.attr("action","/menu/gallery/list")
		operForm.submit();		
	});	
});


</script>


<script>
//This Document Ready is for upload image and file
$(document).ready(function(){
	(function(){
		var bno = '<c:out value="${board.bno}"/>';
		
		$.getJSON("/menu/gallery/getAttachList", {bno: bno}, function(arr){
			
			console.log(arr);
			
			var str = "";
			
			$(arr).each(function(i, attach){
				
				//image type
				if(attach.fileType){
					var fileCallPath = encodeURIComponent( attach.uploadPath+ "/"+attach.uuid+"_"+attach.fileName);
					
					str += "<li data-path='"+attach.uploadPath+"'";
					str += " data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'";
					str += "><div>";
					str += "<img src='/galleryDisplay?fileName="+fileCallPath+"'>";
					str += "</div>";
					str +="</li>";
				
				} else{
					str += "<p class='attachFileNo'>[첨부파일]</p>"
					str += "<li data-path='"+attach.uploadPath+"'";
					str += " data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'";
					str += " class='attachFileClick'><div>";
					str += "<span class='attachFileNameC'>" + attach.fileName +"</span><br>";
					//str += "<img src='/resources/images/attach.png'>";
					str += "</div>";
					str += "</li>";
					
				}
			});
			$(".uploadResult ul").html(str);
			
			
		});//end getJson
		
	})();//end function	
	
	
	$(".uploadResult").on("click","li[class='attachFileClick']",function(e){
		
		console.log("uploadResult Clicked");
		
		<sec:authorize access="isAnonymous()">
			alert("You can download after sign in");
		</sec:authorize>
		
		<sec:authorize access="isAuthenticated()">
		
		var liObj = $(this);
		
		var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_"+ liObj.data("filename"));
		
		if(liObj.data("type")){
			//showImage(path.replace(new RegExp(/\\/g),"/"));	//I don't use this function which is show picture bigger (I deleted)
		}else{
			self.location="/galleryDownload?fileName="+path;	//download
		}
		
		</sec:authorize>
		
	});
	
});


</script>


<%@include file="/WEB-INF/views/includes/footer.jsp" %>