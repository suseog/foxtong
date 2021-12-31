<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>전자정부 모바일 프레임워크 fox 상세정보 </title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/ussCommon.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/swiper.min.css"/>


    <style>
      div, ul {margin:0;padding:0;}
      #top_category {overflow-x:scroll;width:320px;}
      ul {display:table;width:100%;}
      li {display:table-cell;white-space:nowrap;list-style:none;}
      li a {display:block;margin-left:10px;border:1px solid #000;}
      li.on a {background:pink;}
    </style>
    
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>	    
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>   	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/fox/cmm/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/fox/cmm/swiper.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/fox/cmm/jquery.roundimage.js"></script>
  
  <!--탭사용을 위한 소스  -->
 <!--  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css"> -->
 <!--  <link rel="stylesheet" href="/resources/demos/style.css"> -->
  <!-- <script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
<!--   <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script> -->


  <script>
    $(document).ready(function() {
        $('.img-round').roundImage();
    });
  </script> 
  
<!--
   <script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>  
  -->  
  
</head>  
 
<body>
<!-- 모바일 페이지 start -->

<div data-role="page" >
<!-- header start -->
<%-- <div data-role="header" >
	<li><a href="${pageContext.request.contextPath}/index.jsp" data-icon="home" rel="external">홈</a></li>
</div> --%>
<!-- header end -->

<!-- 업체 이미지   start  -->
 <!-- Swiper -->
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide"><img src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/cat1.png" alt="1" title="이미지1"></div>
            <div class="swiper-slide"><img src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/cat2.png" alt="2" title="이미지1"></div>
            <div class="swiper-slide"><img src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/cat3.png" alt="3" title="이미지1"></div>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
        <!-- Add Arrows -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
 <!-- Initialize Swiper -->
    <script>
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        paginationClickable: true,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: 2000,
        autoplayDisableOnInteraction: false
    });
    </script> 
     
<!-- 업체 이미지  end  -->


<div>
	  <li data-icon="false">
		  <table border="10">
		  	<tr>
		  		<td> 		  		
			  		<a href="${pageContext.request.contextPath}/uss/sam/stp/FoxMobileDetail.fo" rel="external">			  		
		    		<img class="img-round" src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/biz_photo_sample1.png" width="70" height="70">
		    		</a>
	    		</td>
		  		<td style="padding:5pt">
		  		    <span><b>월드출장세차</b></span> <span>          </br></span><span> 후기 </span>  <span> 좋아요 </span> <span> 위치 </span> 
		  		    </br>대구광역시 수성구 만촌동 999-999
		  		    <a href="#" style="text-decoration: none; color: inherit;"> </a>
		  		</td>		  		
		  	</tr>
		  	<!-- <tr>대구광역시 수성구 만촌동 999-999</tr> -->
		  </table>
	  </li>
</div>	

<div data-role="tabs" id="tabs">
<div data-role="navbar">
  <ul>
    <li><a href="#tabs-1">업체정보</a></li>
    <li><a href="#tabs-2">소식</a></li>
    <li><a href="#tabs-3">후기</a></li>
  </ul>
</div>
<div id="tabs-1" class="ui-content">
    <img class="img-round" src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/biz_photo_sample1.png" width="70" height="70"><br>
    영업시간 : 10시~21시</br>
   주소지 : 대구시 대구동 대구리 1111-1111</br>
   연락처 : 010-000-0000 / 053-111-0000</br>
   
</div>
  <div id="tabs-2">
    <ul data-role="listview" data-inset="true">
        <li><a href="#">Acura</a></li>
        <li><a href="#">Audi</a></li>
        <li><a href="#">BMW</a></li>
    </ul>
  </div>
  <div id="tabs-3">
    <ul data-role="listview" data-inset="true">
        <li><a href="#">aaa</a></li>
        <li><a href="#">bbb</a></li>
        <li><a href="#">ccc</a></li>
    </ul>
  </div>
</div>

<!-- 	
 content start
<div data-role="content">
	카테고리 네비게이션 start 
    <div data-role="controlgroup" data-type="horizontal">
    	<button class = "ui-btn" href="#"> 업체정보</button>
    	<button class = "ui-btn" href="#"> 소식</button>
    	<button class = "ui-btn" href="#"> 후기</button>   
    </div>
	카테고리 네비게이션 end 
	



	<br/> 
	
<a href="${pageContext.request.contextPath}/index.jsp" data-icon="home" rel="external">홈</a>
 -->
	<!-- 제공서비스 start -->	
	<ul data-role="listview" data-autodividers="false" >
	  <li data-icon="false">
	    <a href="#">
	   <img class="img-round" src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/biz_photo_sample1.png" width="70" height="70">
	    <h2>감성힐링테라피-60분 </h2>
	    <p>Google Chrome is a free, open-source web browser. Released in 2008.</p>
	    </a>
	  </li>
	  <li data-icon="false">
	    <a href="#">
	    <img class="img-round" src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/biz_photo_sample1.png" width="70" height="70">
	    <h2>감성힐링테라피-90분 </h2>
	    <p>Google Chrome is a free, open-source web browser. Released in 2008.</p>
	    </a>
	  </li>
	  <li data-icon="false">
	    <a href="#">
	    <img class="img-round" src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/biz_photo_sample1.png" width="70" height="70">
	    <h2>감성힐링테라피-120분 </h2>
	    <p>Google Chrome is a free, open-source web browser. Released in 2008.</p>
	    </a>
	  </li>
	</ul>
	<!-- 제공서비스 end-->
	<br/>
	<!-- 상품광고 start -->
	<div>
		<span>
			<a href="javascript:alert('구현필요 ');"><img src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/banner_sample.png" alt="banner_sample"></a>
		</span>
	</div>
	<!-- 상품광고 end -->	

<!-- content end -->

<!-- footer start -->
  
  <div data-role="footer" style="text-align:center;" data-position="fixed">
   <div data-role="navbar">
      <ul>       
        <li><a href="tel:010-2868-8051" data-icon="phone">전화</a></li>
        <li><a href="sms:010-2868-8051" data-icon="mail">메세지</a></li>
      </ul>
    </div>
  </div>
<!-- footer end -->

</div>
<!-- 모바일 페이지 end -->
</body>
</html>

