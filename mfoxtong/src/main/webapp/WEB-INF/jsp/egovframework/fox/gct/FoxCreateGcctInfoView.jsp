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
<title> 상품권 조회 </title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/ussCommon.css"/>
    <style>
      #top_category {overflow-x:scroll;width:100%;}
      #top_category ul {display:table;width:100%;margin:5px 5px 0px 5px;}
      #top_category li {display:table-cell;white-space:nowrap;list-style:none;}
      #top_categoryli a {display:block;margin-left:5px;border:1px solid #000;}
    </style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>	    
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>   	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/fox/cmm/jquery.roundimage.js"></script>
  <script>
  <!--//
    $(document).ready(function() {
        $('.img-round').roundImage();
    });
    
    
	function fn_fox_search_noticeList() {
		document.frm.action = "${pageContext.request.contextPath}/cop/bbs/searchBoardArticlesResult.fo?bbsId=BBSMSTR_000000000002";
		document.frm.submit();	
	}
	
	function fn_addCupn() {
		document.foxGcctInfoVO.action = "${pageContext.request.contextPath}/fox/gct/createGcctInfo.fo";
		document.foxGcctInfoVO.submit();	
	}
	
	function fn_change(value){
		//alert("스위치 선택값은 : " + value);
		document.foxGcctInfoVO.gcctSttus.value=value;
	}
    -->
    </script>
</head>  
<body>
<!-- 모바일 페이지 start -->
<div data-role="page" >


<!-- header start -->
<div data-role="header" >
<form id="frm" name="frm" method="post" data-role="none">
<div width = "100%">
	<table border="1" width = "100%">
		<tr>
			<td width = "10%" align="right">
			 <img src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/logo_fox.png" width="50" height="50" alt="여우통로"> 
			</td>
			<td width = "70%">
			 <input type="text" name="searchWrd_me" id="searchWrd_me"  onkeypress="press(event);"/>
			</td>
			<td width = "10%">
			 <button type ="submit" onclick="javascript:fn_fox_search_noticeList()">검색</button>
			</td>
			<td width = "10%" align="center">
			 <a href="#overlayPanel" >
			 	<img src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/btn_more.png" width="30" height="30" alt="지역검색 "> 
			 </a>
			</td>
		</tr>
	</table>
</div>
</form>
</div>
<!-- header end -->

<!-- content start -->
    
<div data-role="content">
	<form name ="foxGcctInfoVO" id= "foxGcctInfoVO" method="post">	
		<input type = "text" id="gcctId" name ="gcctId" value="copn_000000000000001">
		<input type = "text" id="esntlId" name ="esntlId" value="USRCNFRM_00000000063">
		<input type = "text" id="bsshEsntlId" name ="bsshEsntlId" value="BSSH_000000000000555">
		<input type = "text" id="gcctAmount" name ="gcctAmount" value="10">
		<input type = "text" id="distbBeginDe" name ="distbBeginDe" value="20220120">
		<input type = "text" id="distbEndDe" name ="distbEndDe" value="20220222">
		<span>사용여부:<select data-role="slider" id="change" name="change" onchange="javascript:fn_change(this.value);"><option value="N">Off</option><option value="Y" selected>On</option></select></span>
		<input type = "hidden" id="gcctSttus" name ="gcctSttus" value= "Y">
		<input type = "text" id="tlphonNo" name ="tlphonNo" value="053 111 2222">
		<input type = "text" id="moblphonNo" name ="moblphonNo" value="010 111 2222">
		
		 <input id="ntceBgnde" name="ntceBgnde" type="hidden" >
		      <input id ="ntceBgndeView" name="ntceBgndeView"  type="text" size="10" value=""  readOnly
		      	onClick="javascript:fn_egov_NormalCalendar(document.foxGcctInfoVO, document.foxGcctInfoVO.ntceBgnde, document.foxGcctInfoVO.ntceBgndeView);" title="게시시작일자입력">
		
		
		
	</form>
		  
	  <li>
	  		<input type="button" onClick="javascript:fn_addCupn();" name="addCupn" id="addCupn" value="등록">
	  </li>
	<br/>
</div>
<div data-role="footer" style="text-align:center;" data-position="fixed">
   <div data-role="navbar">
      <ul>
        <li><a href="${pageContext.request.contextPath}/FoxMobileMain.fo" data-icon="home" rel="external">홈 </a></li>
       
        <c:choose>
         	<c:when test="${sessionScope.loginVO.mberSe eq '02'}">
         		<li><a href="${pageContext.request.contextPath}/fox/bsh/bsshInMain.fo" data-icon="user" rel="external">샵정보관리(예약)</a></li> 
         	</c:when>
         	<c:otherwise>
		         <li><a href="${pageContext.request.contextPath}/fox/bsh/bsshInMain.fo" data-icon="navigation">내주변</a></li>
         	</c:otherwise>
         </c:choose>
        <li><a href="${pageContext.request.contextPath}/fox/gct/retrieveGcctInfoList.fo" data-icon="check" rel="external">쿠폰북 </a></li>
        <li><a href="${pageContext.request.contextPath}/cop/bbs/anonymous/selectBoardList.fo?bbsId=BBSMSTR_000000000002" rel="external" data-icon="navigation" data-icon="comment">여우수다 </a></li>
        <!-- 
        /cop/bbs/selectBoardList.fo?bbsId=BBSMSTR_000000000001
        <li><a href="${pageContext.request.contextPath}/cop/bbs/anonymous/selectBoardList.fo?bbsId=BBSMSTR_000000000002" rel="external" data-icon="navigation" data-icon="comment">여우생활</a></li>
         -->
         <c:choose>
         	<c:when test="${sessionScope.loginVO.ncnm eq null}">
         		<li><a href="${pageContext.request.contextPath}/uat/uia/egovLoginUsr.fo" data-icon="user" rel="external">로그인</a></li> 
         	</c:when>
         	<c:otherwise>
		        <li><a href="${pageContext.request.contextPath}/uat/uia/foxMypage.fo" data-icon="user" rel="external">내정보</a></li> 
         	</c:otherwise>
         </c:choose>
      </ul>
    </div>
  </div>
  
<!-- 모바일 페이지 end -->
</body>
</html>

