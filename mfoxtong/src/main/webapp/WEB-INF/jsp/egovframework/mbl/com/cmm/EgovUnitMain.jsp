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
<title>전자정부 모바일 프레임워크 fox 메인 </title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/ussCommon.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>	    
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>   	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>
</head>  
 
<body>
<!-- 모바일 페이지 start -->

<div data-role="page" >

<!-- header start -->
<div data-role="header" data-theme="z" class="com-egovHeaderBar">
	<h1><img src="${pageContext.request.contextPath}/images/egovframework/mbl/bod/logo.png" alt="logo"></h1>
</div>
<!-- header end -->

<!-- content start -->
<div data-role="content">
<p>모바일 전자정부 공통컴포넌트 (메인화면 이용예)</p>
<br>
<p>** 메뉴 링크의 게시판 아이디를 현재 생성된 게시판 아이디로 바꿔주세요 **</p>

	<div data-role="collapsible-set">
		<div data-role="collapsible" data-collapsed="true">
			<h3>협업</h3>
				<ul data-role="listview" data-inset="true" data-theme="d">
					
					<li><a href="${pageContext.request.contextPath}/cop/bbs/selectBoardList.fo?bbsId=BBSMSTR_000000000001" data-ajax="false">일반게시판</a></li>
					<li><a href="${pageContext.request.contextPath}/cop/bbs/anonymous/selectBoardList.fo?bbsId=BBSMSTR_000000000002" rel="external">익명게시판</a></li>
					<li><a href="${pageContext.request.contextPath}/cop/bbs/selectBoardList.fo?bbsId=BBSMSTR_000000000003" data-ajax="false">공지게시판</a></li>
					<li><a href="${pageContext.request.contextPath}/cop/bbs/selectBoardList.fo?bbsId=BBSMSTR_000000000004" data-ajax="false">유효게시판</a></li>
					<li><a href="${pageContext.request.contextPath}/cop/scp/selectScrapList.fo" data-ajax="false">스크랩</a></li>
					<li><a href="${pageContext.request.contextPath}/cop/cmy/CmmntyMainPage.fo?cmmntyId=CMMNTY_0000000000001" rel="external">커뮤니티</a></li>
					<li><a href="${pageContext.request.contextPath}/cop/smt/sdm/EgovDeptSchdulManageDailyList.fo" rel="external">부서일정관리</a></li>
					<li><a href="${pageContext.request.contextPath}/cop/smt/sim/EgovIndvdlSchdulManageDailyList.fo" rel="external">일정관리</a></li>
					<li><a href="${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageList.fo" rel="external">일지관리</a></li>
					<li><a href="${pageContext.request.contextPath}/cop/smt/sam/EgovAllSchdulManageList.fo" rel="external">전체일정 목록</a></li>	
					<li><a href="${pageContext.request.contextPath}/cop/adb/selectAdbkList.fo" rel="external">주소록관리</a></li>
				</ul>
		</div>
		
	</div>
</div>
<!-- content end -->

<!-- footer start -->
<div data-role="footer" data-theme="z" class="com-egovFooterBar paddT10" data-position="fixed">
<h4>Copyright (c) MINISTRY OF SECURITY AND PUBLIC ADMINISTRATION.</h4>
</div>
<!-- footer end -->

</div>
<!-- 모바일 페이지 end -->
</body>
</html>

