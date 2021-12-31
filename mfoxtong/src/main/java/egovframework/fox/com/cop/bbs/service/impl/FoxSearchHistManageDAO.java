package egovframework.fox.com.cop.bbs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.fox.com.cop.bbs.service.SearchBoardHist;

/**
 * 게시물 관리를 위한 데이터 접근 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------      --------    ---------------------------
 *   2009.3.19  이삼섭          최초 생성
 *   2011.09.22 서준식          nttId IdGen 서비스로 변경
 * </pre>
 */
@Repository("FoxSearchHistManageDAO")
public class FoxSearchHistManageDAO extends EgovComAbstractDAO {

    /**
     * 게시판에 게시물을 등록 한다.
     * 
     * @param searchBoardHist
     * @throws Exception
     */
    public void insertBoardSearchHist(SearchBoardHist searchBoardHist) throws Exception {
	
	insert("FoxSearchHistManageDAO.insertBoardSearchHist", searchBoardHist);
    }
    

    /**
     * 조건에 맞는 게시물 목록을 조회 한다.
     * 
     * @param searchBoardHist
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<SearchBoardHist> selectBoarSearchHitFive(SearchBoardHist searchBoardHist) throws Exception {
	return (List<SearchBoardHist>) list("FoxSearchHistManageDAO.selectBoarSearchHitFive", searchBoardHist);
    }
    
    /**
     * 조건에 맞는 게시물 목록을 조회 한다.
     * 
     * @param searchBoardHist
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<SearchBoardHist> selectBoarSearchHistList(SearchBoardHist searchBoardHist) throws Exception {
	return (List<SearchBoardHist>) list("FoxSearchHistManageDAO.selectBoarSearchHistList", searchBoardHist);
    }
    
    

    /**
     * 조건에 맞는 게시물 목록에 대한 전체 건수를 조회 한다.
     * 
     * @param searchBoardHist
     * @return
     * @throws Exception
     */
    public int selectBoarSearchHistListCnt(SearchBoardHist searchBoardHist) throws Exception {
	return (Integer)select("FoxSearchHistManageDAO.selectBoarSearchHistListCnt", searchBoardHist);
    }

    /**
     * 게시물 한 건의 내용을 수정 한다.
     * 
     * @param SearchBoardHist
     * @throws Exception
     */
    public void updateBoarSearchHistList(SearchBoardHist searchBoardHist) throws Exception {
    	update("FoxSearchHistManageDAO.updateBoarSearchHistList", searchBoardHist);
    }


    /**
     *  번호의 최대값을 구한다.
     * 
     * @param searchBoardHist
     * @return
     * @throws Exception   
     */
    public int selectMaxSn(SearchBoardHist searchBoardHist) throws Exception {
	return (int)select("FoxSearchHistManageDAO.selectMaxSn", searchBoardHist);
    }
    
}
