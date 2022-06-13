<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>업소정보 및 서비스정보 수정</title> 
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/fox/com/cmm/foxBase.css"/>

<style type="text/css">

.bg {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0,0,0, 0.6);
    z-index: 3;
    display: none;
}

.container {
    width: 100%;
    max-width: 717px;
    margin: 0 auto;
}
	.top_docbar {
    width: 100%;
    height: 52px;
    border-bottom: 1px solid #ccc;
}

.top_docbar .inner {
    position: relative;
    height: 100%;

    display: flex;
    justify-content: center;
    align-items: center;
}

.top_docbar .title h2 {
    font-size: 20px;
    font-weight: 500;
}

.top_docbar figure {
    position: absolute;
    left: 15px;
    cursor: pointer;
}

/* main_content */

.main_content {
    padding: 0 15px;
    margin-top: 20px;
}

/* login_mene */
.main_content .nav_mene {
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    padding-bottom: 15px;
    border-bottom: 1px solid #ccc;
}

.main_content .nav_mene a {
    color: #333;
    font-size: 14px;
    font-weight: 500;
    width: 33.3333%;
    text-align: center;
    border-right: 1px solid #ccc;
}

.main_content .nav_mene a:last-child {
    border-right: 0;
}


.main_content .chk_btn {
    width: 80px;
    height: 20px;
    background: #F5833C;
    border-radius: 12px;
    cursor: pointer;
    position: absolute;
    right: 0;
    top: 20%;
    transform: translateY(-50%);
}

.main_content .chk_btn span {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
    font-size: 11px;
    color: #fff;
}


.main_content .sub_title {
    width: 200px;
    height: 30px;
    position: relative;
    background: #F5833C;
    border-radius: 5px;
    margin-bottom: 5px;
    
}

.main_content .sub_title span {
    display: flex;
    justify-content: left;
    align-items: center;
    width: 100%;
    height: 100%;
    font-size: 15px;
    color: #fff;
    
}


.main_content .select_box {
    margin-bottom: 15px;
    position: relative;
}

.main_content .select_box label {
    display: block;
    margin-bottom: 10px;
    color: #999;
    font-size: 14px;
}

.main_content .select_box span  {
    display: block;
    margin-bottom: 10px;
    color: #999;
    font-size: 12px;
}

.main_content .select_box .select {
    width: 100%;
    outline: none;
    border: none;

    border-bottom: 1px solid #ccc;
    padding-bottom: 5px;
    font-size: 14px;
    color: #333;
}
.main_content .classtd span {
    display: block;
    margin-bottom: 10px;
    color: #999;
    font-size: 12px;
}


.main_content .chk_btn {
    width: 80px;
    height: 20px;
    background: #F5833C;
    border-radius: 12px;
    cursor: pointer;
    position: absolute;
    right: 0;
    top: 20%;
    transform: translateY(-50%);
}

.main_content .chk_btn span {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
    font-size: 11px;
    color: #fff;
}

.main_content .input_box {
    margin-bottom: 15px;
    position: relative;
}

.main_content .input_box label {
    display: block;
    margin-bottom: 10px;
    color: #999;
    font-size: 14px;
}

.main_content .input_box input {
    width: 100%;
    outline: none;
    border: none;

    border-bottom: 1px solid #ccc;
    padding-bottom: 5px;
    font-size: 14px;
    color: #333;
}

.main_content .input_box input::placeholder {
    color: #ccc;
    font-size: 12px;
}

.main_content .input_box .false {
    color: #f00;
    font-size: 11px;
}

.main_content .input_box .true {
    color: #F5833C;
    font-size: 11px;
}

.main_content .img_wrap {
    margin-bottom: 15px;
}

.main_content .img_wrap ul {
    position: relative;
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    overflow-x: auto;
}

.main_content .img_wrap li:first-child {
    width: 69px;
    height: 69px;
    border: 1px solid #ccc;
    border-radius: 8px;
    background: #fff;

    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 5px;
}

.main_content .img_wrap li span {
    font-size: 13px;
    color: #999;
}

#egovComFileUploader { 
    width: 69px;
    height: 69px;
    position: absolute;
    top: 0;
    left: 0;
    opacity: 0;
    cursor: pointer;
}

