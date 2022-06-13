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
<title> 상품권 조회(수정화면) </title>

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
	
	function fn_updateCupn() {
		//alert("data 수정합니다");
		document.foxGcctInfoVO.action = "${pageContext.request.contextPath}/fox/gct/updateGcctInfo.fo";
		document.foxGcctInfoVO.submit();	 
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

</form>
</div>
<!-- header end -->

<!-- content start -->
    
<div data-role="content">

  상품권 수정화면입니다.
  
	<form name ="foxGcctInfoVO" id= "foxGcctInfoVO" method="post">
		<c:if test="${result.esntlId != ''}">	
			<input type = "text" id="gcctId" name ="gcctId" readonly value="<c:out value='${result.gcctId}'/>">
			<input type = "text" id="esntlId" name ="esntlId" readonly value="<c:out value='${result.esntlId}'/>">
			<input type = "text" id="bsshEsntlId" name ="bsshEsntlId" readonly value="<c:out value='${result.bsshEsntlId}'/>">
			<input type = "text" id="gcctAmount" name ="gcctAmount" value="<c:out value='${result.gcctAmount}'/>">
			<input type = "text" id="distbBeginDe" name ="distbBeginDe" value="<c:out value='${result.distbBeginDe}'/>">
			<input type = "text" id="distbEndDe" name ="distbEndDe" value="<c:out value='${result.distbEndDe}'/>">
			<input type = "text" id="gcctSttus" name ="gcctSttus" value="<c:out value='${result.gcctSttus}'/>">
			<input type = "text" id="tlphonNo" name ="tlphonNo" readonly value="<c:out value='${result.tlphonNo}'/>">
			<input type = "text" id="moblphonNo" name ="moblphonNo" readonly value="<c:out value='${result.moblphonNo}'/>">
		</c:if>
	</form>

	  <li>
	  		<input type="button" onClick="javascript:fn_updateCupn();" name="updateCupn" id="updateCupn" value="상품권수정">
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

