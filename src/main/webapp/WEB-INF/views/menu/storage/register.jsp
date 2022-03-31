<%@include file="/WEB-INF/views/includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- --------------------------------------   memoByHwan  Cut here for Header   --------------------------------------   -->

<!-- Start Breadcrumbs -->
<div class="breadcrumbs overlay storagePageHwan">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
                <div class="breadcrumbs-content">
                    <h1 class="page-title">Storage</h1>
                    <p>다양한 자료가 있는 창고입니다.  <br> 유용한 도구들을 당신의 작품에 활용하세요.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->



    <!--     memoByHwan     -->

    <!-- Start Contact Area -->
    <section id="contact-us" class="contact-us section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="form-main">
                        <h3 class="title"><span>Master Of Your Masterpieces</span>
                            Write down
                        </h3>
                        <form class="form" role="form" action="/menu/storage/register" method="post" id='regPostForm'>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Title</label>
                                        <input name="title" type="text" class='titleInpH'>
                                    </div>
                                </div>
                                
                                <div class="col-lg-3 col-12">
                                    <div class="form-group">
                                        <label>Choose Category</label>
                                        <select class="select" name="category">                                
                                            <option value="none" selected></option>
                                            <option value="songwriting">Song Writing</option>
                                            <option value="freesounds">Free Sounds</option>
                                            <option value="usefulapps">Useful Apps</option>
                                            <option value="stuffs">Stuffs</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="col-lg-3 col-12">
                                    <div class="form-group">
                                        <label>writer</label>
                                        <input name="writer" type="text" value='<sec:authentication property="principal.username"/>' readonly="readonly">
                                    </div>
                                </div>
                                
                                <div class="col-lg-6 col-12">
                                    <div class="form-group">
                                        <label>Youtube Link</label>
                                        <input name="ytlink" type="text" value='' placeholder='type if you need to'>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-12">
                                    <div class="form-group">
                                        <label>Quotation Content</label>
                                        <input name="quocon" type="text" value='' placeholder='type if you need to'>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-12">
                                    <div class="form-group">
                                        <label>Quotation From</label>
                                        <input name="quofrom" type="text" value='' placeholder='type if you need to'>
                                    </div>
                                </div>
                                
                                <div class="col-lg-5 col-12">
                                    <div class="choose-img">
                                    <label>Main Picture</label>
                                    	<!-- zxc -->
                                    	<div class='button'>
                                    		<div class='btn uploadThBtn'>
                                    			<span class='uploadBtnS'>Choose file</span>
                                    		</div>
                                    	</div>
                                       	<input type="file" name='uploadThumbn' multiple="multiple" class='mainP'>
                                       	<p>Maximum file size: 2 MB</p>
                                    </div>
                                </div>
                                <div class='col-lg-7 col-12 uploadResultTh'>
                                	<ul>
                                	</ul>
                                </div>
                                
                                
                                <div class="col-12">
                                    <div class="form-group message">
                                        <label>Contents</label>
                                        <textarea name="content" row="5" class='contentInpH'></textarea>
                                    </div>
                                </div>

                                <div class="col-lg-5 col-12">
                                    <div class="choose-img">
                                    <label>Upload Image</label>
                                    	<div class='button'>
                                    		<div class='btn uploadBtnCSH'>
                                    			<span class='uploadBtnS'>Choose file</span>
                                    		</div>
                                    	</div>
                                        <input type="file" name='uploadFile' multiple="multiple"><!-- from Book -->
                                        <p>Maximum file size: 2 MB</p>
                                    </div>
                                </div>
                                
                                <div class='col-lg-7 col-12 uploadResult'>
                                	<ul>
                                	</ul>
                                </div>
                                
                                
                                
                                

                                <div class="col-12">
                                    <div class="form-group button">
                                        <button type="submit" class="btn registerBotMarH">Register</button>
                                        <button type="reset" class="btn registerBotMarH">Reset</button>
                                        <div class='btn registerBotMarH cancelToListC'>
                                        	<span>Cancel</span>
										</div>                                    
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
<script src="https://code.jquery.com/jquery-3.3.1.min.js" 
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" 
	crossorigin="anonymous"></script>
	