.main_content .img_wrap .img_list {
    width: 69px;
    height: 69px;
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
    gap: 10px;
}

.main_content .textarea textarea {
    width: 100%;
    height: 120px;
    overflow-y: auto;
    resize: none;
    border: none;
    background: #f6f6f6;
    padding: 10px;
    outline: none;
    font-size: 13px;
}

.main_content .textarea label {
    display: block;
    margin-bottom: 10px;
    color: #999;
    font-size: 14px;
}

.main_content .btn_wrap {
    justify-content: center;
    align-items: center;
    margin: 24px 0;
}

.main_content .btn_wrap button {
    border: none;
    width: 50%;
    height: 30px;
    border-radius: 8px;
    background: #F5833C;
    color: #fff;
    font-size: 20px;
    font-weight: 500;
    cursor: pointer;
}

.main_content .btn_wrap_two {
	display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin: 24px 0;
}

.main_content .btn_wrap_two button {
    border: none;
    width: 50%;
    height: 30px;
    border-radius: 8px;
    background: #F5833C;
    color: #fff;
    font-size: 20px;
    font-weight: 500;
    cursor: pointer;
}


/* bottom */

.bottom_docbar {
    width: 100%;
    height: 60px;
    background: #fff;
    box-shadow: 4px 0 11px rgb(0,0,0, 0.5);
    position: fixed;
    left: 50%;
    transform: translatex(-50%);
    bottom: 0;
}

.bottom_docbar .inner {
    height: 100%;
}

.bottom_docbar ul {
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 100%;
}

.bottom_docbar ul li {
    width: 25%;
    height: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-around;
    cursor: pointer;
}

.bottom_docbar ul li a {
    display: block;
}

.bottom_docbar ul li p {
    font-weight: bold;
    font-size: 11px;
}

.bottom_link.active svg path {
    fill: #F5833C;
}

.bottom_link.active p {
    color: #F5833C;
}

/* 사이드바 */
.side_bar .slide_btn {
	position: fixed;
	right: 0;
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 200px;
    margin: 10px 0;
    background: #fff;
}
.side_bar .slide_btn .left_area {
    width: 90%;
}

.side_bar .slide_btn .slide_ul {
    width: 100%;
    display: flex;
    height: 100%;
}

.side_bar .slide_btn .slide_ul li {
    display: flex;
    justify-content: center;
    align-items: center;
} 

.side_bar .slide_btn .slide_ul li span {
    display: inline-block;
    font-size: 14px;
    border: 1px solid #F5833C;
    color: #F5833C;
    border-radius: 15px;
    padding: 7px;
    font-weight: 500;
}

/* side_bar */
.side_bar {
    background: #f0f0f0;
    width: 70%;
    height: 100vh;
    position: fixed;
    top: 0;
    right: -100%;
    z-index: 4;
    box-shadow: -5px 0 22px rgba(0,0,0, 0.5);
    transition: .4s;
}

.main_content .right_area figure.active + .side_bar {
    position: fixed;
    right: 0;
}


.side_bar .top_docbar {
    border: none;
    background: #fff;
}

.side_bar .inner {
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 100%;
}

.side_bar .inner .left_area {
    display: flex;
    align-items: center;
    gap: 10px;
}

/* 신규로 버거 아이콘 우측 정렬로 */
.side_bar .inner .rigth_area {
    display: flex;
    align-items: right;
    gap: 10px;
    position: absolute;
    right: 5px;
    top: 50%;
    
}

.side_bar .top_docbar .title h2 {
    font-weight: bold;
    cursor: pointer;
}

.side_bar .top_docbar .title h2::after {
    content: "";
    display: inline-block;
    background: url(../images/right_arrow.png);
    background-repeat: no-repeat;
    width: 6px;
    height: 12px;
    margin-left: 10px;
}

.side_bar .top_docbar .title span {
    font-weight: bold;
}

.side_bar .slide_wrap {
    background: #fff;
    margin: 10px 0;
}

.side_bar .zone_wrap {
    background: #fff;
}

.side_bar .zone_wrap .title {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 15px;
    height: 45px;
    border-bottom: 1px solid #999;
}

.side_bar .zone_wrap .title em {
    color: #fff;
}

.side_bar .zone_wrap .title h2 {
    font-size: 18px;
    font-weight: bold;
}

