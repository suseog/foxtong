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
<style type="text/css">
@charset "UTF-8";

.container {
    width: 100%;
    max-width: 717px;
    margin: 0 auto;
}

.main_content .title {
    padding-top: 15px;
}

.main_content .title h2 {
    font-size: 18px;
    font-weight: bold;
    color: #333;
}

/* top */
.top_docbar {
    width: 100%;
    height: 52px;
    border-bottom: 1px solid #ccc;
}

.top_docbar .inner {
    position: relative;
    height: 100%;

    display: flex;
    justify-content: center;
    align-items: center;
}

.top_docbar .title h2 {
    font-size: 20px;
    font-weight: bold;
}

.top_docbar figure {
    position: absolute;
    left: 15px;
    cursor: pointer;
}

/* main_content */

.top_banner figure {
    width: 100%;
    height: 152px;
    background: #ccc;
}

.top_banner figure img {
    width: 100%;
    height: 100%;
    object-fit: contain;
}

.swiper-pagination-bullet-active {
    background: #F5833C;
}

/* info_wrap */
.info_wrap {
    padding: 0 15px;
    margin-top: 30px;
}

.info_wrap .top_area {
    margin-bottom: 15px;
}

.info_wrap .top_area .inner {
    display: flex;
    align-items: center;
    gap: 18px;
    margin-bottom: 15px;
}

.info_wrap .top_area .left_area figure {
    width: 65px;
}

.info_wrap .top_area .left_area figure img {
    width: 100%;
}

.info_wrap .top_area .right_area {
    width: 100%;
}

.info_wrap .top_area .right_area .info_title {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
}

.info_wrap .top_area .right_area .info_title h2 {
    font-size: 25px;
    font-weight: 500;
}

.info_wrap .top_area .right_area .info_title figure {
    cursor: pointer;
}

.info_wrap .top_area .right_area .comment {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 10px;
}

.info_wrap .top_area .right_area .comment span {
    font-size: 12px;
    font-weight: 500;
    color: #808080;
    display: flex;
    align-items: center;
}

