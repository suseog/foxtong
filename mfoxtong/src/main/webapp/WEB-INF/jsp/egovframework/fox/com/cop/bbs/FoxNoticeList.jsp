<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>  

 
<!DOCTYPE html> 
<html> 
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>여우인사이드 ${brdMstrVO.bbsNm}</title> 
   	<!-- eGovFrame Common import -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/fox/com/cmm/foxBase.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/fox/com/cmm/swiper-bundle.min.css"/>
	
	<style>
		.container {
		    width: 100%;
		    max-width: 717px;
		    margin: 0 auto;
		    background: #f0f0f0;
		}
		
		.top_docbar {
		    width: 100%;
		    height: 52px;
		    border-bottom: 1px solid #ccc;
		    background: #fff;
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
		    font-weight: 500;
		}
		
		.top_docbar figure {
		    position: absolute;
		    left: 15px;
		    cursor: pointer;
		}
		
		.top_docbar .icon_wrap {
		    position: absolute;
		    right: 15px;
		}
		
		.top_docbar .icon_wrap a {
		    margin-right: 5px;
		}
		
		.top_docbar .icon_wrap a:last-child {
		    margin-right: 0;
		}
		
		.top_docbar .icon_wrap .alert_ico.active path {
		    stroke: #F5833C;
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
		}
		
		.bottom_docbar .inner {
		    height: 100%;
		}
		
		.bottom_docbar ul {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    height: 100%;
		}
		
		.bottom_docbar ul li {
		    width: 25%;
		    height: 100%;
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    justify-content: space-around;
		    cursor: pointer;
		}
		
		.bottom_docbar ul li a {
		    display: block;
		}
		
		.bottom_docbar ul li p {
		    font-weight: bold;
		    font-size: 11px;
		}
		
		.bottom_link.active svg path {
		    fill: #F5833C;
		}
		
		.bottom_link.active p {
		    color: #F5833C;
		}
		
		.swiper-slide {
		    width: auto !important;
		}
		
		/* main_content */
		
		.main_content {
		    margin-top: 10px;
		    padding-bottom: 80px;
		}
		
		.main_content .catagory {
		    background: #fff;
		    height: 45px;
		}
		
		.main_content .slide_ul {
		    width: 100%;
		    height: 100%;
		    display: flex;
		    padding: 0 15px;
		}
		
		.main_content .slide_ul li {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		} 
		
		.main_content .slide_ul li span {
		    display: inline-block;
		    font-size: 14px;
		    border: 1px solid #999;
		    color: #999;
		    border-radius: 15px;
		    padding: 7px;
		    font-weight: 500;
		}
		
		.main_content .slide_ul li.active span {
		    border: 1px solid #F5833C;
		    color: #F5833C;
		}
		
		/* feed_content */
		.main_content .feed_content {
		    margin-top: 10px;
		}
		
		.main_content .feed_content li {
		    background: #fff;
		    margin-bottom: 10px;
		    border-bottom: 1px solid #ccc;
		}
		
		.main_content .feed_content li .top_area img {
		    width: 100%;
		}
		
		.main_content .feed_content li:last-child {
		    margin-bottom: 0;
		}
		
		.main_content .feed_content .bottom_area .title {
		    height: 38px;
		    line-height: 38px;
		    padding: 0 15px;
		    border-bottom: 1px solid #ccc;
		}
		
		.main_content .feed_content .bottom_area .title h2 {
		    font-weight: 500;
		    font-size: 16px;
		    color: #333;
		}
		
		.main_content .feed_content .bottom_area .content {
		    padding: 10px 15px;
		}
		
		.main_content .feed_content .bottom_area .content p {
		    line-height: 1.3;
		    color: #999;
		    font-size: 14px;
		}
		
		.main_content .feed_content .bottom_area .footer {
		    display: flex;
		    justify-content: space-between;
		    margin-top: 15px;
		}
		
		.main_content .feed_content .bottom_area .footer strong {
		    font-weight: bold;
		    color: #292929;
		}
		
		.main_content .feed_content .bottom_area .footer span {
		    font-size: 12px;
		    color: #999;
		}
		
		.main_content .feed_content .bottom_area .comment {
		    border-top: 1px solid #ccc;
		    height: 38px;
		    line-height: 38px;
		    padding-left: 15px;
		    display: flex;
		}
		
		.main_content .feed_content .bottom_area .comment .left_area {
		    width: 70%;
		    display: flex;
		    gap: 10px;
		}
		
		.main_content .feed_content .bottom_area .comment span {
		    font-size: 12px;
		    font-weight: 500;
		    color: #808080;
		    display: flex;
		    align-items: center;
		}
		
		.main_content .feed_content .bottom_area .comment .like span::before {
		    content: "";
		    display: inline-block;
		    background: url('/images/egovframework/fox/com/cmm//like_ico.png');
		    background-repeat: no-repeat;
		    width: 14px;
		    height: 14px;
		    margin-right: 3px;
		}
		
		.main_content .feed_content .bottom_area .comment .reply span::before {
		    content: "";
		    display: inline-block;
		    background: url('/images/egovframework/fox/com/cmm//reply_ico.png');
		    background-repeat: no-repeat;
		    width: 14px;
		    height: 14px;
		    margin-right: 3px;
		}
		
		.main_content .feed_content .bottom_area .comment .right_area {
		    border-left: 1px solid #ccc;
		    width: 30%;
		    cursor: pointer;
		}
		
		.main_content .feed_content .bottom_area .comment .right_area span {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    gap: 5px;
		    width: 100%;
		    font-size: 15px;
		}
		
		.main_content .feed_content .bottom_area .comment .right_area span::before {
		    content: "";
		    display: inline-block;
		    background: url('/images/egovframework/fox/com/cmm//like.png');
		    background-repeat: no-repeat;
		    width: 15px;
		    height: 14px;
		}
		
		.main_content .feed_content .bottom_area .comment .right_area.active span {
		    color: #F5833C;
		}
		
		.main_content .feed_content .bottom_area .comment .right_area.active span::before {
		    content: "";
		    display: inline-block;
		    background: url('/images/egovframework/fox/com/cmm//like_active.png');  
		    background-repeat: no-repeat;
		    width: 15px;
		    height: 14px;
		}
		
		.create_btn {
		    position: fixed;
		    bottom: 75px;
		    right: 15px;
		}
	</style>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script type="text/javaScript" language="javascript">
	$(document).on('pagehide', "#view", function(){ $(this).remove(); });	
	
	
	function fn_egov_regist(bbsAttrbCode) {
		document.frm.bbsAttrbCode.value = bbsAttrbCode;
		document.frm.nttId.value = document.frm.nttId.value;
		document.frm.bbsId.value=document.frm.bbsId.value;
		document.frm.action =  "${pageContext.request.contextPath}/cop/bbs${prefix}/addBoardArticle.fo"; // 임시변
		document.frm.submit();		
	}

	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_noticeList('0');
		}
	}

	function fn_egov_select_noticeList(pageNo) {

		if(document.frm.pageIndex.value == pageNo) {
			return;
		} 

		document.frm.pageIndex.value = pageNo == 0 ? 1 : pageNo;

		document.frm.action = "${pageContext.request.contextPath}/cop/bbs${prefix}/selectBoardList.fo";
		document.frm.submit();	
	}
	
	// 키워드 검색화면 화면 호출 
	function fn_search_noticeList() {
		document.frm.action = "${pageContext.request.contextPath}/cop/bbs/searchBoardListView.fo";
		document.frm.submit();	
	}

	//상세조회
	function fn_egov_inqire_notice(nttId, bbsId) {
		document.frm.nttId.value = nttId;
		document.frm.bbsId.value = bbsId;
		document.frm.action =  "${pageContext.request.contextPath}/cop/bbs${prefix}/selectBoardArticle.fo";
		document.frm.submit();			
	}	
	
	
	</script>
