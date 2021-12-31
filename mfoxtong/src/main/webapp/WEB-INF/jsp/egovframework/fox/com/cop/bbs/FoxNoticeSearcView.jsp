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
	<style>
      #top_category {overflow-x:scroll;width:100%;}
      #top_category ul {display:table;width:100%;margin:5px 5px 0px 5px;}
      #top_category li {display:table-cell;white-space:nowrap;list-style:none;}
      #top_categoryli a {display:block;margin-left:5px;border:1px solid #000;}
      #fixedbtn{position:fixed;right:10px;bottom:70px;z-index:1000}
    </style
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>	

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>   
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/EgovCom.js"></script>
	
	<!-- datebox  import-->        
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/datepicker/jqm-datebox.css"/>
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
		//$(document).on('pagehide', "#view", function(){ $(this).remove(); });	
		
		function fn_egov_regist(bbsAttrbCode) {
			
			document.frm.bbsAttrbCode.value = bbsAttrbCode;
			document.frm.nttId.value = document.frm.nttId.value;
			document.frm.bbsId.value=document.frm.bbsId.value;
			document.frm.action =  "${pageContext.request.contextPath}/cop/bbs${prefix}/addBoardArticle.fo"; // 임시변
			document.frm.submit();		
		}
	
		function press(event) {
			if (event.keyCode==13) {
				fn_fox_search_noticeList();
			}
		}

		function fn_fox_search_noticeList() {
			
			var searchWrd = document.frm.searchWrd.value;
			if(searchWrd =""){
				alert("검색어를 입력하시기 바랍니다.");
				return false;
			}else{
				document.frm.action = "${pageContext.request.contextPath}/cop/bbs/searchBoardArticlesResult.fo";
				document.frm.submit();	
			}
		}
		
		//자신의 최근 검색 기록이나 검색 순위 클릭시 검색 
		function fn_fox_search_last_noticeList(str) {
			
			var searchWrd = str;
			alert(str);
			if(searchWrd !=""){
				document.frm.searchWrd.value=str;
			}else{
				alert("검색어를 입력하시기 바랍니다.");
				return false;
			}
			alert(document.frm.searchWrd.value);
			document.frm.action = "${pageContext.request.contextPath}/cop/bbs/searchBoardArticlesResult.fo";
			document.frm.submit();	
			
		}
	    
		// 검색기록삭제
		function fn_fox_search_item_remove(sn, mberId) {
			document.searchHistForm.sn.value = sn;
			document.searchHistForm.mberId.value = mberId;
			document.searchHistForm.action =  "${pageContext.request.contextPath}/cop/bbs${prefix}/searchBoardListViewRemove.fo";
			document.searchHistForm.submit();			
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
	<form id="frm" name="frm" method="post" data-role="none">
	<div data-role="header">
		<table width="100%">
			<tr> 
				<td align="left" width="10%"><a href="${pageContext.request.contextPath}/cop/bbs/anonymous/selectBoardList.fo?bbsId=BBSMSTR_000000000002" class="ui-btn ui-corner-all ui-icon-arrow-l ui-btn-icon-notext">뒤로</a></td>
				<td width = "80%">
				 <input type="text" name="searchWrd" id="searchWrd"  onkeypress="press(event);"/>
				</td>
				<td width = "10%">
				 <button type ="submit" onclick="javascript:fn_fox_search_noticeList()">검색</button>
				</td>
			</tr>
		</table>
		<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>"/>
		<input type="hidden" name="nttId"  value="0"/>
		<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>"/>
		<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>"/>
		<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>"/>
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	</div>
	</form>
	<!-- header end -->
			
	<!-- contents start -->
    <div data-role="content">
    
    
	   <!-- 검색 순위 상위 리스트  start  -->
	    <div align="center">
    		<span  width="100%" style="font-size: 10pt">현재 검색 순위</span>
    	</div>
	    <div id="top_category">
	       <ul>
	       	<c:choose>
	       		<c:when test="${empty searchRankList}" >
	       			<li class="com-egovNodata">
               			없어요 
               		</li>	
	       		</c:when>
	       		<c:otherwise>
	       			<c:forEach var="result" items="${searchRankList}" >
	       				 <li><a href="#" class="ui-btn ui-corner-all"> <c:out value="${result.srchWrd}"/></a></li>
	       			</c:forEach>
	       		</c:otherwise>
	       	</c:choose>
	      </ul>
	    </div>
		<!-- 검색 순위 상위 리스트  start  -->
    	<br/>
    	
    	<!-- 나의 최근 검색 목록 start  -->
    	<div align="center">
    		<span  width="100%" style="font-size: 10pt">최근 검색 기록 </span>
    	</div>
		 <div id="my_search_list" class = "ui-grid-a">
		 	<c:choose>
		 		<c:when test="${empty mySearchList }">
		 			<div>검색 이력이 없습니다.</div>
		 		</c:when>
		 		<c:otherwise>
		 			<c:forEach var="result" items="${mySearchList}">
		 				 <div class = "ui-block-a">
				            <a href="javascript:fn_fox_search_last_noticeList('<c:out value="${result.srchWrd}"/>');" class = "ui-btn ui-icon-search ui-btn-icon-right"><c:out value="${result.srchWrd}"/>검색</a>
				         </div>
				         <div class = "ui-block-b">
				            <a href="javascript:fn_fox_search_item_remove('<c:out value="${result.sn}"/>','<c:out value="${result.mberId}"/>');" class = "ui-btn ui-icon-delete ui-btn-icon-right"><c:out value="${result.srchWrd}"/>삭제</a>
				         </div>
		 			</c:forEach>
		 		</c:otherwise>
		 	</c:choose>
	    </div>
    	<!-- 나의 최근 검색 목록  end  -->
    	
		<!-- 잠시적으로 bbsId=BBSMSTR_000000000550 mappping -->
		<form name="subForm" method="Post">
		<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>"/>
		<input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>"/> 
		<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>"/>
		<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>"/>
		<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>"/>
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
		</form> 
		
		<!-- 나의검색기록 삭제 폼 -->
		<form name="searchHistForm" method="Post">
		<input type="hidden" name="mberId" value=""/>
		<input type="hidden" name="sn"  value=""/> 
		</form>    
		<!-- 나의검색기록 삭제 폼 -->
		 
		 
   	</div>
  
   	
	<!-- contents end -->
	
<!-- footer 없음 start -->
 
<!-- footer end -->
			
<!-- page end -->
</div>

</body>
</html>
