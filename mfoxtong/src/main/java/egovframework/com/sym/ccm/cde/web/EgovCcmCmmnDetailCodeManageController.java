package egovframework.com.sym.ccm.cde.web;

import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.util.SystemOutLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.sym.ccm.cde.service.CmmnDetailCodeVO;
import egovframework.com.sym.ccm.cde.service.EgovCcmCmmnDetailCodeManageService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
*
* 공통상세코드에 관한 요청을 받아 서비스 클래스로 요청을 전달하고 서비스클래스에서 처리한 결과를 웹 화면으로 전달을 위한 Controller를 정의한다
* @author 공통서비스 개발팀 이중호
* @since 2009.04.01
* @version 1.0
* @see
*
* <pre>
* << 개정이력(Modification Information) >>
*
*   수정일      수정자           수정내용
*  -------    --------    ---------------------------
*   2009.04.01  이중호       최초 생성
*   2011.08.26	정진오	IncludedInfo annotation 추가
*   2017.08.08	이정은	표준프레임워크 v3.7 개선
*
* </pre>
*/

@Controller
public class EgovCcmCmmnDetailCodeManageController {

	@Resource(name = "CmmnDetailCodeManageService")
   private EgovCcmCmmnDetailCodeManageService cmmnDetailCodeManageService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	@Autowired
	private DefaultBeanValidator beanValidator;
	
	   /**
		 * 공통상세코드 목록을 조회한다.
	     * @param loginVO
	     * @param searchVO
	     * @param model
	     * @return "egovframework/com/sym/ccm/cde/EgovCcmCmmnDetailCodeList"
	     * @throws Exception
	     */
		@IncludedInfo(name="공통상세코드", listUrl="/sym/ccm/cde/SelectCcmCmmnDetailCodeList.do", order = 970 ,gid = 60)
	    @RequestMapping(value="/sym/ccm/cde/SelectCcmCmmnDetailCodeList.do")
		public String selectCmmnDetailCodeList (@ModelAttribute("loginVO") LoginVO loginVO, @ModelAttribute("searchVO") CmmnDetailCodeVO searchVO
				, ModelMap model
				) throws Exception {
			
	    	/** EgovPropertyService.sample */
	    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
	    	searchVO.setPageSize(propertiesService.getInt("pageSize"));

	    	/** pageing */
	    	PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
			paginationInfo.setPageSize(searchVO.getPageSize());

			searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
			searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	        List<?> CmmnCodeList = cmmnDetailCodeManageService.selectCmmnDetailCodeList(searchVO);
	        model.addAttribute("resultList", CmmnCodeList);

	        int totCnt = cmmnDetailCodeManageService.selectCmmnDetailCodeListTotCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt);
	        model.addAttribute("paginationInfo", paginationInfo);

	        return "egovframework/com/sym/ccm/cde/EgovCcmCmmnDetailCodeList";
		}
		
		/**
		 * 공통상세코드 상세항목을 조회한다.
		 * @param loginVO
		 * @param cmmnDetailCodeVO
		 * @param model
		 * @return "egovframework/com/sym/ccm/cde/EgovCcmCmmnDetailCodeDetail"
		 * @throws Exception
		 */
		@RequestMapping(value="/sym/ccm/cde/SelectCcmCmmnDetailCodeDetail.do")
	 	public String selectCmmnDetailCodeDetail (@ModelAttribute("loginVO") LoginVO loginVO
	 			, CmmnDetailCodeVO cmmnDetailCodeVO,	ModelMap model
	 			)	throws Exception {
	    	CmmnDetailCode vo = cmmnDetailCodeManageService.selectCmmnDetailCodeDetail(cmmnDetailCodeVO);
			model.addAttribute("result", vo);

			return "egovframework/com/sym/ccm/cde/EgovCcmCmmnDetailCodeDetail";
		}
		
}