</head>

<body>
<!-- 메인 페이지 -->

 <div class="container">
 	<!-- header start -->
	<div class="top_docbar">
	    <div class="inner">
	        <div class="title">
	            <h2>${brdMstrVO.bbsNm}</h2>
	        </div>
	        <a href="${pageContext.request.contextPath}/FoxMobileMain.fo" rel="external">
	        <figure>
	            <img src="${pageContext.request.contextPath}/images/egovframework/fox/com/cmm//prev.png" alt="">
	        </figure>
	        </a>
	        <div class="icon_wrap">
	            <a href="javascript:fn_search_noticeList();">
	                <svg xmlns="http://www.w3.org/2000/svg" width="16.48" height="16.48" viewBox="0 0 16.48 16.48">
	                    <g id="그룹_5" data-name="그룹 5" transform="translate(-2 -2)">
	                        <path id="패스_31" data-name="패스 31" d="M9.251,15.5A6.251,6.251,0,1,0,3,9.251,6.251,6.251,0,0,0,9.251,15.5Z" transform="translate(0 0)" fill="none" stroke="#333" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" />
	                        <path id="패스_32" data-name="패스 32" d="M20.049,20.049l-3.4-3.4" transform="translate(-2.983 -2.983)" fill="none" stroke="#333" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" />
	                    </g>
	                </svg>
	            </a>
	            <a href="javascript:;" class="alert_ico active">
	                <svg xmlns="http://www.w3.org/2000/svg" width="17.574" height="16.811" viewBox="0 0 17.574 16.811">
	                    <path id="패스_8" data-name="패스 8" d="M457.787,114l2.406,4.875,5.381.786-3.893,3.792.919,5.357-4.812-2.531-4.812,2.531.919-5.357L450,119.661l5.381-.786Z" transform="translate(-449 -113)" fill="none" stroke="#333" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" />
	                </svg>
	            </a>
	            <a href="javascript:;" class="alert_ico">
	                <svg xmlns="http://www.w3.org/2000/svg" width="16.129" height="17.695" viewBox="0 0 16.129 17.695">
	                    <g id="그룹_14" data-name="그룹 14" transform="translate(1392 -679)">
	                        <path id="패스_90" data-name="패스 90" d="M742.774,958.71a4.71,4.71,0,1,0-9.419,0c0,5.494-2.355,7.064-2.355,7.064h14.129S742.774,964.2,742.774,958.71Z" transform="translate(-2122 -274)" fill="none" stroke="#333" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" />
	                        <path id="패스_91" data-name="패스 91" d="M740.986,973a1.57,1.57,0,0,1-2.716,0" transform="translate(-2123.564 -278.086)" fill="none" stroke="#333" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" />
	                    </g>
	                </svg>
	            </a>
	        </div>
	    </div>
	</div>
	<form id="frm" name="frm" method="post" data-role="none">
		<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>"/>
		<input type="hidden" name="nttId"  value="0"/>
		<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>"/>
		<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>"/>
		<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>"/>
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	</form>
	<!-- header end -->
    <div class="main_content">
    
	   <!-- 게시글 카테고리  start  -->
       <div class="catagory swiper mySwiper">
           <ul class="swiper-wrapper slide_ul ">
		     <c:choose> 
		      	<c:when test="${empty resultCodeList}">
						<li class="slide_item swiper-slide active">
		                   <span>주제영역이 없음</span>
		                </li>			
				</c:when>
				<c:otherwise>
					<c:forEach var="result" items="${resultCodeList}">
						<li class="slide_item swiper-slide active">
		                   <span>#<c:out value="${result.codeNm}"/></span><input type="hidden" id="ctgryId" name="ctgryId" value="<c:out value="${result.code}"/>"/>
		                </li>
					</c:forEach>
	      	   </c:otherwise>
			</c:choose>
           </ul>
       </div>
	   	<!-- 게시글 카테고리 end  -->
	   	
		<!-- 게시글 목록 start  -->	
        <div class="feed_content">
            <ul>
           	<c:choose>
			<c:when test="${empty resultList}">
				<li class="com-egovNodata">
			           			<spring:message code="common.nodata.msg"/>
			           		</li>			
			</c:when>
			<c:otherwise>
			
            	<!-- 게시글 start -->
            	<c:forEach var="result" items="${resultList}">
                <li>
                    <div class="top_area">
                        <figure>
                            <img src="${pageContext.request.contextPath}/images/egovframework/fox/com/cmm/community.png" alt="">
                        </figure>
                    </div>
                    <div class="bottom_area">
                        <div class="title">
                            <h2><c:out value="${result.nttSj}"/></h2>
                        </div>

                        <div class="content">
                            <p><c:out value="${result.nttCn}"/></p>
                            <div class="footer">
                                <strong><c:out value="${result.frstRegisterNm}"/></strong>
                                <span>${result.frstRegisterPnttm }</span>
                            </div>
                        </div>


                        <div class="comment">
                            <div class="left_area">
                                <div class="like">
                                    <span>${result.inqireCo}개</span>
                                </div>
                                <div class="reply">
                                    <span>2개</span>
                                </div>
                            </div>
                            <div class="right_area">
                                <span>좋아요</span>
                            </div>
                        </div>
                    </div>
                </li>
				</c:forEach>
                <!-- 게시글 start -->
                
           	</c:otherwise>
           	</c:choose>    
            </ul>
        </div>
        <!-- 게시글 목록 end  -->	
    </div>
 	<!-- 메인컨텐츠 end -->

	<!-- footer start -->
	<div class="bottom_docbar">
        <div class="inner">
            <ul>
                <li class="home bottom_link active">
                    <a href="${pageContext.request.contextPath}/FoxMobileMain.fo" rel="external">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="22" viewBox="0 0 20 22">
                            <g id="그룹_64" data-name="그룹 64" transform="translate(0 0)">
                                <path id="합치기_2" data-name="합치기 2" d="M13,22H3a2.983,2.983,0,0,1-2.121-.878A3.02,3.02,0,0,1,0,19V8a1,1,0,0,1,.385-.789l9-7a1,1,0,0,1,1.229,0l9,7A1,1,0,0,1,20,8V19a3.02,3.02,0,0,1-.879,2.121A2.981,2.981,0,0,1,17,22Zm4-2a1,1,0,0,0,1-1V8.489L10,2.266,2,8.489V19a1,1,0,0,0,1,1H6V11a1,1,0,0,1,1-1h6a1,1,0,0,1,1,1v9Zm-5,0V12H8v8Z" transform="translate(0 0)" fill="#333" />
                            </g>
                        </svg>
                    </a>
                    <p>홈</p>
                </li>
                <!-- 내주변의 업체 정보목록만 추출하여 출력  -->
                <li class="location bottom_link">
                    <a href="${pageContext.request.contextPath}/FoxMobileMain.fo" rel="external">
                        <svg xmlns="http://www.w3.org/2000/svg" width="17.967" height="25.154" viewBox="0 0 17.967 25.154">
                            <path id="location-sharp" d="M15.734,2.25c-4.96,0-8.984,3.622-8.984,8.085,0,7.187,8.984,17.069,8.984,17.069s8.984-9.882,8.984-17.069C24.717,5.872,20.693,2.25,15.734,2.25Zm0,12.577a3.593,3.593,0,1,1,3.593-3.593A3.593,3.593,0,0,1,15.734,14.827Z" transform="translate(-6.75 -2.25)" fill="#333" />
                        </svg>
                    </a>
                    <p>내주변</p>
                </li>
                <li class="book bottom_link">
                    <a href="javascript:;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="22.013" height="18.039" viewBox="0 0 22.013 18.039">
                            <g id="book" transform="translate(0 -2)">
                                <path id="패스_183" data-name="패스 183" d="M4.422,2.252c2.2-.44,5.094-.5,7.072,1.478a.688.688,0,0,1,.2.487V19.35a.688.688,0,0,1-1.175.487,5.732,5.732,0,0,0-4.774-1.266A14.77,14.77,0,0,0,1,19.965a.688.688,0,0,1-1-.615V4.217A.688.688,0,0,1,.38,3.6l.308.615L.38,3.6h0l.006,0,.018-.008q.15-.075.3-.142a17.827,17.827,0,0,1,3.715-1.2Zm-3.046,2.4V18.288A15.927,15.927,0,0,1,5.6,17.2a7.984,7.984,0,0,1,4.714.77V4.516C8.856,3.238,6.7,3.2,4.691,3.6A16.451,16.451,0,0,0,1.376,4.657Z" fill="#333" fill-rule="evenodd" />
                                <path id="패스_184" data-name="패스 184" d="M24.147,2.252c-2.2-.44-5.093-.5-7.072,1.478a.688.688,0,0,0-.2.487V19.35a.688.688,0,0,0,1.175.487,5.732,5.732,0,0,1,4.774-1.266,14.77,14.77,0,0,1,4.749,1.394.688.688,0,0,0,1-.615V4.217a.688.688,0,0,0-.38-.615l-.308.615L28.19,3.6h0l-.006,0-.018-.008L28.1,3.558Q27.557,3.3,27,3.09a17.83,17.83,0,0,0-2.852-.838Zm3.046,2.4V18.288A15.927,15.927,0,0,0,22.965,17.2a7.984,7.984,0,0,0-4.714.77V4.516c1.463-1.278,3.62-1.315,5.627-.914a16.449,16.449,0,0,1,3.315,1.054Z" transform="translate(-6.557)" fill="#333" fill-rule="evenodd" />
                            </g>
                        </svg>
                    </a>
                    <p>쿠폰북</p>
                </li>
                <li class="community bottom_link">
                    <a href="${pageContext.request.contextPath}/cop/bbs/selectBoardList.fo?bbsId=BBSMSTR_000000000001" rel="external">
                        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 26 26">
                            <g id="그룹_455" data-name="그룹 455" transform="translate(-49.235 -49.235)">
                                <path id="패스_229" data-name="패스 229" d="M240.4,109.981c-.039-.039-.017-.012,0,0Z" transform="translate(-181.143 -34.746)" fill="#071023" />
                                <path id="패스_230" data-name="패스 230" d="M62.235,49.235a13,13,0,1,0,13,13A13,13,0,0,0,62.235,49.235Zm2,4.312a.378.378,0,0,1,.172-.3.4.4,0,0,1,.23-.064.408.408,0,0,1,.23.083l.012.009.009.008.012.011.024.021.047.043c.03.03.061.058.091.089.059.061.117.124.171.19a1.973,1.973,0,0,1,.285.446L65.5,54.1l-.2-.162-.193-.165c-.128-.109-.258-.222-.385-.329a.189.189,0,0,0-.214-.014.191.191,0,0,0-.076.083.2.2,0,0,0-.016.055c0,.02-.005.042-.008.063l-.03.252-.033.252-.022,0a1.95,1.95,0,0,1-.094-.521l0-.032v-.016A.108.108,0,0,1,64.236,53.547Zm-9.49,2.162c.077-.112.16-.22.247-.325q.066-.078.134-.154a1.552,1.552,0,0,1,.144-.145c.105-.086.21-.173.319-.255s.22-.16.332-.235c.226-.15.465-.282.695-.41.463-.26.928-.518,1.374-.8a4.8,4.8,0,0,0,.627-.454,1.588,1.588,0,0,0,.247-.273,1.137,1.137,0,0,0,.156-.321l0-.011.007-.019a.232.232,0,0,1,.109-.125.241.241,0,0,1,.212-.007.244.244,0,0,1,.047.028.33.33,0,0,1,.033.03l.035.037.07.075a3.613,3.613,0,0,1,.26.321,3.515,3.515,0,0,1,.4.723,3.8,3.8,0,0,1,.227.792q.035.2.051.408c.009.137.015.272.016.407,0,.27-.005.54-.028.809-.01.135-.026.269-.041.4-.007.067-.013.134-.027.2s-.029.132-.045.2c-.063.262-.137.522-.225.775a6.2,6.2,0,0,1-.3.743,9.139,9.139,0,0,0,.295-1.558c.007-.065.012-.131.018-.2s.018-.13.027-.195c.018-.13.031-.26.041-.391.022-.261.03-.523.027-.784,0-.131-.007-.262-.016-.39s-.026-.256-.048-.383a3.539,3.539,0,0,0-.211-.738,3.251,3.251,0,0,0-.371-.669,3.35,3.35,0,0,0-.242-.3l-.066-.071-.013-.014a1.394,1.394,0,0,1-.184.372,1.846,1.846,0,0,1-.287.318,5.041,5.041,0,0,1-.663.481c-.456.285-.922.542-1.386.8-.234.131-.461.256-.678.4-.108.073-.215.146-.319.226a3.541,3.541,0,0,0-.3.248c-.049.043-.1.082-.151.123s-.1.082-.15.125c-.1.085-.193.176-.284.269a3.536,3.536,0,0,0-.261.3,2.359,2.359,0,0,0-.224.328A2.768,2.768,0,0,1,54.745,55.709Zm1.067,11.5a.106.106,0,0,1-.164.124c-1.094-.877-3.6-3.885-2.77-7.449s3.165-4.035,3.915-4.283a.212.212,0,0,1,.277.177l.164,1.409a.212.212,0,0,0,.36.126l.947-.937a.318.318,0,0,1,.51.086,3.47,3.47,0,0,1,.4,2.674c-.559,1.119-2.65,2.756-3.294,4.759A5.975,5.975,0,0,0,55.812,67.211Zm7.067,1.844a11.2,11.2,0,0,0-1.486-1,6.487,6.487,0,0,0-1.421-.54,15.147,15.147,0,0,1,1.164-1.4,12.475,12.475,0,0,1,1.006,1.054A9.711,9.711,0,0,1,63.2,68.789.212.212,0,0,1,62.879,69.055Zm6.339-5.963a9.709,9.709,0,0,1-.4,1.9.212.212,0,0,1-.413-.036,11.2,11.2,0,0,0-.345-1.759,5.112,5.112,0,0,0-.508-1.076,13.093,13.093,0,0,1,1.712-.333A10.161,10.161,0,0,1,69.218,63.091Zm3.767-1.476A13.359,13.359,0,0,0,63.6,63.638a14.822,14.822,0,0,0-5.926,7.672c-.1.282-.255.754-.409,1.25a.425.425,0,0,1-.828-.086,28.509,28.509,0,0,1-.042-5.785,9.141,9.141,0,0,1,1.945-4.722,4.535,4.535,0,0,1,3.854-1.6,5.685,5.685,0,0,0,1.645-.082,1.7,1.7,0,0,0,.749-1.993,3.657,3.657,0,0,1-1.06-1.466,2.85,2.85,0,0,1-.036-.929,4.814,4.814,0,0,1-.149-1.645.106.106,0,0,1,.105-.09A5.066,5.066,0,0,1,65.2,54.5a4.033,4.033,0,0,1,2.038,0,7.547,7.547,0,0,0,2.082.378c.675.008.474.38.474.38a1.894,1.894,0,0,1-1.4,1.076c-.982.11-2.158-.125-2.766.5a1.908,1.908,0,0,1,1.054,0,1.9,1.9,0,0,0-.527,1.326,1.27,1.27,0,0,1,.988-.383,2.018,2.018,0,0,0,0,.6.819.819,0,0,1,.306-.269,2.36,2.36,0,0,0,1.065,1.074c.821.448,1.861.584,3.062,1.133a8.253,8.253,0,0,1,1.565.911A.213.213,0,0,1,72.985,61.616Zm-4.27-5.028c-.059.184-.105.345-.15.5s-.083.309-.123.463c-.017.078-.039.154-.056.234l-.015.059c0,.02-.011.039-.015.06-.008.04-.018.08-.029.121,0,.02-.013.041-.017.061s-.009.041-.015.062c-.01.042-.023.084-.036.127s-.023.086-.038.13l-.023.067c-.009.023-.017.045-.028.069l-.026,0c-.009-.088-.02-.176-.026-.264l0-.133a1.261,1.261,0,0,1,0-.133l.007-.133c0-.044.01-.088.015-.132a2.644,2.644,0,0,1,.047-.262,2.344,2.344,0,0,1,.191-.5l.032-.059c.011-.019.023-.038.035-.057.023-.038.048-.075.074-.111a1.342,1.342,0,0,1,.179-.2Z" fill="#071023" />
                                <path id="패스_231" data-name="패스 231" d="M241.128,109.747a.069.069,0,0,0,0-.025l-.014.043Z" transform="translate(-181.846 -34.53)" fill="#071023" />
                            </g>
                        </svg>
                    </a>
                    <p>여우인사이드</p>
                </li>
                <li class="info bottom_link">
                    <c:choose>
		        	<c:when test="${sessionScope.loginVO.ncnm eq null}">
		                     <!-- 로그인 안했을 경우 -->
		        	    <a href="${pageContext.request.contextPath}/uat/uia/egovLoginUsr.fo" rel="external">
		                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="20" viewBox="0 0 18 20">
		                            <g id="그룹_186" data-name="그룹 186" transform="translate(-387 -879)">
		                                <g id="그룹_63" data-name="그룹 63" transform="translate(387 879)">
		                                    <path id="패스_101" data-name="패스 101" d="M188,358a1,1,0,0,1-1-1v-2a3,3,0,0,0-3-3h-8a3,3,0,0,0-3,3v2a1,1,0,0,1-2,0v-2a5,5,0,0,1,5-5h8a5,5,0,0,1,5,5v2A1,1,0,0,1,188,358Z" transform="translate(-171 -338)" fill="#333" />
		                                    <path id="패스_102" data-name="패스 102" d="M180,348a5,5,0,1,1,5-5A5.006,5.006,0,0,1,180,348Zm0-8a3,3,0,1,0,3,3A3,3,0,0,0,180,340Z" transform="translate(-171 -338)" fill="#333" />
		                                </g>
		                            </g>
		                        </svg>
		                    	</a>
		                    	<p>로그인</p>
		        	</c:when>
		        	<c:otherwise>
		                 	<!-- 로그인 했을 경우  -->
		       	    	<a href="${pageContext.request.contextPath}/uat/uia/foxMypage.fo" rel="external">
		                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="20" viewBox="0 0 18 20">
		                            <g id="그룹_186" data-name="그룹 186" transform="translate(-387 -879)">
		                                <g id="그룹_63" data-name="그룹 63" transform="translate(387 879)">
		                                    <path id="패스_101" data-name="패스 101" d="M188,358a1,1,0,0,1-1-1v-2a3,3,0,0,0-3-3h-8a3,3,0,0,0-3,3v2a1,1,0,0,1-2,0v-2a5,5,0,0,1,5-5h8a5,5,0,0,1,5,5v2A1,1,0,0,1,188,358Z" transform="translate(-171 -338)" fill="#333" />
		                                    <path id="패스_102" data-name="패스 102" d="M180,348a5,5,0,1,1,5-5A5.006,5.006,0,0,1,180,348Zm0-8a3,3,0,1,0,3,3A3,3,0,0,0,180,340Z" transform="translate(-171 -338)" fill="#333" />
		                                </g>
		                            </g>
		                        </svg>
		                    	</a>
		                    	<p>여우정보</p>
		        	</c:otherwise>
		        </c:choose>
                </li>
            </ul>
        </div>
    </div>
	<!-- footer end -->
	
	<!-- 작성 버튼 start -->
	<div class="create_btn">
        <figure>
            <a href="javascript:fn_egov_regist();">
                <img src="${pageContext.request.contextPath}/images/egovframework/fox/com/cmm/create_btn.png" alt="">
            </a>
        </figure>
    </div>
	<!-- 작성 버튼 end -->

	<!-- contents end -->
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

$('.category li').click(function () {
 if ($(this).hasClass('active')) {
     $(this).removeClass('active')
 } else {
     $('.category li').removeClass('active');
     $(this).addClass('active');
 }
})

$('.slide_item').click(function () {
 if ($(this).hasClass('active')) {
     $(this).removeClass('active');
 } else {
     $('.slide_item').removeClass('active');
     $(this).addClass('active');
 }
})

$('.comment .right_area').click(function () {
 if ($(this).hasClass('active')) {
     $(this).removeClass('active');
 } else {
     $(this).addClass('active');
 }
})

//스와이퍼 슬라이드
var swiper = new Swiper(".main_content .catagory.mySwiper", {
 slidesPerView: 'auto',
 spaceBetween: 10,
});

</script>   
</body>
</html>
