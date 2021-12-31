package egovframework.fox.com.cmm.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.IncludedCompInfoVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.sym.ccm.cde.service.CmmnDetailCodeVO;
import egovframework.com.sym.ccm.cde.service.EgovCcmCmmnDetailCodeManageService;
import egovframework.mbl.com.cmm.annotation.IncludedMblInfo;


@Controller
public class FoxMComIndexController  {
	
	@Resource(name = "CmmnDetailCodeManageService")
    private EgovCcmCmmnDetailCodeManageService cmmnDetailCodeManageService;
	


	private static final Logger LOGGER = LoggerFactory.getLogger(FoxMComIndexController.class);
	
	
	@RequestMapping("/FoxMobileMain.fo")
    public String mobileMain( ModelMap model) throws Exception {
	
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		// 권한 체크
//        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//        if(!isAuthenticated) {
//            return "egovframework/mbl/com/uat/uia/EgovLoginUsr";
//        }
		
	    //------------------------------
	    // 게시물주제구분코드 목록 조회 설정 
	    //------------------------------
	    CmmnDetailCodeVO cvo = new CmmnDetailCodeVO();
	    cvo.setCodeId("FOX001"); // 
	    List<CmmnDetailCodeVO> codeList = (List<CmmnDetailCodeVO>) cmmnDetailCodeManageService.selectCmmnDetailCodeList(cvo);
	    
		model.addAttribute("resultCodeList", codeList);
	    
		return "egovframework/fox/com/cmm/FoxUnitMain";
	}
}
