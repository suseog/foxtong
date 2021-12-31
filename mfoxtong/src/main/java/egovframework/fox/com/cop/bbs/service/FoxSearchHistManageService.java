package egovframework.fox.com.cop.bbs.service;

import java.util.Map;


/**
 * 게시물 관리를 위한 서비스 인터페이스  클래스
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
 *   2021.12.27  정수          최초 생성
 *
 * </pre>
 */
public interface FoxSearchHistManageService {


    /**
     * 검색이력 등록 
     * 
     * @param Board
     * @throws Exception
     */
    public void insertBoardSearchHist(SearchBoardHist searchHist) throws Exception;
    
    
    /**
     * 최신 검색 top5  
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectBoarSearchHitFive(SearchBoardHist searchHist) throws Exception;
    
    
    /**
     * 검색이력목록조회 
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectBoarSearchHistList(SearchBoardHist searchHist) throws Exception;

    /**
     * 게시물 한 건의 내용을 수정 한다.
     * 
     * @param Board
     * @throws Exception
     */
    public void updateBoarSearchHistList (SearchBoardHist searchHist) throws Exception;


}
