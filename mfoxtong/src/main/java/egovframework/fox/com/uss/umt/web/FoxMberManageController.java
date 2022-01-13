package egovframework.fox.com.uss.umt.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.uss.umt.service.UserDefaultVO;
import egovframework.fox.com.uss.umt.service.FoxMberManageService;
import egovframework.fox.com.uss.umt.service.FoxMberManageVO;
import egovframework.fox.com.uss.umt.service.FoxUserDefaultVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 일반회원관련 요청을  비지니스 클래스로 전달하고 처리된결과를  해당   웹 화면으로 전달하는  Controller를 정의한다
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
 *   2009.04.10  조재영          최초 생성
 *   2011.8.26	정진오			IncludedInfo annotation 추가
 *
 * </pre>
 */

@Controller
public class FoxMberManageController {

	/** mberManageService */
	@Resource(name = "foxMberManageService")
	private FoxMberManageService foxMberManageService;

	/** cmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** DefaultBeanValidator beanValidator */
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	
	/**
	 * 약관동의 화면으로 이동 
	 * @param userSearchVO 검색조건정보
	 * @param foxMberManageVO 일반회원초기화정보
	 * @param model 화면모델
	 * @return uss/umt/FoxMberInsert
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/foxStplatAgre.fo")
	public String stplatAgreView(@ModelAttribute("foxMberManageVO") FoxMberManageVO foxMberManageVO, Model model)
			throws Exception {
		
		model.addAttribute("foxMberManageVO", foxMberManageVO); // 전화면의 데이터를넘겨준다
		return "egovframework/fox/com/uss/umt/FoxstplatAgre";
		
	}
	
	/**
	 * 약관동의 후 sms 인증 화면으로 이동
	 * @param userSearchVO 검색조건정보
	 * @param foxMberManageVO 일반회원초기화정보
	 * @param model 화면모델
	 * @return uss/umt/FoxMberInsert
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/smsCertView.fo")
	public String smsCertView(@ModelAttribute("foxMberManageVO") FoxMberManageVO foxMberManageVO, Model model)
			throws Exception {
		FoxMberManageVO vo = new FoxMberManageVO();
		vo.setUseStplatAgreAt(foxMberManageVO.getUseStplatAgreAt());
		vo.setIndvdlinfoColctAgreAt(foxMberManageVO.getIndvdlinfoColctAgreAt());
		vo.setMarktRecptnAgreAt(foxMberManageVO.getMarktRecptnAgreAt());
		vo.setLcinfoUseAgreAt(foxMberManageVO.getLcinfoUseAgreAt());
		
		model.addAttribute("foxMberManageVO", vo); // 전화면의 데이터를넘겨준다
		return "egovframework/fox/com/uss/umt/FoxSMSCert";
		
	}


	/**
	 * 일반회원등록화면으로 이동한다.
	 * @param userSearchVO 검색조건정보
	 * @param foxMberManageVO 일반회원초기화정보
	 * @param model 화면모델
	 * @return uss/umt/FoxMberInsert
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/foxMberInsertView.fo")
	public String insertMberView(@ModelAttribute("foxMberManageVO") FoxMberManageVO foxMberManageVO, Model model)
			throws Exception {
		
		// 전화번호에 대한 인증을 다시한번 수행 :to-do
		
		FoxMberManageVO vo = new FoxMberManageVO();
		vo.setUseStplatAgreAt(foxMberManageVO.getUseStplatAgreAt());
		vo.setIndvdlinfoColctAgreAt(foxMberManageVO.getIndvdlinfoColctAgreAt());
		vo.setMarktRecptnAgreAt(foxMberManageVO.getMarktRecptnAgreAt());
		vo.setLcinfoUseAgreAt(foxMberManageVO.getLcinfoUseAgreAt());
		vo.setMoblphonNo(foxMberManageVO.getMoblphonNo());
		vo.setUserCertNum(foxMberManageVO.getUserCertNum());
		

		model.addAttribute("foxMberManageVO", vo); // 전화면의 데이터를넘겨준다
		return "egovframework/fox/com/uss/umt/FoxMberInsert";
		
	}

	/**
	 * 일반회원등록 처리
	 * @param foxMberManageVO 일반회원등록정보
	 * @param bindingResult 입력값검증용 bindingResult
	 * @param model 화면모델
	 * @return forward:/uss/umt/FoxMberManage.fo
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/foxMberInsert.fo")
	public String insertMber(@ModelAttribute("foxMberManageVO") FoxMberManageVO foxMberManageVO, BindingResult bindingResult, Model model) throws Exception {
		
		FoxMberManageVO vo = new FoxMberManageVO();
		vo.setUseStplatAgreAt(foxMberManageVO.getUseStplatAgreAt());
		vo.setIndvdlinfoColctAgreAt(foxMberManageVO.getIndvdlinfoColctAgreAt());
		vo.setMarktRecptnAgreAt(foxMberManageVO.getMarktRecptnAgreAt());
		vo.setLcinfoUseAgreAt(foxMberManageVO.getLcinfoUseAgreAt());
		vo.setMoblphonNo(foxMberManageVO.getMoblphonNo());
		vo.setMberEmailAdres(foxMberManageVO.getMberEmailAdres());
		vo.setNcnm(foxMberManageVO.getNcnm());
		
		// 가입구분
		vo.setSbscrbSe("01");
		vo.setMberSe("01");

//		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if (isAuthenticated) {
//			return "egovDevIndex";
//		}

//		beanValidator.validate(foxMberManageVO, bindingResult); 최종 확인 필요  
//		if (bindingResult.hasErrors()) {
//			return "egovframework/com/uss/umt/FoxMberInsert";
//		} else {
//			if (foxMberManageVO.getGroupId().equals("")) {
//				foxMberManageVO.setGroupId(null);
//			}
//			mberManageService.insertMber(foxMberManageVO);
//			//Exception 없이 진행시 등록 성공메시지
//			model.addAttribute("resultMsg", "success.common.insert");
//		}
		
		foxMberManageService.insertMber(foxMberManageVO);
		
		
		return "forward:/FoxMobileMain.fo";
	}
	

	/**
	 * 일반회원목록을 조회한다. (pageing)
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return uss/umt/FoxMberManage
	 * @throws Exception
	 */
	@IncludedInfo(name = "일반회원관리", order = 470, gid = 50)
	@RequestMapping(value = "/uss/umt/FoxMberManage.fo")
	public String selectMberList(@ModelAttribute("userSearchVO") FoxUserDefaultVO foxUserSearchVO, ModelMap model) throws Exception {

		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (isAuthenticated) {
			return "egovDevIndex";
		}

		/** EgovPropertyService.sample */
		foxUserSearchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		foxUserSearchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(foxUserSearchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(foxUserSearchVO.getPageUnit());
		paginationInfo.setPageSize(foxUserSearchVO.getPageSize());

		foxUserSearchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		foxUserSearchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		foxUserSearchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> mberList = foxMberManageService.selectMberList(foxUserSearchVO);
		model.addAttribute("resultList", mberList);

		int totCnt = foxMberManageService.selectMberListTotCnt(foxUserSearchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		//일반회원 상태코드를 코드정보로부터 조회
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		vo.setCodeId("COM013");
		List<?> mberSttus_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("entrprsMberSttus_result", mberSttus_result);//기업회원상태코드목록

		return "egovframework/com/uss/umt/FoxMberManage";
	}

	/**
	 * 일반회원정보 수정을 위해 일반회원정보를 상세조회한다.
	 * @param mberId 상세조회대상 일반회원아이디
	 * @param userSearchVO 검색조건
	 * @param model 화면모델
	 * @return uss/umt/FoxMberSelectUpdt
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/foxMberSelectUpdtView.fo")
	public String updateMberView(@RequestParam("mberEmailAdres") String mberEmailAdres, @ModelAttribute("searchVO") UserDefaultVO userSearchVO, Model model) throws Exception {

//		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if (isAuthenticated) {
//			
//			return "forward:/uat/uia/egovLoginUsr.fo";
////			return "egovDevIndex";
//		}

		ComDefaultCodeVO vo = new ComDefaultCodeVO();

//		//패스워드힌트목록을 코드정보로부터 조회
//		vo.setCodeId("COM022");
//		List<?> passwordHint_result = cmmUseService.selectCmmCodeDetail(vo);
//
//		//성별구분코드를 코드정보로부터 조회
//		vo.setCodeId("COM014");
//		List<?> sexdstnCode_result = cmmUseService.selectCmmCodeDetail(vo);
//
//		//사용자상태코드를 코드정보로부터 조회
//		vo.setCodeId("COM013");
//		List<?> mberSttus_result = cmmUseService.selectCmmCodeDetail(vo);
//
//		//그룹정보를 조회 - GROUP_ID정보
//		vo.setTableNm("COMTNORGNZTINFO");
//		List<?> groupId_result = cmmUseService.selectGroupIdDetail(vo);

//		model.addAttribute("passwordHint_result", passwordHint_result); //패스워트힌트목록
//		model.addAttribute("sexdstnCode_result", sexdstnCode_result); //성별구분코드목록
//		model.addAttribute("mberSttus_result", mberSttus_result); //사용자상태코드목록
//		model.addAttribute("groupId_result", groupId_result); //그룹정보 목록
		
		//session.setAttribute("loginVO", loginVO);
//		String mberId  = HttpSession
		
				

		FoxMberManageVO foxMberManageVO = foxMberManageService.selectMber(mberEmailAdres);
		
		model.addAttribute("foxMberManageVO", foxMberManageVO);
//		model.addAttribute("userSearchVO", userSearchVO);

		return "egovframework/fox/com/uss/umt/FoxMberSelectUpdtView"; //FoxMberSelectUpdt
	}

	/**
	 * 일반회원정보 수정후 목록조회 화면으로 이동한다.
	 * @param foxMberManageVO 일반회원수정정보
	 * @param bindingResult 입력값검증용 bindingResult
	 * @param model 화면모델
	 * @return forward:/uss/umt/foxMberManage.fo
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/foxMberSelectUpdt.fo")
	public String updateMber(@ModelAttribute("foxMberManageVO") FoxMberManageVO foxMberManageVO, BindingResult bindingResult, Model model) throws Exception {

		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if (isAuthenticated) {
//			return "egovDevIndex";
//		}

//		beanValidator.validate(foxMberManageVO, bindingResult);
//		if (bindingResult.hasErrors()) {
//			return "egovframework/com/uss/umt/FoxEntrprsMberSelectUpdt";
//		} else {
//			if (foxMberManageVO.getGroupId().equals("")) {
//				foxMberManageVO.setGroupId(null);
//			}
			
			foxMberManageService.updateMber(foxMberManageVO);
			
//			//Exception 없이 진행시 수정성공메시지
//			model.addAttribute("resultMsg", "success.common.update");
			
			return "forward:/FoxMobileMain.fo";
//		}
	}

	/**
	 * 일반회원정보삭제후 목록조회 화면으로 이동한다.
	 * @param checkedIdForDel 삭제대상 아이디 정보
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return forward:/uss/umt/foxMberManage.fo
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/foxMberDelete.fo")
	public String deleteMber(@RequestParam("mberEmailAdres") String mberEmailAdres,@ModelAttribute("foxMberManageVO") FoxMberManageVO foxMberManageVO, Model model) throws Exception {

		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if (isAuthenticated) {
//			return "egovDevIndex";
//		}

//		foxMberManageService.deleteMber(checkedIdForDel);
		//Exception 없이 진행시 삭제성공메시지
		
		
		foxMberManageService.deleteMber(mberEmailAdres);
		
		
		//model.addAttribute("resultMsg", "success.common.delete");
		return "forward:/FoxMobileMain.fo";
	}

	/**
	 * 일반회원가입신청 등록화면으로 이동한다.
	 * @param userSearchVO 검색조건
	 * @param foxMberManageVO 일반회원가입신청정보
	 * @param commandMap 파라메터전달용 commandMap
	 * @param model 화면모델
	 * @return uss/umt/FoxMberSbscrb
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/foxMberSbscrbView.fo")
	public String sbscrbMberView(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO, @ModelAttribute("foxMberManageVO") FoxMberManageVO foxMberManageVO,
			@RequestParam Map<String, Object> commandMap, Model model) throws Exception {

		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (isAuthenticated) {
			return "egovDevIndex";
		}

		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//패스워드힌트목록을 코드정보로부터 조회
		vo.setCodeId("COM022");
		List<?> passwordHint_result = cmmUseService.selectCmmCodeDetail(vo);
		//성별구분코드를 코드정보로부터 조회
		vo.setCodeId("COM014");
		List<?> sexdstnCode_result = cmmUseService.selectCmmCodeDetail(vo);

		model.addAttribute("passwordHint_result", passwordHint_result); //패스워트힌트목록
		model.addAttribute("sexdstnCode_result", sexdstnCode_result); //성별구분코드목록
		if (!"".equals(commandMap.get("realname"))) {
			model.addAttribute("mberNm", commandMap.get("realname")); //실명인증된 이름 - 주민번호 인증
			model.addAttribute("ihidnum", commandMap.get("ihidnum")); //실명인증된 주민등록번호 - 주민번호 인증
		}
		if (!"".equals(commandMap.get("realName"))) {
			model.addAttribute("mberNm", commandMap.get("realName")); //실명인증된 이름 - ipin인증
		}

		//foxMberManageVO.setGroupId("DEFAULT");
		foxMberManageVO.setMberSttus("DEFAULT");

		return "egovframework/com/uss/umt/FoxMberSbscrb";
	}

	/**
	 * 일반회원가입신청등록처리후로그인화면으로 이동한다.
	 * @param foxMberManageVO 일반회원가입신청정보
	 * @return forward:/uat/uia/FoxLoginUsr.fo
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/foxMberSbscrb.fo")
	public String sbscrbMber(@ModelAttribute("foxMberManageVO") FoxMberManageVO foxMberManageVO) throws Exception {

		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (isAuthenticated) {
			return "egovDevIndex";
		}

		//가입상태 초기화
		foxMberManageVO.setMberSttus("A");
		//그룹정보 초기화
		//foxMberManageVO.setGroupId("1");
		//일반회원가입신청 등록시 일반회원등록기능을 사용하여 등록한다.
//		mberManageService.insertMber(foxMberManageVO);
		return "forward:/uat/uia/foxLoginUsr.fo";
	}

	/**
	 * 일반회원 약관확인
	 * @param model 화면모델
	 * @return uss/umt/FoxStplatCnfirm
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/foxStplatCnfirmMber.fo")
	public String sbscrbEntrprsMber(Model model) throws Exception {

		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (isAuthenticated) {
			return "egovDevIndex";
		}

		//일반회원용 약관 아이디 설정
		String stplatId = "STPLAT_0000000000001";
		//회원가입유형 설정-일반회원
		String sbscrbTy = "USR01";
		//약관정보 조회
		List<?> stplatList = foxMberManageService.selectStplat(stplatId);
		model.addAttribute("stplatList", stplatList); //약관정보 포함
		model.addAttribute("sbscrbTy", sbscrbTy); //회원가입유형 포함

		return "egovframework/com/uss/umt/FoxStplatCnfirm";
	}

	/**
	 * @param model 화면모델
	 * @param commandMap 파라메터전달용 commandMap
	 * @param userSearchVO 검색조건
	 * @param foxMberManageVO 일반회원수정정보(비밀번호)
	 * @return uss/umt/FoxMberPasswordUpdt
	 * @throws Exception
	 */
	@RequestMapping(value = "/uss/umt/foxMberPasswordUpdt.fo")
	public String updatePassword(ModelMap model, @RequestParam Map<String, Object> commandMap, @ModelAttribute("searchVO") UserDefaultVO userSearchVO,
			@ModelAttribute("foxMberManageVO") FoxMberManageVO foxMberManageVO) throws Exception {

		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (isAuthenticated) {
			return "egovDevIndex";
		}

		String oldPassword = (String) commandMap.get("oldPassword");
		String newPassword = (String) commandMap.get("newPassword");
		String newPassword2 = (String) commandMap.get("newPassword2");
		String uniqId = (String) commandMap.get("uniqId");

		boolean isCorrectPassword = false;
		FoxMberManageVO resultVO = new FoxMberManageVO();
		foxMberManageVO.setPassword(newPassword);
//		foxMberManageVO.setOldPassword(oldPassword);
//		foxMberManageVO.setUniqId(uniqId);

		String resultMsg = "";
//		resultVO = mberManageService.selectPassword(foxMberManageVO);
		//패스워드 암호화
//		String encryptPass = EgovFileScrty.encryptPassword(oldPassword, foxMberManageVO.getMberId());
//		if (encryptPass.equals(resultVO.getPassword())) {
//			if (newPassword.equals(newPassword2)) {
//				isCorrectPassword = true;
//			} else {
//				isCorrectPassword = false;
//				resultMsg = "fail.user.passwordUpdate2";
//			}
//		} else {
//			isCorrectPassword = false;
//			resultMsg = "fail.user.passwordUpdate1";
//		}
//
//		if (isCorrectPassword) {
//			foxMberManageVO.setPassword(EgovFileScrty.encryptPassword(newPassword, foxMberManageVO.getMberId()));
//			mberManageService.updatePassword(foxMberManageVO);
//			model.addAttribute("foxMberManageVO", foxMberManageVO);
//			resultMsg = "success.common.update";
//		} else {
//			model.addAttribute("foxMberManageVO", foxMberManageVO);
//		}
//		model.addAttribute("userSearchVO", userSearchVO);
//		model.addAttribute("resultMsg", resultMsg);

		return "egovframework/com/uss/umt/FoxMberPasswordUpdt";
	}

	/**
	 * 일반회원 암호 수정 화면 이동
	 * @param model 화면모델
	 * @param commandMap 파라메터전달용 commandMap
	 * @param userSearchVO 검색조건
	 * @param foxMberManageVO 일반회원수정정보(비밀번호)
	 * @return uss/umt/FoxMberPasswordUpdt
	 * @throws Exception
	 */
	@RequestMapping(value = "/uss/umt/foxMberPasswordUpdtView.fo")
	public String updatePasswordView(ModelMap model, @RequestParam Map<String, Object> commandMap, @ModelAttribute("searchVO") UserDefaultVO userSearchVO,
			@ModelAttribute("foxMberManageVO") FoxMberManageVO foxMberManageVO) throws Exception {

		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (isAuthenticated) {
			return "egovDevIndex";
		}

		String userTyForPassword = (String) commandMap.get("userTyForPassword");
//		foxMberManageVO.setUserTy(userTyForPassword);

		model.addAttribute("userSearchVO", userSearchVO);
		model.addAttribute("foxMberManageVO", foxMberManageVO);
		return "egovframework/com/uss/umt/FoxMberPasswordUpdt";
	}

}