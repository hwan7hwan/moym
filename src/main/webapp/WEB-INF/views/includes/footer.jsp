<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    



    <!-- Start Footer Area -->
    <footer class="footer style2">
        <!-- Start Middle Top -->
        <div class="footer-middle">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-12">
                        <!-- Single Widget -->
                        <div class="f-about single-footer">
                            <div class="logo">
                                <a href="index.html"><img src="${path}/resources/images/logoSample.jpg" alt="Logo"></a>
                            </div>
                            <p>Master Of Your Masterpieces <br>당신의 명작의 주인,<br><br>그리고 그들을 위한 MOYM</p>
                        </div>
                        <!-- End Single Widget -->
                    </div>
                    <div class="col-lg-6 col-md-6 col-12">
                    	<div class="single-footer footer-newsletter">
                        	<h3>Q&A</h3>
                         <form action="/qnaSend" role='form' method="post" class="newsletter-form" id='qnaForm'>
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                         	<input name="emailq" placeholder="Your email address" type="email">
                         	<textarea name='contentq' rows="3" placeholder="Your question" class="form-control form-control-custom marTopInH"></textarea>
                         	<div class="button">
                         		<div class="btn" id='qnaBtn'><span>Ask</span></div>
                         	</div>
                         </form>
                         </div>
                   	</div>
                   	<div class="col-lg-3 col-md-3 col-12">
                   		<div class="single-footer sm-custom-border f-link">
                            <h3>Pages</h3>
                         <ul>
                        	<li><a href="/menu/gallery/list">Gallery</a></li>
                        	<li><a href="/menu/studio/list">Studio</a></li>
                        	<li><a href="/menu/storage/list">Storage</a></li>
                        	<li><a href="/menu/cafe/list">Cafe</a></li>
                        	<li><a href="/menu/moym/aboutMoym">MOYM</a></li>
                        </ul>
                        </div>
                   	</div>

                    
                </div>
            </div>
        </div>
        <!--/ End Footer Middle -->
        <!-- Start Footer Bottom -->
        <div class="footer-bottom"> 
            <div class="container">
                <div class="inner">
                    <div class="row">
                        <div class="col-12">
                            <div class="left">
                                <p>Designed and Developed by<a href="#" rel="nofollow"
                                        target="_blank">Hwan</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Footer Middle -->
    </footer>
    <!--/ End Footer Area -->


    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="${path}/resources/js/bootstrap.min.js"></script>
    <script src="${path}/resources/js/count-up.min.js"></script>
    <script src="${path}/resources/js/wow.min.js"></script>
    <script src="${path}/resources/js/tiny-slider.js"></script>
    <script src="${path}/resources/js/glightbox.min.js"></script>
    <script src="${path}/resources/js/main.js"></script>
    <script src="${path}/resources/js/customByHwan.js"></script>
    
    <!--  JS From Example in the book -->
    <!-- <script src="/resources/js/sb-admin-2.js"></script> --> <!-- It caused nav-menu opend -->
    
    
    <script src="${path}/resources/js/jquery.dataTables.min.js"></script>
     
      
    <script src="${path}/resources/js/jquery.js"></script>
    <!--
    <script src="/resources/js/dataTables.bootstrap.min.js"></script>   
	-->

<script type="text/javascript">
$(document).ready(function(){

	$('#qnaBtn').on("click",function(e){
		var qnaForm = $("#qnaForm");
		qnaForm.submit();
	});
});

</script>


    
    
    
</body>

</html>