.side_bar .zone_wrap .title span {
    font-size: 12px;
    color: #999;
    font-weight: bold;
    cursor: pointer;
}

.side_bar .zone_wrap .title span::before {
    content: "";
    display: inline-block;
    background: url(../images/zone_ico.png);
    background-repeat: no-repeat;
    width: 12px;
    height: 11px;
    margin-right: 5px;
}

.side_bar .zone_wrap .zone_list {
    height: 50vh;
    overflow-y: auto;
    background: #f0f0f0;
    border-bottom: 1px solid #ccc;
}

.side_bar .zone_wrap .zone_list > ul {
    position: relative;
}

.side_bar .zone_item {
    display: flex;
    height: 37px;
}

.side_bar .zone_item > span {
    width: 40%;
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
    background: #F5F5F5;
    border-bottom: 1px solid #ccc;
    cursor: pointer;
} 

.side_bar .zone_item > span.active {
    font-weight: 500;
    background: #fff;
}

.side_bar .zone_item > span::after {
    content: "";
    display: inline-block;
    background: url(../images/right_arrow.png);
    background-repeat: no-repeat;
    width: 6px;
    height: 12px;
    position: absolute;
    right: 5px;
    top: 50%;
    transform: translateY(-50%);
}

.side_bar .zone_item > span.active + .zone_ul {
    display: block;
}

.side_bar .zone_item ul {
    width: 60%;
    height: 100%;
    position: absolute;
    top: 0;
    right: 0;
    background: #fdfdfd;
    display: none;
}

.side_bar .zone_item ul span {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 37px;
    background: #fdfdfd;
    border-bottom: 1px solid #ccc;
    cursor: pointer;
}

.side_bar .btn_wrap {
    width: 100%;
    display: flex;
    justify-content: center;
    margin-top: 30px;
    padding: 0 15px;
}

.side_bar .btn_wrap button {
    width: 100%;
    height: 45px;
    outline: none;
    border: none;
    border-radius: 8px;
    background: #F5833C;
    color: #fff;
    font-size: 20px;
    font-weight: 500;
    cursor: pointer;
}

@media screen and (max-width: 280px) {
    .side_bar .zone_wrap .title em {
        display: none;
    }
}

</style>
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
		<script src="//cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>
		<script type="text/javascript">
		<!--
		function clearText(obj) {
			obj.value = "";
		}
		
		function modifySvcGoodsInfoView() {
			
			document.foxBsshInfoManageVO.action="${pageContext.request.contextPath}/fox/bsh/updateSvcGoodsInfoView.fo";
			document.foxBsshInfoManageVO.submit();
		}
		
		function modifyBsnBassInfoView() {
			
			document.foxBsshInfoManageVO.action="${pageContext.request.contextPath}/fox/bsh/updateBsnBassInfoView.fo";
			document.foxBsshInfoManageVO.submit();
			
		}
		
		function modifyBassInfoView() {
			
			document.foxBsshInfoManageVO.action="${pageContext.request.contextPath}/fox/bsh/updateBsshInfoView.fo";
			document.foxBsshInfoManageVO.submit();
			
		}
		
		function modifySvcGoodsInfo(frm) {
			frm.action="${pageContext.request.contextPath}/fox/bsh/updateSvcGoodsInfo.fo";
			frm.submit();
		}
		
		function addSvcGoods(){
			document.frm1.action="${pageContext.request.contextPath}/fox/bsh/createSvcGoodsInfo.fo";
			document.frm1.submit();
		}
		
		
		function deleteSvcGoodsInfo(frm){
			frm.action="${pageContext.request.contextPath}/fox/bsh/deleteSvcGoodsInfo.fo";
			frm.submit();
		}
		
		function addSvcGoodsCl(){
			
			if(document.frmCl.svcSmallclasNm.value == ""){
				alert('추가할 분류명을 먼저입력하고 요청하세요');
				return false;
			}else{
				frmCl.action="${pageContext.request.contextPath}/fox/bsh/createSvcGoodsCl.fo";
				frmCl.submit();
			}
		}
		
		function deleteSvcGoodsCl(frm){
			frm.action="${pageContext.request.contextPath}/fox/bsh/deleteSvcGoodsCl.fo";
			frm.submit();
		}
		
		function modifySvcGoodsCl(frm){
			frm.action="${pageContext.request.contextPath}/fox/bsh/updateSvcGoodsCl.fo";
			frm.submit();
		}
		
		function changeStr (el){
			
			alert(el);

			var str = numeral(el.val()).format('0,0');
			
			alert('formatting:' + str);
			
		}
		
		//-->
		</script>
		
