<%@include file="/WEB-INF/views/includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="java.util.*" %>

<!-- --------------------------------------   memoByHwan  Cut here for Header   --------------------------------------   -->


    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs overlay aboutPageHwan">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">About Us</h1>
                    </div>
                    <ul class="breadcrumb-nav">
                        <li><a href="/">Home</a></li>
                        <li>About Us</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
    
    <!-- Start About Us Area -->
    <section class="about-us section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-12">
                    <div class="about-left">
                        <div class="about-title align-left">
                            <span class="wow fadeInDown" data-wow-delay=".2s">Master Of Your Masterpieces</span>
                            <h2 class="wow fadeInUp" data-wow-delay=".4s">Welcome to MOYM</h2>
                            <p class="wow fadeInUp" data-wow-delay=".6s">
                                Master Of Your Masterpieces<br><br>
                                당신의 명작의 주인은 당신입니다.<br><br>
                            </p>
                            <p class="qote wow fadeInUp" data-wow-delay=".6s">
                                당신이 아티스트라면 당신만의 공간을 가져보세요. <br><br>
                                당신이 팬이라면 당신의 아티스트를 서포트해주세요.<br><br>
                                당신이 공간을 가지고 있다면 아티스트들을 위한 공간을 제공해주세요.<br>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-12">
                    <div class="about-right wow fadeInRight" data-wow-delay=".4s">
                        <img src="/resources/images/logoSample.jpg" alt="#">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /End About Us Area -->



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
<%@include file="/WEB-INF/views/includes/footer.jsp" %>