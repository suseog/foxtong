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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>

		<script type="text/javascript">
		<!--
		function clearText(obj) {
			obj.value = "";
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
		<td align="center" width="80%"><h1 class="bodyLogo" style="font-size:14pt">업체사용자가입완료</h1></td>
	</tr>
</table>
</div>
<!-- header end -->

<!-- content start -->
 <div data-role="content" class="com-logContent">   

	<form name=foxBsshInfoManageVO"  method="post">	
	
	<!--업체카테고리 선택 -->
	<div data-role="fieldcontain">
		<p> 안녕하십니까?
		    여우통 서비스를 이용해 주셔서 감사합니다. 
		    여우통 관리자가 별도의 연락을 드리고 
		    승인하여 드립니다. 
	    </p> 
   		<p> 
   			업체 소개내용 등을 바로 등록하실 수 있습니다.  
   			나중에 등록 하시려면, 내정보(업소정보관리)에서 등록이 가능합니다. 
 			업소의 사진, 한줄 홍보문구, 상품이나 서비스 정보 등이 필요 합니다.  
	    </p> 
	</div>	
	<br/>
	<br/>
	<br/>
	<div data-role="fieldcontain" class="com-logLogin" >   
		<a href="javascript:regist();" data-role="button" data-thema="z">바로등록</a>
	</div>
	<div data-role="fieldcontain" class="com-logLogin" >   
		<a href="javascript:regist();" data-role="button" data-thema="z">나중에등록</a>
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

