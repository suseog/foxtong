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

			document.frm.action = "${pageContext.request.contextPath}/cop/bbs${prefix}/searchBoardArticlesResult.fo";
			document.frm.submit();	
		}
		
		
		// 키워드 검색화면 화면 호출 
		function fn_search_noticeList() {
			document.frm.action = "${pageContext.request.contextPath}/cop/bbs/searchBoardListView.fo";
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
	<form id="frm" name="frm" method="post" data-position="fixed">
	<div data-role="header">
		<table width="100%">
			<tr> 
				<td align="left" width="10%"><a href="${pageContext.request.contextPath}/cop/bbs/anonymous/selectBoardList.fo?bbsId=BBSMSTR_000000000002" class="ui-btn ui-corner-all ui-icon-arrow-l ui-btn-icon-notext">뒤로</a></td>
				<td width = "80%">
				 <input type="text" name="searchWrd" id="searchWrd"  onkeypress="press(event);" value="<c:out value='${boardVO.searchWrd}'/>""/>
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
 
    	<!-- 게시글 목록 전체 start  -->
		<ul data-role="listview">
			<c:choose>
				<c:when test="${empty resultList}">
					<li class="com-egovNodata">
               			<spring:message code="common.nodata.msg"/>
               		</li>			
				</c:when>
				<c:otherwise>
					<c:forEach var="result" items="${resultList}">
						 	<c:choose>
				    		<c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
				    		<li>
				    			<h3>
				    				<c:out value="${result.nttSj}"/> 
				    			</h3>
							</li>
				    		</c:when>
				    		<c:otherwise>
							<li>
								<a href="javascript:fn_egov_inqire_notice('<c:out value="${result.nttId}"/>','<c:out value="${result.bbsId}"/>')" data-transition="slide">
									<h3><c:if test="${result.replyLc!=0}">
							    		<c:forEach begin="0" end="${result.replyLc}" step="1">
							    		</c:forEach>
						    			<span><img src="${pageContext.request.contextPath}/images/egovframework/com/cmm/icon/reply_arrow.gif" alt=""/></span>
							    		</c:if>
							            <c:out value="${result.nttSj}"/>
									</h3>
									<p><c:out value="${result.nttCn}"/></p>
									<span class="ui-li-count">${result.inqireCo}</span>
									<p>
						            	<c:choose>
										<c:when test="${result.ntcrNm == ''}">
											<span class="uss-txtBlack"><c:out value="${result.frstRegisterNm}"/></span>
										</c:when>
										<c:otherwise>
										    <span class="uss-txtBlack"><c:out value="${result.ntcrNm}"/></span>
										</c:otherwise>
										</c:choose><span class="uss-txtDate">${result.frstRegisterPnttm }</span>
										<!-- <span class="uss-txtBlack">${qnaManage.wrterNm }</span><span class="uss-txtDate">${qnaManage.writngDe }</span> -->
										</p>
								</a>
							</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>					
				</c:otherwise>
			</c:choose>
		</ul>
    	<!-- 게시글 목록 전체 start  -->
    	
		<!-- 잠시적으로 bbsId=BBSMSTR_000000000550 mappping -->
		<form name="subForm" method="Post">
		<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>"/>
		<input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>"/> 
		<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>"/>
		<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>"/>
		<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>"/>
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
		</form>    
		<div id="pageNavi" class="com-egovPaging">
		<ui:pagination paginationInfo="${paginationInfo}" type="mblImage" jsFunction="fn_egov_select_noticeList"/>
		</div>
   	</div>
   	<!-- 글쓰기 버튼 start -->
   	<div>
   		<a href="javascript:fn_egov_regist('<c:out value="${brdMstrVO.bbsAttrbCode}"/>');">
		<img src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/btn_bbs_write.png" id="fixedbtn" width="50" height="50">
		</a>
   	</div>
   	<!-- 글쓰기 버튼 end -->
   	
	<!-- contents end -->
	
<!-- footer start -->
  <div data-role="footer" style="text-align:center;" data-position="fixed">
   <div data-role="navbar">
      <ul>
        <li><a href="${pageContext.request.contextPath}/FoxMobileMain.fo" data-icon="home">홈 </a></li>
        <li><a href="javascript:alert('구현 예정');" data-icon="navigation">내주변 </a></li>
        <li><a href="javascript:alert('구현 예정');" data-icon="check">쿠폰북 </a></li>
        <li><a href="${pageContext.request.contextPath}/cop/bbs/anonymous/selectBoardList.fo?bbsId=BBSMSTR_000000000002" rel="external" data-icon="navigation" data-icon="comment">여우수다 </a></li>
        <!-- 
        /cop/bbs/selectBoardList.fo?bbsId=BBSMSTR_000000000001
        <li><a href="${pageContext.request.contextPath}/cop/bbs/anonymous/selectBoardList.fo?bbsId=BBSMSTR_000000000002" rel="external" data-icon="navigation" data-icon="comment">여우생활</a></li>
        <li><a href="${pageContext.request.contextPath}/cop/bbs/anonymous/selectBoardList.fo?bbsId=BBSMSTR_000000000003" rel="external" data-icon="navigation" data-icon="comment">여우생활</a></li>
         -->
        <li><a href="javascript:alert('구현 예정');" data-icon="user">내정보</a></li>
      </ul>
    </div>
  </div>
<!-- footer end -->
			

</div>

</body>
</html>
