<%@include file="/WEB-INF/views/includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*" %>

<!-- --------------------------------------   memoByHwan  Cut here for Header   --------------------------------------   -->

<!-- Start Breadcrumbs -->
<div class="breadcrumbs overlay cafePageHwan">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
                <div class="breadcrumbs-content">
                    <h1 class="page-title">Notice</h1>
                </div>
            </div>
        </div>
    </div>
</div> 
<!-- End Breadcrumbs --> 


<!-- List Start -->
<section class="courses section grid-page tableHwan">
    <div class="container">
        <div class="row">
            <div class="search-job searchHwanMargin">
            
<!-- memoByHwan Start Form tag for Category Search -->
            	<form id='searchForm' action="/menu/cafe/notice/list" method="get">
                        <div class="row">
                            <div class="col-lg-5 col-md-4 col-xs-12">
                                <div class="form-group">
                                    <select name="type" class="select">
                                    	<option value=""
             								<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>Choose Category</option>
             							<option value="A"
             								<c:out value="${pageMaker.cri.type eq 'A'?'selected':''}"/>>All</option>
             							<option value="M"
             								<c:out value="${pageMaker.cri.type eq 'M'?'selected':''}"/>>MOYM</option>
             							<option value="B"
             								<c:out value="${pageMaker.cri.type eq 'B'?'selected':''}"/>>Performance</option>
             							<option value="R"
             								<c:out value="${pageMaker.cri.type eq 'R'?'selected':''}"/>>Upcoming</option>
             								
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-xs-12">
                                <div class="form-group">
                                    <input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' class="margin-5px-bottom searchGallary" placeholder="Type keywords"/>
             						<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
             						<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-xs-12 button">
                                <button class="btn btn-common float-right filterBtnH">Filter</button>
                                <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')">		
									<button type='button' id='regBtn' class="btn btn-common float-right">Write</button>
								</sec:authorize>
                                
                            </div>
                        </div>
                </form>
<!-- memoByHwan End Form -->
                
            </div>
        </div>

        <div class="row">
            <div class="table-responsive">
            <table class="table table-striped tableMarginTopC">
                <thead class="table-primary">
                  <tr>
                    <th scope="col" class="col-12">Notice</th>
                    <!-- 
                    <th scope="col" class="col-2">Writer</th>
                  	 -->
                  </tr>
                </thead>
                <tbody>
                
                <c:forEach items="${list}" var="board">
                  <tr>
                    <td>
                    	<div class="row">
                        	<a class="move" href="<c:out value="${board.bno}"/>">
                        		<h4><c:out value="${board.title}"/> </h4>
                        	</a>
                        </div>
                        <div class="infoTable">
                        	<i class="lni lni-calendar"> <fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></i>
                        	<i class="lni lni-tag"> <c:out value="${board.category}"/></i>
                        	<i class="lni lni-eye">(<c:out value="${board.viewCnt}"/>)</i>
                        	<i class="lni lni-comments">(<c:out value="${board.replyCnt}"/>)</i>
                        	<i class="lni lni-pencil"> <c:out value="${board.writer}"/></i>
                        </div>
                    </td>
                  </tr>
                 </c:forEach>
                  
                  
                </tbody>
              </table>
            </div>
        </div>

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
        <form id = 'actionForm' action="/menu/cafe/notice/list" method="get">
           	<input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
           	<input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
           	<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
          	<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>
          	
        </form>     

    </div>
</section>
<!--  List end   -->

        <!-- Register Success Modal -->
        <div class="modal fade form-modal" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog max-width-px-840 position-relative">
                <div class="login-modal-main modalForNoticeH">
                    <div class="row no-gutters">
                        <div class="col-12">
                            <div class="row">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Success</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                  </div>

                                    <div class="modal-body">
                                        <p>Success</p>
                                    </div>
                                    <div class="modal-footer">
                                        <div class="form-group mb-8 button">
                                            <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">Close</button>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Reply Modal -->








<!-- --------------------------------------   memoByHwan  Cut here for Footer   --------------------------------------   -->


<%@include file="/WEB-INF/views/includes/footer.jsp" %>



<script type="text/javascript">
	$(document).ready(function(){
		var result = '<c:out value="${result}"/>';
		checkModal(result);
		history.replaceState({},null,null);
		
		function checkModal(result){
			
			if(result === '' || history.state){
				return;
			}
			$(".modal-body").html(result);
			
			$("#myModal").modal("show");			
		}				
		
		$("#regBtn").on("click", function(){
			self.location = "/menu/cafe/notice/register";
		});
		
	
	var actionForm = $("#actionForm");
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	
	$(".move").on("click", function(e){
		
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action","/menu/cafe/notice/get");
		actionForm.submit();

	});
	
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
	
	});
</script>