<%@include file="/WEB-INF/views/includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


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

<!-- Start Contact Area -->
    <section id="contact-us" class="contact-us section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="form-main">
                        <h3 class="title"><span>Master Of Your Masterpieces</span>
                            Modify
                        </h3>
                        <form class="form" role="form" action="/menu/cafe/notice/modify" method="post" id='modForm'>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        
                        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
						<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
						<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
						<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
					
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Title</label>
                                        <input name="title" type="text" value='<c:out value="${board.title}"/>'>
                                    </div>
                                </div>
                                
                                <div class="col-lg-3 col-12">
                                    <div class="form-group">
                                        <label>Choose Category</label>
                                        <select class="select" name="category">                                
                                            <option value="none" selected></option>
                                            <option value="moym">MOYM</option>
                                            <option value="performance">Performance</option>
                                            <option value="upcoming">Upcoming</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="col-lg-3 col-12">
                                    <div class="form-group">
                                        <label>writer</label>
                                        <input name="writer" type="text" value='<c:out value="${board.writer}"/>' readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-lg-3 col-12">
                                    <div class="form-group">
                                        <label>Bno</label>
                                        <input name="bno" type="text" value='<c:out value="${board.bno}"/>' readonly="readonly">
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    <div class="form-group message">
                                        <label>Contents</label>
                                        <textarea name="content" row="3"><c:out value="${board.content}"/></textarea>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-group message">
                                        <label>Upload Image</label>
                                    </div>
                                    
                                    <!-- memoByHwan It's for showing images -->
                                    <div class='bigPictureWrapper'> 
                                    	<div class='bigPicture'>
                                    	</div>
                                    </div>
                                    
                                    
                                    <div class="choose-img">
                                    	<div class='button'>
                                    		<div class='btn uploadBtnCSH'>
                                    			<span class='uploadBtnS'>Choose file</span>
                                    		</div>
                                    	</div>
                                        <input type="file" name='uploadFile' multiple="multiple"><!-- from Book -->
                                        <p>Maximum file size: 2 MB</p>
                                    </div>
                                    
                                    <div class='col-12 uploadResult'>
                                    		<ul>
                                    		</ul>
                                    	</div>
                                	</div>
                                
                                

                                <div class="col-12">
                                    <div class="form-group button">
                                    
                                    <sec:authentication property="principal" var="pinfo"/>
                                    	<sec:authorize access="isAuthenticated()">
											<c:if test="${pinfo.username eq board.writer}">
                                        <button type="submit" data-oper='modify' id='modifyChat' class="btn registerBotMarH">Modify</button>
                                        <button type="submit" data-oper='remove' class="btn registerBotMarH">Remove</button>
                                        	</c:if>
										</sec:authorize>
										
                                        <button type="submit" data-oper='list' class="btn registerBotMarH">Cancel</button>
                                    
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
	
	//It's for CSS
	$('.uploadBtnCSH').on("click",function(e){
		$("input[name='uploadFile']").trigger('click');
	});
	
	var formObj = $("form[id='modForm']");
	
	$('button').on("click", function(e){
		
		e.preventDefault();
		

		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action", "/menu/cafe/notice/remove");
		}else if(operation === 'list'){
			//move to list
			formObj.attr("action", "/menu/cafe/notice/list").attr("method","get");
			
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
			
			// Check form Null
			var selectCat = $(".form-main").find("select[name='category']");
			var titleInp = $(".form-main").find("input[name='title']");
			var contentInp = $(".form-main").find("textarea[name='content']");
			var selectVal = selectCat.val();
			var titleVal = titleInp.val();
			var contentVal = contentInp.val();
			
			if(selectVal == "none"){
				alert("Choose category");
				$(".select").focus();
				return;
			}
			if(titleVal == ""){
				alert("Write title");
				titleInp.focus();
				return;
			}
			if(contentVal == ""){
				alert("Write content");
				contentInp.focus();
				return;
			}
			// End of Check form Null
			
			console.log("submit clicked");
			var str ="";
			$(".uploadResult ul li").each(function(i,obj){
				var jobj = $(obj);
				console.dir(jobj);
				
				str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
			});
			formObj.append(str).submit;
			}
		formObj.submit();
	});
	
});

</script>

<script>
$(document).ready(function(){
	(function(){
		
		var bno = '<c:out value="${board.bno}"/>';
		
		$.getJSON("/menu/cafe/notice/getAttachList", {bno: bno}, function(arr){
			
			console.log(arr);
			
			var str="";
			
			
			$(arr).each(function(i, attach){
				
				//image type
				if(attach.fileType){
					var fileCallPath = encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid+"_"+attach.fileName);
					
					str += "<li data-path='"+attach.uploadPath+"'";
					str += " data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'";
					str += "><div>";
					str += "<span> "+ attach.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image'";
					str += "class='btn btn-circle'><i class='lni lni-close'></i></button><br>";
					str += "<img src='/galleryDisplay?fileName="+fileCallPath+"'>";
					str += "</div>";
					str +="</li>";
				
				} else{
					str += "<li data-path='"+attach.uploadPath+"'";
					str += " data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'";
					str += "><div>";
					str += "<span>" + attach.fileName +"</span><br>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file'";
					str += "class='btn btn-circle'><i class='lni lni-close'></i></button><br>";
					//str += "<img src='/resources/images/attach.png'>";
					str += "</div>";
					str += "</li>";
					
				}
			});
			
			$(".uploadResult ul").html(str);
			
		});//end getJSON
		
	})(); //end function
	
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; 
	
	function checkExtension(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	//첨부파일 추가
	var csrfHeaderName ="${_csrf.headerName}";
	 var csrfTokenValue="${_csrf.token}";
	
	
	$("input[type='file']").change(function(e){
		
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		
		for(var i = 0; i < files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		
		
		$.ajax({
			url: '/galleryUploadAjaxAction',
				processData: false,
				contentType: false,
				data: formData,
					type: 'POST',
					beforeSend: function(xhr){
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					dataType:'json',
					success: function(result){
					console.log(result);
					showUploadResult(result);// Function for result of upload
				}
			});	//ajax
		
		
	});//input
	
	
	
	function showUploadResult(uploadResultArr){
		
		if(!uploadResultArr || uploadResultArr.length == 0){return;}
		
		var uploadUL = $(".uploadResult ul");
		
		var str ="";
		
		$(uploadResultArr).each(function(i,obj){
			
			//image type
			if(obj.image){
				
				var fileCallPath = encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid+"_"+obj.fileName);
				
				str += "<li data-path='"+obj.uploadPath+"'";
				str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'";
				str += "><div>";
				str += "<span>" + obj.fileName +"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\'";
				str += "data-type='image' class='btn btn-circle'><i class='lni lni-close'></i></button><br>";
				str += "<img src='/galleryDisplay?fileName="+fileCallPath+"'>";
				str += "</div>";
				str += "</li>";
				
				
			} else{
				
				var fileCallPath = encodeURIComponent( obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
				
				var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				
				str += "<li data-path='"+obj.uploadPath+"'";
				str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'";
				str += "><div>";
				str += "<span>" + obj.fileName +"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-circle'><i class='lni lni-close'></i></button><br>";
				//str += "<img src='/resources/images/attach.png'>";
				str += "</div>";
				str += "</li>";
				
				
			}
			
		});
		
		uploadUL.append(str);
		alert("Success to choose file!");
		
	}//showUploadResult
	
});


$(".uploadResult").on("click", "button", function(e){
	
	console.log("delete file");
	
	if(confirm("Remove this file???")){
		
		var targetLi = $(this).closest("li");
		targetLi.remove();
		
	}
	
});

</script>