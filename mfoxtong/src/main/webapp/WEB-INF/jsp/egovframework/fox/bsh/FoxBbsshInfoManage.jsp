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
		
		function updateBsshInfoView(){
			   document.foxMberManageVO.action="${pageContext.request.contextPath}/fox/bsh/updateBsshInfoView.fo";
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
		<td align="center" width="80%"><h1 class="bodyLogo" style="font-size:14pt">업소기본정보관리</h1></td>
	</tr>
</table>
</div>
<!-- header end -->

<!-- content start -->
 <div data-role="content" class="com-logContent">   

	<form name="foxMberManageVO" method="post">
	<br/>
	<div data-role = "navbar">
       <ul>
          <li><a href="${pageContext.request.contextPath}/fox/bsh/updateBsshInfoView.fo" class="ui-btn ui-corner-all ui-shadow ui-icon-edit ui-btn-icon-right"  rel="external">업소기정본정보관리</a></li>
          <li><a href = "#one" data-ajax = "false">서비스정보관리</a></li>
       </ul>
    </div>
 
	</form>

</div>
<!-- content end -->

<!-- footer start -->
  <div data-role="footer" style="text-align:center;" data-position="fixed">
   <div data-role="navbar">
      <ul>
        <li><a href="${pageContext.request.contextPath}/FoxMobileMain.fo" data-icon="home" rel="external">여우홈</a></li>
        <li><a href="${pageContext.request.contextPath}/fox/bsh/bsshInMain.fo" data-icon="navigation">예약관리</a></li>
        <li><a href="javascript:alert('구현 예정');" data-icon="check">쿠폰관리</a></li>
        <li><a href="${pageContext.request.contextPath}/cop/bbs/anonymous/selectBoardList.fo?bbsId=BBSMSTR_000000000002" rel="external" data-icon="navigation" data-icon="comment">후기관리</a></li>
        <li><a href="${pageContext.request.contextPath}/uat/uia/foxMypage.fo" data-icon="user" rel="external">샵정보관리</a></li> 
      </ul>
    </div>
  </div>
<!-- footer end -->


</div>
<!-- 메인 페이지 end -->
</body>
</html>

