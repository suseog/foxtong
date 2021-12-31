<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>전자정부 모바일 프레임워크 fox 메인 </title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/ussCommon.css"/>
    <style>
      #top_category {overflow-x:scroll;width:100%;}
      #top_category ul {display:table;width:100%;margin:5px 5px 0px 5px;}
      #top_category li {display:table-cell;white-space:nowrap;list-style:none;}
      #top_categoryli a {display:block;margin-left:5px;border:1px solid #000;}
    </style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>	    
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>   	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/fox/cmm/jquery.roundimage.js"></script>
  <script>
  <!--//
    $(document).ready(function() {
        $('.img-round').roundImage();
    });
    
    
	function fn_fox_search_noticeList() {
		document.frm.action = "${pageContext.request.contextPath}/cop/bbs/searchBoardArticlesResult.fo?bbsId=BBSMSTR_000000000002";
		document.frm.submit();	
	}
    -->
    </script>
</head>  

<body>
<!-- 모바일 페이지 start -->
<div data-role="page" >

<!-- 지역검색 overlay panel start-->
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
<!-- 지역검색 overlay panel end -->

<!-- header start -->
<div data-role="header" >
<form id="frm" name="frm" method="post" data-role="none">
<div width = "100%">
	<table border="1" width = "100%">
		<tr>
			<td width = "10%" align="right">
			 <img src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/logo_fox.png" width="50" height="50" alt="여우통로"> 
			</td>
			<td width = "70%">
			 <input type="text" name="searchWrd_me" id="searchWrd_me"  onkeypress="press(event);"/>
			</td>
			<td width = "10%">
			 <button type ="submit" onclick="javascript:fn_fox_search_noticeList()">검색</button>
			</td>
			<td width = "10%" align="center">
			 <a href="#overlayPanel" >
			 	<img src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/btn_more.png" width="30" height="30" alt="지역검색 "> 
			 </a>
			</td>
		</tr>
	</table>
</div>
</form>
</div>
<!-- header end -->