</head>

<body>
<form name="foxBsshInfoManageVO"  method="post">	
<input type="hidden" id="bsshEsntlId" name="bsshEsntlId" value="<c:out value='${result.bsshEsntlId}'/>" />
<input type="hidden" id="esntlId" name="esntlId" value="<c:out value='${result.esntlId}'/>" />
</form>
		
<!-- 메인 페이지 -->
<div class="container">
<div class="bg"></div>
<!-- header start -->
	<div class="top_docbar">
	    <div class="inner">
	        <div class="title">
	            <h2>업소정보 및 서비스정보 관리</h2>
	        </div>
	        <a href="${pageContext.request.contextPath}/FoxMobileMain.fo" rel="external">
	        <figure>
	            <img src="${pageContext.request.contextPath}/images/egovframework/fox/com/cmm/prev.png" alt="">
	        </figure>
	        </a>
	    </div>
	</div>
<!-- header end -->


<!-- content start -->
	<div class="main_content">

		<!--  네비게이션 탭영역 strt -->
		<div class="nav_mene">
	          <a href = "javascript:modifyBsnBassInfoView();"  rel="external">프로필 관리</a>
	          <a href = "javascript:modifySvcGoodsInfoView();" rel="external">서비스정보관리</a>  
	          <a href = "javascript:modifyBassInfoView();"     rel="external">업소기정본정보관리</a>
	    </div>
	    <br/>
		<!--  네비게이션 탭영역	end -->
			<!-- right_area -->
					<div class="right_area">
	                    <figure class="side_btn" onclick="sideOn(this);">
	                        <img src="${pageContext.request.contextPath}/images/egovframework/fox/com/cmm/sidebar_ico.png" alt="">
	                    </figure>
	                    <!-- 햄버거 사이드바 start-->
	                    <div class="side_bar">
	                        <div class="top_docbar">
	                            <div class="inner">
		                            <div class="left_area">
	                                    <figure>
	                                        <img src="${pageContext.request.contextPath}/images/egovframework/fox/com/cmm/fox_logo.png" alt="">
	                                    </figure>
	                                    <div class="title">
	                                        <span>서비스 그룹 관리</span>
	                                    </div>
	                                </div>
	                                <!-- 
	                                <div class="right_area" align="right">
	                                    <figure onclick="sideOff(this)">
	                                        <img src="${pageContext.request.contextPath}/images/egovframework/fox/com/cmm/close.png" alt="">
	                                    </figure>
                               		</div>
                               		 -->
	                            </div>
	                        </div>
	                        <!-- 분류관리 -->
							  <br/>
							  <br/>
							  <br/>
							  <div>
							    <form name="frmCl" id="frmCl" method="post" enctype="multipart/form-data">	
							    	<input type="hidden" id="bsshEsntlId" name="bsshEsntlId" value="<c:out value='${vo.bsshEsntlId}'/>" />
									<input type="hidden" id="esntlId" name="esntlId" value="<c:out value='${vo.esntlId}'/>" />
 								  	 <div class="input_box">
										 <label for="">신규 서비스 그룹명 </label>
										 <input type="text" name="svcSmallclasNm" id="svcSmallclasNm" value="" />
									 </div>
								     <input type="button" onClick="javascript:addSvcGoodsCl();" value="신규추가">
								     <br/>
								     <br/>
								     <br/>
								     <br/>
						         </form>
					         </div>
					         <div>
							    <c:choose>
					     			<c:when test="${empty resultCodeList}">
					            	</c:when>
					            	<c:otherwise>
										 <div class="input_box">
											 <label for=""> 서비스 그룹 수정 </label>
										 </div>	 
											<c:forEach var="cllist" items="${resultCodeList}">
							            		<form name="frmCl<c:out value='${cllist.svcSmallclas}'/>" method="post" enctype="multipart/form-data">	
									   		 		<input type="hidden" name="svcSmallclas" id="svcSmallclas" value="<c:out value='${cllist.svcSmallclas}'/>">
													 <div class="input_box">
														 <input type="text" name="svcSmallclasNm" id="svcSmallclasNm" value="<c:out value='${cllist.svcSmallclasNm}'/>">
													 </div>
												    <input type="button" onClick="javascript:modifySvcGoodsCl(frmCl<c:out value='${cllist.svcSmallclas}'/>)" value="수정">
												    <input type="button" onClick="javascript:deleteSvcGoodsCl(frmCl<c:out value='${cllist.svcSmallclas}'/>)" value="삭제">
											    </form>
											</c:forEach>
					             	</c:otherwise>
					            </c:choose>
				             </div>
					  	     <div class="btn_wrap">
					             <button type="button" onclick="javascript:sideOff2();">닫기</button>
					         </div>
							  <br/>
							  <br/>
							  <br/>   
							 <!-- 분류관리 end --> 
	                    </div>
	                    <!-- 햄버거 사이드바 end-->
			         </div>
			         <!-- right_area -->
	
		<!--신규 서비스 상품정보 추가  -->
	 	<form name="frm1" method="post" enctype="multipart/form-data">	
		<input type="hidden" id="bsshEsntlId" name="bsshEsntlId" value="<c:out value='${vo.bsshEsntlId}'/>" />
		<input type="hidden" id="esntlId" name="esntlId" value="<c:out value='${vo.esntlId}'/>" />

		<div class="sub_title">
			<span> [서비스 신규 등록]</span>
		</div>
		<div>
			<!--업체카테고리 선택 -->
			<div class="select_box">
		        <select name="svcSmallclas" id="svcSmallclas" class="select">
			     	<c:choose> 
			     		<c:when test="${empty resultCodeList}">
		           	 			<option value="000000">서비스그룹을 먼저 등록 하시기 바랍니다.</option>
		            	</c:when>
		            	<c:otherwise>
		            		<option value="000000">서비스그룹 선택</option>
							<c:forEach var="codeResult" items="${resultCodeList}">
							 	<option value="<c:out value='${codeResult.svcSmallclas}'/>"><c:out value="${codeResult.svcSmallclasNm}"/></option>
							</c:forEach>
		            	</c:otherwise>
		            </c:choose>
		        </select>
		    </div>    
		   	<!--업체카테고리 선택 -->
		</div>
		<div class="input_box">
	          <label for="">서비스상품명</label>
	          <input type="text" name="svcGoodsNm" id="svcGoodsNm" value="" />
	    </div>
	    <div class="input_box">
	          <label for="">시간</label>
	          <input type="text" name="svcTime" id="svcTime" value="" />
	    </div>
		<div class="input_box">
	          <label for="">소비자가격</label>
	          <input type="text" name="svcCnsmrPc" id="svcCnsmrPc" value="" />
	    </div>
		<div class="input_box">
	          <label for="">할인율</label>
	          <input type="text" name="svcDscntRt" id="svcDscntRt" value="" />
	    </div>	    	    
		<div class="input_box">
	          <label for="">최종가</label>
	          <input type="text" name="lastDscntPc" id="lastDscntPc" value="" />
	    </div>	    	    
	    <div class="btn_wrap" align="center">
             <button type="button" onclick="javascript:addSvcGoods();">서비스신규등록</button>
        </div>
		<br/>
		<br/>
		</form>
		<!--신규 서비스 상품정보 추가  -->

	
   		<!--등록된 서비스상품정보 -->	
   		<div class="sub_title" >
			<span> [서비스 수정]</span>
		</div>
		<div>
   		<c:choose> 
    		<c:when test="${empty svcGoodsInfoList}">
       	 			<span >서비스정보 없음</span>
          	</c:when>
          	<c:otherwise>
				<c:forEach var="result" items="${svcGoodsInfoList}">
					<form name="frm<c:out value='${result.svcId}'/>"  method="post" enctype="multipart/form-data">	
					<input type="hidden" id="bsshEsntlId" 	name="bsshEsntlId" 	value="<c:out value='${vo.bsshEsntlId}'/>" />
					<input type="hidden" id="esntlId" 		name="esntlId" 		value="<c:out value='${vo.esntlId}'/>" />
				   	<input type="hidden" id="svcId" 		name="svcId" 		value="<c:out value='${result.svcId}'/>"/>
					<table width="100%">
						<tr>
							<td class="classtd"><span>서비스 그룹</span></td>
							<td colspan="3">
								<!--서비스그룹 선택 -->
								<div class="select_box">
							        <select name="svcSmallclas" id="svcSmallclas" class="select">
								     	<c:choose> 
								     		<c:when test="${empty resultCodeList}">
							           	 			<option value="000000">서비스그룹 선택</option>
							            	</c:when>
							            	<c:otherwise>
							            		<option value="000000">서비스그룹 선택</option>
												<c:forEach var="codeResult" items="${resultCodeList}">
													<c:if test="${codeResult.svcSmallclas eq result.svcSmallclas}">
												 		<option value="<c:out value='${codeResult.svcSmallclas}'/>" selected><c:out value="${codeResult.svcSmallclasNm}"/></option>
													</c:if>
												 		<option value="<c:out value='${codeResult.svcSmallclas}'/>" ><c:out value="${codeResult.svcSmallclasNm}"/></option>
												</c:forEach>
							            	</c:otherwise>
							            </c:choose>
							        </select>
							    </div>    
							   	<!--서비스그룹 선택 -->
				   			</td>
						</tr>
						<tr>
							<td class="classtd"><span>서비스명</span></td>
							<td colspan="3">
								<div class="input_box"><input type="text" name="svcGoodsNm" id="svcGoodsNm" value="<c:out value='${result.svcGoodsNm}'/>"/></div>
						    </td>	
						</tr>
						<tr>
							<td class="classtd"><span>시간(회수)</span></td>
							<td class="classtd"><span>소비자가격</span></td>
							<td class="classtd"><span>할인율</span></td>
							<td class="classtd"><span>최종할인가격</span></td>
						</tr>
						<tr>
							<td><div class="input_box"><input type="text" name="svcTime" id="svcTime" value="<c:out value='${result.svcTime}'/>"/></div></td>
							<td><div class="input_box"><input type="text" name="svcCnsmrPc" id="svcCnsmrPc" value="<c:out value='${result.svcCnsmrPc}'/>" onchange="changeStr(this);"/></div></td>
							<td><div class="input_box"><input type="text" name="svcDscntRt" id="svcDscntRt" value="<c:out value='${result.svcDscntRt}'/>"/></div></td>
							<td><div class="input_box"><input type="text" name="lastDscntPc" id="lastDscntPc" value="<c:out value='${result.lastDscntPc}'/>"/></div></td>
						</tr>
					</table>
				    <div class="btn_two" align="center">
			             <button type="button" onclick="javascript:modifySvcGoodsInfo(frm<c:out value='${result.svcId}'/>);">수정</button>
			             <button type="button" onclick="javascript:deleteSvcGoodsInfo(frm<c:out value='${result.svcId}'/>);">삭제</button>
			        </div>
					<br/>
					</form>	
					<hr>
				</c:forEach>
          	</c:otherwise>
          </c:choose>
	</div>
	<br/>
	<br/>
   	<!-- 서비스상품정보 -->	
   	
	
	
</div>
<!-- content end -->







<!-- footer start -->
 
 
 
<!-- footer end -->


</div>
<!-- 메인 페이지 end -->

<script>
//햄버거 사이드바 
function sideOn(el) {
    $(el).addClass('active');
    $('.bg').css('display', 'block');
    $('body').css('overflow', 'hidden');
}

function sideOff(el) {
    var sideOff = $(el).parents('.right_area').find('.side_btn')[0];
    $(sideOff).removeClass('active');
    $('.bg').css('display', 'none');
    $('body').css('overflow', 'unset');
}

function sideOff2() {
   // var sideOff = $(el).parents('.right_area').find('.side_btn')[0];
    $('.side_btn').removeClass('active');
    $('.bg').css('display', 'none');
    $('body').css('overflow', 'unset');
}



/*
$('.zone_item > span').click(function () {
    if ($(this).hasClass('active')) {
        $(this).removeClass('active');
    } else {
        $('.zone_item > span').removeClass('active');
        $(this).addClass('active');
    }
});
*/
</script>
</body>
</html>


