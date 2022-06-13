<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>여우통 : <c:out value='${result.mtltyNm}'/></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/fox/com/cmm/foxBase.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/fox/com/cmm/FoxRetrieveBsshinfo.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/fox/com/cmm/swiper-bundle.min.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1647e3d12b4da2d05dd2d4c1f2e78770&libraries=services"></script>
</head>

<body>

	<form id="foxBsshInfoDefaultVO" name="foxBsshInfoDefaultVO" method="post" data-role="none">
	<input type="hidden" id="searchCtgryId" name="searchCtgryId" value="<c:out value='${searchVo.searchCtgryId}'/>"/>
	<input type="hidden" id="searcBrtcCode" name="searcBrtcCode" value="<c:out value='${searchVo.searcBrtcCode}'/>"/>
	<input type="hidden" id="searchSignguCode" name="searchSignguCode" value="<c:out value='${searchVo.searchSignguCode}'/>"/>
	<input type="hidden" id="searchMtltyNm" name="searchMtltyNm" value="<c:out value='${searchVo.searchMtltyNm}'/>"/>
	<input type="hidden" id="bsshEsntlId" name="bsshEsntlId" value=""/>
	
    <div class="container">
        <!-- 상단독바 -->
        <div class="top_docbar">
            <div class="inner">
                <div class="title">
                    <h2><c:out value='${result.mtltyNm}'/></h2>
                </div>
                <figure>
                	<a href="${pageContext.request.contextPath}/FoxMobileMain.fo" rel="external">
                    <img src="${pageContext.request.contextPath}/images/egovframework/fox/com/cmm/prev.png" alt="">
                    </a>
                </figure>
            </div>
        </div>
        
        <!-- 업소기본정보 -->
        <div class="main_content">
            <div class="top_banner swiper mySwiper">
                <ul class="swiper-wrapper">
                    <li class="swiper-slide">
                        <figure>
                            <img src="${pageContext.request.contextPath}/images/egovframework/fox/com/cmm/business_banner.png" alt="">
                        </figure>
                    </li>
                    <li class="swiper-slide">
                        <figure>
                            <img src="${pageContext.request.contextPath}/images/egovframework/fox/com/cmm/business_banner.png" alt="">
                        </figure>
                    </li>
                    <li class="swiper-slide">
                        <figure>
                            <img src="${pageContext.request.contextPath}/images/egovframework/fox/com/cmm/business_banner.png" alt="">
                        </figure>
                    </li>
                </ul>
                <div class="swiper-pagination"></div>
            </div>

            <div class="info_wrap">
                <div class="top_area">
                    <div class="inner">
                        <div class="left_area">
                            <figure>
                                <img src="${pageContext.request.contextPath}/images/egovframework/fox/com/cmm/business_logo.png" alt="">
                            </figure>
                        </div>
                        <div class="right_area">

                            <div class="info_title">
                                <h2><c:out value="${bsshInfo.mtltyNm}"/></h2>
                                <figure>
                                    <img src="${pageContext.request.contextPath}/images/egovframework/fox/com/cmm/more_btn.png" alt="">
                                </figure>
                            </div>

                            <div class="comment">
                                <div class="like">
                                    <span><c:out value="${bsshInfo.preferCo}"/>개</span>
                                </div>
                                <div class="reply">
                                    <span><c:out value="${bsshInfo.postscriptCo}"/>개</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="address">
                        <ul>
                            <li>
                                <em>캠페인</em>
                                <span><c:out value="${bsshInfo.bsshCmpgnWords}"/></span>
                            </li>
                            <li>
                                <em>대표번호</em>
                                <span><c:out value="${bsshInfo.tlphonNo}"/>, <c:out value="${bsshInfo.moblphonNo}"/></span>
                            </li>
                            <li>
                                <em>영업시간</em>
                                <span><c:out value="${bsshInfo.bsnBeginTime}"/> ~ <c:out value="${bsshInfo.bsnEndTime}"/> </span>
                            </li>
                            <li>
                                <em>주소</em>
                                <span><c:out value="${bsshInfo.adres}"/></span>
                            </li>
                        </ul>
                    </div>
                </div>
				</form>

        
                <div class="info_btn">
                    <div class="business_btn active">
                        <span>업소서비스정보</span>
                        <em></em>
                    </div>
                    <div class="review_btn">
                        <span>후기</span>
                        <em></em>
                    </div>
                    <div class="news_btn">
                        <span>소식</span>
                        <em></em>
                    </div>
                </div>

                <div class="info_content">
                    <p>
                       <c:out value="${bsshInfo.bsshIntrcnCn}"/> 
                    </p>
                </div>
        <!-- 업소기본정보 -->
        
        <!-- 업소서비스 상품정보 -->
                <div class="info_menu">
                    <ul>
      	     <c:choose> 
		      	<c:when test="${empty foxSvcGoodsInfoVOList}"> 
		      		    <li><span>서비스 정보가 등록되지 않았습니다.</span> </li>
		      	</c:when>
		      	<c:otherwise>
		      		   <c:forEach var="svcList" items="${foxSvcGoodsInfoVOList}">
                        <li>
                            <div class="left_area">
                                <strong><c:out value="${svcList.svcSmallclasNm}"/></strong>
                                <p><c:out value="${svcList.svcGoodsNm}"/></p>
                            </div>
                            <div class="right_area">
                                <div style="margin-bottom: 5px;">
                                    <span style="font-size: 12px;color: #999;text-decoration: line-through;"><c:out value="${svcList.svcCnsmrPc}"/>원</span>
                                    <em style="display: inline-block;  width: 30px; height: 20px;line-height: 20px;text-align: center; background: #F5833C;border-radius: 5px;color: #fff;font-size: 12px; font-weight: bold;">
                                    <c:out value="${svcList.svcDscntRt}"/>%
                                    </em>
                                </div>
                                <div style="text-align: right;font-size: 14px;color: #F5833C;">
                                    <span><c:out value="${svcList.svcCnsmrPc}"/>원</span>
                                </div>
                            </div>
                        </li>
                  	</c:forEach>
	     	   </c:otherwise>
			</c:choose>                 
                        <li>
                            <div class="left_area">
                                <strong>1. 감성힐링 테라피 (화면샘플))</strong>
                                <p>건식 + 스포츠 + 아로마 + 스웨디시 + 로미로미 + 감성테라피</p>
                            </div>
                            <div class="right_area">
                                <div class="top">
                                    <em>23%</em>
                                    <span>130,000원</span>
                                </div>
                                <div class="bottom">
                                    <span>100,000원</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                
        <!-- 편의사항 정보 start -->
                <div class="convenience">
                    <div class="inner">
                        <div class="title">
                            <h2>편의사항 (예시)</h2>
                        </div>
                        <div class="content">
                            <span>샤워가능</span>
                            <span>주차가능</span>
                        </div>
                    </div>
                </div>
        <!-- 업소기본정보 end -->
        
                <div class="review_wrap">
                    <div class="inner">
                        <div class="title" id="review">
                            <h2>후기</h2>
                        </div>

                        <ul>
                            <li>
                                <div class="content">
                                    <div class="sub_title">
                                        <div class="inner">
                                            <strong>사월</strong>
                                            <span class="dong">청라동</span>
                                            <span>3일전</span>
                                        </div>
                                        <figure>
                                            <img src="${pageContext.request.contextPath}/images/egovframework/fox/com/cmm/more_btn.png" alt="">
                                        </figure>
                                    </div>
                                    <div class="sub_content">
                                        <p>마사지 너무 시원하게 잘 받았습니다.
                                            다음에 또 방문할 의향이 있어요
                                        </p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="content">
                                    <div class="sub_title">
                                        <div class="inner">
                                            <strong>사월</strong>
                                            <span class="dong">청라동</span>
                                            <span>3일전</span>
                                        </div>
                                        <figure>
                                            <img src="${pageContext.request.contextPath}/images/egovframework/fox/com/cmm/more_btn.png" alt="">
                                        </figure>
                                    </div>
                                    <div class="sub_content">
                                        <p>마사지 너무 시원하게 잘 받았습니다.
                                            다음에 또 방문할 의향이 있어요
                                        </p>
                                    </div>
                                </div>
                            </li>
                        </ul>

                        <div class="btn_wrap">
                            <button type="button">후기 전체 보기</button>
                        </div>
                    </div>
                </div>

	            <!-- 업체지도 start -->
                <div class="map_wrap">
                    <div class="title" >
                        <h2>찾아가는 길</h2>
                    </div>
		            <div class="content">
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
							alert('주소: ${bsshInfo.adres}');
							geocoder.addressSearch('${bsshInfo.adres}', function(result, status) {
				
							    // 정상적으로 검색이 완료됐으면 
							     if (status === kakao.maps.services.Status.OK) {
				
							        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
							         
							        // 결과값으로 받은 위치를 마커로 표시합니다
							        var marker = new kakao.maps.Marker({
							            map: map,
							            position: coords
							        });
				
							        // 인포윈도우로 장소에 대한 설명을 표시합니다
							        var infowindow = new kakao.maps.InfoWindow({
							            content: '<div style="width:150px;text-align:center;padding:6px 0;"><c:out value="${bsshInfo.mtltyNm}"/></div>'
							        });
							        
							        infowindow.open(map, marker);
				
							        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							        map.setCenter(coords);
							    } 
							});    
						</script>
					     <strong>대구광역시 수성구 세진로 45</strong>
	                     <span><em>지번</em> 대구광역시 수성구 만촌동 960-34</span>	
	                </div>
              </div>
			  <!-- 업체지도 content end -->
        </div>
        <!-- 하단독바 -->
        <div class="bottom_docbar">
            <div class="inner">
                <div class="left_area">
                    <figure class="" onclick="likeBtnOn(this)">
                        <img class="like_btn" src="${pageContext.request.contextPath}/images/egovframework/fox/com/cmm/like.png" alt="">
                        <img class="like_active_btn" src="${pageContext.request.contextPath}/images/egovframework/fox/com/cmm/like_active.png" alt="">
                    </figure>
                    <span></span>
                </div>
                <div class="right_area">
                    <div class="call">
                        <span>전화</span>
                    </div>
                    <div class="sms">
                        <span>메세지</span>
                    </div>
                    <div class="reservation">
                        <span>예약하기</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/fox/com/cmm/swiper-bundle.min.js"></script> 
<script type="text/javascript">

//하단독바
$('.bottom_link').click(function () {
 if ($(this).hasClass('active')) {
     $(this).removeClass('active');
 } else {
     $('.bottom_link').removeClass('active');
     $(this).addClass('active');
 }
})

$('.info_btn div').click(function () {
 if ($(this).hasClass('active')) {
     $(this).removeClass('active');
 } else {
     $('.info_btn div').removeClass('active');
     $(this).addClass('active');
 }
})

$('.review_btn').click(function () {
 var offset = $("#review").offset();
 console.log(offset)
 $("html, body").animate({ scrollTop: offset.top }, 400);
})

function likeBtnOn(el) {
 if ($(el).hasClass('active')) {
     $(el).removeClass('active');
 } else {
     $(el).addClass('active');
 }
}

var swiper = new Swiper(".top_banner.mySwiper", {
 spaceBetween: 30,
 pagination: {
     el: ".top_banner .swiper-pagination",
     clickable: true,
 },
});
</script>

</body>

</html>

