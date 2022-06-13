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
        
    <!-- eGovFrame Common import -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/fox/com/cmm/foxBase.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/fox/com/cmm/FoxRetrieveBsshinfo.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/fox/com/cmm/swiper-bundle.min.css"/>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	

		<script type="text/javascript">
		<!--
		function clearText(obj) {
			obj.value = "";
		}
		
		
		function modifyBsnBassInfoView() {
			
			document.foxBsshInfoManageVO.action="${pageContext.request.contextPath}/fox/bsh/updateBsnBassInfoView.fo";
			document.foxBsshInfoManageVO.submit();
			
		}
		
		function modifyBassInfoView() {
			
			document.foxBsshInfoManageVO.action="${pageContext.request.contextPath}/fox/bsh/updateBsshInfoView.fo";
			document.foxBsshInfoManageVO.submit();
			
		}
		
		function modifyBsshInfo() { 
			
			 if($("#ctgryId").val() == "" || $("#ctgryId").val()=="000000"){
			 	jAlert("업종분류를 선택 해주세요.",'알림', 'b');
				return false;
			 }  
			 
			 if($("#mtltyNm").val() == "" || $("#mtltyNm").val()=="상호를 입력해 주세요"){
				 	jAlert("상호명을 입력 해주세요 .",'알림', 'b');
					return false;
			 }
			 
			 if($("#moblphonNo").val() == ""|| $("#moblphonNo").val()=="휴대폰번호를 입력해 주세요"){
				 	jAlert("휴대폰번호를 입력해 주시기 바랍니다. \n 휴대폰번호는 일반사용자에게 공개되지 않습니다.",'알림', 'b');
					return false;
			 }
			 
			 if($("#adres").val() == ""|| $("#adres").val()=="주소를 입력해주세요"){
				 	jAlert("주소를 입력하여 주시기 바랍니다.",'알림', 'b');
					return false;
			 }
			 
			if($("#detailAdres").val() == ""|| $("#detailAdres").val()=="상세 주소를 입력해주세요"){
				 	jAlert("지도서비스를 위해 상세 주소가 필요합니다.",'알림', 'b');
					return false;
			}

			document.foxBsshInfoManageVO.action="${pageContext.request.contextPath}/fox/bsh/updateBsshInfo.fo";
			document.foxBsshInfoManageVO.submit();
			
		}
		
		function modifySvcGoodsInfoView() {
			
			document.foxBsshInfoManageVO.action="${pageContext.request.contextPath}/fox/bsh/updateSvcGoodsInfoView.fo";
			document.foxBsshInfoManageVO.submit();
		}
		
		
		
		//-->
		</script>
</head>
<body>

<!-- 메인 페이지 -->
    <div class="container">
<!-- header start -->
        <div class="top_docbar">
            <div class="inner">
                <div class="title">
                    <h2>업소정보 및 서비스정보 수정</h2>
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
 <div data-role="content" class="com-logContent">   

	<form name="foxBsshInfoManageVO"  method="post">	
	<input type="hidden" id="bsshEsntlId" name="bsshEsntlId" value="<c:out value='${result.bsshEsntlId}'/>" />
	<input type="hidden" id="esntlId" name="esntlId" value="<c:out value='${result.esntlId}'/>" />
	<br/>
	<!--  네비게이션 탭영역 strt -->
	<div data-role = "navbar">
       <ul>
          <li><a href = "javascript:modifyBsnBassInfoView();"  rel="external">영업정보관리</a></li>
          <li><a href = "javascript:modifySvcGoodsInfoView();" rel="external">서비스정보관리</a></li>  
          <li><a href = "javascript:modifyBassInfoView();"     rel="external">업소기정본정보관리</a></li>
       </ul>
    </div>
    <br/>
	<!--  네비게이션 탭영역	end -->
	
	<!--업체카테고리 선택 -->
	<br/>
	<fieldset class="fieldcontain">
        <label for="ctgryId">업체 분류 선택</label>
        <select name="ctgryId" id="ctgryId">
	     	<c:choose> 
	     		<c:when test="${empty codeList}">
           	 			<option value="000000">선택사항없음</option>
            	</c:when>
            	<c:otherwise>
            		<option value="000000">업종분류선택</option>
					<c:forEach var="codeResult" items="${codeList}">
						<c:if test="${codeResult.code eq result.ctgryId}">
					 		<option value="<c:out value='${codeResult.code}'/>" selected><c:out value="${codeResult.codeNm}"/></option>
						</c:if>
					 		<option value="<c:out value='${codeResult.code}'/>"><c:out value="${codeResult.codeNm}"/></option>
					</c:forEach>
            	</c:otherwise>
            </c:choose>
        </select>
    </fieldset>
   	<!--업체카테고리 선택 -->
	
	<!--상호명입력 -->
	<div data-role="fieldcontain">
		<span align="left">상호명</span><br/>
		<input type="text" name="mtltyNm" id="mtltyNm" value="<c:out value='${result.mtltyNm}'/>" data-theme="c" onclick="javascript:clearText(this);"/>
	</div>
	
	<!-- 휴대폰번호 입력 -->
	<div data-role="fieldcontain">
		<span align="left">전화번호</span><br/>
		<input type="text" name="tlphonNo" id="tlphonNo" value="<c:out value='${result.tlphonNo}'/>" data-theme="c" onclick="javascript:clearText(this);"/>
	</div>
	<div data-role="fieldcontain">
		<span align="left">휴대폰번호</span><br/>
		<input type="text" name="moblphonNo" id="moblphonNo" value="<c:out value='${result.moblphonNo}'/>" data-theme="c" onclick="javascript:clearText(this);"/>
	</div>
	
	<!-- 주소입력 -->
	<div data-role="fieldcontain">
        <table border="1" width = "100%">
			<tr>
				<td width = "100%" hdight="100" align="left">
					<span align="left">우편번호</span><br/>
					<input type="text" name="postNo" id="postNo" value="<c:out value='${result.postNo}'/>" data-theme="c" readonly/>
				</td>
				<td width = "100%" hdight="100" align="center">
					<span align="left">  </span><br/>
					<a href="javascript:addressSearch();" data-role="button" data-thema="z">우편번호검색</a>
				</td>
			</tr>
		</table>
			<span align="left">주소</span><br/>
			<input type="text" name="adres" id="adres" value="<c:out value='${result.adres}'/>" data-theme="c" onclick="javascript:clearText(this);"/>
			<span align="left">상세주소</span><br/>
			<input type="text" name="detailAdres" id="detailAdres" value="<c:out value='${result.detailAdres}'/>" data-theme="c" onclick="javascript:clearText(this);"/>
			<span align="left">건물명</span><br/>
			<input type="text" name="buldNm" id="buldNm" value="<c:out value='${result.buldNm}'/>" data-theme="c" onclick="javascript:clearText(this);"/>
	</div>
	<br/>
	<br/>
	<br/>
	<div data-role="fieldcontain" class="com-logLogin" >   
		<a href="javascript:modifyBsshInfo();" data-role="button" data-thema="z">수정완료</a>
	</div>
	<br/>
	<br/> 
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

