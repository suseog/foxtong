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
	<div data-role="header">
	<table width="100%">
		<tr> 
			<td align="left" width="30%"><a href="${pageContext.request.contextPath}/index.jsp"  class="ui-btn ui-corner-all ui-icon-arrow-l ui-btn-icon-notext" rel="external">뒤로</a></td>
			<td align="center" width="35%"><h1 class="bodyLogo" style="font-size:14pt">${brdMstrVO.bbsNm}</h1></td>
			<td align="right" width="35%">
				<a href="javascript:fn_search_noticeList();" class="ui-btn ui-corner-all ui-icon-search ui-btn-icon-notext">검색</a>
				<a href="#" class="ui-btn ui-corner-all ui-icon-star ui-btn-icon-notext">주제목록 </a>
				<a href="#" class="ui-btn ui-corner-all ui-icon-mail ui-btn-icon-notext">알림(소식 )</a>
			</td>
		</tr>
	</table>
	</div>
	<form id="frm" name="frm" method="post" data-role="none">
		<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>"/>
		<input type="hidden" name="nttId"  value="0"/>
		<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>"/>
		<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>"/>
		<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>"/>
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	</form>
	<!-- header end -->
	
	<!-- 키워드 overlay panel start -->		
	  <div data-role="panel" id="overlayPanel" data-display="overlay" data-position="right" width="50" height="200"> 
		  <div data-role="header">
		  <h1>검색 지역 선택</h1>
		  </div>
		  <div data-role="main" class="ui-content">
			    <form method="post" action="#">
				  <fieldset data-role="controlgroup">
				    <legend>대구에서 태었났어요 검색 지역을 선택하세요  </legend>
				      <label for="local_sub_area1">동구 </label>
				      <input type="checkbox" name="local_sub_area" id="local_sub_area1" value="동구">
				      <label for="local_sub_area2">북구 </label>
				      <input type="checkbox" name="local_sub_area" id="local_sub_area2" value="북구">
				      <label for="local_sub_area3">서구 </label>
				      <input type="checkbox" name="local_sub_area" id="local_sub_area3" value="서구">
	   			      <label for="local_sub_area4">남구  </label>
				      <input type="checkbox" name="local_sub_area" id="local_sub_area4" value="남구">
					  <label for="local_sub_area5">달서구 </label>
				      <input type="checkbox" name="local_sub_area" id="local_sub_area5" value="달서구">
					  <label for="local_sub_area6">수성구  </label>
				      <input type="checkbox" name="local_sub_area" id="local_sub_area6" value="수성구">			      
					  <label for="local_sub_area7">중구   </label>
				      <input type="checkbox" name="local_sub_area" id="local_sub_area7" value="중구">				
				  </fieldset>
			    	<input type="submit" data-inline="true" class="ui-btn ui-btn-inline ui-shadow ui-corner-all ui-btn-a ui-icon-delete ui-btn-icon-left" value="선택 ">
			    </form>
		  </div>
	  </div>
	<!-- 키워드 overlay panel start -->	
			
	<!-- contents start -->
    <div data-role="content">
    
	   <!-- 게시글 카테고리  start  -->
	    <div id="top_category">
	       <ul>
		     <c:choose> 
		      	<c:when test="${empty resultCodeList}">
					<li class="com-egovNodata">
               			없어요 
               		</li>			
				</c:when>
				<c:otherwise>
					<c:forEach var="result" items="${resultCodeList}">
						 <li><a href="#" class="ui-btn ui-corner-all"><c:out value="${result.codeNm}"/></a></li>
					</c:forEach>
	      	   </c:otherwise>
			</c:choose>
	      </ul>
	     </div>
		<!-- 게시글 카테고리 end  -->
    	<br/>
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
        <li><a href="${pageContext.request.contextPath}/FoxMobileMain.fo" data-icon="home" rel="external">홈 </a></li>
        <li><a href="javascript:alert('구현 예정');" data-icon="navigation">내주변 </a></li>
        <li><a href="javascript:alert('구현 예정');" data-icon="check">쿠폰북 </a></li>
        <li><a href="${pageContext.request.contextPath}/cop/bbs/anonymous/selectBoardList.fo?bbsId=BBSMSTR_000000000002" rel="external" data-icon="navigation" data-icon="comment">여우수다 </a></li>
        <!-- 
        /cop/bbs/selectBoardList.fo?bbsId=BBSMSTR_000000000001
        <li><a href="${pageContext.request.contextPath}/cop/bbs/anonymous/selectBoardList.fo?bbsId=BBSMSTR_000000000002" rel="external" data-icon="navigation" data-icon="comment">여우생활</a></li>
        <li><a href="${pageContext.request.contextPath}/cop/bbs/anonymous/selectBoardList.fo?bbsId=BBSMSTR_000000000003" rel="external" data-icon="navigation" data-icon="comment">여우생활</a></li>
         -->
         <c:choose>
         	<c:when test="${sessionScope.loginVO.email eq null}">
         		<li><a href="${pageContext.request.contextPath}/uat/uia/egovLoginUsr.fo" data-icon="user" rel="external">로그인</a></li> 
         	</c:when>
         	<c:otherwise>
		        <li><a href="${pageContext.request.contextPath}/uat/uia/egovLoginUsr.fo" data-icon="user" rel="external">내정보</a></li> 
         	</c:otherwise>
         </c:choose>
      </ul>
    </div>
  </div>
<!-- footer end -->
			

</div>

</body>
</html>
