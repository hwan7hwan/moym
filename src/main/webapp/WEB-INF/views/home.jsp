<%@include file="/WEB-INF/views/includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*" %>
     <!-- --------------------------------------   memoByHwan  Cut here for Header   --------------------------------------   -->

    <!-- Start Hero Area -->
    <section class="hero-area style2">
        <!-- Single Slider -->
        <div class="hero-inner overlay" style="background-image: url('/resources/images/mainPic_1920x800.jpg');">
            <div class="container">
                <div class="row ">
                    <div class="col-lg-6 co-12">
                        <div class="home-slider">
                            <div class="hero-text">
                                <h1 class="wow fadeInUp" data-wow-delay=".5s">MOYM</h1>
                                <p class="wow fadeInLeft" data-wow-delay=".7s">Master Of Your Masterpieces <br>당신의 명작의 주인,<br><br>그리고 그들을 위한 MOYM
                                    </p>
                                <div class="button style2 wow fadeInLeft" data-wow-delay=".9s">
                                    <a href="/menu/gallery/list" class="btn">Into The Gallery<i class="lni lni-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/ End Single Slider -->
    </section>
    <!--/ End Hero Area -->

    <!-- Start Latest News Area -->
    <div class="latest-news-area style2 section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">At MOYM</h2>
                    </div>
                </div>
            </div>
            <div class="single-head">
                <div class="row">
                    <div class="col-lg-3 col-md-12 col-12">
                        <!-- Single News -->
                        <div class="single-news wow fadeInUp" data-wow-delay=".2s">
                            <div class="image">
                                <a href="/menu/gallery/list"><img class="thumb"
                                        src="/resources/images/indexGallery.jpg" alt="#"></a> <!-- memoByHwan 사이즈 270x200 지만 비율이 이정도면 잘 나옴 약 10x7 비율 -->
                            </div>
                            <div class="content-body">
                                <a href="/menu/gallery/list">
                                    <h4 class="title py-2">Gallery</h4><!-- memoByHwan add py-2-->
                                </a>
                                <div class="meta-data">
                                    <ul>
                                        <li>
                                            <a href="/menu/gallery/list">다양한 작품들을 소개하는 공간입니다. 이곳에서 당신이 모르는 새로운 아티스트 새로운 작품들을 만나보세요.</a>
                                        </li>
                                    </ul>
                                 </div>
                             </div>
                        </div>
                        <!-- End Single News -->
                        <!-- Single News -->
                        <div class="single-news wow fadeInUp" data-wow-delay=".2s">
                            <div class="image">
                                <a href="/menu/storage/list"><img class="thumb"
                                        src="/resources/images/indexStorage.jpg" alt="#"></a>
                            </div>
                            <div class="content-body">
                                <a href="/menu/storage/list">
                                    <h4 class="title py-2">Storage</h4>
                                </a>
                                <div class="meta-data">
                                    <ul>
                                        <li>
                                            <a href="/menu/storage/list">다양한 자료가 있는 창고입니다. 유용한 도구들을 당신의 작품에 활용하세요.</a>
                                        </li>
                                    </ul>
                                 </div>
                             </div>
                        </div>
                        <!-- End Single News -->
                    </div>
                    <div class="col-lg-6 col-md-12 col-12">
                        <!-- Single News -->
                        <div class="single-news big custom-shadow-hover wow fadeInUp" data-wow-delay=".4s">
                            <div class="image">
                                <a href="/menu/moym/aboutMoym"><img class="thumb"
                                        src="/resources/images/indexLogoSample.jpg" alt="#"></a><!-- memoByhwan 500x390  -->
                            </div>
                            <div class="content-body">
                               
                                <h4 class="title"><a href="/menu/moym/aboutMoym">MOYM</a></h4>
                                <p>당신이 아티스트라면 당신만의 공간을 가져보세요. <br>
                                   당신이 팬이라면 당신의 아티스트를 서포트해주세요.<br>
                                   당신이 공간을 가지고 있다면 아티스트들을 위한 공간을 제공해주세요.<br>
                                </p>
                                <div class="button">
                                    <a href="/menu/moym/aboutMoym" class="btn">Entrance</a>
                                </div>
                            </div>
                        </div>
                        <!-- End Single News -->
                    </div>
                    <div class="col-lg-3 col-md-12 col-12">
                        <!-- Single News -->
                        <div class="single-news wow fadeInUp" data-wow-delay=".2s">
                            <div class="image">
                                <a href="/menu/studio/list"><img class="thumb"
                                        src="/resources/images/indexStudio.jpg" alt="#"></a>
                            </div>
                            <div class="content-body">
                                    <a href="/menu/studio/list">
                                        <h4 class="title py-2">Studio</h4><!-- memoByHwan add py-2-->
                                    </a>
                                 <div class="meta-data">
                                        <ul>
                                            <li>
                                                <a href="/menu/studio/list">여러분도 아티스트가 될 수 있습니다. 창작에 도움이 되는 정보가 있는 공간입니다.</a>
                                            </li>
                                        </ul>
                                 </div>
                            </div>
                        </div>
                        <!-- End Single News -->
                        <!-- Single News -->
                        <div class="single-news wow fadeInUp" data-wow-delay=".2s">
                            <div class="image">
                                <a href="/menu/cafe/list"><img class="thumb"
                                        src="/resources/images/indexCafe.jpg" alt="#"></a>
                            </div>
                            <div class="content-body">
                                <a href="/menu/cafe/list">
                                    <h4 class="title py-2">Cafe</h4>
                                </a>
                                <div class="meta-data">
                                    <ul>
                                        <li>
                                            <a href="/menu/cafe/list">소통하는 공간입니다. 다양한 정보와 작품을 공유해보세요.</a>
                                        </li>
                                    </ul>
                                 </div>
                             </div>
                        </div>
                        <!-- End Single News -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Latest News Area -->

    <!-- Start Experience Area -->
    <section class="experience section">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-12">
                    <div class="left-content">
                        <div class="noticeSecC exp-title align-left">
                            <span class="boardName wow fadeInDown" data-wow-delay=".2s">The latest Notice</span>
                            	<h2 id='titleNot'class="wow fadeInUp" data-wow-delay=".4s">
                            		제목
                            	</h2>
                            <p id='contentNot' class="wow fadeInUp" data-wow-delay=".6s">
                            	내용
                            </p>
                            <div class="button wow fadeInUp" data-wow-delay="1s">
                                <a href="/menu/cafe/notice/list" class="btn">Go To Notice</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- asd -->
                <div class="col-lg-4 col-12 ">
                	<div class='noticeLatest'>
                	<h2 class='align-center moveToNotice'>Recent Notices</h2>
                	<c:forEach items="${notice}" var="notice" varStatus="status">
                    <div class='noticeLC'>
                        <a href="/menu/cafe/notice/get?bno=<c:out value="${notice.bno}"/>">
                        	<span data-indexN="<c:out value="${status.index}"/>" data-content="<c:out value="${notice.content}"/>" data-title="<c:out value="${notice.title}"/>" 
                        	data-bno="<c:out value="${notice.bno}"/>">
                        		<c:out value="${notice.title}"/>
                        	</span>
                        </a>
                        <div class="row"><i class="lni lni-calendar"> <fmt:formatDate pattern="yyyy-MM-dd" value="${notice.regdate}"/></i><i class="lni lni-tag"> <c:out value="${notice.category}"/></i></div>
                    </div>
                    </c:forEach>
                    </div>
                </div>
            </div>
            
            <!-- End Mini Call To Action -->
        </div>
    </section>
    <!-- /End Experience Area -->


    <!-- Start Courses Area -->
    <section class="courses style2 section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp" data-wow-delay=".2s">Latest</h2>   <!--  memoByHwan  이 부분 최근 게시물 서버에서 잘 구현 인덱스... -->
                    </div>                                                          <!--  memoByHwan  view more 누르면 6개 더 나오게끔 하자. -->
                </div> 
            </div>
            <div class="single-head"><!-- asd -->
                <div class="row">
                	<c:forEach items="${list}" var="board" varStatus="status">
                	<!-- Start Single Course -->
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="single-course wow fadeInUp" data-wow-delay=".2s">
                            <div class="course-image">
	                            <a class="move" id="dataId" href="<c:out value="${board.bno}"/>" data-pageinfo="<c:out value="${board.pageInfo}"/>">
                                	<img src='/thgalleryDisplay?fileName=<c:out value="${board.fileCallPath}"/>'>
                                </a>              
                            </div>
                            <div class="content">
                            	<a href="/menu/<c:out value="${board.pageInfo}"/>/list">
                                <p class="date bg-primary text-white"><c:out value="${board.pageInfo}"/></p>
                                </a>
                                <h3>
                                	<a class="move" id="dataId" href="<c:out value="${board.bno}"/>" data-pageinfo="<c:out value="${board.pageInfo}"/>">
                        				<c:out value="${board.title}"/>
                        			</a>
                                </h3>
                            </div>
                        </div>
                    </div>
                    <!-- End Single Course -->
                    </c:forEach>
                </div>
            </div>
        </div>
        <form id = 'actionForm' action="/" method="get">
        </form> 
        
    </section>
    <!-- End Courses Area -->
    
    


        <!-- Start Work Process Area -->
        <section class="work-process section breadcrumbs overlay aboutPageWhatHwan1">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3 col-12">
                        <div class="section-title align-center gray-bg">
                            <h2 class="wow fadeInUp" data-wow-delay=".4s">What MOYM Does</h2>
                        </div>
                    </div>
                </div>
                <div class="list">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-12">
                            <ul class="wow fadeInUp" data-wow-delay=".2s">
                                <li>
                                    <span class="serial">1</span>
                                    <p class="content">
                                        <span>감상</span>
                                        다양한 아티스트와 그들의 작품을 소개합니다. 인지도나 평판에 의한 것이 아닙니다. 숨겨진, 아직 많이 알려지지 않은 
                                        작품들까지 소개합니다. <br><br><br>
                                    </p>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-4 col-md-4 col-12">
                            <ul class="wow fadeInUp" data-wow-delay=".4s">
                                <li>
                                    <span class="serial">2</span>
                                    <p class="content">
                                        <span>공유와 소통</span>
                                        아티스트들은 작품과 그들의 세계관을 공유합니다. 좋은 공간을 가지고 있는 사람들은 그들의 공간을 공유하여 아티스트와 
                                        청중들을 연결해줍니다. 그리고 청중들은 그들의 작품을 통한 감정을 공유하고 아티스트들과 소통합니다.
                                    </p>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-4 col-md-4 col-12">
                            <ul class="wow fadeInUp" data-wow-delay=".6s">
                                <li>
                                    <span class="serial">3</span>
                                    <p class="content">
                                        <span>가치</span>
                                        아티스트의 작품의 최저 가치는 지속적으로 평가 절하되고 있습니다. 대중의 예술에 대한 인식과 미디어와 기술의 발전에 따른 본연의 가치가 훼손되고 있습니다.
                                        우리 MOYM은 그 가치를 되찾고 작품의 가치를 높이기 위해 존재합니다.
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /End Work Process Area -->

