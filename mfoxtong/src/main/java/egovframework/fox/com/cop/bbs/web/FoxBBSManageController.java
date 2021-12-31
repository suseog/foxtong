package egovframework.fox.com.cop.bbs.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.Board;
import egovframework.com.cop.bbs.service.BoardMaster;
import egovframework.com.cop.bbs.service.BoardMasterVO;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.cop.bbs.service.EgovBBSAttributeManageService;
import egovframework.com.cop.bbs.service.EgovBBSCommentService;
import egovframework.com.cop.bbs.service.EgovBBSManageService;
import egovframework.com.cop.bbs.service.EgovBBSSatisfactionService;
import egovframework.com.cop.bbs.service.EgovBBSScrapService;
import egovframework.com.sym.ccm.cde.service.CmmnDetailCodeVO;
import egovframework.com.sym.ccm.cde.service.EgovCcmCmmnDetailCodeManageService;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.fox.com.cop.bbs.service.FoxSearchHistManageService;
import egovframework.fox.com.cop.bbs.service.SearchBoardHist;
import egovframework.mbl.com.cmm.annotation.IncludedMblInfo;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 게시물 관리를 위한 컨트롤러 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------       --------    ---------------------------
 *   2009.3.19  이삼섭          최초 생성
 *   2009.06.29	한성곤			2단계 기능 추가 (댓글관리, 만족도조사)
 *   2011.07.01 안민정		 	댓글, 스크랩, 만족도 조사 기능의 종속성 제거
 *
 * </pre>
 */
@Controller
public class FoxBBSManageController {
	
	@Resource(name = "CmmnDetailCodeManageService")
    private EgovCcmCmmnDetailCodeManageService cmmnDetailCodeManageService;

    @Resource(name = "EgovBBSManageService")
    private EgovBBSManageService bbsMngService;

    @Resource(name = "EgovBBSAttributeManageService")
    private EgovBBSAttributeManageService bbsAttrbService;
    
    @Resource(name = "FoxSearchHistManageService")
    private FoxSearchHistManageService foxSearchHistManageService;

    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileMngService;

    @Resource(name = "EgovFileMngUtil")
    private EgovFileMngUtil fileUtil;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    //---------------------------------
    // 2009.06.29 : 2단계 기능 추가
    // 2011.07.01 : 댓글, 스크랩, 만족도 조사 기능의 종속성 제거
    //---------------------------------
    @Autowired(required=false)
    private EgovBBSCommentService bbsCommentService;

    @Autowired(required=false)
    private EgovBBSSatisfactionService bbsSatisfactionService;

    @Autowired(required=false)
    private EgovBBSScrapService bbsScrapService;
    ////-------------------------------

    @Autowired
    private DefaultBeanValidator beanValidator;

    /**
     * XSS 방지 처리.
     *
     * @param data
     * @return
     */
    protected String unscript(String data) {
        if (data == null || data.trim().equals("")) {
            return "";
        }

        String ret = data;

        ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
        ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");

        ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
        ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");

        ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
        ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");

        ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");

        ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
        ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

        return ret;
    }

    /** 첫 화면 공지게시판 링크를 위한 더미 메소드 */
    @IncludedMblInfo(name="공지게시판",order = 102 ,gid = 10, listUrl = "/cop/bbs/selectBoardList.fo?bbsId=BBSMSTR_000000000003")
    public void noticeBoard() {}

    /** 첫 화면 유효게시판 링크를 위한 더미 메소드 */
    @IncludedMblInfo(name="유효게시판",order = 103 ,gid = 10, listUrl = "/cop/bbs/selectBoardList.fo?bbsId=BBSMSTR_000000000004")
    public void effectiveBoard() {}

    
    /**
     * 게시글 주체를 추가한 게시물에 대한 목록을 조회한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @IncludedMblInfo(name="일반게시판테마형 ",order = 100 ,gid = 10, listUrl = "/cop/bbs/selectBoardThemaList.fo?bbsId=BBSMSTR_000000000001")
    @RequestMapping("/cop/bbs/selectBoardThemaList.fo")
    public String selectBoardThemaArticles(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
	
    LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	/*log.debug(this.getClass().getName() + " user.getId() "+ user.getId());
	log.debug(this.getClass().getName() + " user.getName() "+ user.getName());
	log.debug(this.getClass().getName() + " user.getUniqId() "+ user.getUniqId());
	log.debug(this.getClass().getName() + " user.getOrgnztId() "+ user.getOrgnztId());
	log.debug(this.getClass().getName() + " user.getUserSe() "+ user.getUserSe());
	log.debug(this.getClass().getName() + " user.getEmail() "+ user.getEmail());*/
	//String attrbFlag = "";

//	boardVO.setBbsId(boardVO.getBbsId()); 2021.12.23 주석처리 jss
//	boardVO.setBbsNm(boardVO.getBbsNm());
    
    //------------------------------
    // 게시물주제구분코드 목록 조회 설정 
    //------------------------------
    CmmnDetailCodeVO cvo = new CmmnDetailCodeVO();
    cvo.setCodeId("FOX002"); // 
    List<CmmnDetailCodeVO> codeList = (List) cmmnDetailCodeManageService.selectCmmnDetailCodeList(cvo);
    
    
    //------------------------------
	BoardMasterVO vo = new BoardMasterVO();

	vo.setBbsId(boardVO.getBbsId());
	vo.setUniqId(user.getUniqId());

	BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);
	//-------------------------------
	// 방명록이면 방명록 URL로 forward
	//-------------------------------
	if (master.getBbsTyCode().equals("BBST04")) {
	    return "forward:/cop/bbs/selectGuestList.fo";
	}
	////-----------------------------

	boardVO.setPageUnit(propertyService.getInt("pageUnit"));
	boardVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();

	paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(10);
	paginationInfo.setPageSize(1);

	boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
	boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	//Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, vo.getBbsAttrbCode());
	Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, master.getBbsAttrbCode());//2011.09.07
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	paginationInfo.setTotalRecordCount(totCnt);

	//-------------------------------
	// 기본 BBS template 지정
	//-------------------------------
	if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
	    master.setTmplatCours("/css/egovframework/cop/tpl/egovBaseTemplate.css");
	}
	////-----------------------------
	model.addAttribute("resultCodeList", codeList);
	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("boardVO", boardVO);
	model.addAttribute("brdMstrVO", master);
	model.addAttribute("paginationInfo", paginationInfo);

	return "egovframework/fox/com/cop/bbs/FoxNoticeList";
    }
    
    

    /**
     * 게시물에 대한 목록을 조회한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @IncludedMblInfo(name="일반게시판",order = 100 ,gid = 10, listUrl = "/cop/bbs/selectBoardList.fo?bbsId=BBSMSTR_000000000001")
    @RequestMapping("/cop/bbs/selectBoardList.fo")
    public String selectBoardArticles(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
	
    LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	/*log.debug(this.getClass().getName() + " user.getId() "+ user.getId());
	log.debug(this.getClass().getName() + " user.getName() "+ user.getName());
	log.debug(this.getClass().getName() + " user.getUniqId() "+ user.getUniqId());
	log.debug(this.getClass().getName() + " user.getOrgnztId() "+ user.getOrgnztId());
	log.debug(this.getClass().getName() + " user.getUserSe() "+ user.getUserSe());
	log.debug(this.getClass().getName() + " user.getEmail() "+ user.getEmail());*/
	//String attrbFlag = "";