<!-- content start -->

    
<div data-role="content">
	<!-- 카테고리 네비게이션 start  -->
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
	<!-- 카테고리 네비게이션 end  -->
	
	<!-- 파워링크 배너  start  -->
	<div align="center">
		<span>
			<a href="javascript:alert('구현필요 ');"><img src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/banner_sample2.png" alt="banner_sample" width="340" hedght="50"></a>
		</span>
	</div>
	<!-- 파워링트 배너  end  -->

	<!-- 업체목록 start -->	
	<ul data-role="listview" data-autodividers="false" >
	  <li data-icon="false">
		  <table border="1">
		  	<tr>
		  		<td> 
			  		<a href="${pageContext.request.contextPath}/uss/sam/stp/FoxMobileDetail.fo" rel="external">
		    		<img class="img-round" src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/biz_photo_sample1.png" width="70" height="70">
		    		</a>
	    		</td>
		  		<td style="padding:5pt">
		  		    <span><b>몸 필라테스</b></span> <span>           </span><span> 후기(123) </span>  <span> 좋아요(99) </span> 
		  		    <a href="#" style="text-decoration: none; color: inherit;">
		    			<p>Google Chrome is a free, open-source web browser. Released in 2008.<br/>
		    			   google Chrome is a free, open-source web browser. Released in 2008.</p>
	    			</a>
		  		</td>
		  	</tr>
		  </table>
	  </li>
	  <li data-icon="false">
		  <table border="1">
		  	<tr>
		  		<td> 		  		
			  		<a href="${pageContext.request.contextPath}/fox/com/geo/goGeoLocationPrivateInqire.fo" rel="external">
			  		<img class="img-round" src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/biz_photo_sample2.png" width="70" height="70">
		    		</a>
	    		</td>
		  		<td style="padding:5pt">
		  		    <span><b>케어 필라테스 (침산)</b></span> <span>           </span><span> 후기(123) </span>  <span> 좋아요(99) </span> 
		  		    <a href="#" style="text-decoration: none; color: inherit;">
		    			<p>안녕하세요~! 케어필라테스 침산점 입니다!<br/>
		    			   대구필라테스자격증, 제대로 알아보고 취득하자!</p>
	    			</a>
		  		</td>
		  	</tr>
		  </table>
	  </li>
	  <li data-icon="false">
		  <table border="1">
		  	<tr>
		  		<td> 
			  		<a href="${pageContext.request.contextPath}/mbl/com/geo/goGeoLocationPrivateInqire.mdo" rel="external">
		    		<img class="img-round" src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/biz_photo_sample3.png" width="70" height="70">
		    		</a>
	    		</td>
		  		<td style="padding:5pt">
		  		    <span><b>케어 필라테스 (시지)</b></span> <span>           </span><span> 후기(123) </span>  <span> 좋아요(99) </span> 
		  		    <a href="#" style="text-decoration: none; color: inherit;">
		    			<p>케어필라테스에서 준비한 겨울맞이 프로모션 (30% 할인 이벤트 )<br/>
		    			   레슨문의 : 053)795-8800 </p>
	    			</a>
		  		</td>
		  	</tr>
		  </table>
	  </li>
	  <li data-icon="false">
		  <table border="1">
		  	<tr>
		  		<td> 
			  		<a href="#">
		    		<img class="img-round" src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/biz_photo_sample1.png" width="70" height="70">
		    		</a>
	    		</td>
		  		<td style="padding:5pt">
		  		    <span><b>몸 필라테스</b></span> <span>           </span><span> 후기(123) </span>  <span> 좋아요(99) </span> 
		  		    <a href="#" style="text-decoration: none; color: inherit;">
		    			<p>Google Chrome is a free, open-source web browser. Released in 2008.<br/>
		    			   google Chrome is a free, open-source web browser. Released in 2008.</p>
	    			</a>
		  		</td>
		  	</tr>
		  </table>
	  </li>
	  <li data-icon="false">
		  <table border="1">
		  	<tr>
		  		<td> 
			  		<a href="#">
		    		<img class="img-round" src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/biz_photo_sample2.png" width="70" height="70">
		    		</a>
	    		</td>
		  		<td style="padding:5pt">
		  		    <span><b>케어 필라테스 (침산)</b></span> <span>           </span><span> 후기(123) </span>  <span> 좋아요(99) </span> 
		  		    <a href="#" style="text-decoration: none; color: inherit;">
		    			<p>안녕하세요~! 케어필라테스 침산점 입니다!<br/>
		    			   대구필라테스자격증, 제대로 알아보고 취득하자!</p>
	    			</a>
		  		</td>
		  	</tr>
		  </table>
	  </li>
	  <li data-icon="false">
		  <table border="1">
		  	<tr>
		  		<td> 
			  		<a href="#">
		    		<img class="img-round" src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/biz_photo_sample3.png" width="70" height="70">
		    		</a>
	    		</td>
		  		<td style="padding:5pt">
		  		    <span><b>케어 필라테스 (시지)</b></span> <span>           </span><span> 후기(123) </span>  <span> 좋아요(99) </span> 
		  		    <a href="#" style="text-decoration: none; color: inherit;">
		    			<p>케어필라테스에서 준비한 겨울맞이 프로모션 (30% 할인 이벤트 )<br/>
		    			   레슨문의 : 053)795-8800 </p>
	    			</a>
		  		</td>
		  	</tr>
		  </table>
	  </li>
	  <li data-icon="false">
		  <table border="1">
		  	<tr>
		  		<td> 
			  		<a href="#">
		    		<img class="img-round" src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/biz_photo_sample1.png" width="70" height="70">
		    		</a>
	    		</td>
		  		<td style="padding:5pt">
		  		    <span><b>몸 필라테스</b></span> <span>           </span><span> 후기(123) </span>  <span> 좋아요(99) </span> 
		  		    <a href="#" style="text-decoration: none; color: inherit;">
		    			<p>Google Chrome is a free, open-source web browser. Released in 2008.<br/>
		    			   google Chrome is a free, open-source web browser. Released in 2008.</p>
	    			</a>
		  		</td>
		  	</tr>
		  </table>
	  </li>
	  <li data-icon="false">
		  <table border="1">
		  	<tr>
		  		<td> 
			  		<a href="#">
		    		<img class="img-round" src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/biz_photo_sample2.png" width="70" height="70">
		    		</a>
	    		</td>
		  		<td style="padding:5pt">
		  		    <span><b>케어 필라테스 (침산)</b></span> <span>           </span><span> 후기(123) </span>  <span> 좋아요(99) </span> 
		  		    <a href="#" style="text-decoration: none; color: inherit;">
		    			<p>안녕하세요~! 케어필라테스 침산점 입니다!<br/>
		    			   대구필라테스자격증, 제대로 알아보고 취득하자!</p>
	    			</a>
		  		</td>
		  	</tr>
		  </table>
	  </li>
	  <li data-icon="false">
		  <table border="1">
		  	<tr>
		  		<td> 
			  		<a href="#">
		    		<img class="img-round" src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/biz_photo_sample3.png" width="70" height="70">
		    		</a>
	    		</td>
		  		<td style="padding:5pt">
		  		    <span><b>케어 필라테스 (시지)</b></span> <span>           </span><span> 후기(123) </span>  <span> 좋아요(99) </span> 
		  		    <a href="#" style="text-decoration: none; color: inherit;">
		    			<p>케어필라테스에서 준비한 겨울맞이 프로모션 (30% 할인 이벤트 )<br/>
		    			   레슨문의 : 053)795-8800 </p>
	    			</a>
		  		</td>
		  	</tr>
		  </table>
	  </li>
	</ul>
	<!-- 업체목록 start -->
	<br/>
	<!-- 상품광고 start -->
	<div align="center">
		<span>
			<a href="javascript:alert('구현필요 ');"><img src="${pageContext.request.contextPath}/images/egovframework/fox/com/smp/banner_sample.png" alt="banner_sample" width="340" hedght="50"></a>
		</span>
	</div>
	<!-- 상품광고 end -->

<!-- content end -->
<!-- 약관 start-->
	<div align="center">
		<br/>
		<p>
			<a href="${pageContext.request.contextPath}/uss/sam/stp/StplatListInqire.fo" rel="external"> 이용약관 </a> | 
			<a href="${pageContext.request.contextPath}/uss/sam/stp/StplatListInqire.fo" rel="external"> 위치기반서비스약관 </a> | 
			<a href="${pageContext.request.contextPath}/uss/sam/stp/StplatListInqire.fo" rel="external"> 개인정보처리방침 </a>									
			<h5>Copyright Foxtong Corp.</h5>
		</p>
	</div>
<!-- 약관 end -->
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
        <li><a href="javascript:alert('구현 예정');" data-icon="user">내정보</a></li>
      </ul>
    </div>
  </div>
<!-- footer end -->

</div>
<!-- 모바일 페이지 end -->
</body>
</html>