<!-- --------------------------------------   memoByHwan  Cut here for Footer   --------------------------------------   -->
<script type="text/javascript">
$(document).ready(function(){
	var result = '<c:out value="${result}"/>';
	if(result != ""){
		alert(result);
	}
	
	
	$(".moveToNotice").on("click", function(e){
		self.location="/menu/cafe/notice/list";
	});
	var actionForm = $("#actionForm");
	
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
		
	});//move
	
	
	var noticeCon ="";
	var noticeTit ="";
	var noticeBno;
	noticeCon = $('span[data-indexN="0"]').data('content');
	noticeTit = $('span[data-indexN="0"]').data('title');
	noticeBno = $('span[data-indexN="0"]').data('bno');
	
	var cutNoticeCon="";
	if(noticeCon.length > 300){
		cutNoticeCon = noticeCon.substr(0,300)+"...";
	}
	
	var strForTitleMove="";
	strForTitleMove +="<a href='/menu/cafe/notice/get?bno="+noticeBno+"'>";
	strForTitleMove +=noticeTit;
	strForTitleMove +="</a>";
	strForTitleMove +="";
	
	$('#titleNot').html(strForTitleMove);
	$('#contentNot').html(cutNoticeCon);
	
});//document

</script>





<%@include file="/WEB-INF/views/includes/footer.jsp" %>
