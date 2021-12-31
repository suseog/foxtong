package egovframework.fox.com.uss.sam.stp.web;

import java.net.URLDecoder;
import java.util.List;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.uss.sam.stp.service.EgovStplatManageService;
import egovframework.com.uss.sam.stp.service.StplatManageDefaultVO;
import egovframework.com.uss.sam.stp.service.StplatManageVO;
import egovframework.mbl.com.cmm.annotation.IncludedMblInfo;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * 약관내용을 처리하는 비즈니스 구현 클래스
 * 
 * @author 공통서비스 개발팀 박정규
 * @since 2009.04.01
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.01  박정규          최초 생성
 *
 *      </pre>
 */
@Controller
public class FoxStplatManageController {
	
	
	  /**
     * json데이터를 호출하기 위한 페이지를 호출한다.
     * @param commandMap
     * @param model
     * @return
     *         "/uss/olh/omm/EgovOnlineManual"
     * @throws Exception
     */
    @IncludedMblInfo(name="약관",order = 200 ,gid = 20)
    @RequestMapping(value="/uss/sam/stp/StplatListInqire.fo")
    public String mainBoard(@ModelAttribute("searchVO") StplatManageDefaultVO searchVO, ModelMap model)
    throws Exception {

    	return "egovframework/fox/com/uss/sam/stp/FoxStplatListInqire";

    }

    
	@RequestMapping(value="/uss/sam/stp/FoxMobileDetail.fo")
	public String MainDetail(ModelMap model){

		return "egovframework/fox/com/uss/sam/stp/FoxUnitDetail";
		
	}
}

 