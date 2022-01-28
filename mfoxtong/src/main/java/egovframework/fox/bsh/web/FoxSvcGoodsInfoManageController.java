package egovframework.fox.bsh.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.LoginVO;
import egovframework.com.sym.ccm.cde.service.CmmnDetailCodeVO;
import egovframework.com.sym.ccm.cde.service.EgovCcmCmmnDetailCodeManageService;
import egovframework.fox.bsh.service.FoxBsshInfoManageVO;
import egovframework.fox.bsh.service.FoxSvcGoodsInfoDefaultVO;
import egovframework.fox.bsh.service.FoxSvcGoodsInfoManageService;
import egovframework.fox.bsh.service.FoxSvcGoodsInfoVO;


/**
 * 업소의 서비스상 정보를 관리하는 기능 
 * @author 정수석 
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
public class FoxSvcGoodsInfoManageController {
	
	
	/** FoxBsshInfoManageService */
	@Resource(name = "foxSvcGoodsInfoManageService")
	private FoxSvcGoodsInfoManageService foxSvcGoodsInfoManageService;
	
	@Resource(name = "CmmnDetailCodeManageService")
    private EgovCcmCmmnDetailCodeManageService cmmnDetailCodeManageService;
	
	
	/**
	 * 서비스상품정보 등록 화면 
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return 등록결과
	 * @throws Exception   
	 */
	@RequestMapping("/fox/bsh/createSvcGoodsInfoView.fo")
	public String createSvcGoodsInfoView(@ModelAttribute("foxBsshInfoManageVO") FoxBsshInfoManageVO foxBsshInfoManageVO
										,@ModelAttribute("foxSvcGoodsInfVO") FoxSvcGoodsInfoVO foxSvcGoodsInfoVO, HttpServletRequest request, Model model) throws Exception{
		
		
		// 세션에서 사용자 정보 가져오기 
		LoginVO logVO = (LoginVO) request.getSession().getAttribute("loginVO");
		foxSvcGoodsInfoVO.setEsntlId(logVO.getUniqId());						// 사용자 고유 아이디 
		foxSvcGoodsInfoVO.setBsshEsntlId(foxBsshInfoManageVO.getBsshEsntlId()); // 업소 고유 아이디 : 세션에 넣어서관리하는 것으로 수정 하자  
		
		
		model.addAttribute("vo", foxBsshInfoManageVO);
		return "egovframework/fox/bsh/FoxCreateSvcGoodsInfoView";
			
	}
	
	/**
	 * 서비스상품정보 등록
	 * 서비스 등록 후 조회하여 화면에 출력   
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return 등록결과
	 * @throws Exception   
	 */
	@RequestMapping("/fox/bsh/createSvcGoodsInfo.fo")
	public String createSvcGoodsInfo(@ModelAttribute("foxBsshInfoManageVO") FoxBsshInfoManageVO foxBsshInfoManageVO,
									 @ModelAttribute("foxSvcGoodsInfVO") FoxSvcGoodsInfoVO foxSvcGoodsInfoVO, Model model) throws Exception{
		
		// 서비스 생성 
		foxSvcGoodsInfoManageService.createSvcGoodsInfo(foxSvcGoodsInfoVO);
		
		// 서비스 목록 조회 
		FoxSvcGoodsInfoDefaultVO foxSvcGoodsInfoDefaultVO = (FoxSvcGoodsInfoDefaultVO) foxSvcGoodsInfoVO;
		List<FoxSvcGoodsInfoVO> svcGoodsInfoList = foxSvcGoodsInfoManageService.retrieveSvcGoodsInfoList(foxSvcGoodsInfoDefaultVO);
		
		
		// FoxSvcGoodsInfoDefaultVO
		// 성공메시지 출력
		model.addAttribute("vo", foxBsshInfoManageVO);
		model.addAttribute("svcGoodsInfoList", svcGoodsInfoList);
		return "forward:/fox/bsh/updateSvcGoodsInfoView.fo"; // 조회/수정화면으로 변경 필요 
			
	}
	
	/**
	 * 서비스상품정보 수정 화면
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return foxSvcGoodsInfVO
	 * @throws Exception   
	 */
	@RequestMapping("/fox/bsh/updateSvcGoodsInfoView.fo")
	public String updateSvcGoodsInfoView(	@ModelAttribute("foxBsshInfoManageVO") FoxBsshInfoManageVO foxBsshInfoManageVO,
			 								@ModelAttribute("foxSvcGoodsInfVO") FoxSvcGoodsInfoVO foxSvcGoodsInfoVO, Model model) throws Exception{
		
	    //------------------------------
	    // 업체카테고리 정보 조회 (공통코드) 
	    //------------------------------
	    CmmnDetailCodeVO cvo = new CmmnDetailCodeVO();
	    cvo.setCodeId("FOX001"); // 
	    List<CmmnDetailCodeVO> codeList = (List<CmmnDetailCodeVO>) cmmnDetailCodeManageService.selectCmmnDetailCodeList(cvo);
		
		// 서비스 목록 조회 
//		FoxSvcGoodsInfoDefaultVO foxSvcGoodsInfoDefaultVO = (FoxSvcGoodsInfoDefaultVO) foxSvcGoodsInfoVO;
		List<FoxSvcGoodsInfoVO> svcGoodsInfoList = foxSvcGoodsInfoManageService.retrieveSvcGoodsInfoList(foxSvcGoodsInfoVO);
		
		// 성공메시지 출력
		model.addAttribute("resultCodeList", codeList);
		model.addAttribute("vo", foxBsshInfoManageVO);
		model.addAttribute("svcGoodsInfoList", svcGoodsInfoList);
		
		return "egovframework/fox/bsh/FoxUpdateSvcGoodsInfoView"; // 조회/수정화면으로 변경 필요 
			
	}
	

	/**
	 * 서비스상품정보 조회
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return foxSvcGoodsInfVO
	 * @throws Exception   
	 */
	@RequestMapping("/fox/bsh/retrieveSvcGoodsInfo.fo")
	public String retrieveSvcGoodsInfo(FoxSvcGoodsInfoVO foxSvcGoodsInfoVO) throws Exception{
		
		// 서비스 목록 조회 
		FoxSvcGoodsInfoDefaultVO foxSvcGoodsInfoDefaultVO = (FoxSvcGoodsInfoDefaultVO) foxSvcGoodsInfoVO;
		List<FoxSvcGoodsInfoVO> svcGoodsInfoList = foxSvcGoodsInfoManageService.retrieveSvcGoodsInfoList(foxSvcGoodsInfoDefaultVO);
		
		
		foxSvcGoodsInfoManageService.retrieveSvcGoodsInfo(foxSvcGoodsInfoVO);
		
		return "egovframework/fox/bsh/FoxRetrieveSvcGoodsInfo"; // 조회 화면으로 변경 필요 
			
	}
	
	
	/**
	 * 서비스상품정보 수정 
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return foxSvcGoodsInfVO
	 * @throws Exception   
	 */
	@RequestMapping("/fox/bsh/updateSvcGoodsInfo.fo")
	public String updateSvcGoodsInfo() throws Exception{
		
		
		// 성공메시지 출력
		return "egovframework/fox/bsh/FoxUpdateSvcGoodsInfoView"; // 조회/수정화면으로 변경 필요 
			
	}
	

	/**
	 * 서비스상품정보 삭제  (수정) 
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return foxSvcGoodsInfVO
	 * @throws Exception   
	 */
	@RequestMapping("/fox/bsh/deleteSvcGoodsInfo.fo")
	public String deleteSvcGoodsInfo() throws Exception{
		
		// 조회 먼저 수행
		
		// 성공메시지 출력
		return "egovframework/fox/bsh/FoxUpdateSvcGoodsInfoView"; // 조회/수정화면으로 변경 필요 
			
	}
	

	/**
	 * 서비스상품정보 목록 조회 (화면 미사용) 
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return foxSvcGoodsInfVO
	 * @throws Exception   
	 */
	@RequestMapping("/fox/bsh/retrieveSvcGoodsInfoList.fo")
	public String retrieveSvcGoodsInfoList(FoxSvcGoodsInfoDefaultVO foxSvcGoodsInfoDefaultVO) throws Exception{
		
		foxSvcGoodsInfoManageService.retrieveSvcGoodsInfo(foxSvcGoodsInfoDefaultVO);
		
		return "egovframework/fox/bsh/FoxRetrieveSvcGoodsInfoList"; // 조회/수정화면으로 변경 필요 
			
	}

}
