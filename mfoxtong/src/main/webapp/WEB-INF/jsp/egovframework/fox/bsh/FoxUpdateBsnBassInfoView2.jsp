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
		
		function makeFileAttachment(){
			 var maxFileNum = 1;
		     if(maxFileNum==null || maxFileNum==""){
		    	 maxFileNum = 2;
		     }
			 var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
			 multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
		}
		
		function modifyBsnBassInfoView() {
			
			document.foxBsshInfoManageVO.action="${pageContext.request.contextPath}/fox/bsh/updateBsnBassInfoView.fo";
			document.foxBsshInfoManageVO.submit();
			
		}
		
		function modifyBsnBsshInfo() {
			alert('호출됩니다.');

			document.foxBsshInfoManageVO.action="${pageContext.request.contextPath}/fox/bsh/updateBsnBassInfo.fo";
			document.foxBsshInfoManageVO.submit(); 
			
		}
		
		function modifyBassInfoView() {
			
			document.foxBsshInfoManageVO.action="${pageContext.request.contextPath}/fox/bsh/updateBsshInfoView.fo";
			document.foxBsshInfoManageVO.submit();
			
		}
		
		function modifySvcGoodsInfoView() {
			
			document.foxBsshInfoManageVO.action="${pageContext.request.contextPath}/fox/bsh/updateSvcGoodsInfoView.fo";
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
		<td align="center" width="90%"><h1 class="bodyLogo" style="font-size:14pt">영업점기본정보관리</h1></td>
	</tr>
</table>
</div>
<!-- header end -->


<!-- content start -->
 <div data-role="content" class="com-logContent">   

	<form name="foxBsshInfoManageVO"  method="post" enctype="multipart/form-data">	
	<input type="hidden" id="bsshEsntlId" name="bsshEsntlId" value="<c:out value='${result.bsshEsntlId}'/>" />
	<input type="hidden" id="esntlId" name="esntlId" value="<c:out value='${result.esntlId}'/>" />
	
	<input type="hidden" name="posblAtchFileNumber" value="1"/>
	<input type="hidden" name="posblAtchFileSize" value="10000000000000"/>
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
   	<!--  멀티미디어 사진파일 참조  -->
	<div>
		<span align="left">영업점 메인 프로필 </span>
		<br/>
		<table width="100%" align="center">
	  	  <c:if test="${result.bsshPhotoId != ''}">
		    <tr> 
	            <td width="200px" height="200px" align="center">
	                <img width="400px" height="200px" src="<c:url value='${pageContext.request.contextPath}/cmm/fms/getImage.do'/>?atchFileId=<c:out value='${result.bsshPhotoId}'/>&fileSn=0" class="mcomd-photo"/>
	            </td>
		    </tr>
		  </c:if>  
	  	</table>
  	</div>
	<div>
		<!-- <input type="file" id="bsshPhoto" name="bsshPhoto" accept="image/*" /> -->
        <table width="100%" cellspacing="0" cellpadding="0" border="0" align="center">
		    <tr>
		        <td><input name="file_1" id="egovComFileUploader" type="file" title="업소메인프로필사진" accept="image/*"/></td>
		    </tr>
       </table>
	</div>
  	<br/>
	<!--  멀티미디어 사진파일 참조  -->
	
	<!--업소 캠페인 문구  -->
	<div data-role="fieldcontain">
		<span align="left">캠페인문구(한줄)</span><br/>
		<input type="text" name="bsshCmpgnWords" id="bsshCmpgnWords" value="<c:out value='${result.bsshCmpgnWords}'/>" data-theme="c" onclick="javascript:clearText(this);"/>
	</div>
	
	<!-- 업소정보소개(text) -->
	<div data-role="fieldcontain">
		<span align="left">업소소개내용</span><br/>
		<textarea id="bsshIntrcnCn" name="bsshIntrcnCn" rows="5" cols="33"><c:out value='${result.bsshIntrcnCn}'/></textarea>
	</div>
	
	<!-- 영업시간 -->	
	<div data-role="fieldcontain">
		<span align="left">영업시간</span><br/>
		<table>
			<tr>
				<td>시작시간:</td>
				<td>
				<select name="bsnBeginTime" id="bsnBeginTime">
		 			<option value="09">09</option>
		 			<option value="10">10</option>
		 			<option value="11">11</option>
		 			<option value="12">12</option>
		 			<option value="13">13</option>
		 			<option value="14">14</option>
		 			<option value="15">15</option>
		 			<option value="16">16</option>
		 			<option value="17">17</option>
		 			<option value="18">18</option>
		        </select>
				</td>
				<td>         </td>
				<td>종료시간:</td>
				<td>
				<select name="bsnEndTime" id="bsnEndTime">
		 			<option value="09">17</option>
		 			<option value="09">18</option>
		 			<option value="09">19</option>
		 			<option value="09">20</option>
		 			<option value="09">21</option>
		 			<option value="09">01</option>
		 			<option value="09">02</option>
		 			<option value="09">03</option>
		 			<option value="09">04</option>
		 			<option value="09">05</option>
		        </select>
				</td>
			</tr>
		</table>
	</div>
	<br/>
	<div data-role="fieldcontain" class="com-logLogin" >   
		<a href="javascript:modifyBsnBsshInfo();" data-role="button" data-thema="z">영업정보수정완료</a>
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

