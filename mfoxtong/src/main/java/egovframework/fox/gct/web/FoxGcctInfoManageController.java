package egovframework.fox.gct.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.LoginVO;
import egovframework.fox.gct.service.FoxGcctInfoDefaultVO;
import egovframework.fox.gct.service.FoxGcctInfoManageService;
import egovframework.fox.gct.service.FoxGcctInfoVO;

/**
 * 상품권 업체 정보를 관리하는 기능 
 * @author 
 * @since 2009.04.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2022.02.08  kdg         최초 생성
 *
 * </pre>
 */

@Controller
public class FoxGcctInfoManageController {

	@Resource(name = "foxGcctInfoManageService")
	private FoxGcctInfoManageService foxGcctInfoManageService;
	
	/**
	 * 상품권 조회 목록  
	 * @param 
	 * @return 상품권 조회 목록   
	 * @throws Exception   
	 */
	@RequestMapping("/fox/gct/retrieveGcctInfoList.fo")
	public String retrieveGcctInfoList(@ModelAttribute("foxGcctInfoDefaultVO") FoxGcctInfoDefaultVO foxGcctInfoDefaultVO, HttpServletRequest request, Model model) 
			throws Exception{
		
		// 세션에서 사용자 정보 가져오기 
		LoginVO logVO = (LoginVO) request.getSession().getAttribute("loginVO");		
		
		//세션 사용자 정보를 logvo에 담아 화면단으로 넘긴다.
		model.addAttribute("logvo", logVO);			
		//서비스의 상품권리스트 정보를 result 에 담는다.
		model.addAttribute("result", foxGcctInfoManageService.retrieveGcctInfoList(foxGcctInfoDefaultVO));
		
		//logvo, result 에 담은 정보를 FoxRetrieveGcctInfoList.jsp 로 넘겨준다.
		return "egovframework/fox/gct/FoxRetrieveGcctInfoList";
	}
	
	/**
	 * 상품권 상세조회 
	 * @param 상품권 정보 키값 
	 * @return 상품권정보   
	 * @throws Exception   
	 */
	@RequestMapping("/fox/gct/retrieveGcctInfo.fo")
	public String retrieveGcctInfo(@ModelAttribute("foxGcctInfoVO") FoxGcctInfoVO foxGcctInfoVO, Model model  ) 
			throws Exception{		
		
		//한건받음
		FoxGcctInfoVO result = foxGcctInfoManageService.retrieveGcctInfo(foxGcctInfoVO);
		
		//result 를 화면단으로 보냄
		model.addAttribute("result", result);
		return "egovframework/fox/gct/FoxRetrieveGcctInfo";
	}
	
	/**
	 * 상품권등록화면  
	 * @param  
	 * @return 상품권 등록 정보   
	 * @throws Exception   
	 */
	@RequestMapping("/fox/gct/createGcctInfoView.fo")
	public String createGcctInfoView(@ModelAttribute("foxGcctInfoVO") FoxGcctInfoVO foxGcctInfoVO, Model model  ) 
			throws Exception{
		
		return "egovframework/fox/gct/FoxCreateGcctInfoView";
	}
	
	/**
	 * 상품권등록  
	 * @param  
	 * @return 상품권 등록 결과   
	 * @throws Exception   
	 */
	@RequestMapping("/fox/gct/createGcctInfo.fo")
	public String createGcctInfo(@ModelAttribute("foxGcctInfoVO") FoxGcctInfoVO foxGcctInfoVO, Model model  ) 
			throws Exception{
		
		foxGcctInfoManageService.createGcctInfo(foxGcctInfoVO);
		
		return "forward:/fox/gct/retrieveGcctInfoList.fo";	
	}
	
	/**
	 * 상품권수정화면  
	 * @param  
	 * @return 상품권 등록 결과   
	 * @throws Exception   
	 */
	@RequestMapping("/fox/gct/updateGcctInfoView.fo")
	public String updateGcctInfoView(@ModelAttribute("foxGcctInfoVO") FoxGcctInfoVO foxGcctInfoVO, Model model  ) 
			throws Exception{
		
		//한건받음
		FoxGcctInfoVO result = foxGcctInfoManageService.retrieveGcctInfo(foxGcctInfoVO);
		
		//result 를 화면단으로 보냄
		model.addAttribute("result", result);
		
		return "egovframework/fox/gct/FoxUpdateGcctInfoView";	
	}
	
