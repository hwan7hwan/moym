<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">


<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>MOYM - Master Of Your Masterpieces</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/logoSample.jpg" />
    <!-- Place favicon.ico in the root directory -->

    <!-- Web Font -->
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${path}/resources/css/LineIcons.2.0.css" />
    <link rel="stylesheet" href="${path}/resources/css/animate.css" />
    <link rel="stylesheet" href="${path}/resources/css/tiny-slider.css" />
    <link rel="stylesheet" href="${path}/resources/css/glightbox.min.css" />
    <link rel="stylesheet" href="${path}/resources/css/main.css" />
    <link rel="stylesheet" href="${path}/resources/css/customByHwan.css" />



</head> 

<body>
    <!--[if lte IE 9]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
        your experience and security.
      </p>
    <![endif]-->

    <!-- Preloader -->
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- /End Preloader -->
    

    <!-- Start Header Area -->
    <header class="header navbar-area"> 

        <!-- Login Toolbar Start -->
        <div class="toolbar-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-6 col-12">
                        <div class="toolbar-social">
                            <ul>
                                <li><span class="title">Follow Us On : </span></li>
                                <li><a href="javascript:void(0)"><i class="lni lni-facebook-original"></i></a></li>
                                <li><a href="javascript:void(0)"><i class="lni lni-twitter-original"></i></a></li>
                                <li><a href="javascript:void(0)"><i class="lni lni-instagram"></i></a></li>
                                <li><a href="javascript:void(0)"><i class="lni lni-linkedin-original"></i></a></li>
                                <li><a href="javascript:void(0)"><i class="lni lni-google"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="toolbar-login">
                            <div class="button">
                            	<sec:authorize access="isAnonymous()">
                                	<a href="/member/createAccount">Create an Account</a>
                                </sec:authorize>
                                <sec:authorize access="isAnonymous()">
                              		<a href="/customLogin" class="btn">Sign In</a>
                           		</sec:authorize>
                           		<sec:authorize access="isAuthenticated()">
                           			<a href="/member/myPageAccount" id='myPageBtn'>My Page</a>
                                </sec:authorize>
                                
                                <sec:authorize access="isAuthenticated()">
                                	<form id="signOutBtnForm" method="post" class='btn'>
                        	 			<div class="signOutBtn">
                        	 				<span>Sign Out</span>
                        				</div>
                        				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        			</form>
                                </sec:authorize>
                                
                             
                            
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

 
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                <div class="nav-inner">
                    <nav class="navbar navbar-expand-lg">
                        <a class="navbar-brand" href="/">
                            <img src="/resources/images/logoSample.jpg" alt="Logo">
                        </a>
                        <button class="navbar-toggler mobile-menu-btn" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="toggler-icon"></span>
                            <span class="toggler-icon"></span>
                            <span class="toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul id="nav" class="navbar-nav ms-auto">
                                <li class="nav-item"><a href="/menu/gallery/list">Gallery</a></li>
                                <li class="nav-item"><a href="/menu/studio/list">Studio</a></li>
                                <li class="nav-item"><a href="/menu/storage/list">Storage</a></li>

                                <li class="nav-item">
                                    <a class="page-scroll dd-menu collapsed" href="javascript:void(0)"
                                        data-bs-toggle="collapse" data-bs-target="#submenu-1-5"
                                        aria-controls="navbarSupportedContent" aria-expanded="false"
                                        aria-label="Toggle navigation">Cafe</a>
                                    <ul class="sub-menu collapse" id="submenu-1-5">
                                        <li class="nav-item"><a href="/menu/cafe/list">Chat</a></li>
                                        <li class="nav-item"><a href="/menu/cafe/notice/list">Notice</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item"><a href="/menu/moym/aboutMoym">MOYM</a></li>  <!-- This page is like about page for a moment-->
                            </ul>
                        </div> <!-- navbar collapse -->
                    </nav> <!-- navbar -->
                </div>
                </div>
            </div> <!-- row -->
        </div> <!-- container --> 
    </header>
    <!-- End Header Area -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>

$(document).ready(function(){
	$(".signOutBtn").click(function(){
		$("#signOutBtnForm").attr("action", "/customLogout");
		$("#signOutBtnForm").submit();
	});
	
	
	
});

</script>
	
	
	
