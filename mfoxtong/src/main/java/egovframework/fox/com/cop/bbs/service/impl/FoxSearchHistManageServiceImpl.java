package egovframework.fox.com.cop.bbs.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cop.bbs.service.Board;
import egovframework.fox.com.cop.bbs.service.FoxSearchHistManageService;
import egovframework.fox.com.cop.bbs.service.SearchBoardHist;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 게시물 관리를 위한 서비스 구현 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일     	수정자           수정내용
 *  -----------    --------    ---------------------------
 *   2009.03.19  	이삼섭          최초 생성
 *	 2011.09.22 	서준식          nttId IdGen 서비스로 변경
 *	 2014.02.21		이기하          답글에 대한 nttId 생성
 * </pre>
 */
@Service("FoxSearchHistManageService")
public class FoxSearchHistManageServiceImpl extends EgovAbstractServiceImpl implements FoxSearchHistManageService {

    @Resource(name = "FoxSearchHistManageDAO")
    private FoxSearchHistManageDAO foxSearchHistManageDAO;


    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name = "egovNttIdGnrService")
    private EgovIdGnrService nttIdgenService;


    
    /**
     * 검색이력 등록 
     * 사용자가 검색어 검색시 검색이력을 등록한다. 
     *
     * @see 
     */
    public void insertBoardSearchHist(SearchBoardHist searchBoardHist) throws Exception {
	
    	    searchBoardHist.setSn(foxSearchHistManageDAO.selectMaxSn(searchBoardHist));
		    foxSearchHistManageDAO.insertBoardSearchHist(searchBoardHist);
	
    }
    
    /**
     * 최신 top5 검색이력목록 조회 
     * 사용자별 검색이력 목록을 조회한다. 
     *
     * @see egovframework.com.cop.bbs.FoxSearchHistManageService.service.EgovBBSManageService#selectBoardArticles(egovframework.com.cop.bbs.brd.service.BoardVO)
     */
    public Map<String, Object> selectBoarSearchHitFive(SearchBoardHist searchBoardHist) throws Exception {
	
    	List<SearchBoardHist> result = foxSearchHistManageDAO.selectBoarSearchHitFive(searchBoardHist); 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", result);
		return map;
    }
 

	/**
     * 검색이력목록 조회 
     * 사용자별 검색이력 목록을 조회한다. 
     *
     * @see egovframework.com.cop.bbs.FoxSearchHistManageService.service.EgovBBSManageService#selectBoardArticles(egovframework.com.cop.bbs.brd.service.BoardVO)
     */
    public Map<String, Object> selectBoarSearchHistList(SearchBoardHist searchBoardHist) throws Exception {
	
    	List<SearchBoardHist> result = foxSearchHistManageDAO.selectBoarSearchHistList(searchBoardHist); 
	
    	int cnt =0;
	    cnt = foxSearchHistManageDAO.selectBoarSearchHistListCnt(searchBoardHist);
    	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));
	
		return map;
    }
    
    

    /**
     * 게시물 한 건의 내용을 수정 한다.
     *
     * @see egovframework.com.cop.bbs.FoxSearchHistManageService.service.EgovBBSManageService#updateBoardArticle(egovframework.com.cop.bbs.brd.service.Board)
     */
    public void updateBoarSearchHistList(SearchBoardHist searchBoardHist) throws Exception {
    	foxSearchHistManageDAO.updateBoarSearchHistList(searchBoardHist);
    }


	
    
}