.info_wrap .top_area .right_area .like span::before {
    content: "";
    display: inline-block;
    background: url(/images/egovframework/fox/com/cmm//like_ico.png);
    background-repeat: no-repeat;
    width: 14px;
    height: 14px;
    margin-right: 3px;
}

.info_wrap .top_area .right_area .reply span::before {
    content: "";
    display: inline-block;
    background: url(/images/egovframework/fox/com/cmm//reply_ico.png);
    background-repeat: no-repeat;
    width: 14px;
    height: 14px;
    margin-right: 3px;
}

.info_wrap .top_area .address ul {
    padding: 15px 10px;
    background: #fff;
    box-shadow: 0 2px 5px rgb(0 0 0 / 17%);
    border-radius: 8px;
}

.info_wrap .top_area .address li {
    display: flex;
    gap: 15px;
    margin-bottom: 10px;
}

.info_wrap .top_area .address li em {
    font-size: 14px;
    font-weight: 500;
    color: #999;
}

.info_wrap .top_area .address li span {
    font-size: 14px;
    font-weight: 500;
    color: #333;
}

.info_wrap .top_area .address li:last-child {
    margin-bottom: 0;
}


/* info_btn */
.info_wrap .info_btn {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 15px;
}

.info_wrap .info_btn div {
    height: 26px;
    width: 33.3333%;
    text-align: center;
    cursor: pointer;
}


.info_wrap .info_btn div span {
    display: block;
    margin-bottom: 8px;
    font-size: 20px;
}

.info_wrap .info_btn div em {
    width: 100%;
    height: 2px;
    background: #ccc;
    display: block;
    position: relative;
}

.info_wrap .info_btn div em::before {
    content: "";
    background: #F5833C;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    transition: .4s ease;
    width: 0;
    height: 100%;
}

.info_wrap .info_btn div.active span {
    color: #F5833C;
}

.info_wrap .info_btn div.active em::before {
    width: 100%;
}

/* info_content */
.info_content {
    width: 100%;
    height: 150px;    
    overflow-y: auto;
    background: #f6f6f6;
    padding: 20px;
    border-radius: 8px;
    margin-bottom: 15px;
}

.info_content p {
    line-height: 1.7;
    font-size: 14px;
    font-weight: 500;
    color: #333;
}

/* info_menu */

.info_menu {
    padding-top: 15px;
    border-top: 1px solid #ccc;
    margin-bottom: 15px;
}

.info_menu ul {
    padding: 0 10px;
}

.info_menu li {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 0;
    border-bottom: 1px solid #ccc;
}

.info_menu li:first-child {
    padding-top: 0;
}

.info_menu li:last-child {
    border-bottom: 0;
}




.info_menu li .svcSmallclas {
	padding-top: 1;
	padding-bottom: 1;
	text-align: center;
    background-color: #A3C5C1;
    font-size: 14px;
    font-weight: 500;
    color: 808080;
    line-height: 1.4;
    border-radius: 1px;
}
 
.info_menu li .left_area {
    width: 60%;
}

.info_menu li .left_area strong {
    display: block;
    font-size: 14px;
    font-weight: bold;
    color: #333;
    margin-bottom: 10px;
}

.info_menu li .left_area p {
    font-size: 12px;
    font-weight: 500;
    color: #999;
    line-height: 1.4;
}

.info_menu li .right_area .top {
    margin-bottom: 5px;
}

.info_menu li .right_area .top em {
    display: inline-block;
    width: 30px;
    height: 20px;
    line-height: 20px;
    text-align: center;
    background: #F5833C;
    border-radius: 5px;
    color: #fff;
    font-size: 12px;
    font-weight: bold;
}

.info_menu li .right_area .top span {
    font-size: 14px;
    color: #999;
    text-decoration: line-through;
}

.info_menu li .right_area .bottom {
    text-align: right;
    font-size: 14px;
    color: #F5833C;
}

/* convenience */
.convenience  {
    border-top: 1px solid #ccc;
}

.convenience .inner {
    padding: 0 10px;
}

.convenience .content {
    padding: 15px 0;
}

.convenience .content span {
    display: inline-block;
    text-align: center;
    width: 66px;
    height: 25px;
    line-height: 25px;
    background: #999;
    color: #fff;
    border-radius: 8px;
    font-size: 14px;
}

/* review_wrap */
.review_wrap {
    border-top: 1px solid #ccc;
}

.review_wrap > .inner {
    padding: 0 10px;
}

.review_wrap li {
    border-bottom: 1px solid #ccc;
}

.review_wrap li:last-child {
    border-bottom: 0;
    margin-bottom: 20px;
}

.review_wrap .content {
    padding-bottom: 15px;
}

.review_wrap .content .sub_title {
    display: flex;
    justify-content: space-between;
    margin:15px 0;
}

.review_wrap .content .sub_title strong {
    display: block;
    color: #333;
    font-weight: 500;
    margin-bottom: 5px;
}

.review_wrap .content .sub_title span {
    font-size: 14px;
    color: #999;
    font-weight: 500;
}

.review_wrap .content .sub_title .dong::after {
    content: "";
    display: inline-block;
    width: 1px;
    height: 13px;
    background: #ccc;
    margin:0 4px 0 6px;
}

.review_wrap .content .sub_content p{
    font-size: 14px;
    color: #999;
    line-height: 1.4;
    width: 100%;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.review_wrap .btn_wrap {
    padding-bottom: 15px;
}

.review_wrap .btn_wrap button {
    width: 100%;
    height: 37px;
    border: 1px solid #F5833C;
    border-radius: 8px;
    color: #F5833C;
    background: #fff;
    font-weight: 500;
    cursor: pointer;
    outline: none;
}


/* map_wrap */
.map_wrap {
    border-top: 1px solid #ccc;
    padding-bottom: 100px;
}

.map_wrap .content {
    margin-top: 15px;
}

.map_wrap .content figure {
    width: 100%;
}

.map_wrap .content figure img {
    width: 100%;
}

.map_wrap .content strong {
    display: block;
    font-size: 14px;
    color: #333;
    font-weight: bold;
    margin:15px 0 5px;
}

.map_wrap .content span {
    display: inline-block;
    font-size: 14px;
    color: #999;
}

.map_wrap .content em {
    display: inline-block;
    width: 30px;
    height: 20px;
    line-height: 20px;
    text-align: center;
    background: #999;
    border-radius: 5px;
    color: #fff;
    font-size: 12px;
    font-weight: 500;
    margin-right: 10px;
}

/* bottom */
.bottom_docbar {
    width: 100%;
    height: 60px;
    background: #fff;
    box-shadow: 4px 0 11px rgb(0,0,0, 0.5);
    position: fixed;
    left: 50%;
    transform: translatex(-50%);
    bottom: 0;
    padding: 0 15px;
}

.bottom_docbar .inner {
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 100%;
}

.bottom_docbar .left_area {
    width: 20%;
    display: flex;
    align-items: center;
    gap: 10px;
}

.bottom_docbar .left_area figure {
    width: 29px;
    cursor: pointer;
}

.bottom_docbar .left_area figure .like_active_btn {
    display: none;
}

.bottom_docbar .left_area figure.active .like_active_btn {
    display: block;
}

.bottom_docbar .left_area figure.active .like_btn {
    display: none;
}


.bottom_docbar .left_area figure img {
    width: 100%;
}

.bottom_docbar .left_area span {
    display: inline-block;
    width: 1px;
    height: 30px;
    background: #ccc;
}

.bottom_docbar .right_area {
    display: flex;
    justify-content: space-between;
    width: 80%;
}

.bottom_docbar .right_area div {
    width: 30%;
    height: 30px;
    background: #F5833C;
    border-radius: 8px;
    cursor: pointer;
}

.bottom_docbar .right_area span {
    color: #fff;
    font-weight: 500;
    display: flex;
    width: 100%;
    height: 100%;
    justify-content: center;
    align-items: center;
}

.bottom_docbar .right_area .call span::before {
    content: "";
    display: inline-block;
    background: url(/images/egovframework/fox/com/cmm//call.png);
    background-repeat: no-repeat;
    width: 15px;
    height: 15px;
    margin-right: 5px;
}

.bottom_docbar .right_area .sms span::before {
    content: "";
    display: inline-block;
    background: url(/images/egovframework/fox/com/cmm//sms.png);
    background-repeat: no-repeat;
    width: 15px;
    height: 15px;
    margin-right: 5px;
}


@media screen and (max-width: 320px) {
    .info_wrap .top_area .address li em,
    .info_wrap .top_area .address li span {
        font-size: 12px;
    }

    .info_wrap .top_area .right_area .info_title {
        margin-bottom: 7px;
    }

    .info_wrap .top_area .right_area .info_title h2 {
        font-size: 20px;
    }

    .info_wrap .info_btn div span {
        font-size: 18px;
    }

    .info_content p {
        font-size: 11px;
    }

    .info_menu li .left_area p {
        font-size: 11px;
    }

    .info_menu li .right_area .bottom {
        font-size: 11px;
    }

    .info_menu li .right_area .top em {
        width: 25px;
        height: 15px;
        line-height: 15px;
        font-size: 10px;
    }

    .bottom_docbar .right_area span {
        font-size: 12px;
    }
}
</style>
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
                                <em>캠 페 인</em>
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
                                <em>주    소</em>
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
                    <pre><c:out value="${bsshInfo.bsshIntrcnCn}"/></pre>
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
		      		   <c:set var="lastSvcSmallclas" scope="page" value=""/>

		      		   <c:forEach var="svcList" items="${foxSvcGoodsInfoVOList}">
			      		   <c:if test="${lastSvcSmallclas != svcList.svcSmallclas}">
		                        <li>
		                            <div class="svcSmallclas" style="background-color: #EEE0D0; height: 30px;">
		                                <strong><c:out value="${svcList.svcSmallclasNm}"/></strong>
		                            </div>
		                        </li>
	                        </c:if>
	                        <li>
	                            <div class="left_area">
	                                <strong><c:out value="${svcList.svcGoodsNm}"/></strong>
	                                <p><c:out value="${svcList.svcGoodsNm}"/></p>
	                                <c:set var="lastSvcGoodsNm" value="${svcList.svcSmallclas}"/>
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
                        <c:set var="lastSvcSmallclas" value="${svcList.svcSmallclas}"/>
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

                <div class="map_wrap">
                    <div class="title">
                        <h2>찾아가는 길</h2>
                    </div>
		            <!-- 업체지도 start -->
					<div class="content">
		                <div id="map" style="width:100%;height:350px;"></div>
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
		                <div class="content">
		                    <strong>대구광역시 수성구 세진로 45</strong>
		                    <span><em>지번</em> 대구광역시 수성구 만촌동 960-34</span>
		                </div>
	        		</div>
					<!-- 업체지도 content end -->
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
                        <a href='tel:${result.tlphonNo}'><span>전화(Call)</span></a>
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