//	boardVO.setBbsId(boardVO.getBbsId()); 2021.12.23 주석처리 jss
//	boardVO.setBbsNm(boardVO.getBbsNm());
    
  
    
    
    //------------------------------
	BoardMasterVO vo = new BoardMasterVO();

	vo.setBbsId(boardVO.getBbsId());
	vo.setUniqId(user.getUniqId());

	BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);
	//-------------------------------
	// 방명록이면 방명록 URL로 forward
	//-------------------------------
	if (master.getBbsTyCode().equals("BBST04")) {
	    return "forward:/cop/bbs/selectGuestList.fo";
	}
	////-----------------------------

	boardVO.setPageUnit(propertyService.getInt("pageUnit"));
	boardVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();

	paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(10);
	paginationInfo.setPageSize(1);

	boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
	boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	//Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, vo.getBbsAttrbCode());
	Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, master.getBbsAttrbCode());//2011.09.07
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	paginationInfo.setTotalRecordCount(totCnt);

	//-------------------------------
	// 기본 BBS template 지정
	//-------------------------------
	if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
	    master.setTmplatCours("/css/egovframework/cop/tpl/egovBaseTemplate.css");
	}
	////-----------------------------

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("boardVO", boardVO);
	model.addAttribute("brdMstrVO", master);
	model.addAttribute("paginationInfo", paginationInfo);

	return "egovframework/fox/com/cop/bbs/FoxNoticeList";
    }
    
    
    /**
     * 게시물 검색화면을 출력
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @IncludedMblInfo(name="일반게시판",order = 100 ,gid = 10, listUrl = "/cop/bbs/searchBoardListView.fo?bbsId=BBSMSTR_000000000001")
    @RequestMapping("/cop/bbs/searchBoardListView.fo")
    public String searchBoardListView(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	/*log.debug(this.getClass().getName() + " user.getId() "+ user.getId());
	log.debug(this.getClass().getName() + " user.getName() "+ user.getName());
	log.debug(this.getClass().getName() + " user.getUniqId() "+ user.getUniqId());
	log.debug(this.getClass().getName() + " user.getOrgnztId() "+ user.getOrgnztId());
	log.debug(this.getClass().getName() + " user.getUserSe() "+ user.getUserSe());
	log.debug(this.getClass().getName() + " user.getEmail() "+ user.getEmail());*/
	//String attrbFlag = "";

	boardVO.setBbsId(boardVO.getBbsId());
	boardVO.setBbsNm(boardVO.getBbsNm());

	BoardMasterVO vo = new BoardMasterVO();
	vo.setBbsId(boardVO.getBbsId());
	vo.setUniqId(user.getUniqId());
	BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);
	
//	//-------------------------------
//	// 방명록이면 방명록 URL로 forward
//	//-------------------------------
//	if (master.getBbsTyCode().equals("BBST04")) {
//	    return "forward:/cop/bbs/selectGuestList.fo";
//	}
//	////-----------------------------

	
	/* 검색 순위 상위 목록 조회 (2시간 이내, 5건 Ajax로 구현하는 것은 어떤가 리팩토링 고려  */
	SearchBoardHist searchBoardHist = new SearchBoardHist();
	searchBoardHist.setMberId("");
	searchBoardHist.setSearchFlag("1");
	Map<String, Object>  searchRanktMap = foxSearchHistManageService.selectBoarSearchHistList(searchBoardHist);
	model.addAttribute("searchRankList", searchRanktMap.get("resultList"));
	
	/* 나의 검색 이력 목록 조회 (전체)  */
	searchBoardHist.setMberId(user.getId());
	searchBoardHist.setSearchFlag("2");
	Map<String, Object>  mySearchListMap = foxSearchHistManageService.selectBoarSearchHistList(searchBoardHist);
	int mySearchListCnt = Integer.parseInt((String) mySearchListMap.get("resultCnt"));
	model.addAttribute("mySearchListCnt", mySearchListCnt);
	model.addAttribute("mySearchList", mySearchListMap.get("resultList"));
	
	
	/* 페이징 변수등 처리 없애도 되는지 고민활것  */
	boardVO.setPageUnit(propertyService.getInt("pageUnit"));
	boardVO.setPageSize(propertyService.getInt("pageSize"));
	
	PaginationInfo paginationInfo = new PaginationInfo();

	paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(10);
	paginationInfo.setPageSize(1);

	boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
	boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
	

	//Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, vo.getBbsAttrbCode());
	Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, master.getBbsAttrbCode());//2011.09.07
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	paginationInfo.setTotalRecordCount(totCnt);

	//-------------------------------
	// 기본 BBS template 지정
	//-------------------------------
	if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
	    master.setTmplatCours("/css/egovframework/cop/tpl/egovBaseTemplate.css");
	}
	////-----------------------------
	
	
	
	
	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("boardVO", boardVO);
	model.addAttribute("brdMstrVO", master);
	model.addAttribute("paginationInfo", paginationInfo);

	return "egovframework/fox/com/cop/bbs/FoxNoticeSearcView";
    }
    
    /**
     * 게시물 검색결과를 출력 (내용에서의 키워드검색 결과)
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @IncludedMblInfo(name="일반게시판",order = 100 ,gid = 10, listUrl = "/cop/bbs/searchBoardArticlesResult.fo?bbsId=BBSMSTR_000000000001")
    @RequestMapping("/cop/bbs/searchBoardArticlesResult.fo")
    public String searchBoardArticlesResult(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	/*log.debug(this.getClass().getName() + " user.getId() "+ user.getId());
	log.debug(this.getClass().getName() + " user.getName() "+ user.getName());
	log.debug(this.getClass().getName() + " user.getUniqId() "+ user.getUniqId());
	log.debug(this.getClass().getName() + " user.getOrgnztId() "+ user.getOrgnztId());
	log.debug(this.getClass().getName() + " user.getUserSe() "+ user.getUserSe());
	log.debug(this.getClass().getName() + " user.getEmail() "+ user.getEmail());*/
	//String attrbFlag = "";

	BoardMasterVO vo = new BoardMasterVO();
	vo.setBbsId(boardVO.getBbsId());
	vo.setUniqId(user.getUniqId());
	BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);
	
	// 검색이력 등록 : board 서비스내에서 구현이 필요해 보이나 여기서 진행 .  jss
	SearchBoardHist searchBoardHist = new SearchBoardHist();
	searchBoardHist.setSrchWrd(boardVO.getSearchWrd());
	searchBoardHist.setMberId(user.getId());
	searchBoardHist.setFrstRegisterId(user.getId());
	foxSearchHistManageService.insertBoardSearchHist(searchBoardHist);
	

	boardVO.setPageUnit(propertyService.getInt("pageUnit"));
	boardVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();
	paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(10);
	paginationInfo.setPageSize(1);

	boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
	boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
	//검색어 설정 2121.12.26 jss 
	boardVO.setSearchCnd("1"); // 내용에서 검색 설정하는 것으로 고정 jss
	

	Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, master.getBbsAttrbCode());//2011.09.07
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	paginationInfo.setTotalRecordCount(totCnt);

	//-------------------------------
	// 기본 BBS template 지정
	//-------------------------------
	if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
	    master.setTmplatCours("/css/egovframework/cop/tpl/egovBaseTemplate.css");
	}
	////-----------------------------

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("boardVO", boardVO);
	model.addAttribute("brdMstrVO", master);
	model.addAttribute("paginationInfo", paginationInfo);

	return "egovframework/fox/com/cop/bbs/FoxNoticeSearchResult";
	
    }
    
