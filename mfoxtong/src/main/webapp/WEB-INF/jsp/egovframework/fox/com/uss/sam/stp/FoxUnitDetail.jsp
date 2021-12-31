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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/fox/cmm/swiper.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/fox/cmm/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/fox/cmm/jquery.roundimage.js"></script>
  
  <script>
    $(document).ready(function() {    	
        $('.img-round').roundImage();
        $(document).on('pageshow', "#navbar", init);
        
        $("#tabs").click(function(){
			alert("버튼 클릭시 이벤트");
		});
        
       /*  $( "#tabs" ).tabs({ active: 0 });
        $('#tabs').tabs({ active: $('#tabs ul').index($('#tab-1')) }); */
			
    });
    
  </script> 
  
  
		<!-- 신규공통컴포넌트 import -->
		<link rel="stylesheet" href="<c:url value='/css/egovframework/mbl/mcomd/egovMcomd.css'/>"/>
		<script type="text/javascript" src="<c:url value='/js/egovframework/mbl/com/geo/geo.js'/>"></script>
		<!-- 카카오맵 API -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1647e3d12b4da2d05dd2d4c1f2e78770"></script>		
		
		<script type="text/javascript" language="javascript" defer="defer">		
			var buildingList = new Array();	
			
		   $(document).on('pageshow', "#navbar", init);

			/*********************************************************
			 * 건물 위치정보 조회
			 ******************************************************** */
	        function init() {
	            if (!navigator.geolocation) {
	            	jAlert("This browser doesn't support geolocation", "GeoLocation", "a");
	            } else {
	                $.getJSON("<c:url value='/mbl/com/geo/selectMobileBuildingLocationInfoList.mdo'/>", $('#searchVO').serialize().replace(/%/g,'%25'), function(json){
	               		$("#searchCondition option[value='" + json.searchVO.searchCondition + "']").attr('selected', 'selected');
						$('#mapCanvas').html("");
						
	               		buildingList = json.resultList;
	               		
						// 현재 위치정보 취득
		                navigator.geolocation.getCurrentPosition(successCallback, errorCallback, { maximumAge: 0, timeout: 30000, enableHighAccuracy: true });
	                });
	            }
	        }

	        /*********************************************************
			 * 위치정보 취득 성공시 처리
			 ******************************************************** */
	        function successCallback(position) {
	        	// 현재 위치정보 표시
	        	var html = "";
	       		html += '<ul class="mcom-posi">';
	       		html += '<li><strong>위도 :</strong> ' + position.coords.latitude + '</li>';
	       		html += '<li><strong>경도 :</strong> ' + position.coords.longitude + '</li>';
	       		html += '</ul>';
	
	       		$('#latlngInfo').html(html);
		        
		        var zoomLevel = 4;
	
		        // 조회 범위에 따른 ZoomLevel 설정*
		        if ($('#searchCondition').val() == "100") {
					zoomLevel = 3;
		        } else if ($('#searchCondition').val() == "500") {
					zoomLevel = 5;
				} else if ($('#searchCondition').val() == "1000") {
					zoomLevel = 6;
				} else if ($('#searchCondition').val() == "2000") {
					zoomLevel = 7;
				}
	
		        // 현재 위치 좌표*
	        	var latlng =  new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude);
	
				// 지도 설정*
	        	var myOptions = {
					level: zoomLevel,
	        		center: latlng,
	        		mapTypeId: kakao.maps.MapTypeId.ROADMAP
	        	};
	
				// 지도 생성*
	        	var map = new kakao.maps.Map(document.getElementById("mapCanvas"), myOptions);
	        	map.addControl(new kakao.maps.ZoomControl());
				
	        	// 현재 위치 마커 표시*
	        	var curMarker = new kakao.maps.Marker({
	        		position: latlng
	        	});
	        	curMarker.setMap(map);
	
	        	var infowindow = new kakao.maps.InfoWindow({ 
	        		content: '현재위치'
	        	});
	        	infowindow.open(map, curMarker);
	        	
	        	var buildingMarker = new Array();
	        	
	        	// 조회 범위 내의 건물 데이터 조회
	        	var resultList = fn_select_building(position.coords.latitude, position.coords.longitude, $('#searchCondition').val(), buildingList);
	
	        	// 건물 아이콘
	        	var icon = new kakao.maps.MarkerImage(
	        		"<c:url value='/images/egovframework/mbl/com/geo/icon/ic_building.png'/>",
	        		new kakao.maps.Size(32, 32),
	        		new kakao.maps.Point(16, 0)
	        	);
	
				// 조회 범위 내의 건물 마커 표시*
	        	for (var i = 0; i < resultList.length; i++) {        		
		        	var buildingLatLng = new kakao.maps.LatLng(resultList[i].la, resultList[i].lo);
	        		buildingMarker[i] = new kakao.maps.Marker({
	        			position: buildingLatLng,
						image : icon
		        	});
	        		buildingMarker[i].setMap(map);
	
	        		infowindow = new kakao.maps.InfoWindow({ 
		        		content: resultList[i].buldNm + '<br>' + resultList[i].telno
		        	});
		        	infowindow.open(map, buildingMarker[i]);
	        	}
	
	        	// 조회 범위 원 그리기*
	        	var circle =  new kakao.maps.Circle({
	        		center: latlng,
	        		radius: parseInt($('#searchCondition').val())*1,
	        		strokeWeight: 2,
	        		strokeColor: "#ff0000",
	        		strokeOpacity: 1,
	        		fillOpacity : 0
	        	});
	        	circle.setMap(map);
	        }

	        /*********************************************************
			 * 위치정보 취득 실패시 처리
			 ******************************************************** */
	        function errorCallback(error) {
				jAlert("에러발생, 에러코드: " + error.code + " 메시지: " + error.message, "Error", "a");
			}
		</script>

  
