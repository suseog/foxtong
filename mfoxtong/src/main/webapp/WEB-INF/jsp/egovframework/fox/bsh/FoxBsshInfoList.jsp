<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>업체목록조회</title> 
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        
        <!-- eGovFrame Common import -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/ussCommon.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>

		<script type="text/javascript">
	
		
		
		</script>
</head>
<body>

<!-- content start -->
 <div data-role="content" class="com-logContent">   
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
</div>
<!-- content end -->
</body>
</html>

