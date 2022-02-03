package egovframework.fox.bsh.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.fox.bsh.service.FoxBsshInfoDefaultVO;
import egovframework.fox.bsh.service.FoxBsshInfoManageVO;
import egovframework.fox.bsh.service.FoxEntrpsEmplyrSbscrbRequstVO;
import egovframework.fox.com.uss.umt.service.FoxMberManageVO;

/**
 * 업소기본정보에 대한 데이터 접근 클래스를 정의.
 * @author 공통서비스 개발팀 조재영
 * @since 2022.01.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2022.01.10 정수          최초 생성
 *
 * </pre>
 */
@Repository("foxBsshInfoManageDAO")
public class FoxBsshInfoManageDAO extends EgovComAbstractDAO { 
	
	 /**
     * 업소기본정보등록
     * @param foxMberManageVO 일반회원 등록정보
     * @return String 등록결과
     */
    public String createBsshInfo(FoxBsshInfoManageVO foxBsshInfoManageVO){
        return (String)insert("foxBsshInfoManageDAO.insertBsshInfo", foxBsshInfoManageVO);
    }       
    
    /**
     * 업소기본정보상세조회
     * @param bsshEsntlId 상세조회대상 
     * @return FoxBsshInfoManageVO 일반회원 상세정보
     */
    public FoxBsshInfoManageVO retrieveBsshInfo(String bsshEsntlId){
        return (FoxBsshInfoManageVO) select("foxBsshInfoManageDAO.selectBsshInfo", bsshEsntlId);
    }
    
    /**
     * 업소기본정보수정
     * @param FoxBsshInfoManageVO 일반회원수정정보
     */
    public void updateBsshInfo(FoxBsshInfoManageVO foxBsshInfoManageVO){
        update("foxBsshInfoManageDAO.updateBsshInfo",foxBsshInfoManageVO);
    }

    /**
     * 업소기본정보 목록조회 
     * @param foxBsshInfoDefaultVO 검색조건
     * @return List<FoxBsshInfoManageVO> 기업회원 목록정보
     */
    @SuppressWarnings("unchecked")
	public List<FoxBsshInfoManageVO> retrieveBsshInfoList(FoxBsshInfoDefaultVO foxBsshInfoDefaultVO){
        return (List<FoxBsshInfoManageVO>) list("foxBsshInfoManageDAO.selectBsshInfoList", foxBsshInfoDefaultVO);
    }

    /**
     * 업소기본정보 목록조회 수 
     * @param foxBsshInfoDefaultVO 검색조건
     * @return int 일반회원총갯수
     */
    public int retrieveBsshInfoListTotCnt(FoxBsshInfoDefaultVO foxBsshInfoDefaultVO) {
        return (Integer)select("foxBsshInfoManageDAO.selectBsshInfoListTotCnt", foxBsshInfoDefaultVO);
    }

    /**
     * 업체기본정보 삭제 (수정) 
     * @param delId 삭제 대상 
     */
    public void deleteBsshInfo(String delId){
        delete("foxBsshInfoManageDAO.deleteBsshInfo", delId);
    }

    /**
     * 회원 업소 매핑 등록 
     * @param 
     */
	public String createMberBsshMap(FoxBsshInfoManageVO foxBsshInfoManageVO) {
		
		return (String) insert("foxBsshInfoManageDAO.insertMberBsshMap", foxBsshInfoManageVO);
	}
	
	
	/**
	 *  회원의 업소고유 ID 목록 조회 
	 * @param 
	 * @return List<FoxBsshInfoManageVO> 일반회원목록정보˙
	 */
	public List<FoxBsshInfoManageVO> retrievBsshEsntlIdList(String esntlId) {
		
		return (List<FoxBsshInfoManageVO>) list("foxBsshInfoManageDAO.selectBsshEsntlIdList", esntlId);
		
	}
	
	/**
	 *  회원의 업소고유 ID 목록 조회 
	 * @param 
	 * @return List<FoxBsshInfoManageVO> 일반회원목록정보
	 */
	public FoxBsshInfoManageVO retrievBsshEsntlId(String esntlId) {
		
		return (FoxBsshInfoManageVO) select("foxBsshInfoManageDAO.selectBsshEsntlId", esntlId);
		
	}
	
	
    /**
     * 영업점기본정보 수정
     * @param foxBsshInfoDefaultVO 검색조건
     * @return 
     */
	public void updateBsnBassInfo(FoxBsshInfoManageVO foxBsshInfoManageVO) {
		
		update("foxBsshInfoManageDAO.updateBsnBassInfo",foxBsshInfoManageVO);
		
	}

	

                      

   

   

  
}