	/**
	 * 상품권수정 
	 * @param  
	 * @return 상품권 등록 결과   
	 * @throws Exception   
	 */
	@RequestMapping("/fox/gct/updateGcctInfo.fo")
	public String updateGcctInfo(@ModelAttribute("foxGcctInfoVO") FoxGcctInfoVO foxGcctInfoVO, Model model  ) 
			throws Exception{
		
		
		foxGcctInfoManageService.updateGcctInfo(foxGcctInfoVO);
		
		return "forward:/fox/gct/retrieveGcctInfoList.fo";	
	}
	
	/**
	 * 상품권 삭제 
	 * @param  
	 * @return 상품권 삭제 결과   
	 * @throws Exception   
	 */
	@RequestMapping("/fox/gct/deleteGcctInfo.fo")
	public String deleteGcctInfo(@ModelAttribute("foxGcctInfoVO") FoxGcctInfoVO foxGcctInfoVO, HttpServletRequest request, Model model  ) 
			throws Exception{		
		

		//상품등록 삭제 서비스는 void 형이므로 리턴 불필요
	   foxGcctInfoManageService.deleteGcctInfo(foxGcctInfoVO);
				
		
		return "forward:/fox/gct/retrieveGcctInfoList.fo";	
	}
	
	/**
	 * 사용자 상품권 등록  
	 * @param 상품권 정보 키값 
	 * @return 사용상품권정보   
	 * @throws Exception   
	 */
	@RequestMapping("/fox/gct/createEmplyrGcctInfo.fo")
	public String createEmplyrGcctInfo(@ModelAttribute("foxGcctInfoVO") FoxGcctInfoVO foxGcctInfoVO, Model model  ) 
			throws Exception{
		
		foxGcctInfoManageService.createEmplyrGcctInfo(foxGcctInfoVO);		
		
		return "forward:/fox/gct/retrieveGcctInfoList.fo";	
	}
	
	/**
	 * 사용자 상품권 삭제  
	 * @param 상품권 정보 키값 
	 * @return 사용상품권정보   
	 * @throws Exception   
	 */
	@RequestMapping("/fox/gct/deleteEmplyrGcctInfo.fo")
	public String deleteEmplyrGcctInfo(@ModelAttribute("foxGcctInfoVO") FoxGcctInfoVO foxGcctInfoVO, Model model  ) 
			throws Exception{
		
		foxGcctInfoManageService.createEmplyrGcctInfo(foxGcctInfoVO);		
		
		return "forward:/fox/gct/retrieveGcctInfoList.fo";	
	}
	
	/**
	 * 상품권 조회 목록  
	 * @param 
	 * @return 상품권 조회 목록   
	 * @throws Exception   
	 */
	@RequestMapping("/fox/gct/retrieveGcctInfoList_new.fo")
	public String retrieveGcctInfoList_new(@ModelAttribute("foxGcctInfoDefaultVO") FoxGcctInfoDefaultVO foxGcctInfoDefaultVO, HttpServletRequest request, Model model) 
			throws Exception{
		
		// 세션에서 사용자 정보 가져오기 
		LoginVO logVO = (LoginVO) request.getSession().getAttribute("loginVO");		
		
		//세션 사용자 정보를 logvo에 담아 화면단으로 넘긴다.
		model.addAttribute("logvo", logVO);			
		//서비스의 상품권리스트 정보를 result 에 담는다.
		model.addAttribute("result", foxGcctInfoManageService.retrieveGcctInfoList_new(foxGcctInfoDefaultVO));
		
		//logvo, result 에 담은 정보를 FoxRetrieveGcctInfoList.jsp 로 넘겨준다.
		return "egovframework/fox/gct/FoxRetrieveGcctInfoList_new";
	}
	
	/**
	 * 상품권 상세조회 
	 * @param 상품권 정보 키값 
	 * @return 상품권정보   
	 * @throws Exception   
	 */
	@RequestMapping("/fox/gct/retrieveGcctInfo_new.fo")
	public String retrieveGcctInfo_new(@ModelAttribute("foxGcctInfoVO") FoxGcctInfoVO foxGcctInfoVO, HttpServletRequest request, Model model  ) 
			throws Exception{			
		
		foxGcctInfoManageService.updatelatlongGcctInfo(foxGcctInfoVO);
				
		return "forward:/fox/gct/retrieveGcctInfoList_new.fo";
	}
	
		
	
}
	
	
	
	
	
	
	
	
	