</head>  
 
<body>
<!-- 모바일 페이지 start -->

<div id="main" data-role="page" >
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
			  		<%-- <a href="${pageContext.request.contextPath}/uss/sam/stp/FoxMobileDetail.fo" rel="external">	 --%>		  		
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

<div data-role="tabs" id="tabs" >
	<div class = "navbar" data-role="navbar" onclick="javascript:init();">
		<ul>
			<li><a href="#tabs-1">업체정보</a></li>
			<li><a href="#tabs-2">소식</a></li>
			<li><a href="#tabs-3">후기</a></li>
		</ul>
	</div>
	<!--업체정보 -->
	<div id="tabs-1" class="ui-content">
		<img class="img-round" src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/biz_photo_sample1.png" width="70" height="70"><br>
		영업시간 : 10시~21시</br>
		주소지 : 대구시 대구동 대구리 1111-1111</br>
		연락처 : 010-000-0000 / 053-111-0000</br>
	</div>	
	<!-- 소식 -->
	<div id="tabs-2" class="ui-content">
		<ul data-role="listview">
			<li><a href="#">소식 화면으로 이동</a></li>
		</ul>
	</div>		
	<!--후기 -->			
	<div id="tabs-3" class="ui-content">
		<ul data-role="listview">
			<li><a href="#">후기화면으로 이동</a></li>
		</ul>
	</div>
</div>
<!-- 업체지도 start -->
			<div id="navi" data-role="content">
				<h3 class="mcom-h3">위도, 경도 좌표</h3>
				<div id="latlngInfo" class="ui-body-c">
					
				</div>
				<div id="mapTitle">
					<div style="padding:10px 0">
	                	<div class="egov-grid">
	                		<div class="egov-wid2">
	                			<div align="left">							
	                				<b>MAP</b>
	                			</div>
	                		</div>
	                		<div class="egov-wid10">
	                			<div align="right">	
	                				<form id="searchVO" name="searchVO" method="post">
	                					<p>조회범위
	                					<select id="searchCondition" name="searchCondition" onchange="javascript:init();" data-role="none">
	                						<option value="100">100m 이내</option>
	                						<option value="200">200m 이내</option>
	                						<option value="300">300m 이내</option>
	                						<option value="500">500m 이내</option>
	                						<option value="1000">1km 이내</option>
	                						<option value="2000">2km 이내</option>
	               						</select></p>
	               					</form>
	               				</div>
	               			</div>
	               		</div>
	               	</div>
				</div>
				<div id="mapCanvas" class="ui-body-c" style="font-size:0.75em">
					
				</div>
			</div>
			<!-- 업체지도 content end -->


<div>
	<a href="${pageContext.request.contextPath}/index.jsp" data-icon="home" rel="external">홈</a>
</div>	

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

