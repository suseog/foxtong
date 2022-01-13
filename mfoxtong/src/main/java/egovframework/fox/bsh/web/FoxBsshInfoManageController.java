package egovframework.fox.bsh.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.sym.ccm.cde.service.CmmnDetailCodeVO;
import egovframework.com.sym.ccm.cde.service.EgovCcmCmmnDetailCodeManageService;
import egovframework.fox.bsh.service.FoxBsshInfoDefaultVO;
import egovframework.fox.bsh.service.FoxBsshInfoManageService;
import egovframework.fox.bsh.service.FoxBsshInfoManageVO;
import egovframework.fox.bsh.service.FoxEntrpsEmplyrSbscrbRequstVO;
import egovframework.fox.com.uss.umt.service.FoxMberManageVO;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 업소기본 정보를 관리하는 기능 
 * @author 공통서비스 개발팀 조재영
 * @since 2009.04.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2022.01.10  정수석         최초 생성
 *
 * </pre>
 */

@Controller
public class FoxBsshInfoManageController {

	/** FoxBsshInfoManageService */
	@Resource(name = "foxBsshInfoManageService")
	private FoxBsshInfoManageService foxBsshInfoManageService;

	/** cmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name = "CmmnDetailCodeManageService")
    private EgovCcmCmmnDetailCodeManageService cmmnDetailCodeManageService;
	

	/** DefaultBeanValidator beanValidator */
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	
	/**
	 * 업체사용자가입요청 
	 * @param foxBsshInfoManageVO 일반회원 등록정보
	 * @return 등록결과
	 * @throws Exception   
	 */
	@RequestMapping("/fox/bsh/entrpsEmplyrSbscrbRequstView.fo")
	public String Bbss(@ModelAttribute("foxBsshInfoManageVO") FoxBsshInfoManageVO foxBsshInfoManageVO,@ModelAttribute("foxMberManageVO") FoxMberManageVO foxMberManageVO, Model model)
			throws Exception{
		
	    //------------------------------
	    // 업체카테고리 정보 조회 (공통코드) 
	    //------------------------------
	    CmmnDetailCodeVO cvo = new CmmnDetailCodeVO();
	    cvo.setCodeId("FOX001"); // 
	    List<CmmnDetailCodeVO> codeList = (List<CmmnDetailCodeVO>) cmmnDetailCodeManageService.selectCmmnDetailCodeList(cvo);
	    
		model.addAttribute("resultCodeList", codeList);
	    
		
		return "egovframework/fox/bsh/FoxEntrpsEmplyrSbscrbRequstView";
		
		
	}
	
	
	/**
	 * 업체사용자가입요청처리
	 * @param foxBsshInfoManageVO 일반회원의 업체 등록요청 정보
	 * @return 등록결과
	 * @throws Exception
	 */
	@RequestMapping("/fox/bsh/entrpsEmplyrSbscrbRequst.fo")
	public String entrpsEmplyrSbscrbRequst(@ModelAttribute("foxEntrpsEmplyrSbscrbRequstVO") FoxEntrpsEmplyrSbscrbRequstVO foxEntrpsEmplyrSbscrbRequstVO, HttpServletRequest request, Model model)
			throws Exception{
		
		// 세션에서 사용자 정보 가져오기 
		LoginVO logVO = (LoginVO) request.getSession().getAttribute("loginVO");
		
		foxEntrpsEmplyrSbscrbRequstVO.setEsntlId(logVO.getUniqId());	// 사용자 고유 아이디 
		foxEntrpsEmplyrSbscrbRequstVO.setMberNm(logVO.getMberNm());		// 사용자 이름  
		foxEntrpsEmplyrSbscrbRequstVO.setMberSe("02"); 					// 업체 회원 
		foxEntrpsEmplyrSbscrbRequstVO.setBsnSttus("01"); 				// 가입요청 
		

        
		
		foxBsshInfoManageService.entrpsEmplyrSbscrbRequst(foxEntrpsEmplyrSbscrbRequstVO);
		
		
		return "egovframework/fox/bsh/FoxEntrpsEmplyrSbscrbRequstCompt";
	}
	
	
	/**
	 * 업소관리메인 
	 * @param foxBsshInfoManageVO 
	 * @return 등록결과
	 * @throws Exception
	 */
	@RequestMapping("/fox/bsh/bsshInMain.fo")
	public String BbsshInMain(@ModelAttribute("foxBsshInfoManageVO") FoxBsshInfoManageVO foxBsshInfoManageVO, Model model)
			throws Exception{
		
		//  업소관리자 권한 확인 
		
		
		//  업소정보 조회 
		return "egovframework/fox/bsh/FoxBbsshInMain";
	}
	
	
	
