<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>내정보 수정</title> 
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
		
		function modify() {
			
			var ncnm = document.foxMberManageVO.ncnm.value;
			
			if ($("#userCertNum").val() == "") {
				jAlert("인증번호를  입력하여 주시기 바랍니다.",'알림', 'b');
				return false;
			}
			
			if ($("#ncnm").val() == "") {
				jAlert("닉네임을 입력하여 주시기 바랍니다.",'알림', 'b');
				return false;
			}
			
			if(comparePWd() == false){
				return false;
			}
			
			if (mberEmailAdres != "" && ncnm != "") {
				document.foxMberManageVO.action="${pageContext.request.contextPath}/uss/umt/foxMberSelectUpdt.fo";
				document.foxMberManageVO.submit();
			}else{
				jAlert("알수없는 오류 발생.",'알림', 'b');
				return false;
			}
		}
		

		
		function comparePWd(){
			 if($("#repassword").val() != "" && $("#password").val() == ""){
				jAlert("첫 번째 비밀번호 부터 입력해 주세요.",'알림', 'b');
				return false;
			 }
		     if($("#password").val() != $("#repassword").val()){
		    	 jAlert("입력한 패스워드가 일치하지 않습니다. ",'알림', 'b');
				 return false;
		     }
	    	 return true;
		}
		
		
		function changePassword(){

			 var pw = $("#password").val();
			 var num = pw.search(/[0-9]/g);
			 var eng = pw.search(/[a-z]/ig);
			 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

			 if(pw.length < 8 || pw.length > 20){
				  jAlert("자리 ~ 20자리 이내로 입력해주세요. ",'알림', 'b');
				  return false;
			 }else if(pw.search(/\s/) != -1){
			  	 jAlert("비밀번호는 공백 없이 입력해주세요.",'알림', 'b');
			  	return false;
			 }else if(num < 0 || eng < 0 || spe < 0 ){
				  jAlert("영문,숫자, 특수문자를 혼합하여 입력해주세요.",'알림', 'b');
				  return false;
			 }else {
			    return true;
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
		<td align="left" width="20%"><a href="${pageContext.request.contextPath}/uat/uia/foxMypage.fo"  class="ui-btn ui-corner-all ui-icon-arrow-l ui-btn-icon-notext" rel="external">뒤로</a></td>
		<td align="center" width="80%"><h1 class="bodyLogo" style="font-size:14pt">내정보수정</h1></td>
	</tr>
</table>
</div>
<!-- header end -->

<!-- content start -->
 <div data-role="content" class="com-logContent">   

	<form name="foxMberManageVO"  method="post">	
	<input type="hidden" id="userSe" name="userSe" value="01"/>
	<input type="hidden" id="mberSe" name="mberSe" value="01"/>
	<input type="hidden" id="mberSttus" name="mberSttus" value="01"/>
	<input type="hidden" id="tockenCertNum" name="tockenCertNum" value=""/>
	
	<!-- 이메일 -->
	<br/>
	<div>  
        <table border="1" width = "100%">
			<tr>
				<td width = "100%" hdight="100" align="left">
					<span align="left">아이디(이메일)</span><br/>
					<input type="text" name="mberEmailAdres" id="mberEmailAdres" value="<c:out value='${foxMberManageVO.mberEmailAdres}'/>" data-theme="c"  readonly/>
				</td>
				<td width = "100%" hdight="100" align="center">
				</td>
			</tr>
		</table>
	</div>	
	
	<!-- 닉네임 -->
	<div>  
        <table border="1" width = "100%">
			<tr>
				<td width = "100%" hdight="100" align="left">
					<span align="left">별명</span><br/>
					<input type="text" name="ncnm" id="ncnm" value="<c:out value='${foxMberManageVO.ncnm}'/>" data-theme="c" onclick="javascript:clearText(this);"/>
				</td>
				<td width = "100%" hdight="100" align="center">
					<span align="left">  </span><br/>
					<a href="javascript:certRequest();" data-role="button" data-thema="z">중복확인</a>
				</td>
			</tr>
		</table>
	</div>
	
	<!-- 비밀번호 -->
	<div data-role="fieldcontain">
		<span align="left">비밀번호</span><br/>
		<input type="text" name="password" id="password" value="" data-theme="c" onclick="javascript:clearText(this);" onchange="javascript:changePassword();"/>
		<input type="text" name=repassword" id="repassword" value="" data-theme="c" onclick="javascript:clearText(this);"/>
	</div>
	
	<!-- 휴대폰번호 인증 -->
	<div data-role="fieldcontain"  class="com-logPw">
        <table border="1" width = "100%">
			<tr>
				<td width = "100%" hdight="100" align="left">
					<span align="left">휴대폰번호</span><br/>
					<input type="text" name="moblphonNo" id="moblphonNo" value="<c:out value='${foxMberManageVO.moblphonNo}'/>" data-theme="c" onclick="javascript:clearText(this);" />
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
	<div>  
		<input type="text" name="userCertNum" id="userCertNum" value="인증번호를 입력해주세요" data-theme="c" onclick="javascript:clearText(this);"/>
	</div>
	<br/>
	<br/>
	<br/>
	<br/>
	<div>  
		<a href="javascript:modify();" data-role="button" data-thema="z">수정완료 </a>
	</div>
	<div>   
		<a href="${pageContext.request.contextPath}/uat/uia/actionLogout.fo" data-role="button" rel="external" >로그아웃</a>
	</div>
	<div>   
		<a href="javascript:deleteMyInfo();" data-role="button" data-thema="z">회원탈퇴</a>
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

