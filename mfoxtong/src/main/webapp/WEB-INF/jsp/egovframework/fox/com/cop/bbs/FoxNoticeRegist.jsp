<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>  


 
<!DOCTYPE html> 
<html>  
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
        	
    <title>${bdMstr.bbsNm}</title> 

   	<!-- eGovFrame Common import -->
   	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
   	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/fox/com/cmm/foxBase.css"/>
    <link rel="stylesheet" href="./css/community_create.css">
    <style type="text/css">
	.container {
	    width: 100%;
	    max-width: 717px;
	    margin: 0 auto;
	    background: #f0f0f0;
	}
	
	.top_docbar {
	    width: 100%;
	    height: 52px;
	    border-bottom: 1px solid #ccc;
	    background: #fff;
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
	
	/* main_content */
	
	.main_content {
	    margin-top: 10px;
	    background: #fff;
	    height: 100%;
	    padding: 0 15px;
	}
	
	.main_content .input_inner {
	    padding-top: 10px;
	}
	
	.main_content .input_box {
	    margin-bottom: 10px;
	}
	
	.main_content .input_box label {
	    display: block;
	}
	
	.main_content .input_box select {
	    width: 100%;
	    border: none;
	    outline: none;
	    border-bottom: 1px solid #ccc;
	    padding: 10px 0;
	    font-size: 15px;
	    color: #333;
	}
	
	.main_content .input_box input[type="text"] {
	    width: 100%;
	    border: none;
	    outline: none;
	    border-bottom: 1px solid #ccc;
	    padding: 10px 5px;
	}
	
	.main_content .input_box input[type="text"]:disabled {
	    background: #fff;
	}
	
	.main_content .textarea {
	    width: 100%;
	    margin-bottom: 15px;
	}
	
	.main_content .textarea textarea {
	    width: 100%;
	    height: 185px;
	    overflow-y: auto;
	    resize: none;
	    border: none;
	    background: #f6f6f6;
	    padding: 10px;
	    outline: none;
	    font-size: 13px;
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
	
	#btnAtt {
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
	
	.main_content .btn_wrap {
	    padding-bottom: 15px;
	}
	
	.main_content .btn_wrap button {
	    border: none;
	    width: 100%;
	    height: 45px;
	    border-radius: 8px;
	    color: #fff;
	    background: #F5833C;
	    font-weight: 500;
	    cursor: pointer;
	    outline: none;
	}
	
	@media screen and (max-width: 320px) {
	    .main_content .check_box_wrap label {
	        font-size: 11px;
	    }
	}
    </style>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/validator.do"></script>
    <validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>
	<script type="text/javascript">

			function fn_showList() {
				var bbsId = document.board.bbsId.value;
				document.board.action = "${pageContext.request.contextPath}/cop/bbs${prefix}/selectBoardList.fo";
				document.board.bbsId.value = bbsId;
				document.board.submit();
				
			}
			
			function fn_egov_regist_notice() {
				var ntceBgnde = document.board.ntceBgnde.value; 
				var ntceEndde = document.board.ntceEndde.value;
				var bbsId = document.board.bbsId.value;

				if(ntceBgnde > ntceEndde){
					alert("게시기간 종료일이 시작일보다 빠릅니다.");
					return;		
				}

				if (!validateBoard(document.board)){
					return;
				}
					document.board.bbsId.value=bbsId;
					document.board.action = "${pageContext.request.contextPath}/cop/bbs${prefix}/insertBoardArticle.fo";
					document.board.submit();
			}

      </script>
</head>

<body>

<!--등록 페이지 -->
<div class="container">

<!--header start-->
	<div class="top_docbar">
	    <div class="inner">
	        <div class="title">
	            <h2>수다글 쓰기</h2>
	        </div>
	        <a href="javascript:fn_showList();">
	        <figure>
	            <img src="${pageContext.request.contextPath}/images/egovframework/fox/com/cmm/prev.png" alt=""/>
	        </figure>
	        </a>
	    </div>
	</div>
<!--header end-->
 
<!--main_content start -->       
	<form:form commandName="board" name="board" method="post" enctype="multipart/form-data">
       <div class="main_content">
               <div class="input_inner">
                   <div class="input_box">
                       <label for="">글 주제</label>
                       <select name="nttThemaSeCode" id="nttThemaSeCode">
			          <option value=" ">글 주제선택</option>
			          <c:choose> 
				      	<c:when test="${empty resultCodeList}">
							<option value="전체 ">선택할수 없음 </option>
						</c:when>
						<c:otherwise>
							<c:forEach var="result" items="${resultCodeList}">
								<option value="<c:out value="${result.code}"/>"><c:out value="${result.codeNm}"/></option>
							</c:forEach>
			      	   </c:otherwise>
					</c:choose>
			        </select>
                   </div>
                   <div class="input_box">
                       <label for="">글 제목</label>
                       <input type="text" name="nttSj" id="name"   placeholder="제목을 입력해주세요." />
                   </div>
                   <!-- 
                   <div class="input_box">
                       <label for="">작성자</label>
                       <input type="text" value="도요새잉글리시" disabled>
                   </div>
                    -->
               </div>
               <div class="textarea">
                   <textarea name="nttCn" id="nttCn" placeholder="등록 할 소식을 작성해주세요."></textarea>
               </div>

               <div class="img_wrap">
                   <ul>
                       <li>
                           <figure>
                               <label for="btnAtt">
                                   <img src="./images/camera.png" alt="">
                               </label>
                           </figure>
                           <span><span>0</span> / 10</span>
                       </li>
                       <li class="img_list" id="att_zone">

                       </li>
                       <input type="file" id="btnAtt" name="image" accept="image/*">
                   </ul>
               </div>

               <div class="btn_wrap">
                   <button type="button" onclick="fn_egov_regist_notice();">완료</button>
               </div>
               
      		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
		<input type="hidden" name="bbsId" value="<c:out value='${brdMstrVO.bbsId}'/>"/>
		<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>"/>
		<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>"/>
		<input type="hidden" name="replyPosblAt" value="<c:out value='${brdMstrVO.replyPosblAt}'/>"/>
		<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${brdMstrVO.fileAtchPosblAt}'/>"/>
		<input type="hidden" name="tmplatId" value="<c:out value='${brdMstrVO.tmplatId}'/>"/>
		<input type="hidden" name="frstRegisterNm" value="<c:out value='${brdMstrVO.frstRegisterNm}'/>"/>
		
		<input type="hidden" name="searchCnd" value="<c:out value='${searchVO.searchCnd}'/>">
		<input type="hidden" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>">
		<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>"/>
		
		<c:if test="${anonymous != 'true'}">
		<input type="hidden" name="ntcrNm" value="dummy">   <!-- validator 처리를 위해 지정 -->
		<input type="hidden" name="password" value="dummy"> <!-- validator 처리를 위해 지정 -->
		</c:if>
		
		<c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'}">
		<input name="ntceBgnde" type="hidden" value="10000101">
		<input name="ntceEndde" type="hidden" value="99991231">
		</c:if>
	
           </form>
       </div>
		<!--main_content start --> 
    </div>
<!--등록 페이지 end -->    
<script type="text/javascript">
//하단독바
$('.bottom_link').click(function () {
 if ($(this).hasClass('active')) {
     $(this).removeClass('active');
 } else {
     $('.bottom_link').removeClass('active');
     $(this).addClass('active');
 }
})

$('.category li').click(function () {
 if ($(this).hasClass('active')) {
     $(this).removeClass('active')
 } else {
     $('.category li').removeClass('active');
     $(this).addClass('active');
 }
})

$('.slide_item').click(function () {
 if ($(this).hasClass('active')) {
     $(this).removeClass('active');
 } else {
     $(this).addClass('active');
 }
})

$('.comment .right_area').click(function () {
 if ($(this).hasClass('active')) {
     $(this).removeClass('active');
 } else {
     $(this).addClass('active');
 }
})

imageView = function imageView(att_zone, btn) {

 var attZone = document.getElementById(att_zone);
 var btnAtt = document.getElementById(btn)
 var sel_files = [];

 var div_style = 'display:inline-block; position:relative;'
     + 'width:100%; height:69px; background: #ccc; border-radius: 8px; z-index:1';

 var img_style = 'width:100%; height:100%; object-fit: contain;';

 var chk_style = 'width:23px; height:23px; position:absolute; font-size:17px;'
     + 'right:0px; bottom:0px; z-index:999; border: 1px solid #F5833C; color:#fff; border-radius: 8px 0 0 0; background: #F5833C; cursor: pointer; ';

 btnAtt.onchange = function (e) {
     var files = e.target.files;
     var fileArr = Array.prototype.slice.call(files)
     for (f of fileArr) {
         imageLoader(f);
     }
 }


 attZone.addEventListener('dragenter', function (e) {
     e.preventDefault();
     e.stopPropagation();
 }, false)

 attZone.addEventListener('dragover', function (e) {
     e.preventDefault();
     e.stopPropagation();

 }, false)

 attZone.addEventListener('drop', function (e) {
     var files = {};
     e.preventDefault();
     e.stopPropagation();
     var dt = e.dataTransfer;
     files = dt.files;
     for (f of files) {
         imageLoader(f);
     }

 }, false)


 imageLoader = function (file) {
     sel_files.push(file);
     var reader = new FileReader();
     reader.onload = function (ee) {
         let img = document.createElement('img');
         img.setAttribute('style', img_style);
         img.src = ee.target.result;
         attZone.appendChild(makeDiv(img, file));
     }

     reader.readAsDataURL(file);
 }

 makeDiv = function (img, file) {
     var div = document.createElement('div')
     div.setAttribute('style', div_style)

     var btn = document.createElement('input')
     btn.setAttribute('type', 'button')
     btn.setAttribute('value', 'x')
     btn.setAttribute('delFile', file.name);
     btn.setAttribute('style', chk_style);
     btn.onclick = function (ev) {
         var ele = ev.srcElement;
         var delFile = ele.getAttribute('delFile');
         for (var i = 0; i < sel_files.length; i++) {
             if (delFile == sel_files[i].name) {
                 sel_files.splice(i, 1);
             }
         }

         dt = new DataTransfer();
         for (f in sel_files) {
             var file = sel_files[f];
             dt.items.add(file);
         }
         btnAtt.files = dt.files;
         var p = ele.parentNode;
         attZone.removeChild(p)
     }
     div.appendChild(img)
     div.appendChild(btn)
     return div
 }
}
 ('att_zone', 'btnAtt')
</script>    
</body>
</html>
