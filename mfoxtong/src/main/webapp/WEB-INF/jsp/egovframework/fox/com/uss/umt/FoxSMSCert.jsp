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

		function certRequest() {
			
			if (document.foxMberManageVO.moblphonNo.value =="") {
				jAlert("휴대폰 번호를 입력해주시기 바랍니다.",'알림', 'a');
				return false;
				
			} else {
				
				// to-do :  휴대폰번호 체크 로직 넣어야 함.
				
				
				// 신규 개발 필요  : 비동기 방식 
		        //document.foxMberManageVO.action="${pageContext.request.contextPath}/uat/uia/actionLogin.fo"; // 인증url로 변경 필요 
				//document.foxMberManageVO.submit();
		        
		        // 임시 인증번호 셋팅 : 제거 필요 
		        alert('인증번호를 전송하였습니다. 123456');
				document.foxMberManageVO.tockenCertNum.value = "123456";
			}
		}	
		
		function searchResult() {
			
			
			var tockenNum = document.foxMberManageVO.tockenCertNum.value;
			var userCertNum = document.foxMberManageVO.userCertNum.value;
			
			if (userCertNum == "") {
				jAlert("인증번호를 입력하여 주시기 바랍니다.",'알림', 'b');
				return false;
			}
			
			if (tockenNum != userCertNum) {
				jAlert("입력하신 인증번호가 일치하지 않습니다.",'알림', 'b');
				return false;
			}else{
				
		        document.foxMberManageVO.action="${pageContext.request.contextPath}/uat/uia/foxIdPwSearchResult.fo";
				document.foxMberManageVO.submit();
			}
		}
		
		function clearText(obj) {
			obj.value = "";
		}
		
		function next(){
			
			   document.foxMberManageVO.action="${pageContext.request.contextPath}/uss/umt/foxMberInsertView.fo";
			   document.foxMberManageVO.submit();
			
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
		<td align="center" width="80%"><h1 class="bodyLogo" style="font-size:14pt">회원가입</h1></td>
	</tr>
</table>
</div>
<!-- header end -->

<!-- content start -->
 <div data-role="content" class="com-logContent">   

	<form name="foxMberManageVO"  method="post">
	<input type="hidden" id="userSe" name="userSe" value="USR"/>
	<input type="hidden" id="tockenCertNum" name="tockenCertNum" value="123456"/>

	<div data-role="fieldcontain"  class="com-logPw">
        <table border="1" width = "100%">
			<tr>
				<td width = "100%" hdight="100" align="left">
					<span align="left">휴대폰번호</span><br/>
					<input type="text" name="moblphonNo" id="moblphonNo" value="휴대번호를 입력해 주세요  예)01012341234" data-theme="c" onclick="javascript:clearText(this);" />
				</td>
				<td width = "100%" hdight="100" align="center">
					<span align="left">  </span><br/>
					<a href="javascript:certRequest();" data-role="button" data-thema="z">인증요청</a>
				</td>
			</tr>
		</table>
	</div>
	<br/>
	<br/>
	
	<div data-role="fieldcontain"  class="com-logPw">
		<input type="text" name="userCertNum" id="userCertNum" value="인증번호를 입력해주세요" data-theme="c" onclick="javascript:clearText(this);"/>
	</div>
	<br/>
	
	<div data-role="fieldcontain" class="com-logLogin" >   
		<a href="javascript:next();" data-role="button" data-thema="z">인증완료</a>
	</div>
	<br/>
	
	<input name="j_username" type="hidden"/>
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

