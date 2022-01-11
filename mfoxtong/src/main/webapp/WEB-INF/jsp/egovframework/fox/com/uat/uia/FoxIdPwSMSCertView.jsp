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
		function certRequest(){
			var code2 = ""; 			
			var smoblphonNo = $("#moblphonNo").val(); 			
			
			if (document.loginForm.moblphonNo.value =="") {
				jAlert("휴대폰 번호를 입력해주시기 바랍니다.",'알림', 'a');
				return false;
			} else {
			
			$.ajax({ 
				type:"POST", 
				url:"${pageContext.request.contextPath}/uat/uai/phoneCheck.fo?smoblphonNo=" + smoblphonNo, 
				cache : false, 
				success:function(data){
					if(data == "error"){
						alert("휴대폰 번호가 올바르지 않습니다.") 						
					}else{						
						code2 = data;
						document.loginForm.tockenCertNum.value = code2;}
					}
				});				
			}
		}
		
		function searchResult(){					
			var suserCertNum = $("#userCertNum").val(); 
			var code2 = document.loginForm.tockenCertNum.value;
			
			if (userCertNum == "") {
				jAlert("인증번호를 입력하여 주시기 바랍니다.",'알림', 'b');
				return false;
			}
			
			//휴대폰 인증번호 대조 			
			if(suserCertNum == code2){
				jAlert("메인페이지 호출" + suserCertNum + code2); 
				
				document.loginForm.action="/FoxMobileMain.fo";
				document.loginForm.submit();
			}else{
				jAlert("입력하신 인증번호가 일치하지 않습니다.",'알림', 'b');
				return false;				
			}			
		}
		
				
		function certRequest2() {
			
			if (document.loginForm.moblphonNo.value =="") {
				jAlert("휴대폰 번호를 입력해주시기 바랍니다.",'알림', 'a');
				return false;
				
			} else {
				
				// 신규 개발 필요  : 비동기 방식 
				document.loginForm.action="${pageContext.request.contextPath}/uat/uia/actionLogin2.fo"; // 인증url로 변경 필요 
				document.loginForm.submit();
		        //document.loginForm.action="${pageContext.request.contextPath}/uat/uia/actionLogin.fo"; // 인증url로 변경 필요 
				//document.loginForm.submit();
		        
		        // 임시 인증번호 셋팅 : 제거 필요 
		       // alert('인증번호를 전송하였습니다. 123456');
				//document.loginForm.tockenCertNum.value = "123456";
			}
		}	
		
		function searchResult2() {
			
			
			var tockenNum = document.loginForm.tockenCertNum.value;
			var userCertNum = document.loginForm.userCertNum.value;
			
			if (userCertNum == "") {
				jAlert("인증번호를 입력하여 주시기 바랍니다.",'알림', 'b');
				return false;
			}
			
			if (tockenNum != userCertNum) {
				jAlert("입력하신 인증번호가 일치하지 않습니다.",'알림', 'b');
				return false;
			}else{
				
		       document.loginForm.action="${pageContext.request.contextPath}/uat/uia/foxIdPwSearchResult.fo";
				document.loginForm.submit();
			}
		}
		
		function clearText(obj) {			
			obj.value = "";
			//this.value=this.value.replace(/[^0-9]/g,'') ;
			
		}

		$(document).ready(fnInit);
		
		function fnInit() {
			var message = "${message}";
			if (message != "") {
				alert(message);
			}
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
		<td align="center" width="80%"><h1 class="bodyLogo" style="font-size:14pt">아이디 찾기</h1></td>
	</tr>
</table>
</div>
<!-- header end -->


<!-- content start -->
 <div data-role="content" class="com-logContent">   
 	<br/>
    <div>
        <table border="1" width = "100%">
			<tr>
				<td width = "100%" hdight="100" align="center">
					가입 시 등록된 휴대폰 번호로 인증후 아이디를 알려드립니다. 
				    
				</td>
			</tr>
		</table>
	</div>

	<form name="loginForm" action ="${pageContext.request.contextPath}/mbl/com/uat/uia/actionLogin.do" method="post">
	<input type="hidden" id="userSe" name="userSe" value="USR"/>
	<input type="hidden" id="rdoSlctUsr" name="rdoSlctUsr" value="GNR"/>
	<input type="hidden" id="searchSe" name="searchSe" value="ID"/>
	<input type="hidden" id="tockenCertNum" name="tockenCertNum" value=""/>	
	

	<div data-role="fieldcontain"  class="com-logPw">
        <table border="1" width = "100%">
			<tr>
				<td width = "100%" hdight="100" align="left">
					<span align="left">휴대폰번호</span><br/>
					<input type="text" name="moblphonNo" id="moblphonNo" value="휴대번호를 입력해 주세요  예)01012341234" data-theme="c" onclick="javascript:clearText(this);" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/> 
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
		<input type="text" name="userCertNum" id="userCertNum" value="인증번호를 입력해주세요" data-theme="c" onclick="javascript:clearText(this);" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
	</div>
	<br/>
	
	<div data-role="fieldcontain" class="com-logLogin" >   
		<a href="javascript:searchResult();" data-role="button" data-thema="z">인증완료</a>
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