/*
    * 나의 검색 결과에서 제
    *
    * @param boardVO
    * @param sessionVO
    * @param model
    * @return
    * @throws Exception
    */
   @IncludedMblInfo(name="일반게시판",order = 100 ,gid = 10, listUrl = "/cop/bbs/searchBoardListViewRemove.fo?bbsId=BBSMSTR_000000000001")
   @RequestMapping("/cop/bbs/searchBoardListViewRemove.fo")
   public String searchBoardListViewRemove(@RequestParam("sn") String sn, @RequestParam("mberId") String mberId, ModelMap model) throws Exception {
	   
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	/*log.debug(this.getClass().getName() + " user.getId() "+ user.getId());
	log.debug(this.getClass().getName() + " user.getName() "+ user.getName());
	log.debug(this.getClass().getName() + " user.getUniqId() "+ user.getUniqId());
	log.debug(this.getClass().getName() + " user.getOrgnztId() "+ user.getOrgnztId());
	log.debug(this.getClass().getName() + " user.getUserSe() "+ user.getUserSe());
	log.debug(this.getClass().getName() + " user.getEmail() "+ user.getEmail());*/
	//String attrbFlag = "";
//
//	boardVO.setBbsId(boardVO.getBbsId());
//	boardVO.setBbsNm(boardVO.getBbsNm());
//
//	BoardMasterVO vo = new BoardMasterVO();
//	vo.setBbsId(boardVO.getBbsId());
//	vo.setUniqId(user.getUniqId());
//	BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);
	
	
	/* 검색 결과에서 제거 (수정) 나중에 Ajax로 변경하는 게 어떨까?   */
	SearchBoardHist searchBoardHistdel = new SearchBoardHist();
	searchBoardHistdel.setSn(Integer.parseInt(sn));
	searchBoardHistdel.setMberId(user.getId());
	searchBoardHistdel.setUseAt("N");
	foxSearchHistManageService.updateBoarSearchHistList(searchBoardHistdel);
	
	/* 검색 순위 상위 목록 조회 (2시간 이내, 5건 Ajax로 구현하는 것은 어떤가 리팩토링 고려  */
	SearchBoardHist searchBoardHist = new SearchBoardHist();
	searchBoardHist.setMberId("");
	searchBoardHist.setSearchFlag("1");
	Map<String, Object>  searchRanktMap = foxSearchHistManageService.selectBoarSearchHitFive(searchBoardHist);
	model.addAttribute("searchRankList", searchRanktMap.get("resultList"));

	/* 나의 검색 이력 목록 조회 신규 조회 (전체)  */
	searchBoardHist.setMberId(user.getId());
	searchBoardHist.setSearchFlag("2");
	Map<String, Object>  mySearchListMap = foxSearchHistManageService.selectBoarSearchHistList(searchBoardHist);
	int mySearchListCnt = Integer.parseInt((String) mySearchListMap.get("resultCnt"));
	model.addAttribute("mySearchListCnt", mySearchListCnt);
	model.addAttribute("mySearchList", mySearchListMap.get("resultList"));
	

	return "egovframework/fox/com/cop/bbs/FoxNoticeSearcView";
   }


    /**
     * 게시물에 대한 상세 정보를 조회한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/selectBoardArticle.fo")
    public String selectBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	// 조회수 증가 여부 지정
	boardVO.setPlusCount(true);

	//---------------------------------
	// 2009.06.29 : 2단계 기능 추가
	//---------------------------------
	if (!boardVO.getSubPageIndex().equals("")) {
	    boardVO.setPlusCount(false);
	}
	////-------------------------------

	boardVO.setLastUpdusrId(user.getUniqId());
	BoardVO vo = bbsMngService.selectBoardArticle(boardVO);

	model.addAttribute("result", vo);

	model.addAttribute("sessionUniqId", user.getUniqId());

	//----------------------------
	// template 처리 (기본 BBS template 지정  포함)
	//----------------------------
	BoardMasterVO master = new BoardMasterVO();

	master.setBbsId(boardVO.getBbsId());
	master.setUniqId(user.getUniqId());

	BoardMasterVO masterVo = bbsAttrbService.selectBBSMasterInf(master);

	if (masterVo.getTmplatCours() == null || masterVo.getTmplatCours().equals("")) {
	    masterVo.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
	}

	model.addAttribute("brdMstrVO", masterVo);
	////-----------------------------

	//----------------------------
	// 2009.06.29 : 2단계 기능 추가
	// 2011.07.01 : 댓글, 스크랩, 만족도 조사 기능의 종속성 제거
	//----------------------------
	if (bbsCommentService != null){
		if (bbsCommentService.canUseComment(boardVO.getBbsId())) {
		    model.addAttribute("useComment", "true");
		}
	}
	if (bbsSatisfactionService != null){
		if (bbsSatisfactionService.canUseSatisfaction(boardVO.getBbsId())) {
		    model.addAttribute("useSatisfaction", "true");
		}
	}
	if (bbsScrapService != null){
		if (bbsScrapService.canUseScrap()) {
		    model.addAttribute("useScrap", "true");
		}
	}

	////--------------------------

	// 김연수 추가 2011.07.20
	// 상세화면 조회시 댓글을 위한 작성자 명 추가
	//model.addAttribute("wrterNm", user.getName());

	//댓글테스트
    //model.addAttribute("useComment", "true");
	return "egovframework/fox/com/cop/bbs/FoxNoticeInqire";
    }

    /**
     *
     *
     * 사용안함:::::사용안함:::::사용안함:::::사용안함:::::사용안함:::::사용안함:::::사용안함:::::사용안함:::::사용안함:::::
     *
     *
     *
     * 게시물 등록을 위한 등록페이지로 이동한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/addBoardArticle.fo")
    public String addBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	BoardMasterVO bdMstr = new BoardMasterVO();

	if (isAuthenticated) {

	    BoardMasterVO vo = new BoardMasterVO();
	    vo.setBbsId(boardVO.getBbsId());
	    vo.setUniqId(user.getUniqId());

	    bdMstr = bbsAttrbService.selectBBSMasterInf(vo);
	    model.addAttribute("bdMstr", bdMstr);
	}
	//----------------------------
	// 기본 BBS template 지정
	//----------------------------
	if (bdMstr.getTmplatCours() == null || bdMstr.getTmplatCours().equals("")) {
	    bdMstr.setTmplatCours("/css/egovframework/cop/tpl/egovBaseTemplate.css");
	}

	model.addAttribute("brdMstrVO", bdMstr);
	////-----------------------------

	return "egovframework/fox/com/cop/bbs/FoxNoticeRegist";
    }

    /**
     * 게시물을 등록한다.
     *
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unused")
	@RequestMapping("/cop/bbs/insertBoardArticle.fo")
    public String insertBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, SessionStatus status,
	    ModelMap model) throws Exception {

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	beanValidator.validate(board, bindingResult);
	if (bindingResult.hasErrors()) {

	    BoardMasterVO master = new BoardMasterVO();
	    BoardMasterVO vo = new BoardMasterVO();

	    vo.setBbsId(boardVO.getBbsId());
	    vo.setUniqId(user.getUniqId());

	    master = bbsAttrbService.selectBBSMasterInf(vo);

	    model.addAttribute("bdMstr", master);

	    //----------------------------
	    // 기본 BBS template 지정
	    //----------------------------
	    if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
			master.setTmplatCours("css/egovframework/com/cop/tpl/egovBaseTemplate.css");
	    }

	    model.addAttribute("brdMstrVO", master);
	    ////-----------------------------

	    return "egovframework/fox/com/cop/bbs/FoxNoticeRegist";
	}

	//if (isAuthenticated) {
	    List<FileVO> result = null;
	    String atchFileId = "";

	    final Map<String, MultipartFile> files = multiRequest.getFileMap();
	    if (!files.isEmpty()) {
		result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
		atchFileId = fileMngService.insertFileInfs(result);
	    }
	    board.setAtchFileId(atchFileId);
	    board.setFrstRegisterId(user.getUniqId());
	    board.setBbsId(board.getBbsId());

	    board.setNtcrNm("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
	    board.setPassword("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)

	    board.setNttCn(unscript(board.getNttCn()));	// XSS 방지

	    bbsMngService.insertBoardArticle(board);
	//}

	//status.setComplete();
	return "redirect:/cop/bbs/selectBoardList.fo?bbsId="+board.getBbsId();
    }

    /**
     * 게시물에 대한 답변 등록을 위한 등록페이지로 이동한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/addReplyBoardArticle.fo")
    public String addReplyBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	BoardMasterVO master = new BoardMasterVO();
	BoardMasterVO vo = new BoardMasterVO();

	vo.setBbsId(boardVO.getBbsId());
	vo.setUniqId(user.getUniqId());

	master = bbsAttrbService.selectBBSMasterInf(vo);

	model.addAttribute("bdMstr", master);
	model.addAttribute("result", boardVO);

	//----------------------------
	// 기본 BBS template 지정
	//----------------------------
	if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
	    master.setTmplatCours("/css/egovframework/cop/tpl/egovBaseTemplate.css");
	}

	model.addAttribute("brdMstrVO", master);
	////-----------------------------

	return "egovframework/fox/com/cop/bbs/FoxNoticeReply";
    }

    /**
     * 게시물에 대한 답변을 등록한다.
     *
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/replyBoardArticle.fo")
    public String replyBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model,
	    SessionStatus status) throws Exception {

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	beanValidator.validate(board, bindingResult);
	if (bindingResult.hasErrors()) {
	    BoardMasterVO master = new BoardMasterVO();
	    BoardMasterVO vo = new BoardMasterVO();

	    vo.setBbsId(boardVO.getBbsId());
	    vo.setUniqId(user.getUniqId());

	    master = bbsAttrbService.selectBBSMasterInf(vo);

	    model.addAttribute("bdMstr", master);
	    model.addAttribute("result", boardVO);

	    //----------------------------
	    // 기본 BBS template 지정
	    //----------------------------
	    if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
		master.setTmplatCours("/css/egovframework/cop/tpl/egovBaseTemplate.css");
	    }

	    model.addAttribute("brdMstrVO", master);
	    ////-----------------------------

	    return "egovframework/fox/com/cop/bbs/FoxNoticeReply";
	}

	if (isAuthenticated) {
	    final Map<String, MultipartFile> files = multiRequest.getFileMap();
	    String atchFileId = "";

	    if (!files.isEmpty()) {
		List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
		atchFileId = fileMngService.insertFileInfs(result);
	    }

	    board.setAtchFileId(atchFileId);
	    board.setReplyAt("Y");
	    board.setFrstRegisterId(user.getUniqId());
	    board.setBbsId(board.getBbsId());
	    board.setParnts(Long.toString(boardVO.getNttId()));
	    board.setSortOrdr(boardVO.getSortOrdr());
	    board.setReplyLc(Integer.toString(Integer.parseInt(boardVO.getReplyLc()) + 1));

	    board.setNtcrNm("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
	    board.setPassword("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)

	    board.setNttCn(unscript(board.getNttCn()));	// XSS 방지

	    bbsMngService.insertBoardArticle(board);
	}

	return "redirect:/cop/bbs/selectBoardList.fo?bbsId="+board.getBbsId();
    }

    /**
     * 게시물 수정을 위한 수정페이지로 이동한다.
     *
     * @param boardVO
     * @param vo
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/forUpdateBoardArticle.fo")
    public String selectBoardArticleForUpdt(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") BoardVO vo, ModelMap model)
	    throws Exception {

	//log.debug(this.getClass().getName()+"selectBoardArticleForUpdt getNttId "+boardVO.getNttId());
	//log.debug(this.getClass().getName()+"selectBoardArticleForUpdt getBbsId "+boardVO.getBbsId());

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	boardVO.setFrstRegisterId(user.getUniqId());

	BoardMaster master = new BoardMaster();
	BoardMasterVO bmvo = new BoardMasterVO();
	BoardVO bdvo = new BoardVO();

	vo.setBbsId(boardVO.getBbsId());

	master.setBbsId(boardVO.getBbsId());
	master.setUniqId(user.getUniqId());

	if (isAuthenticated) {
	    bmvo = bbsAttrbService.selectBBSMasterInf(master);
	    bdvo = bbsMngService.selectBoardArticle(boardVO);
	}

	model.addAttribute("result", bdvo);
	model.addAttribute("bdMstr", bmvo);

	//----------------------------
	// 기본 BBS template 지정
	//----------------------------
	if (bmvo.getTmplatCours() == null || bmvo.getTmplatCours().equals("")) {
	    bmvo.setTmplatCours("/css/egovframework/cop/tpl/egovBaseTemplate.css");
	}

	model.addAttribute("brdMstrVO", bmvo);
	////-----------------------------

	return "egovframework/fox/com/cop/bbs/FoxNoticeUpdt";
    }

    /**
     * 게시물에 대한 내용을 수정한다.
     *
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/updateBoardArticle.fo")
    public String updateBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model,
	    SessionStatus status) throws Exception {

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	String atchFileId = boardVO.getAtchFileId();

	beanValidator.validate(board, bindingResult);
	if (bindingResult.hasErrors()) {

	    boardVO.setFrstRegisterId(user.getUniqId());

	    BoardMaster master = new BoardMaster();
	    BoardMasterVO bmvo = new BoardMasterVO();
	    BoardVO bdvo = new BoardVO();

	    master.setBbsId(boardVO.getBbsId());
	    master.setUniqId(user.getUniqId());

	    bmvo = bbsAttrbService.selectBBSMasterInf(master);
	    bdvo = bbsMngService.selectBoardArticle(boardVO);

	    model.addAttribute("result", bdvo);
	    model.addAttribute("bdMstr", bmvo);

	    return "egovframework/fox/com/cop/bbs/FoxNoticeUpdt";
	}

	/*
	boardVO.setFrstRegisterId(user.getUniqId());
	BoardMaster _bdMstr = new BoardMaster();
	BoardMasterVO bmvo = new BoardMasterVO();
	BoardVO bdvo = new BoardVO();
	vo.setBbsId(boardVO.getBbsId());
	_bdMstr.setBbsId(boardVO.getBbsId());
	_bdMstr.setUniqId(user.getUniqId());

	if (isAuthenticated) {
	    bmvo = bbsAttrbService.selectBBSMasterInf(_bdMstr);
	    bdvo = bbsMngService.selectBoardArticle(boardVO);
	}
	//*/

	if (isAuthenticated) {
	    final Map<String, MultipartFile> files = multiRequest.getFileMap();
	    if (!files.isEmpty()) {
		if ("".equals(atchFileId)) {
		    List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, atchFileId, "");
		    atchFileId = fileMngService.insertFileInfs(result);
		    board.setAtchFileId(atchFileId);
		} else {
		    FileVO fvo = new FileVO();
		    fvo.setAtchFileId(atchFileId);
		    int cnt = fileMngService.getMaxFileSN(fvo);
		    List<FileVO> _result = fileUtil.parseFileInf(files, "BBS_", cnt, atchFileId, "");
		    fileMngService.updateFileInfs(_result);
		}
	    }

	    board.setLastUpdusrId(user.getUniqId());

	    board.setNtcrNm("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
	    board.setPassword("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)

	    board.setNttCn(unscript(board.getNttCn()));	// XSS 방지

	    bbsMngService.updateBoardArticle(board);
	}

	return "redirect:/cop/bbs/selectBoardList.fo?bbsId="+board.getBbsId();
    }

    /**
     * 게시물에 대한 내용을 삭제한다.
     *
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/deleteBoardArticle.fo")
    public String deleteBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, ModelMap model) throws Exception {

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	if (isAuthenticated) {
	    board.setLastUpdusrId(user.getUniqId());

	    bbsMngService.deleteBoardArticle(board);
	}

	return "redirect:/cop/bbs/selectBoardList.fo?bbsId="+board.getBbsId();
    }

    /**
     * 방명록에 대한 목록을 조회한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/selectGuestList.fo")
    public String selectGuestList(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	@SuppressWarnings("unused")
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	// 수정 및 삭제 기능 제어를 위한 처리
	model.addAttribute("sessionUniqId", user.getUniqId());

	BoardVO vo = new BoardVO();

	vo.setBbsId(boardVO.getBbsId());
	vo.setBbsNm(boardVO.getBbsNm());
	vo.setNtcrNm(user.getName());
	vo.setNtcrId(user.getUniqId());
	vo.setPageIndex(boardVO.getPageIndex());
	vo.setPageUnit(boardVO.getPageUnit());
	vo.setPageSize(boardVO.getPageSize());

	BoardMasterVO masterVo = new BoardMasterVO();

	masterVo.setBbsId(vo.getBbsId());
	masterVo.setUniqId(user.getUniqId());

	BoardMasterVO mstrVO = bbsAttrbService.selectBBSMasterInf(masterVo);

	PaginationInfo paginationInfo = new PaginationInfo();
	paginationInfo.setCurrentPageNo(vo.getPageIndex());
	paginationInfo.setRecordCountPerPage(10);
	paginationInfo.setPageSize(1);

	vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
	vo.setLastIndex(paginationInfo.getLastRecordIndex());
	vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = bbsMngService.selectGuestList(vo);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("brdMstrVO", mstrVO);
	model.addAttribute("boardVO", vo);
	model.addAttribute("paginationInfo", paginationInfo);

	return "egovframework/fox/com/cop/bbs/FoxGuestList";
    }

    /**
     * 방명록 수정을 위한 특정 내용을 조회한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/selectSingleGuestList.fo")
    public String selectSingleGuestList(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("brdMstrVO") BoardMasterVO brdMstrVO,
	    ModelMap model) throws Exception {

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	@SuppressWarnings("unused")
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	BoardVO vo = bbsMngService.selectBoardArticle(boardVO);
	
	
    //------------------------------
    // 게시물주제구분코드 목록 조회 설정 
    //------------------------------
    CmmnDetailCodeVO cvo = new CmmnDetailCodeVO();
    cvo.setCodeId("FOX002"); // 
    List<CmmnDetailCodeVO> codeList = (List) cmmnDetailCodeManageService.selectCmmnDetailCodeList(cvo);
    

	boardVO.setBbsId(boardVO.getBbsId());
	boardVO.setBbsNm(boardVO.getBbsNm());
	boardVO.setNtcrNm(user.getName());

	boardVO.setPageUnit(propertyService.getInt("pageUnit"));
	boardVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();
	paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
	//paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
	//paginationInfo.setPageSize(boardVO.getPageSize());
	paginationInfo.setRecordCountPerPage(10);
	paginationInfo.setPageSize(1);

	boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
	boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = bbsMngService.selectGuestList(boardVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resulCodeList", codeList);
	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("boardVO", vo);
	model.addAttribute("brdMstrVO", brdMstrVO);
	model.addAttribute("paginationInfo", paginationInfo);

	return "egovframework/fox/com/cop/bbs/EgovGuestList";
    }

    /**
     * 방명록에 대한 내용을 삭제한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/deleteGuestList.fo")
    public String deleteGuestList(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board, ModelMap model) throws Exception {
	@SuppressWarnings("unused")
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	if (isAuthenticated) {
	    bbsMngService.deleteGuestList(boardVO);
	}

	return "forward:/cop/bbs/selectGuestList.fo";
    }

    /**
     * 방명록 수정의 위한 목록을 조회한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unused")
	@RequestMapping("/cop/bbs/updateGuestList.fo")
    public String updateGuestList(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board, BindingResult bindingResult,
	    ModelMap model) throws Exception {

	//BBST02, BBST04
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	beanValidator.validate(board, bindingResult);
	if (bindingResult.hasErrors()) {

	    BoardVO vo = new BoardVO();

	    vo.setBbsId(boardVO.getBbsId());
	    vo.setBbsNm(boardVO.getBbsNm());
	    vo.setNtcrNm(user.getName());
	    vo.setNtcrId(user.getUniqId());

	    BoardMasterVO masterVo = new BoardMasterVO();

	    masterVo.setBbsId(vo.getBbsId());
	    masterVo.setUniqId(user.getUniqId());

	    BoardMasterVO mstrVO = bbsAttrbService.selectBBSMasterInf(masterVo);

	    vo.setPageUnit(propertyService.getInt("pageUnit"));
	    vo.setPageSize(propertyService.getInt("pageSize"));

	    PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(vo.getPageIndex());
	    //paginationInfo.setRecordCountPerPage(vo.getPageUnit());
	    //paginationInfo.setPageSize(vo.getPageSize());
	    paginationInfo.setRecordCountPerPage(10);
	    paginationInfo.setPageSize(1);

	    vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
	    vo.setLastIndex(paginationInfo.getLastRecordIndex());
	    vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	    Map<String, Object> map = bbsMngService.selectGuestList(vo);
	    int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	    paginationInfo.setTotalRecordCount(totCnt);

	    model.addAttribute("resultList", map.get("resultList"));
	    model.addAttribute("resultCnt", map.get("resultCnt"));
	    model.addAttribute("brdMstrVO", mstrVO);
	    model.addAttribute("boardVO", vo);
	    model.addAttribute("paginationInfo", paginationInfo);

	    return "egovframework/fox/com/cop/bbs/EgovGuestList";
	}

	//if (isAuthenticated) {
	    bbsMngService.updateBoardArticle(board);
	    boardVO.setNttCn("");
	    boardVO.setPassword("");
	    boardVO.setNtcrId("");
	    boardVO.setNttId(0);
	//}
	return "redirect:/cop/bbs/selectGuestList.fo?bbsId="+boardVO.getBbsId();

    }

    /**
     * 방명록에 대한 내용을 등록한다.
     *
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/insertGuestList.fo")
    public String insertGuestList(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board, BindingResult bindingResult,
	    ModelMap model) throws Exception {

	//그러니까 무인증은 아니고  - _- 익명으로 등록이 가능한 부분임
	// 무인증이 되려면 별도의 컨트롤러를 하나 더 등록해야함

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	beanValidator.validate(board, bindingResult);
	if (bindingResult.hasErrors()) {

	    BoardVO vo = new BoardVO();

	    vo.setBbsId(boardVO.getBbsId());
	    vo.setBbsNm(boardVO.getBbsNm());
	    vo.setNtcrNm(user.getName());
	    vo.setNtcrId(user.getUniqId());

	    BoardMasterVO masterVo = new BoardMasterVO();

	    masterVo.setBbsId(vo.getBbsId());
	    masterVo.setUniqId(user.getUniqId());

	    BoardMasterVO mstrVO = bbsAttrbService.selectBBSMasterInf(masterVo);

	    vo.setPageUnit(propertyService.getInt("pageUnit"));
	    vo.setPageSize(propertyService.getInt("pageSize"));

	    PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(vo.getPageIndex());
	    //paginationInfo.setRecordCountPerPage(vo.getPageUnit());
	    //paginationInfo.setPageSize(vo.getPageSize());
	    paginationInfo.setRecordCountPerPage(10);
	    paginationInfo.setPageSize(1);

	    vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
	    vo.setLastIndex(paginationInfo.getLastRecordIndex());
	    vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	    Map<String, Object> map = bbsMngService.selectGuestList(vo);
	    int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	    paginationInfo.setTotalRecordCount(totCnt);

	    model.addAttribute("resultList", map.get("resultList"));
	    model.addAttribute("resultCnt", map.get("resultCnt"));
	    model.addAttribute("brdMstrVO", mstrVO);
	    model.addAttribute("boardVO", vo);
	    model.addAttribute("paginationInfo", paginationInfo);

	    return "egovframework/fox/com/cop/bbs/EgovGuestList";

	}

	if (isAuthenticated) {

	    board.setFrstRegisterId(user.getUniqId());

	    bbsMngService.insertBoardArticle(board);

	    boardVO.setNttCn("");
	    boardVO.setPassword("");
	    boardVO.setNtcrId("");
	    boardVO.setNttId(0);
	}

	return "redirect:/cop/bbs/selectGuestList.fo?bbsId="+boardVO.getBbsId();

    }

    /**
     * 익명게시물에 대한 목록을 조회한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @IncludedMblInfo(name="익명게시판",order = 101 ,gid = 10, listUrl = "/cop/bbs/anonymous/selectBoardList.fo?bbsId=BBSMSTR_000000000002")
    @RequestMapping("/cop/bbs/anonymous/selectBoardList.fo")
    public String selectAnonymousBoardArticles(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
	//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	//log.debug(this.getClass().getName() + " user.getId() "+ user.getId());
	//log.debug(this.getClass().getName() + " user.getName() "+ user.getName());
	//log.debug(this.getClass().getName() + " user.getUniqId() "+ user.getUniqId());
	//log.debug(this.getClass().getName() + " user.getOrgnztId() "+ user.getOrgnztId());
	//log.debug(this.getClass().getName() + " user.getUserSe() "+ user.getUserSe());
	//log.debug(this.getClass().getName() + " user.getEmail() "+ user.getEmail());

	//String attrbFlag = "";

	boardVO.setBbsId(boardVO.getBbsId());
	boardVO.setBbsNm(boardVO.getBbsNm());

	BoardMasterVO vo = new BoardMasterVO();

	vo.setBbsId(boardVO.getBbsId());
	vo.setUniqId("ANONYMOUS");	// 익명

	BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);
	
    //------------------------------
    // 게시물주제구분코드 목록 조회 설정 
    //------------------------------
    CmmnDetailCodeVO cvo = new CmmnDetailCodeVO();
    cvo.setCodeId("FOX002"); // 
    List<CmmnDetailCodeVO> codeList = (List<CmmnDetailCodeVO>) cmmnDetailCodeManageService.selectCmmnDetailCodeList(cvo);
    

	//-------------------------------
	// 익명게시판이 아니면.. 원래 게시판 URL로 forward
	//-------------------------------
	if (!master.getBbsTyCode().equals("BBST02")) {
		return "forward:/cop/bbs/selectBoardList.fo";
	}
	////-----------------------------

	boardVO.setPageUnit(propertyService.getInt("pageUnit"));
	boardVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();

	paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(10);
	paginationInfo.setPageSize(1);

	boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
	boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, vo.getBbsAttrbCode());
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	paginationInfo.setTotalRecordCount(totCnt);

	//-------------------------------
	// 기본 BBS template 지정
	//-------------------------------
	if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
	    master.setTmplatCours("/css/egovframework/cop/tpl/egovBaseTemplate.css");
	}
	////-----------------------------

	model.addAttribute("resultCodeList", codeList);
	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("boardVO", boardVO);
	model.addAttribute("brdMstrVO", master);
	model.addAttribute("paginationInfo", paginationInfo);

	model.addAttribute("anonymous", "true");

	return "egovframework/fox/com/cop/bbs/FoxNoticeList";
    }


    /**
     *
     * 사용안함:::::사용안함:::::사용안함:::::사용안함:::::사용안함:::::사용안함:::::사용안함:::::사용안함:::::
     *
     *
     * 익명게시물 등록을 위한 등록페이지로 이동한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/anonymous/addBoardArticle.fo")
    public String addAnonymousBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
	//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	//Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	Boolean isAuthenticated = true;

	BoardMasterVO bdMstr = new BoardMasterVO();

	if (isAuthenticated) {
	    BoardMasterVO vo = new BoardMasterVO();
	    vo.setBbsId(boardVO.getBbsId());
	    vo.setUniqId("ANONYMOUS");

	    bdMstr = bbsAttrbService.selectBBSMasterInf(vo);
	    model.addAttribute("bdMstr", bdMstr);
	}
	
	//------------------------------
    // 게시물주제구분코드 목록 조회 설정 
    //------------------------------
    CmmnDetailCodeVO cvo = new CmmnDetailCodeVO();
    cvo.setCodeId("FOX002"); // 
    List<CmmnDetailCodeVO> codeList = (List<CmmnDetailCodeVO>) cmmnDetailCodeManageService.selectCmmnDetailCodeList(cvo);
    

	//-------------------------------
	// 익명게시판이 아니면.. 원래 게시판 URL로 forward
	//-------------------------------
	if (!bdMstr.getBbsTyCode().equals("BBST02")) {
	    return "forward:/cop/bbs/addBoardArticle.fo";
	}
	////-----------------------------

	//----------------------------
	// 기본 BBS template 지정
	//----------------------------
	if (bdMstr.getTmplatCours() == null || bdMstr.getTmplatCours().equals("")) {
	    bdMstr.setTmplatCours("/css/egovframework/cop/tpl/egovBaseTemplate.css");
	}

	model.addAttribute("brdMstrVO", bdMstr);
	////-----------------------------

	model.addAttribute("resultCodeList", codeList);
	model.addAttribute("anonymous", "true");

	return "egovframework/fox/com/cop/bbs/FoxNoticeRegist";
    }

    /**
     * 익명게시물을 등록한다.
     *
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/anonymous/insertBoardArticle.fo")
    public String insertAnonymousBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, SessionStatus status,
	    ModelMap model) throws Exception {

	//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	//Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	Boolean isAuthenticated = true;

	beanValidator.validate(board, bindingResult);
	if (bindingResult.hasErrors()) {

	    BoardMasterVO master = new BoardMasterVO();
	    BoardMasterVO vo = new BoardMasterVO();

	    vo.setBbsId(boardVO.getBbsId());
	    vo.setUniqId("ANONYMOUS");

	    master = bbsAttrbService.selectBBSMasterInf(vo);

	    model.addAttribute("bdMstr", master);

	    //-------------------------------
	    // 익명게시판이 아니면.. 원래 게시판 URL로 forward
	    //-------------------------------
	    if (!bdMstr.getBbsTyCode().equals("BBST02")) {
	    	return "forward:/cop/bbs/insertBoardArticle.fo";
	    }
	    ////-----------------------------

	    //----------------------------
	    // 기본 BBS template 지정
	    //----------------------------
	    if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
		master.setTmplatCours("/css/egovframework/cop/tpl/egovBaseTemplate.css");
	    }

	    model.addAttribute("brdMstrVO", master);
	    ////-----------------------------

	    model.addAttribute("anonymous", "true");

	    return "egovframework/fox/com/cop/bbs/FoxNoticeRegist";
	}

	if (isAuthenticated) {
	    List<FileVO> result = null;
	    String atchFileId = "";

	    final Map<String, MultipartFile> files = multiRequest.getFileMap();
	    if (!files.isEmpty()) {
		result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
		atchFileId = fileMngService.insertFileInfs(result);
	    }
	    board.setAtchFileId(atchFileId);
	    board.setFrstRegisterId("ANONYMOUS");
	    board.setBbsId(board.getBbsId());

	    // 익명게시판 관련
	    board.setNtcrNm(board.getNtcrNm());
	    board.setPassword(EgovFileScrty.encryptPassword(board.getPassword(), board.getBbsId()));

	    board.setNttCn(unscript(board.getNttCn()));	// XSS 방지

	    bbsMngService.insertBoardArticle(board);
	}

    model.addAttribute("anonymous", "true");
	//status.setComplete();
	return "redirect:/cop/bbs/anonymous/selectBoardList.fo?bbsId="+board.getBbsId();
    }

    /**
     * 익명게시물에 대한 상세 정보를 조회한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/anonymous/selectBoardArticle.fo")
    public String selectAnonymousBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
	//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	// 조회수 증가 여부 지정
	boardVO.setPlusCount(true);

	//---------------------------------
	// 2009.06.29 : 2단계 기능 추가
	//---------------------------------
	if (!boardVO.getSubPageIndex().equals("")) {
	    boardVO.setPlusCount(false);
	}
	////-------------------------------

	boardVO.setLastUpdusrId("ANONYMOUS");
	BoardVO vo = bbsMngService.selectBoardArticle(boardVO);

	model.addAttribute("result", vo);

	model.addAttribute("sessionUniqId", "ANONYMOUS");

	//----------------------------
	// template 처리 (기본 BBS template 지정  포함)
	//----------------------------
	BoardMasterVO master = new BoardMasterVO();

	master.setBbsId(boardVO.getBbsId());
	master.setUniqId("ANONYMOUS");

	BoardMasterVO masterVo = bbsAttrbService.selectBBSMasterInf(master);

	//-------------------------------
	// 익명게시판이 아니면.. 원래 게시판 URL로 forward
	//-------------------------------
	if (!masterVo.getBbsTyCode().equals("BBST02")) {
		return "forward:/cop/bbs/selectBoardArticle.fo";
	}
	////-----------------------------

	if (masterVo.getTmplatCours() == null || masterVo.getTmplatCours().equals("")) {
	    masterVo.setTmplatCours("/css/egovframework/cop/tpl/egovBaseTemplate.css");
	}

	model.addAttribute("brdMstrVO", masterVo);
	////-----------------------------

	model.addAttribute("anonymous", "true");

	//----------------------------
	// 2009.06.29 : 2단계 기능 추가
	//----------------------------
	if (bbsCommentService != null){
		if (bbsCommentService.canUseComment(boardVO.getBbsId())) {
		    model.addAttribute("useComment", "true");
		}
	}
	if (bbsSatisfactionService != null){
		if (bbsSatisfactionService.canUseSatisfaction(boardVO.getBbsId())) {
		    model.addAttribute("useSatisfaction", "true");
		}
	}
	if (bbsScrapService != null){
		if (bbsScrapService.canUseScrap()) {
		    model.addAttribute("useScrap", "true");
		}
	}

	////--------------------------

	return "egovframework/fox/com/cop/bbs/FoxNoticeInqire";
    }

    /**
     * 익명게시물에 대한 내용을 삭제한다.
     *
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/anonymous/deleteBoardArticle.fo")
    public String deleteAnonymousBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, ModelMap model) throws Exception {

	//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	//Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	Boolean isAuthenticated = true;
	//--------------------------------------------------
	// 마스터 정보 얻기
	//--------------------------------------------------
	BoardMasterVO master = new BoardMasterVO();

	master.setBbsId(boardVO.getBbsId());
	master.setUniqId("ANONYMOUS");

	BoardMasterVO masterVo = bbsAttrbService.selectBBSMasterInf(master);

	//-------------------------------
	// 익명게시판이 아니면.. 원래 게시판 URL로 forward
	//-------------------------------
	if (!masterVo.getBbsTyCode().equals("BBST02")) {
	    return "forward:/cop/bbs/deleteBoardArticle.fo";
	}
	////-----------------------------

	//-------------------------------
	// 패스워드 비교
	//-------------------------------
	String dbpassword = bbsMngService.getPasswordInf(board);
	String enpassword = EgovFileScrty.encryptPassword(board.getPassword(), board.getBbsId());

	if (!dbpassword.equals(enpassword)) {

	    model.addAttribute("msg", egovMessageSource.getMessage("cop.password.not.same.msg"));

	    return "forward:/cop/bbs/anonymous/selectBoardArticle.fo";
	}
	////-----------------------------

	if (isAuthenticated) {
	    board.setLastUpdusrId("ANONYMOUS");

	    bbsMngService.deleteBoardArticle(board);
	}

	return "redirect:/cop/bbs/anonymous/selectBoardList.fo?bbsId="+board.getBbsId();
    }

    /**
     * 익명게시물 수정을 위한 수정페이지로 이동한다.
     *
     * @param boardVO
     * @param vo
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/anonymous/forUpdateBoardArticle.fo")
    public String selectAnonymousBoardArticleForUpdt(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") BoardVO vo, ModelMap model)
	    throws Exception {

	//log.debug(this.getClass().getName()+"selectBoardArticleForUpdt getNttId "+boardVO.getNttId());
	//log.debug(this.getClass().getName()+"selectBoardArticleForUpdt getBbsId "+boardVO.getBbsId());

	//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	//Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	Boolean isAuthenticated = true;

	boardVO.setFrstRegisterId("ANONYMOUS");

	BoardMaster master = new BoardMaster();
	BoardMasterVO bmvo = new BoardMasterVO();
	BoardVO bdvo = new BoardVO();

	vo.setBbsId(boardVO.getBbsId());

	master.setBbsId(boardVO.getBbsId());
	master.setUniqId("ANONYMOUS");

	if (isAuthenticated) {
	    bmvo = bbsAttrbService.selectBBSMasterInf(master);

	    //-------------------------------
	    // 익명게시판이 아니면.. 원래 게시판 URL로 forward
	    //-------------------------------
	    if (!bmvo.getBbsTyCode().equals("BBST02")) {
	    	return "forward:/cop/bbs/forUpdateBoardArticle.fo";
	    }
	    ////-----------------------------

	    //-------------------------------
	    // 패스워드 비교
	    //-------------------------------
	    String dbpassword = bbsMngService.getPasswordInf(boardVO);
	    String enpassword = EgovFileScrty.encryptPassword(boardVO.getPassword(), boardVO.getBbsId());

	    if (!dbpassword.equals(enpassword)) {

		model.addAttribute("msg", egovMessageSource.getMessage("cop.password.not.same.msg"));

		return "forward:/cop/bbs/anonymous/selectBoardArticle.fo";
	    }
	    ////-----------------------------

	    bdvo = bbsMngService.selectBoardArticle(boardVO);
	}

	model.addAttribute("result", bdvo);
	model.addAttribute("bdMstr", bmvo);

	//----------------------------
	// 기본 BBS template 지정
	//----------------------------
	if (bmvo.getTmplatCours() == null || bmvo.getTmplatCours().equals("")) {
	    bmvo.setTmplatCours("/css/egovframework/cop/tpl/egovBaseTemplate.css");
	}

	model.addAttribute("brdMstrVO", bmvo);
	////-----------------------------

	model.addAttribute("anonymous", "true");

	return "egovframework/fox/com/cop/bbs/FoxNoticeUpdt";
    }

    /**
     * 익명게시물에 대한 내용을 수정한다.
     *
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/anonymous/updateBoardArticle.fo")
    public String updateAnonymousBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model,
	    SessionStatus status) throws Exception {

	//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	//Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	Boolean isAuthenticated = true;

	String atchFileId = boardVO.getAtchFileId();

	beanValidator.validate(board, bindingResult);
	if (bindingResult.hasErrors()) {

	    boardVO.setFrstRegisterId("ANONYMOUS");

	    BoardMaster master = new BoardMaster();
	    BoardMasterVO bmvo = new BoardMasterVO();
	    BoardVO bdvo = new BoardVO();

	    master.setBbsId(boardVO.getBbsId());
	    master.setUniqId("ANONYMOUS");

	    bmvo = bbsAttrbService.selectBBSMasterInf(master);

	    //-------------------------------
	    // 익명게시판이 아니면.. 원래 게시판 URL로 forward
	    //-------------------------------
	    if (!bdMstr.getBbsTyCode().equals("BBST02")) {
	    	return "forward:/cop/bbs/updateBoardArticle.fo";
	    }
	    ////-----------------------------

	    bdvo = bbsMngService.selectBoardArticle(boardVO);

	    model.addAttribute("result", bdvo);
	    model.addAttribute("bdMstr", bmvo);

	    model.addAttribute("anonymous", "true");

	    return "egovframework/fox/com/cop/bbs/FoxNoticeUpdt";
	}

	if (isAuthenticated) {
	    final Map<String, MultipartFile> files = multiRequest.getFileMap();
	    if (!files.isEmpty()) {
		if ("".equals(atchFileId)) {
		    List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, atchFileId, "");
		    atchFileId = fileMngService.insertFileInfs(result);
		    board.setAtchFileId(atchFileId);
		} else {
		    FileVO fvo = new FileVO();
		    fvo.setAtchFileId(atchFileId);
		    int cnt = fileMngService.getMaxFileSN(fvo);
		    List<FileVO> _result = fileUtil.parseFileInf(files, "BBS_", cnt, atchFileId, "");
		    fileMngService.updateFileInfs(_result);
		}
	    }

	    board.setLastUpdusrId("ANONYMOUS");

	    // 익명게시판 관련
	    board.setNtcrNm(board.getNtcrNm());
	    board.setPassword(EgovFileScrty.encryptPassword(board.getPassword(), board.getBbsId()));

	    board.setNttCn(unscript(board.getNttCn()));	// XSS 방지

	    bbsMngService.updateBoardArticle(board);
	}

	return "redirect:/cop/bbs/anonymous/selectBoardList.fo?bbsId="+board.getBbsId();
    }

    /**
     * 익명게시물에 대한 답변 등록을 위한 등록페이지로 이동한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/anonymous/addReplyBoardArticle.fo")
    public String addAnonymousReplyBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
	//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	BoardMasterVO master = new BoardMasterVO();
	BoardMasterVO vo = new BoardMasterVO();

	vo.setBbsId(boardVO.getBbsId());
	vo.setUniqId("ANONYMOUS");

	master = bbsAttrbService.selectBBSMasterInf(vo);

	//-------------------------------
	// 익명게시판이 아니면.. 원래 게시판 URL로 forward
	//-------------------------------
	if (!master.getBbsTyCode().equals("BBST02")) {
		return "forward:/cop/bbs/addReplyBoardArticle.fo";
	}
	////-----------------------------

	model.addAttribute("bdMstr", master);
	model.addAttribute("result", boardVO);

	//----------------------------
	// 기본 BBS template 지정
	//----------------------------
	if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
	    master.setTmplatCours("/css/egovframework/cop/tpl/egovBaseTemplate.css");
	}

	model.addAttribute("brdMstrVO", master);
	////-----------------------------

	model.addAttribute("anonymous", "true");

	return "egovframework/fox/com/cop/bbs/FoxNoticeReply";
    }

    /**
     * 익명게시물에 대한 답변을 등록한다.
     *
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/anonymous/replyBoardArticle.fo")
    public String replyAnonymousBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model,
	    SessionStatus status) throws Exception {

	//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	//Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	Boolean isAuthenticated = true;

	beanValidator.validate(board, bindingResult);
	if (bindingResult.hasErrors()) {
	    BoardMasterVO master = new BoardMasterVO();
	    BoardMasterVO vo = new BoardMasterVO();

	    vo.setBbsId(boardVO.getBbsId());
	    vo.setUniqId("ANONYMOUS");

	    master = bbsAttrbService.selectBBSMasterInf(vo);

		//-------------------------------
		// 익명게시판이 아니면.. 원래 게시판 URL로 forward
		//-------------------------------
		if (!master.getBbsTyCode().equals("BBST02")) {
			return "forward:/cop/bbs/replyBoardArticle.fo";
		}
		////-----------------------------

	    model.addAttribute("bdMstr", master);
	    model.addAttribute("result", boardVO);

	    //----------------------------
	    // 기본 BBS template 지정
	    //----------------------------
	    if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
		master.setTmplatCours("/css/egovframework/cop/tpl/egovBaseTemplate.css");
	    }

	    model.addAttribute("brdMstrVO", master);
	    ////-----------------------------

	    model.addAttribute("anonymous", "true");

	    return "egovframework/fox/com/cop/bbs/FoxNoticeReply";
	}

	if (isAuthenticated) {
	    final Map<String, MultipartFile> files = multiRequest.getFileMap();
	    String atchFileId = "";

	    if (!files.isEmpty()) {
		List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
		atchFileId = fileMngService.insertFileInfs(result);
	    }

	    board.setAtchFileId(atchFileId);
	    board.setReplyAt("Y");
	    board.setFrstRegisterId("ANONYMOUS");
	    board.setBbsId(board.getBbsId());
	    board.setParnts(Long.toString(boardVO.getNttId()));
	    board.setSortOrdr(boardVO.getSortOrdr());
	    board.setReplyLc(Integer.toString(Integer.parseInt(boardVO.getReplyLc()) + 1));

	    // 익명게시판 관련
	    board.setNtcrNm(board.getNtcrNm());
	    board.setPassword(EgovFileScrty.encryptPassword(board.getPassword(), board.getBbsId()));

	    board.setNttCn(unscript(board.getNttCn()));	// XSS 방지

	    bbsMngService.insertBoardArticle(board);
	}

	return "redirect:/cop/bbs/anonymous/selectBoardList.fo?bbsId="+board.getBbsId();
    }

    /**
     * 템플릿에 대한 미리보기용 게시물 목록을 조회한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/previewBoardList.fo")
    public String previewBoardArticles(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
	//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	String template = boardVO.getSearchWrd();	// 템플릿 URL

	BoardMasterVO master = new BoardMasterVO();

	master.setBbsNm("미리보기 게시판");

	boardVO.setPageUnit(propertyService.getInt("pageUnit"));
	boardVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();

	paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(10);
	paginationInfo.setPageSize(1);

	boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
	boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	BoardVO target = null;
	List<BoardVO> list = new ArrayList<BoardVO>();

	target = new BoardVO();
	target.setNttSj("게시판 기능 설명");
	target.setFrstRegisterId("ID");
	target.setFrstRegisterNm("관리자");
	target.setFrstRegisterPnttm("2009-01-01");
	target.setInqireCo(7);
	target.setParnts("0");
	target.setReplyAt("N");
	target.setReplyLc("0");
	target.setUseAt("Y");

	list.add(target);

	target = new BoardVO();
	target.setNttSj("게시판 부가 기능 설명");
	target.setFrstRegisterId("ID");
	target.setFrstRegisterNm("관리자");
	target.setFrstRegisterPnttm("2009-01-01");
	target.setInqireCo(7);
	target.setParnts("0");
	target.setReplyAt("N");
	target.setReplyLc("0");
	target.setUseAt("Y");

	list.add(target);

	boardVO.setSearchWrd("");

	int totCnt = list.size();

	paginationInfo.setTotalRecordCount(totCnt);

	master.setTmplatCours(template);

	model.addAttribute("resultList", list);
	model.addAttribute("resultCnt", Integer.toString(totCnt));
	model.addAttribute("boardVO", boardVO);
	model.addAttribute("brdMstrVO", master);
	model.addAttribute("paginationInfo", paginationInfo);

	model.addAttribute("preview", "true");

	return "egovframework/fox/com/cop/bbs/FoxNoticeList";
    }
}
