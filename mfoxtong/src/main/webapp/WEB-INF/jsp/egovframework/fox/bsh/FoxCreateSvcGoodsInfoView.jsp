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
			alert('dkssww');
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
          <li><a href = "javascript:modifySvcGoodsInfoView();" data-ajax = "false">서비스정보관리</a></li>  
          <li><a href = "javascript:modifyBassInfoView();"  rel="external">업소기정본정보관리</a></li>
       </ul>
    </div>
    <br/>
	<!--  네비게이션 탭영역	end -->
	

	<!-- 서비스상품정보 -->	
	<div>
		<span align="left">서비스상품정보</span><br/>
		<table width="100%">
			<tr>
				<th>분류</th><td><input type="text" id="svcSmallclas" 	name="svcSmallclas" value=""/><input type="button" id="pop1" 	name=""pop1" value="관리"/> </td>
			</tr>
			<tr>
				<th>서비스상품명</th><td><input type="text" id="svcGoodsNm" 	name="svcGoodsNm" value=""/></td>
			</tr>
			<tr>
				<th>요약설명</th><td><textarea id="svcSumryDc" name="svcSumryDc" rows="5" cols="33">필요시 입력</textarea></td>
			</tr>
		</table>
		<table width="100%">
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
	
	
	<br/>
	<div data-role="fieldcontain" class="com-logLogin" >   
		<a href="javascript:createSvcGoodsInfo();" data-role="button" data-thema="z">서비스상품정보등록</a>
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

