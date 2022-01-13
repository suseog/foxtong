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
		
		function regist() {
			
			 if($("#ctgryId").val() == "" || $("#ctgryId").val()=="000000"){
			 	jAlert("업종분류를 선택 해주세요.",'알림', 'b');
				return false;
			 }   000000
			 
			 if($("#mtltyNm").val() == "" || $("#mtltyNm").val()=="상호를 입력해 주세요"){
				 	jAlert("상호명을 입력 해주세요 .",'알림', 'b');
					return false;
			 }
			 
			 if($("#moblphonNo").val() == ""|| $("#moblphonNo").val()=="휴대폰번호를 입력해 주세요"){
				 	jAlert("휴대폰번호를 입력해 주시기 바랍니다. \n 휴대폰번호는 일반사용자에게 공개되지 않습니다.",'알림', 'b');
					return false;
			 }
			 
			 if($("#adres").val() == ""|| $("#adres").val()=="주소를 입력해주세요"){
				 	jAlert("주소를 입력하여 주시기 바랍니다.",'알림', 'b');
					return false;
			 }
			 
			if($("#detailAdres").val() == ""|| $("#detailAdres").val()=="상세 주소를 입력해주세요"){
				 	jAlert("지도서비스를 위해 상세 주소가 필요합니다.",'알림', 'b');
					return false;
			}

			document.foxEntrpsEmplyrSbscrbRequstVO.action="${pageContext.request.contextPath}/fox/bsh/entrpsEmplyrSbscrbRequst.fo";
			document.foxEntrpsEmplyrSbscrbRequstVO.submit();
			
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
		<td align="left" width="20%"><a href="${pageContext.request.contextPath}/index.jsp"  class="ui-btn ui-corner-all ui-icon-arrow-l ui-btn-icon-notext" rel="external">뒤로</a></td>
		<td align="center" width="80%"><h1 class="bodyLogo" style="font-size:14pt">업체사용자가입요청</h1></td>
	</tr>
</table>
</div>
<!-- header end -->

<!-- content start -->
 <div data-role="content" class="com-logContent">   

	<form name="foxEntrpsEmplyrSbscrbRequstVO"  method="post">	
	
	<!--업체카테고리 선택 -->
	<br/>
	<fieldset class="fieldcontain">
        <label for="ctgryId">업체 분류 선택</label>
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
   	<!--업체카테고리 선택 -->
	
	<!--상호명입력 -->
	<div data-role="fieldcontain">
		<span align="left">상호명</span><br/>
		<input type="text" name="mtltyNm" id="mtltyNm" value="상호를 입력해 주세요" data-theme="c" onclick="javascript:clearText(this);"/>
	</div>
	
	<!-- 휴대폰번호 입력 -->
	<div data-role="fieldcontain">
		<span align="left">전화번호</span><br/>
		<input type="text" name="tlphonNo" id="tlphonNo" value="업소 전화번호를 입력해주세요" data-theme="c" onclick="javascript:clearText(this);"/>
	</div>
	<div data-role="fieldcontain">
		<span align="left">휴대폰번호</span><br/>
		<input type="text" name="moblphonNo" id="moblphonNo" value="휴대폰번호를 입력해 주세요" data-theme="c" onclick="javascript:clearText(this);"/>
	</div>
	
	<!-- 주소입력 -->
	<div data-role="fieldcontain">
        <table border="1" width = "100%">
			<tr>
				<td width = "100%" hdight="100" align="left">
					<span align="left">우편번호</span><br/>
					<input type="text" name="postNo" id="postNo" value="" data-theme="c" readonly/>
				</td>
				<td width = "100%" hdight="100" align="center">
					<span align="left">  </span><br/>
					<a href="javascript:addressSearch();" data-role="button" data-thema="z">우편번호검색</a>
				</td>
			</tr>
		</table>
			<span align="left">주소</span><br/>
			<input type="text" name="adres" id="adres" value="주소를 입력해주세요" data-theme="c" onclick="javascript:clearText(this);"/>
			<span align="left">상세주소</span><br/>
			<input type="text" name="detailAdres" id="detailAdres" value="상세 주소를 입력해주세요" data-theme="c" onclick="javascript:clearText(this);"/>
			<span align="left">건물명</span><br/>
			<input type="text" name="buldNm" id="buldNm" value="건물명 입력" data-theme="c" onclick="javascript:clearText(this);"/>
	</div>
	<br/>
	<br/>
	<br/>
	<div data-role="fieldcontain" class="com-logLogin" >   
		<a href="javascript:regist();" data-role="button" data-thema="z">가입요청</a>
	</div>
	<br/>
	
	</form>

</div>
<!-- content end -->

<!-- footer start -->
<!-- 
<div data-role="footer"  data-theme="z" data-position="fixed">
	<h4>Copyright (c) MINISTRY OF SECURITY AND PUBLIC ADMINISTRATION.</h4>
</div>
 -->
<!-- footer end -->

</div>
<!-- 메인 페이지 end -->
</body>
</html>

