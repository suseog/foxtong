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
        <!-- 카카오 스크립트 -->
		<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

		<script type="text/javascript">
		//<![CDATA[
			
		function clearText(obj) {
			obj.value = "";
		}
		
		function actionLogin() {
			
			//to-do: email 형식 validation 추가 필요
			
			
			if (document.loginForm.mberEmailAddres.value == "" || document.loginForm.mberEmailAddres.value == "이메일 아이디를 입력해 주세요" ) {
				jAlert("이메일 아이디를 입력하세요",'알림', 'a');
			} else if (document.loginForm.password.value == "" || document.loginForm.password.value == "비밀번호를 입력해 주세요" ) {
				jAlert("비밀번호를 입력하세요",'알림', 'a');
			}
			else {
				var check = $('input[name=rdoSlctUsr]:checked').val();
				$('#userSe').val(check);

		        document.loginForm.action="${pageContext.request.contextPath}/uat/uia/actionLogin.fo";
				document.loginForm.submit();
			}
		}
		
		function searchIdPw(searchSe) {
			
			document.loginForm.searchSe.value = searchSe;
			if(searchSe =="A"){
				document.loginForm.searchSeNm.value = "아이디 찾기";
			}else if(searchSe =="B"){
				document.loginForm.searchSeNm.value = "패스워드 찾기";
			}else{
				alert("알수없는 요청");
				return false;
			}
		 	document.loginForm.action="${pageContext.request.contextPath}/uat/uia/foxIdPwSMSCertView.fo";
			document.loginForm.submit();
			
		}

		$(document).ready(fnInit);
		
		function fnInit() {
			var message = "${message}";
			if (message != "") {
				alert(message);
			}
		}
		
		
		Kakao.init('1647e3d12b4da2d05dd2d4c1f2e78770'); //발급받은 키 중 javascript키를 사용해준다.
        console.log(Kakao.isInitialized()); // sdk초기화여부판단
        
        //카카오로그인
        function kakaoLogin() {        	
            Kakao.Auth.login({
              success: function (response) {
                Kakao.API.request({
                  url: '/v2/user/me',
                  success: function (response) {
                	  console.log(response)
                	  document.getElementById("kakaoserial").value = response.id;
                	  document.getElementById("nickname").value = response.properties.nickname;
                	  document.getElementById("kakaoimg").value = response.properties.profile_image;
                	  document.getElementById("kakaoemail").value = response.kakao_account.email;
                	  document.getElementById("mberEmailAddres").value = response.kakao_account.email;
                	  var imgroot = response.properties.profile_image;
                	  document.getElementById("kkoicon").src = imgroot;
                	  document.getElementById("spankkoicon").style.display = "true";
                	
                  },
                  fail: function (error) {
                    console.log(error)
                  },
                })
              },
              fail: function (error) {
                console.log(error)
              },
            })
          }
        
        //카카오로그아웃  
        function kakaoLogout() {
            if (Kakao.Auth.getAccessToken()) {
              Kakao.API.request({
                url: '/v1/user/unlink',
                success: function (response) {
                	console.log(response)
                	
              	  
                },
                fail: function (error) {
                  console.log(error)
                },
              })
              Kakao.Auth.setAccessToken(undefined)
            }
	            $("#id").value = "";   //$("#id")
	            $("#kakaoserial").value = "";
	            $("#nickname").value = "";
	            $("#kakaoimg").value = "";
	            $("#kakaoemail").value = "";   	 
	            $("#kkoicon").src = "";
          } 
		
        //]]>  
		</script>		

</head>

<body>

<!-- 메인 페이지 -->
<div data-role="page">

<!-- header start -->
<div data-role="header" >
<div width = "100%">
<a href="${pageContext.request.contextPath}/index.jsp"  class="ui-btn ui-corner-all ui-icon-arrow-l ui-btn-icon-notext" rel="external">뒤로</a>
</div>
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

	<form name="loginForm" method="post">
	<input type="hidden" id="userSe" name="userSe" value="USR"/>
	<input type="hidden" id="searchSe" name="searchSe" value=""/>
	<input type="hidden" id="searchSeNm" name="searchSeNm" value=""/>
	
	<input type="hidden" id="kakaoserial" name="kakaoserial" value=""/>
	<input type="hidden" id="nickname" name="nickname" value=""/>
	<input type="hidden" id="kakaoimg" name="kakaoimg" value=""/>
	<input type="hidden" id="kakaoemail" name="kakaoemail" value=""/>
	
	
	<div data-role="fieldcontain" class="com-logId">
		<input type="text" name="mberEmailAddres" id="mberEmailAddres" value="이메일 아이디를 입력해 주세요" data-theme="c" onclick="javascript:clearText(this)"/>
    </div>

	<div data-role="fieldcontain"  class="com-logPw">
		<input type="text" name="password" id="password" value="비밀번호를 입력해 주세요" data-theme="c" onclick="javascript:clearText(this)"/>
	</div>
	<br/>
    <div>
        <table border="1" width = "100%">
			<tr>
				<td width = "35%" align="right">
				 <a href="javascript:searchIdPw('A');" >아이디찾기</a>| 
				</td>
				<td width = "30%" align="center">
				 <a href="javascript:searchIdPw('B');" >비밀번호 찾기    
				</td>
				<td width = "35%" align="left">
				  | <a href="${pageContext.request.contextPath}/uss/umt/foxStplatAgre.fo" rel="external" >회원가입 </a>
				</td>
			</tr>
		</table>
	</div>
	
	<div data-role="fieldcontain" class="com-logLogin" >   
		<a href="javascript:actionLogin();" data-role="button" data-thema="z">로그인</a>
	</div>
	<br/>
	<br/>
	
	<div align="center">   
		<span>간편로그인</span> </br>
			<span id = "spankkoicon" >
				<img id = kkoicon src= "" width="70" height="70"></img>
			</span>
					<ul>
						<!-- <li id=login2 onclick="kakaoLogin();">
					      <a href="javascript:void(0)">
					          <span>카카오 로그인</span>
					      </a>
						</li> -->
						<br></br>
						<li id=logout onclick="kakaoLogout();">
					      <a href="javascript:void(0)">
					          <span>카카오 로그아웃</span>
					      </a>
						</li>
					</ul>
					
	</div>
	<div data-role="fieldcontain" class="com-logLogin" align="center">   		
			<a href="#" rel="external" >
				<img id=login onclick="kakaoLogin();" src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/icon_kakao_login.png" width="60" height="60" alt="카카오로그인"> 
			</a>
			<a href="#" >
				<img src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/icon_naver_login.png" width="60" height="60" alt="네이버로그인"> 
			</a>
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
