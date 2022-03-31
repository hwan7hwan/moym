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
                        <h1 class="page-title">My Posts</h1>
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


<!-- List Start -->
<section class="courses section grid-page tableHwan">
    <div class="container">
    	
    	<form action='/' method='post' id='delChooseForm'>
        <div class="row">
            <div class="table-responsive">
            <table class="table table-striped tableMarginTopC">
                <thead class="table-primary">
                  <tr>
                  	<th scope="col" class="col-11">작성한 글</th>
                  	<th scope="col" class="col-1"><input name='allCheck' type='checkbox'></th>
                  </tr>
                </thead>
                <tbody>
                
                <c:forEach items="${list}" var="board" varStatus="status">
                  <tr>
                    <!-- asd -->
                    <td>
                    	<div class="row">
                        	<a class="move" id="dataId" href="<c:out value="${board.bno}"/>" data-pageinfo="<c:out value="${board.pageInfo}"/>">
                        		<h4><c:out value="${board.title}"/></h4>
                        	</a>
                        </div>
                        <div class="infoTable">
                        	<i class="lni lni-calendar"> <fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></i>
                        	<i class="lni lni-tag"> <c:out value="${board.pageInfo}"/></i>
                        	<i class="lni lni-eye">(<c:out value="${board.viewCnt}"/>)</i>
                        	<i class="lni lni-comments">(<c:out value="${board.replyCnt}"/>)</i>
                        	<i class="lni lni-pencil"> <c:out value="${board.writer}"/></i>
                        </div>
                    </td>
                    <td>
                    	<input name='delChoose' type='checkbox' value='<c:out value="${board.bno}"/>'>
                    	<input name='pageChoose' type='hidden' value='<c:out value="${board.pageInfo}"/>'>
                    </td>
                  </tr>
                  	
                 </c:forEach>
                  
                  
                </tbody>
              </table>
            </div>
            <div class='button'>
            	<div class='btn' id='delQnABtn'>
            		<span>Delete</span>
            	</div>
            </div>
        </div>
		</form>
        <div class="row">
            <div class="col-12">
                <!-- Pagination -->
                <div class="pagination center">
                    <ul class="pagination-list">
                    
                    <c:if test="${pageMaker.prev}">
                        <li class="paginate_button">
                        	<a href="${pageMaker.startPage -1}">Prev</a>
                        </li>
                    </c:if>
                    
                    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
             			<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':'' } ">
             			<a href="${num}">${num}</a>
             			</li>
             		</c:forEach>
                    
                    <c:if test="${pageMaker.next}">
             			<li class="paginate_button">
             			<a href="${pageMaker.endPage +1}">Next</a>
             			</li>
             		</c:if>
             		
                    </ul>
                </div>
                <!--/ End Pagination -->
            </div>
        </div>
        <!-- To send page info to server  -->
        <form id = 'actionForm' action="/member/myPost" method="get">
           	<input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
           	<input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
           	<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
          	<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>
          	
        </form>     

    </div>
</section>
<!--  List end   -->





<!-- --------------------------------------   memoByHwan  Cut here for Footer   --------------------------------------   -->


<script type="text/javascript">
$(document).ready(function(){
	
	var result = '<c:out value="${result}"/>';
	if(result != ""){
		alert(result);
	}
	
	var actionForm = $("#actionForm");
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});


	//asd
	$(".move").on("click", function(e){
		
		var pageInfo = $(this).data('pageinfo');
		
		if(pageInfo == 'chat'){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");	//이 값이 href에 있던 bno 값.
			actionForm.attr("action","/menu/cafe/get");
			actionForm.submit();
		} else if(pageInfo == 'notice'){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");	
			actionForm.attr("action","/menu/cafe/notice/get");
			actionForm.submit();
		} 
		else {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");	
			actionForm.attr("action","/menu/"+pageInfo+"/get");
			actionForm.submit();
		}
		
		

	});
	
	/*
	var searchForm = $("#searchForm");
	
	$("#searchForm .filterBtnH").on("click", function(e){
		
		if(!searchForm.find("option:selected").val()){
			alert("Choose A Category");
			return false;
		}
		
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		
		searchForm.submit();
		
		
	});
	*/
	
	var chkObj = document.getElementsByName("delChoose");
	var rowCnt = chkObj.length;
	
	
	$("input[name='allCheck']").click(function(){
		var chk_listArr = $("input[name='delChoose']");
		for (var i=0; i<chk_listArr.length; i++){
			chk_listArr[i].checked = this.checked;
		}
	});
	
	$("input[name='delChoose']").click(function(){
		if($("input[name='delChoose']:checked").length == rowCnt){
			$("input[name='allCheck']")[0].checked = true;
		}
		else{
			$("input[name='allCheck']")[0].checked = false;
		}
	});
	
	var csrfHeaderName ="${_csrf.headerName}";
	var csrfTokenValue="${_csrf.token}";
	
	
	
	//Ajax spring security header...
	$(document).ajaxSend(function(e,xhr,options){
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});

	function deleteValue(){
		var url = "removeChosenMP"; 
		var valueArr = new Array();
		var valueArrP = new Array();
	    var list = $("input[name='delChoose']");
	    var listP = $("input[name='pageChoose']");
	    for(var i = 0; i < list.length; i++){
	        if(list[i].checked){ 
	            valueArr.push(list[i].value);
	            valueArrP.push(listP[i].value);
	        }
	    }
	    if (valueArr.length == 0){
	    	alert("선택된 글이 없습니다.");
	    }
	    else{
			var chk = confirm("정말 삭제하시겠습니까?");				 
			$.ajax({
			    url : url,                    
			    type : 'POST',                
			    traditional : true,
			    data : {
			    	valueArr : valueArr,
			    	valueArrP : valueArrP
			    },
                success: function(jdata){
                    if(jdata = 1) {
                        alert("삭제 성공");
                        location.replace("myPost")
                    }
                    else{
                        alert("삭제 실패");
                    }
                }
			});
		}
	}
	
	$("#delQnABtn").on("click", function(e){
		deleteValue();
	});	
	
	
	
	

});//document
</script>





<%@include file="/WEB-INF/views/includes/footer.jsp" %>