<script>
//zxc
$(document).ready(function(e){

	//It's for CSS
	$('.uploadThBtn').on("click",function(e){
		$("input[name='uploadThumbn']").trigger('click');
	});
	$('.uploadBtnCSH').on("click",function(e){
		$("input[name='uploadFile']").trigger('click');
	});
	
	
	$(".cancelToListC").click(function(){
		self.location="/menu/storage/list";
	});
	
	
	
	
	var formObj = $("form[id='regPostForm']");
	
	$("button[type='submit']").on("click", function(e){
		
		e.preventDefault();
		console.log("submit clicked");
		

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
			$(".titleInpH").focus();
			return;
		}
		if(contentVal == ""){
			alert("Write content");
			$(".contentInpH").focus();
			return;
		}
		// End of Check form Null
		
		
		
		var str ="";
		
		
		$(".uploadResult ul li").each(function(i, obj){
			
			var jobj = $(obj);
			
			console.dir(jobj);
			
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
			
		});
		
		
		var strTh = "";
		
		var mainPicCnt;
		var mainPicChk = false;
		var mainPicNullChl = false;
		
		$(".uploadResultTh ul li").each(function(i, obj){
			
			var jobj = $(obj);
			
			console.dir(jobj);
			
			strTh += "<input type='hidden' name='thumbList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			strTh += "<input type='hidden' name='thumbList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			strTh += "<input type='hidden' name='thumbList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			strTh += "<input type='hidden' name='thumbList["+i+"].fileType' value='"+jobj.data("type")+"'>";
			
			mainPicCnt = i;
			mainPicNullChl = true;
		});
		
		if(mainPicCnt == 0){
			mainPicChk = true;
		}
		
		var totalStr = str+strTh;
		
		//It's for only 1 main pic
		if(mainPicCnt > 0){
			$(".mainP").focus();
			alert('메인 사진은 하나만 선택할 수 있습니다.');
			return;
		}
		
		if(!mainPicNullChl){
			$(".mainP").focus();
			alert('메인 사진을 선택하세요.');
			return;
		}
		
		if(mainPicChk&&mainPicNullChl){
			formObj.append(totalStr).submit();
		}
		
		

		
	});
	
	
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB
	
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
	//asd
	//Thumbnail type check
	var regexTh = new RegExp("(.*?)\.(bmp|jpeg|jpg|gif|PNG|png|tiff|tif)$");
	
	function checkExtensionTh(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			//$("input[name='uploadThumbn']").val("");//make empty Input. However not neccessary anymore after CSS changed
			return false;
		}
		
		if(!regexTh.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	
	
	
	
	
	
	var csrfHeaderName ="${_csrf.headerName}";
	var csrfTokenValue="${_csrf.token}";
	
	$("input[name='uploadFile']").change(function(e){
		
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
				beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				data: formData,
					type: 'POST',
					dataType:'json',
					success: function(result){
					console.log(result);
					showUploadResult(result);
				}
			});	//ajax
		
	});//input
	
	//asd
	//this for thumbnail
	$("input[name='uploadThumbn']").change(function(e){
		
		var formData = new FormData();
		var inputFile = $("input[name='uploadThumbn']");
		var files = inputFile[0].files;
		
		for(var i = 0; i < files.length; i++){
			if(!checkExtensionTh(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url: '/thgalleryUploadAjaxAction',
				processData: false,
				contentType: false,
				beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				data: formData,
					type: 'POST',
					dataType:'json',
					success: function(result){
					console.log(result);
					showUploadResultTh(result);
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
				str += "><div><img src='/galleryDisplay?fileName="+fileCallPath+"'> <button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-circle'><i class='lni lni-close'></i></button>";
				str += "<br><span>" + obj.fileName +"</span>";
				str += "</div>";
				str += "</li>";
				
				
			} else{
				
				var fileCallPath = encodeURIComponent( obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
				
				var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				
				str += "<li data-path='"+obj.uploadPath+"'";
				str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'";
				str += "><div>";
				str += "<span>" + obj.fileName +"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-circle'><i class='lni lni-close'></i></button>";
				str += "</div>";
				str += "</li>";
				
				
			}
			
		});
		
		uploadUL.append(str);
		alert("Success to choose file!");
		
		
	}//showUploadResult
	

	//showUploadResult for Thumbnail 
	function showUploadResultTh(uploadResultArr){
		
		if(!uploadResultArr || uploadResultArr.length == 0){return;}
		
		var uploadUL = $(".uploadResultTh ul");
		
		var str ="";
		
		$(uploadResultArr).each(function(i,obj){
			
			//image type
			if(obj.image){
				
				var fileCallPath = encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid+"_"+obj.fileName);
				
				str += "<li data-path='"+obj.uploadPath+"'";
				str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'";
				str += "><div><img src='/thgalleryDisplay?fileName="+fileCallPath+"'> <button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-circle'><i class='lni lni-close'></i></button>";
				str += "<br><span>" + obj.fileName +"</span>";
				str += "</div>";
				str += "</li>";
				
				
			} else{
				
				var fileCallPath = encodeURIComponent( obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
				
				var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				
				str += "<li data-path='"+obj.uploadPath+"'";
				str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'";
				str += "><div>";
				str += "<span>" + obj.fileName +"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-circle'><i class='lni lni-close'></i></button>";
				str += "</div>";
				str += "</li>";
				
				
			}
			
		});
		
		uploadUL.append(str);
		alert("Success to choose file!");
		
		
	}//showUploadResult for thumbnail
	
	
	
	$(".uploadResult").on("click", "button", function(e){
		console.log("delete file");	
		
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		
		var targetLi = $(this).closest("li");
		
		$.ajax({
			url:'/galleryDeleteFile',
			data:{fileName: targetFile, type:type},
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			dataType: 'text',
			type: 'POST',
				success: function(result){
					alert(result);
					targetLi.remove();
				}
			
		});	//$.ajax
	});
	
	
	//Delete for Thumbnail
	$(".uploadResultTh").on("click", "button", function(e){
		console.log("delete file");	
		
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		
		var targetLi = $(this).closest("li");
		
		$.ajax({
			url:'/thgalleryDeleteFile',
			data:{fileName: targetFile, type:type},
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			dataType: 'text',
			type: 'POST',
				success: function(result){
					alert(result);
					targetLi.remove();
				}
			
		});	//$.ajax
	});
	
	
	
});//ready

</script>

<%@include file="/WEB-INF/views/includes/footer.jsp" %>