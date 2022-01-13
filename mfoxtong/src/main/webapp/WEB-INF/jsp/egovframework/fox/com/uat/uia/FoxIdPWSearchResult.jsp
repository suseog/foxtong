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
		function searchIdPw(searchSe) {
			
			document.loginForm.searchSe.value = searchSe;
			
			if(searchSe =="A"){
				document.loginForm.searchSeNm.value = "아이디 찾기";
			}else if(searchSe =="B"){
				document.loginForm.searchSeNm.value = "패스워드 찾기";
			}else{
				alert("알수없는 요청입니다. ");
				return false;
			}
		 	document.loginForm.action="${pageContext.request.contextPath}/uat/uia/foxIdPwSMSCertView.fo";
			document.loginForm.submit();
			
		}
		// 의미 없으면 삭제 필요 
		$(document).ready(fnInit);
		function fnInit() {
			var message = "${message}";
			if (message != "") {
				alert(message);
			}
		}
		
		-->
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
		<td align="center" width="80%"><h1 class="bodyLogo" style="font-size:14pt"><c:out value="${loginVO.searchSeNm}"/></h1></td>
	</tr>
</table>
</div>
<!-- header end -->

<!-- content start -->
 <div data-role="content" class="com-logContent">   
    <div>
        <table border="1" width = "100%">
			<tr>
				<td width = "100%" align="center">
				 <img src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/logo_fox.png" width="100" height="100" alt="여우통로"> 
				</td>
			</tr>
		</table>
	</div>

	<form name="loginForm">
		<input type="hidden" id="userSe" name="userSe" value="USR"/>
	<input type="hidden" id="rdoSlctUsr" name="rdoSlctUsr" value="GNR"/>
	<input type="hidden" id="searchSe" name="searchSe" value="<c:out value='${loginVO.searchSe}'/>"/>
	<input type="hidden" id="searchSeNm" name="searchSeNm" value="<c:out value='${loginVO.searchSeNm}'/>"/>
	
	<br/>
	<br/>
	
	<c:if test="${loginVO.searchSe == 'A'}">
		<div align="center">   
			<span>회원님의 아이디</span>
			<br/>
			<span><c:out value='${resultVO.email}'/></span>
		</div>
	</c:if>
	<c:if test="${loginVO.searchSe == 'B'}">
		<div align="center">   
			<span>휴대폰으로 임시 비밀번호를 전송하였습니다.</span>
		</div>
	</c:if>
	<br/>
	<br/>
	<br/>
	<br/>

	<div data-role="fieldcontain" class="com-logLogin" >   
		<a href="${pageContext.request.contextPath}/uat/uia/egovLoginUsr.fo" data-role="button" rel="external">로그인</a>
	</div>
	<div data-role="fieldcontain" class="com-logLogin" >  
		<c:if test="${loginVO.searchSe == 'B'}">
			<div align="center">   
				<a href="javascript:searchIdPw('A');" data-role="button" data-thema="z">아이디 찾기</a>
			</div>
		</c:if>
		<c:if test="${loginVO.searchSe == 'A'}">
			<div align="center">   
				<a href="javascript:searchIdPw('B');" data-role="button" data-thema="z">비밀번호 찾기</a>
				
			</div>
		</c:if>
	</div>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<input name="j_username" type="hidden"/>
	</form>

</div>
<!-- content end -->

<!-- footer start -->
<div data-role="footer"  data-theme="z" data-position="fixed">
	<h4>Copyright (c) MINISTRY OF SECURITY AND PUBLIC ADMINISTRATION.</h4>
</div>
<!-- footer end -->

</div>
<!-- 메인 페이지 end -->
</body>
</html>

