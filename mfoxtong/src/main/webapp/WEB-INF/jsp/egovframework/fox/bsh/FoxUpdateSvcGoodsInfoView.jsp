<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>EgovFrame 일반로그인</title> 
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        
        <!-- eGovFrame Common import -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/ussCommon.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>

		<script type="text/javascript">
		<!--
		function clearText(obj) {
			obj.value = "";
		}
		
		function modifySvcGoodsInfoView() {
			
			document.foxBsshInfoManageVO.action="${pageContext.request.contextPath}/fox/bsh/updateSvcGoodsInfoView.fo";
			document.foxBsshInfoManageVO.submit();
		}
		
		function modifyBsnBassInfoView() {
			
			document.foxBsshInfoManageVO.action="${pageContext.request.contextPath}/fox/bsh/updateBsnBassInfoView.fo";
			document.foxBsshInfoManageVO.submit();
			
		}
		
		function modifyBassInfoView() {
			
			document.foxBsshInfoManageVO.action="${pageContext.request.contextPath}/fox/bsh/updateBsshInfoView.fo";
			document.foxBsshInfoManageVO.submit();
			
		}
		
		//-->
		</script>
</head>

<body>

<!-- 메인 페이지 -->
<div data-role="page">

<!-- 지역검색 overlay panel start-->
  <div data-role="panel" id="overlayPanel" data-display="overlay" data-position="right" width="50" height="200"> 
	  <div data-role="header">
	  <h1>서비스 상품 분류 관리</h1>
	  </div>
	  <div data-role="main" class="ui-content">
		    <form method="post" action="#">
			  <fieldset data-role="controlgroup">
			    <legend>분류관리</legend>
			    <input type="text" name="svcSmallclas" id="svcSmallclas" value="분류1">
			    <input type="button" data-inline="true" class="ui-btn ui-btn-inline ui-shadow ui-corner-all ui-btn-a ui-icon-delete ui-btn-icon-left" value="수정">
			    <input type="button" data-inline="true" class="ui-btn ui-btn-inline ui-shadow ui-corner-all ui-btn-a ui-icon-delete ui-btn-icon-left" value="삭제">
			    <input type="text" name="svcSmallclas" id="svcSmallclas" value="분류2">
   			    <input type="button" data-inline="true" class="ui-btn ui-btn-inline ui-shadow ui-corner-all ui-btn-a ui-icon-delete ui-btn-icon-left" value="수정">
			    <input type="button" data-inline="true" class="ui-btn ui-btn-inline ui-shadow ui-corner-all ui-btn-a ui-icon-delete ui-btn-icon-left" value="삭제">
			  </fieldset>
			  <input type="text" name="svcSmallclas" id="svcSmallclas" value="">
		     <input type="submit" data-inline="true" class="ui-btn ui-btn-inline ui-shadow ui-corner-all ui-btn-a ui-icon-delete ui-btn-icon-left" value="추가">
		    </form>
	  </div>
  </div>
<!-- 지역검색 overlay panel end -->


<!-- header start -->
<div data-role="header">
<table width="100%">
	<tr>   
		<td align="left" width="10%"><a href="${pageContext.request.contextPath}/FoxMobileMain.fo"  class="ui-btn ui-corner-all ui-icon-arrow-l ui-btn-icon-notext" rel="external">뒤로</a></td>
		<td align="center" width="90%"><h1 class="bodyLogo" style="font-size:14pt">서비스정보관리</h1></td>
	</tr>
</table>
</div>
<!-- header end -->


