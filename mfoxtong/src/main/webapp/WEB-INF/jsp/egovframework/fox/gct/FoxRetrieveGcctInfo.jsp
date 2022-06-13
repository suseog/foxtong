<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
	<title> 상품권 상세 조회 </title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/ussCommon.css"/>
	
	<!-- UX_UI 작업 추가 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/gct/swiper-bundle.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/gct/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/gct/coupon_detail.css">    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>	    
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>   	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/fox/cmm/jquery.roundimage.js"></script>
	
  <script>
  <!--//
    $(document).ready(function() {
        $('.img-round').roundImage();
    });
    
    
	
    -->
    </script>
</head>
	<body>	
    <div class="container">
        <div class="top_docbar">
            <div class="inner">
                <div class="title">
                    <h2>쿠폰상세</h2>
                </div>
                <figure>
                  <a href="${pageContext.request.contextPath}/fox/gct/retrieveGcctInfoList.fo" rel="external" >
                    <img src="${pageContext.request.contextPath}/images/egovframework/fox/gct/prev.png" alt="">
                   </a>
                </figure>
            </div>
        </div>        

        <div class="main_content">
            <div class="top_area">
                <div class="title">
                    <figure>
                        <img src="${pageContext.request.contextPath}/images/egovframework/fox/gct/business_logo.png" alt="">
                    </figure>
                    <strong>${result.mtltyNm}</strong>
                    <span>${result.dongCode}</span>
                </div>

                <div class="content">
                    <div class="txt_wrap">
                        <p>12개월 회원권 등록 시 1개월 무료 + Pt 2회 무료</p>
                        <span>${result.distbEndDe}까지</span>
                    </div>
                    <div class="btn_wrap">
                        <button type="button">받은쿠폰</button>
                    </div>
                </div>
            </div>

            <div class="center_area">
                <div class="top_txt">
                    <span>쿠폰 사용 시 <span class="bold">[사용확인]</span> 버튼을 눌러주세요.</span>
                </div>
                <div class="bottom_txt">
                    <p>첫 결제 후 SNS에 공유하고 링크와 함께 후기를 남겨주시면
                        추첨을 통해 <span>아따산의 얼루어 센터라인 고급 요가매트 6mm</span>를 드립니다.
                    </p>
                </div>
            </div>

            <div class="bottom_area">
                <h2>찾아가는 길</h2>
                
                <div id="map" style="width:100%;height:350px;"></div>

				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1647e3d12b4da2d05dd2d4c1f2e78770&libraries=services"></script>
				<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${result.adRes}', function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			         
			        // 결과값 위경도 좌표 표
			        document.test.test.value = coords ;		        
	
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });

			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">${result.mtltyNm}</div>'
			        });
			        infowindow.open(map, marker);

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
				</script>

	<div>
		<form id= "test" name ="test" >		
		<input type="text" id="test" name="test" value="" readonly/>
		
		</form>
	</div>
                
                
                <div class="txt_wrap">
                    <span>${result.adRes}</span>
                    <span><em>지번</em>${result.laadRes}</span>
                </div>

                <div class="btn_wrap">
                    <button type="button">사용확인</button>
                </div>
            </div>

        </div>


    </div>
    <script src="${pageContext.request.contextPath}/js/egovframework/fox/gct/coupon_detail.js"></script>
</body>

</html>




