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
			
			var mberEmailAdres = document.foxMberManageVO.mberEmailAdres.value;
			var ncnm = document.foxMberManageVO.ncnm.value;
			
			if (mberEmailAdres == "") {
				jAlert("인증번호를 입력하여 주시기 바랍니다.",'알림', 'b');
				return false;
			}
			
			if (ncnm == "") {
				jAlert("닉네임을 입력하여 주시기 바랍니다.",'알림', 'b');
				return false;
			}
			
			if(comparePWd() == false){
				return false;
			}
			
			if (mberEmailAdres != "" && ncnm != "") {

				document.foxMberManageVO.action="${pageContext.request.contextPath}/uss/umt/foxMberInsert.fo";//uss/umt/foxMberInsert.fo
				document.foxMberManageVO.submit();
				
			}else{
				jAlert("알수없는 오류 발생.",'알림', 'b');
				return false;
			}
		}
		
		function comparePWd(){
			 if($("#password").val() == ""){
				jAlert("첫 번째 비밀번호 부터 입력해 주세요.",'알림', 'b');
				return false;
			 }
			 
			 if($("#repassword").val() == ""){
					jAlert("확인용 비밀번호를  입력해 주세요.",'알림', 'b');
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
		<td align="left" width="20%"><a href="${pageContext.request.contextPath}/index.jsp"  class="ui-btn ui-corner-all ui-icon-arrow-l ui-btn-icon-notext" rel="external">뒤로</a></td>
		<td align="center" width="80%"><h1 class="bodyLogo" style="font-size:14pt">회원가입</h1></td>
	</tr>
</table>
</div>
<!-- header end -->

<!-- content start -->
 <div data-role="content" class="com-logContent">   

	<form name="foxMberManageVO"  method="post">	
	<input type="hidden" id="moblphonNo" name="moblphonNo" value="<c:out value='${foxMberManageVO.moblphonNo}'/>"/>
	<input type="hidden" id="useStplatAgreAt" name="useStplatAgreAt" value="<c:out value='${foxMberManageVO.useStplatAgreAt}'/>"/>
	<input type="hidden" id="indvdlinfoColctAgreAt" name="indvdlinfoColctAgreAt" value="<c:out value='${foxMberManageVO.indvdlinfoColctAgreAt}'/>"/>
	<input type="hidden" id="marktRecptnAgreAt" name="marktRecptnAgreAt" value="<c:out value='${foxMberManageVO.marktRecptnAgreAt}'/>"/>
	<input type="hidden" id="lcinfoUseAgreAt" name="lcinfoUseAgreAt" value="<c:out value='${foxMberManageVO.lcinfoUseAgreAt}'/>"/>
	<input type="hidden" id="userSe" name="userSe" value="01"/>
	<input type="hidden" id="mberSe" name="mberSe" value="01"/>
	<input type="hidden" id="mberSttus" name="mberSttus" value="01"/>
	
	<!-- 이메일 -->
	<div data-role="fieldcontain">
        <table border="1" width = "100%">
			<tr>
				<td width = "100%" hdight="100" align="left">
					<span align="left">아이디(이메일)</span><br/>
					<input type="text" name="mberEmailAdres" id="mberEmailAdres" value="이메일 주소를 입력해 주세요. 예: mymail@foxtong.kr" data-theme="c" onclick="javascript:clearText(this);"/>
				</td>
				<td width = "100%" hdight="100" align="center">
					<span align="left">  </span><br/>
					<a href="javascript:certRequest();" data-role="button" data-thema="z">중복확인</a>
				</td>
			</tr>
		</table>
		<span align="left" style="font-color: red">사용가능</span><br/>
		<span align="left" style="font-color: red"><font color="red">이메일중복</font></span><br/>
	</div>	
	
	<!-- 닉네임 -->
	<div data-role="fieldcontain">
        <table border="1" width = "100%">
			<tr>
				<td width = "100%" hdight="100" align="left">
					<span align="left">별명</span><br/>
					<input type="text" name="ncnm" id="ncnm" value="사용하실 별명(닉네임)을 입력해 주세요." data-theme="c" onclick="javascript:clearText(this);"/>
				</td>
				<td width = "100%" hdight="100" align="center">
					<span align="left">  </span><br/>
					<a href="javascript:certRequest();" data-role="button" data-thema="z">중복확인</a>
				</td>
			</tr>
		</table>
		<span align="left" style="font-color: red">사용가능</span><br/>
		<span align="left" style="font-color: red"><font color="red">닉네임 중복</font></span><br/>
	</div>
	
	<!-- 비밀번 -->
	<div data-role="fieldcontain">
		<span align="left">비밀번호</span><br/>
		<input type="text" name="password" id="password" value="비밀번호를 입력하여 주시기바랍니다." data-theme="c" onclick="javascript:clearText(this);"/>
		<input type="text" name=repassword" id="repassword" value="비밀번호를 다시 한 번 입력 부탁드립니다." data-theme="c" onclick="javascript:clearText(this);"/>
		
	</div>
	<br/>
	<br/>
	<br/>
	<div data-role="fieldcontain" class="com-logLogin" >   
		<a href="javascript:regist();" data-role="button" data-thema="z">가입완료</a>
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

