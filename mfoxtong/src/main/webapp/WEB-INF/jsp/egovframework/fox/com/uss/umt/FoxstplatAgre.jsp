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
		function allAgree(){
			
			var allCheckVar = $("#allCheck").val();
			if(allCheckVar == "false"){
				$("input[type=checkbox]").prop("checked",true);
				$("#allCheck").val(true);
			}else{
				$("input[type=checkbox]").prop("checked",false);
				$("#allCheck").val(false);
			}
		}
		
		function oneAgree(obj){
			
			var thisCheck = $(obj).is(":checked");
			
			if($("input[type=checkbox]:checked").length == 4){ // 항목이 늘어나는 경우 숫자 변경 필요
				$("#allCheck").val(true);
			}else{
				$("#allCheck").val(false);
			}
		}
		
		function next(){
			
			if($("#useStplatAgreAt").is(":checked") == false){
				alert('이용약관에 동의하셔야 합니다.');
				return false;
			}
			if($("#indvdlinfoColctAgreAt").is(":checked")== false){
				alert('개인정보 수집이용에 동의하셔야 합니다.');
				return false;
			}
			
			if($("#useStplatAgreAt").is(":checked") && $("#indvdlinfoColctAgreAt").is(":checked")){
				
			   document.foxMberManageVO.action="${pageContext.request.contextPath}/uss/umt/smsCertView.fo";
			   document.foxMberManageVO.submit();
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
		<td align="left" width="20%"><a href="${pageContext.request.contextPath}/uat/uia/egovLoginUsr.fo"  class="ui-btn ui-corner-all ui-icon-arrow-l ui-btn-icon-notext" rel="external">뒤로</a></td>
		<td align="center" width="80%"><h1 class="bodyLogo" style="font-size:14pt">회원가입(약관)</h1></td>
	</tr>
</table>
</div>
<!-- header end -->

<!-- content start -->
 <div data-role="content" class="com-logContent">   

	<form name="foxMberManageVO" action ="${pageContext.request.contextPath}/uss/umt/EgovMberInsert.fo" method="post">
	<input type="hidden" id="allCheck" name="allCheck" value="false"/>
	
	<div data-role="fieldcontain" class="com-logLogin" >   
		<a href="javascript:allAgree();" data-role="button" data-thema="z" id="allCheckBtn">전체동의</a>
	</div>
	<div>
        <table border="1" width = "100%">
			<tr>
				<td width = "90%" hdight="100" align="left">
					<a href="#" data-role="button" data-thema="z">이용약관(필수)</a>
				</td>
				<td width = "10%" hdight="100" align="center">
		          	<input type="checkbox" name="useStplatAgreAt" id="useStplatAgreAt" value="1" onchange="javascript:oneAgree(this);"/>
				</td>
			</tr>
			<tr>
				<td width = "90%" hdight="100" align="left">
					<a href="#" data-role="button" data-thema="z">개인정보 수집 이용(필수)</a>
				</td>
				<td width = "10%" hdight="100" align="center">
		          	<input type="checkbox" name="indvdlinfoColctAgreAt" id="indvdlinfoColctAgreAt" value="1" onchange="javascript:oneAgree(this);"/>
				</td>
			</tr>
			<tr>
				<td width = "90%" hdight="100" align="left">
					<a href="#" data-role="button" data-thema="z">마케팅 알림 수신 동의(선택)</a>
				</td>
				<td width = "10%" hdight="100" align="center">
		          	<input type="checkbox" name="marktRecptnAgreAt" id="marktRecptnAgreAt" value="1" onchange="javascript:oneAgree(this);"/>
				</td>
			</tr>
			<tr>
				<td width = "90%" hdight="100" align="left">
					<a href="#" data-role="button" data-thema="z">위치정보 이용약관 동의(선택)</a>
				</td>
				<td width = "10%" hdight="100" align="center">
		          	<input type="checkbox" name="lcinfoUseAgreAt" id="lcinfoUseAgreAt" value="1" onchange="javascript:oneAgree(this);"/>
				</td>
			</tr>
		</table>
	</div>
	<br/>
	<br/>
	<br/>
	<div data-role="fieldcontain" class="com-logLogin" >   
		<a href="javascript:next();" data-role="button" data-thema="z" rel="external">다음</a>
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

