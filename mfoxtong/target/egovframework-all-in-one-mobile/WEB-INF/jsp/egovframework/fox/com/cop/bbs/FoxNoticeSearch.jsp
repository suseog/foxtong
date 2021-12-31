<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>  

 
<!DOCTYPE html> 
<html> 
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        	
    <title>${brdMstrVO.bbsNm}</title> 

   	<!-- eGovFrame Common import -->
   	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/ussCommon.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>	

      <script type="text/javascript">
		_editor_area = "nttCn";
		_editor_url = "${pageContext.request.contextPath}/html/egovframework/com/cmm/utl/htmlarea3.0/";
		</script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/html/egovframework/com/cmm/utl/htmlarea3.0/htmlarea.js"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>   
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/EgovCom.js"></script>
		<!-- datebox  import-->        
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/datepicker/jqm-datebox.css"/>
      
      
	<style>
      #top_category {overflow-x:scroll;width:100%;}
      #top_category ul {display:table;width:100%;margin:5px 5px 0px 5px;}
      #top_category li {display:table-cell;white-space:nowrap;list-style:none;}
      #top_categoryli a {display:block;margin-left:5px;border:1px solid #000;}
      
      #fixedbtn{position:fixed;right:10px;bottom:70px;z-index:1000}

    </style>


	<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jqm-datebox.core.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jqm-datebox.mode.calbox.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jqm-datebox.mode.datebox.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jqm-datebox.mode.flipbox.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jquery.mobile.datebox.i18n.ko.utf8.js"></script> 
      <script type="text/javascript" src="${pageContext.request.contextPath}/validator.do"></script>
      <validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>
      
	<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/com/cop/bbs/EgovBBSMng.js" ></script>

	<script type="text/javaScript" language="javascript">
		<!--


		$(document).on('pagehide', "#view", function(){ $(this).remove(); });	
		
		
		function fn_egov_regist(bbsAttrbCode) {
			document.frm.bbsAttrbCode.value = bbsAttrbCode;
			document.frm.nttId.value = document.frm.nttId.value;
			document.frm.bbsId.value=document.frm.bbsId.value;
			document.frm.action =  "${pageContext.request.contextPath}/cop/bbs${prefix}/addBoardArticle.fo"; // 임시변
			document.frm.submit();		
		}
	
		function press(event) {
			if (event.keyCode==13) {
				fn_egov_select_noticeList('0');
			}
		}
	
		function fn_egov_select_noticeList(pageNo) {

			if(document.frm.pageIndex.value == pageNo) {
				return;
			} 

			document.frm.pageIndex.value = pageNo == 0 ? 1 : pageNo;

			document.frm.action = "${pageContext.request.contextPath}/cop/bbs${prefix}/selectBoardList.fo";
			document.frm.submit();	
		}
	
		//상세조회
		function fn_egov_inqire_notice(nttId, bbsId) {
			document.frm.nttId.value = nttId;
			document.frm.bbsId.value = bbsId;
			document.frm.action =  "${pageContext.request.contextPath}/cop/bbs${prefix}/selectBoardArticle.fo";
			document.frm.submit();			
		}	
		-->
	</script>
</head>

<body>
<!-- 메인 페이지 -->

