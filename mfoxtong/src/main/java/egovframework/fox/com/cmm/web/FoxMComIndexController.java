package egovframework.fox.com.cmm.web;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.sym.ccm.cde.service.CmmnDetailCodeVO;
import egovframework.com.sym.ccm.cde.service.EgovCcmCmmnDetailCodeManageService;
import egovframework.fox.bsh.service.FoxBsshInfoDefaultVO;
import egovframework.fox.bsh.service.FoxBsshInfoManageService;
import egovframework.fox.bsh.service.FoxBsshInfoManageVO;


@Controller
public class FoxMComIndexController  {
	
	
	/** FoxBsshInfoManageService */
	@Resource(name = "foxBsshInfoManageService")
	private FoxBsshInfoManageService foxBsshInfoManageService;
	
	@Resource(name = "CmmnDetailCodeManageService")
    private EgovCcmCmmnDetailCodeManageService cmmnDetailCodeManageService;
	


	private static final Logger LOGGER = LoggerFactory.getLogger(FoxMComIndexController.class);
	
	
	@RequestMapping("/FoxMobileMain.fo")
    public String mobileMain(@ModelAttribute FoxBsshInfoDefaultVO foxBsshInfoDefaultVO, ModelMap model) throws Exception {
	
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		// 권한 체크
//        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//        if(!isAuthenticated) {
//            return "egovframework/mbl/com/uat/uia/EgovLoginUsr";
//        }
		
	    //------------------------------
	    // 업체 카테고리 목록 조회 
	    //------------------------------
	    CmmnDetailCodeVO cvo = new CmmnDetailCodeVO();
	    cvo.setCodeId("FOX001"); // 
	    List<CmmnDetailCodeVO> codeList = (List<CmmnDetailCodeVO>) cmmnDetailCodeManageService.selectCmmnDetailCodeList(cvo);
	    
	    //------------------------------
	    // 시도/시군구 공통코드 목록 조회 (고정으로 걸려있음) 
	    //------------------------------
	    List<FoxBsshInfoManageVO> signguCodeList = (List<FoxBsshInfoManageVO>)foxBsshInfoManageService.retrieveSignguCodeList(foxBsshInfoDefaultVO) ;
	    
	    
	    //------------------------------
	    // 업체정보 목록조회 
	    //------------------------------    
	    List<FoxBsshInfoManageVO> bsshInfoList = (List<FoxBsshInfoManageVO>) foxBsshInfoManageService.retrieveBsshInfoList(foxBsshInfoDefaultVO);
	    
	    
	    model.addAttribute("signguCodeList", signguCodeList);
	    model.addAttribute("searchVo", foxBsshInfoDefaultVO);
	    model.addAttribute("resultBsshInfoList", bsshInfoList);
		model.addAttribute("resultCodeList", codeList);
	    
		return "egovframework/fox/com/cmm/FoxUnitMain";
	}
}
