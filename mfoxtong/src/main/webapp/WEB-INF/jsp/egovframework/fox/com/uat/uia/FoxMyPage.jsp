<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>여우정보관리</title> 
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
		
		function myFoxInfoModify(){
			   document.foxMberManageVO.action="${pageContext.request.contextPath}/uss/umt/foxMberSelectUpdtView.fo";
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
		<td align="left" width="20%"><a href="${pageContext.request.contextPath}/FoxMobileMain.fo"  class="ui-btn ui-corner-all ui-icon-arrow-l ui-btn-icon-notext" rel="external">뒤로</a></td>
		<td align="center" width="80%"><h1 class="bodyLogo" style="font-size:14pt">" <c:out value='${sessionScope.loginVO.ncnm}'/> "님의 정보관리 </h1></td>
	</tr>
</table>
</div>
<!-- header end -->

<!-- content start -->
 <div data-role="content" class="com-logContent">   

	<form name="foxMberManageVO" action ="${pageContext.request.contextPath}/uss/umt/EgovMberInsert.fo" method="post">
	<input type="hidden" id="allCheck" name="allCheck" value="false"/>
	<input type="hidden" id="mberEmailAdres" name="mberEmailAdres" value="<c:out value='${sessionScope.loginVO.mberEmailAddres}'/>"/>
	<br/>
	<div>
		<a href="javascript:myFoxInfoModify();" class="ui-btn ui-corner-all ui-shadow ui-icon-edit ui-btn-icon-right"  rel="external">내정보수정</a>
	</div>
	<div >   
		<a href="javascript:next();" class="ui-btn ui-corner-all ui-shadow ui-icon-gear ui-btn-icon-right"  rel="external">설정</a>
	</div>
	
	<!-- 일반회원인경우 -->
	<div >   
		<a href="${pageContext.request.contextPath}/fox/bsh/entrpsEmplyrSbscrbRequstView.fo" class="ui-btn ui-corner-all ui-shadow ui-icon-gear ui-btn-icon-right"  rel="external">업체사용자가입요청</a>
	</div>
	
	<!-- 업체관리자인경우-->
	<div >   
		<a href="${pageContext.request.contextPath}/fox/bsh/bsshInMain.fo" class="ui-btn ui-corner-all ui-shadow ui-icon-gear ui-btn-icon-right"  rel="external">영업점관리</a>
	</div>
	<br/>
	<hr>
	<br/>
	<div>
        <table border="1" width = "100%">
			<tr>
				<td width = "50%" hdight="100" align="center">
					<span>900 점</span>
					<a href="#" data-role="button" data-thema="z">포인트</a>
				</td>
				<td width = "50%" hdight="100" align="center">
					<span>4 개 </span>
					<a href="#" data-role="button" data-thema="z">쿠폰함</a>
				</td>
			</tr>
			<tr>
				<td width = "50%" hdight="100" align="center">
					<span>2 개</span>
					<a href="#" data-role="button" data-thema="z">나의 리뷰글</a>
				</td>
				<td width = "50%" hdight="100" align="center">
					<span>1 개 </span>
					<a href="#" data-role="button" data-thema="z">나의 수다글</a>
				</td>
			</tr>
		</table>
	</div>
	<br/>
	<hr>
	<br/>
	<div>
		<a href="javascript:next();" class="ui-btn ui-corner-all ui-shadow ui-icon-grid ui-btn-icon-right"  rel="external">최근 본 샵목록</a>
	</div>
	<div> 
		<a href="javascript:next();" class="ui-btn ui-corner-all ui-shadow ui-icon-grid ui-btn-icon-right"  rel="external">공지사항</a>
	</div>
	<div>  
		<a href="javascript:next();" class="ui-btn ui-corner-all ui-shadow ui-icon-grid ui-btn-icon-right"  rel="external">자주묻는 질문</a>

	<br/>
	<br/>
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