	/**
	 * 업소기본정보등록화면
	 * @param foxBsshInfoManageVO 일반회원 등록정보
	 * @return 등록결과
	 * @throws Exception
	 */
	@RequestMapping("/fox/bsh/createBsshInfView.fo")
	public String createBsshInfView(@ModelAttribute("foxBsshInfoManageVO") FoxBsshInfoManageVO foxBsshInfoManageVO, Model model)
			throws Exception{
		
		
		
		return "egovframework/fox/bsh/FoxCreateBsshInfoView";
	}

	/**
	 * 업소기본정보등록
	 * @param foxBsshInfoManageVO 일반회원 등록정보
	 * @return 등록결과
	 * @throws Exception
	 */
	@RequestMapping("/fox/bsh/createBsshInf.fo")
	public String createBsshInfo(@ModelAttribute("foxBsshInfoManageVO") FoxBsshInfoManageVO foxBsshInfoManageVO, Model model)
			throws Exception{
		
		
		model.addAttribute("result", "");
		return "egovframework/fox/bsh/FoxCreateBsshInfo";
	}

	/**
	 * 업소기본정보상세조회
	 * @parm bsshEsntlId	상세조회대상 업소고id
	 * @return foxBsshInfoManageVO 일반회원상세정보
	 * @throws Exception
	 */
	@RequestMapping("/fox/bsh/retrieveBsshInfo.fo")
	public String retrieveBsshInfo (@ModelAttribute("foxBsshInfoManageVO") FoxBsshInfoManageVO foxBsshInfoManageVO, Model model)
			throws Exception{
		
		model.addAttribute("foxBsshInfoManageVO", foxBsshInfoManageVO);
		return "egovframework/fox/bsh/FoxRetrieveBsshInfo";
	}
	
	
	/**
	 * 업소기본정보수정
	 * @parm bsshEsntlId	상세조회대상 업소고id
	 * @return foxBsshInfoManageVO 일반회원상세정보
	 * @throws Exception
	 */
	@RequestMapping("/fox/bsh/updateBsshInfoView.fo")
	public String updateBsshInfo (@ModelAttribute("foxBsshInfoManageVO") FoxBsshInfoManageVO foxBsshInfoManageVO, Model model)
			throws Exception{
		
		
		model.addAttribute("foxBsshInfoManageVO", foxBsshInfoManageVO);
		return "egovframework/fox/bsh/FoxUpdateBsshInfoView";
	}
	
	
	/**
	 * 업소기본정보 목록조회 
	 * @param foxBsshInfoDefaultVO 검색조건
	 * @return List<FoxBsshInfoManageVO> 일반회원목록정보
	 * @throws Exception
	 */
	@RequestMapping("/fox/bsh/retrieveBsshInfoList.fo")
	public String retrieveBsshInfoList(@ModelAttribute("foxBsshInfoDefaultVO") FoxBsshInfoDefaultVO foxBsshInfoDefaultVO, Model model)
			throws Exception{
		
		
		model.addAttribute("resultList", "");
		return "egovframework/fox/bsh/FoxRetrieveBsshInfoList";
	}
	
	
	/**
	 * 업소기본정보삭제 (수정) 
	 * @param bsshEsntlId 삭제대상 일반회원아이디
	 * @throws Exception
	 */
	@RequestMapping("/fox/bsh/deleteBsshInfo.fo")
	public String deleteBsshInfo(@ModelAttribute("foxBsshInfoManageVO") FoxBsshInfoManageVO foxBsshInfoManageVO, Model model)
			throws Exception{
		
		
		model.addAttribute("result", "");
		return "forward:/fox/bsh/retrieveBsshInfoList.fo";
	}
	
}