<div data-role="page" id="list">

	<!-- header start -->
	<div data-role="header">
	<form id="frm" name="frm" method="post" data-role="none">
		<table width="100%">
			<tr> 
				<td align="left" width="10%"><a href="${pageContext.request.contextPath}/cop/bbs/anonymous/selectBoardList.fo?bbsId=BBSMSTR_000000000002" class="ui-btn ui-corner-all ui-icon-arrow-l ui-btn-icon-notext">뒤로</a></td>
				<td width = "80%">
				 <input type="text" name="searchWrd_me" id="searchWrd_me"  onkeypress="press(event);"/>
				</td>
				<td width = "10%">
				 <button type =submit>검색</button>
				</td>
			</tr>
		</table>
		<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>"/>
		<input type="hidden" name="nttId"  value="0"/>
		<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>"/>
		<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>"/>
		<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>"/>
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	</form>
	</div>
	<!-- header end -->
			
	<!-- contents start -->
    <div data-role="content">
    
    
    
    
	   <!-- 검색 순위 상위 리스트  start  -->
	    <div align="center">
    		<span  width="100%" style="font-size: 10pt">현재 검색 순위</span>
    	</div>
	    <div id="top_category">
	       <ul>
		      <li><a href="#" class="ui-btn ui-corner-all">영양크림 </a></li>
		      <li><a href="#" class="ui-btn ui-corner-all">스파 </a></li>
		      <li><a href="#" class="ui-btn ui-corner-all">공장  </a></li>
		      <li><a href="#" class="ui-btn ui-corner-all">맛집  </a></li>
		      <li><a href="#" class="ui-btn ui-corner-all">관절염  </a></li>
		      <li><a href="#" class="ui-btn ui-corner-all">김치 </a></li>

	      </ul>
	    </div>
		<!-- 검색 순위 상위 리스트  start  -->
    	<br/>
    
    
    
    	
    	<!-- 나의 최근 검색 목록 start  -->
    	<div align="center">
    		<span  width="100%" style="font-size: 10pt">최근 검색 기록 </span>
    	</div>
		 <div id="my_search_list" class = "ui-grid-a">
	         <div class = "ui-block-a">
	            <a class = "ui-btn ui-icon-delete ui-btn-icon-right">Button 1</a>
	         </div>
	         <div class = "ui-block-b">
	            <a class = "ui-btn ui-icon-delete ui-btn-icon-right">Button 2</a>
	         </div>
	         <div class = "ui-block-c">
	            <a class = "ui-btn ui-icon-delete ui-btn-icon-right">Button 2</a>
	         </div>
	         <div class = "ui-block-d">
	            <a class = "ui-btn ui-icon-delete ui-btn-icon-right">Button 2</a>
	         </div>
	         <div class = "ui-block-e">
	            <a class = "ui-btn ui-icon-delete ui-btn-icon-right">Button 2</a>
	         </div>
	         <div class = "ui-block-b">
	            <a class = "ui-btn ui-icon-delete ui-btn-icon-right">Button 2</a>
	         </div>
	         <div class = "ui-block-b">
	            <a class = "ui-btn ui-icon-delete ui-btn-icon-right">Button 2</a>
	         </div>
	         <div class = "ui-block-b">
	            <a class = "ui-btn ui-icon-delete ui-btn-icon-right">Button 2</a>
	         </div>
	         <div class = "ui-block-b">
	            <a class = "ui-btn ui-icon-delete ui-btn-icon-right">Button 2</a>
	         </div>
	    </div>
    	<!-- 나의 최근 검색 목록  end  -->
    	나의 키워드 검색 이력 테이블을 작성 
    	검색 시 마다 입력하는 로직이 필요 
    	
    	키워드로 게시판에서 검색 요청 후 selectArciclesList
    	이거 완료 후 
    	검색 결과 페이지를 만들어야 한다. 
    	
    	
		<!-- 잠시적으로 bbsId=BBSMSTR_000000000550 mappping -->
		<form name="subForm" method="Post">
		<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>"/>
		<input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>"/> 
		<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>"/>
		<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>"/>
		<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>"/>
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
		</form>    
		
		<!--  임시 숨깁 처리  2021.12.22 jss
		<div id="pageNavi" class="com-egovPaging">
		<ui:pagination paginationInfo="${paginationInfo}" type="mblImage" jsFunction="fn_egov_select_noticeList"/>
		</div>
		 -->
		 
		 
   	</div>
  
   	
	<!-- contents end -->
	
<!-- footer 없음 start -->
 
<!-- footer end -->
			
<!-- page end -->
</div>

</body>
</html>