<!-- content start -->
 <div data-role="content" class="com-logContent">   

	<form name="foxBsshInfoManageVO"  method="post" enctype="multipart/form-data">	
	<input type="hidden" id="bsshEsntlId" name="bsshEsntlId" value="<c:out value='${vo.bsshEsntlId}'/>" />
	<input type="hidden" id="esntlId" name="esntlId" value="<c:out value='${vo.esntlId}'/>" />
	
	<br/>
	<!--  네비게이션 탭영역 strt -->
	<div data-role = "navbar">
       <ul>
          <li><a href = "javascript:modifyBsnBassInfoView();"  rel="external">영업정보관리</a></li>
          <li><a href = "javascript:modifySvcGoodsInfoView();" rel="external">서비스정보관리</a></li>  
          <li><a href = "javascript:modifyBassInfoView();"     rel="external">업소기정본정보관리</a></li>
       </ul>
    </div>
    <br/>
	<!--  네비게이션 탭영역	end -->
	
	<!--등록된 카테고리 선택 -->
	<!-- 
		<span align="left">서비스분류</span><br/>
		<input type="text" name="svcSmallclas" id="svcSmallclas" value="" data-theme="c" onclick="" />
	 -->
    <table border="1" width = "100%">
		<tr>
			<td width = "100%" hdight="100" align="left">
				<fieldset class="fieldcontain">
			        <label for="ctgryId">서비스/상품 분류</label>
			        <select name="ctgryId" id="ctgryId">
				     	<c:choose> 
				     		<c:when test="${empty resultCodeList}">
			           	 			<option value="000000">분류 관리를 먼저 하시기 바랍니다.</option>
			            	</c:when>
			            	<c:otherwise>
			            		<option value="000000">서비스분류</option>
								<c:forEach var="result" items="${resultCodeList}">
								 	<option value="<c:out value='${result.codeId}'/>"><c:out value="${result.codeNm}"/></option>
								</c:forEach>
			            	</c:otherwise>
			            </c:choose>
			        </select>
			    </fieldset>
			</td>
			<td width = "100%" hdight="100" align="center">
				<span align="left">  </span><br/>
				<a href="#overlayPanel" data-role="button" data-thema="z">분류관리</a>
			</td>
		</tr>
	</table>
	
   	<!--업체카테고리 선택 -->
   	
   	<!--등록된 서비스상품정보 -->	
	<div>
		<span align="left">서비스/상품정보</span><br/>
   		<c:choose> 
    		<c:when test="${empty svcGoodsInfoList}">
       	 			<span >서비스정보 없음</span>
          	</c:when>
          	<c:otherwise>
				<c:forEach var="result" items="${svcGoodsInfoList}">
				   	<input type="hidden" id="svcId" 	name="svcId" 		value="<c:out value='${result.svcId}'/>"/>
					<table width="100%">
						<tr>
							<th>서비스/상품명</th><td colspan="3"><input type="text" id="svcGoodsNm" 	name="svcGoodsNm" value="<c:out value='${result.svcGoodsNm}'/>"/></td>
						</tr>
						<tr>
							<th>시간</th>
							<th>소비자가격</th>
							<th>할인율</th>
							<th>최종할인가격</th>
						</tr>
						<tr>
							<td><input type="text" id="svcTime" 	name="svcTime" 		value="<c:out value='${result.svcTime}'/>"/></td>
							<td><input type="text" id="svcCnsmrPc" 	name="svcCnsmrPc" 	value="<c:out value='${result.svcCnsmrPc}'/>"/></td>
							<td><input type="text" id="svcDscntRt" 	name="svcDscntRt" 	value="<c:out value='${result.svcDscntRt}'/>"/></td>
							<td><input type="text" id="lastDscntPc" name="lastDscntPc" 	value="<c:out value='${result.lastDscntPc}'/>"/></td>
						</tr>
					</table>
					<div data-role="fieldcontain" class="com-logLogin" >   
						<a href="javascript:alert('추가');" data-role="button" data-thema="z">수정</a>
					</div>
				</c:forEach>
          	</c:otherwise>
          </c:choose>
	</div>
	<br/>
	<hr size="2">
	<br/>
   	<!-- 서비스상품정보 -->	
	</form>	
   	
	<!--업체카테고리 선택 -->
	<!-- 
		<span align="left">서비스분류</span><br/>
		<input type="text" name="svcSmallclas" id="svcSmallclas" value="" data-theme="c" onclick="" />
	 -->
 	<form method="post" enctype="multipart/form-data">	
    <table border="1" width = "100%">
		<tr>
			<td width = "100%" hdight="100" align="left">
				<fieldset class="fieldcontain">
			        <label for="ctgryId">서비스상품정보 신규 추가</label>
			        <select name="ctgryId" id="ctgryId">
				     	<c:choose> 
				     		<c:when test="${empty resultCodeList}">
			           	 			<option value="000000">선택사항없음</option>
			            	</c:when>
			            	<c:otherwise>
			            		<option value="000000">업종분류선택</option>
								<c:forEach var="result" items="${resultCodeList}">
								 	<option value="<c:out value='${result.codeId}'/>"><c:out value="${result.codeNm}"/></option>
								</c:forEach>
			            	</c:otherwise>
			            </c:choose>
			        </select>
			    </fieldset>
			</td>
			<td width = "100%" hdight="100" align="center">
				<span align="left">  </span><br/>
				<a href="#overlayPanel" data-role="button" data-thema="z">분류관리</a>
			</td>
		</tr>
	</table>
   	<!--업체카테고리 선택 -->
   	
   	<!-- 서비스상품정보 -->	
	<div>
		<table width="100%">
			<tr>
				<th>서비스상품명</th><td colspan="3"><input type="text" id="svcGoodsNm" 	name="svcGoodsNm" value=""/></td>
			</tr>
			<tr>
				<th>시간</th>
				<th>소비자가격</th>
				<th>할인율</th>
				<th>최종할인가격</th>
			</tr>
			<tr>
				<td><input type="text" id="svcTime" 	name="svcTime" 		value=""/></td>
				<td><input type="text" id="svcCnsmrPc" 	name="svcCnsmrPc" 	value=""/></td>
				<td><input type="text" id="svcDscntRt" 	name="svcDscntRt" 	value=""/></td>
				<td><input type="text" id="lastDscntPc" name="lastDscntPc" 	value=""/></td>
			</tr>
		</table>
	</div>
   	<!-- 서비스상품정보 -->	
	<div data-role="fieldcontain" class="com-logLogin" >   
		<a href="javascript:alert('추가');" data-role="button" data-thema="z">서비스상품정보추가</a>
	</div>
	<br/>
	</form>
	
</div>
<!-- content end -->

<!-- footer start -->
  <div data-role="footer" style="text-align:center;" data-position="fixed">
   <div data-role="navbar">
      <ul>
        <li><a href="${pageContext.request.contextPath}/FoxMobileMain.fo" data-icon="home" rel="external">여우홈</a></li>
        <li><a href="${pageContext.request.contextPath}/fox/bsh/bsshInMain.fo" data-icon="navigation">예약관리</a></li>
        <li><a href="javascript:alert('구현 예정');" data-icon="check">쿠폰관리</a></li>
        <li><a href="${pageContext.request.contextPath}/cop/bbs/anonymous/selectBoardList.fo?bbsId=BBSMSTR_000000000002" rel="external" data-icon="navigation" data-icon="comment">후기관리</a></li>
        <li><a href="${pageContext.request.contextPath}/uat/uia/foxMypage.fo" data-icon="user" rel="external">샵정보관리</a></li> 
      </ul>
    </div>
  </div>
<!-- footer end -->

</div>
<!-- 메인 페이지 end -->
</body>
</html>

