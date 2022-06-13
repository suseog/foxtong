package egovframework.fox.bsh.service;

import java.util.List;

/**
 * 일반회원관리에 관한 인터페이스클래스를 정의한다.
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
 *
 * </pre>
 */
public interface FoxBsshInfoManageService {

	/**
	 * 업소기본정보등록
	 * @param foxBsshInfoManageVO 일반회원 등록정보
	 * @return 등록결과
	 * @throws Exception
	 */
	public String createBsshInfo(FoxBsshInfoManageVO foxBsshInfoManageVO) throws Exception;

	/**
	 * 업소기본정보상세조회
	 * @parm bsshEsntlId	상세조회대상 업소고id
	 * @return foxBsshInfoManageVO 일반회원상세정보
	 * @throws Exception
	 */
	public FoxBsshInfoManageVO retrieveBsshInfo(String bsshEsntlId) throws Exception;
	
	/**
	 * 업소기본정보수정
	 * @param foxBsshInfoManageVO 업소기본정보
	 * @throws Exception
	 */
	public void updateBsshInfo(FoxBsshInfoManageVO foxBsshInfoManageVO) throws Exception;
	

	/**
	 * 업소기본정보 목록조회 
	 * @param foxBsshInfoDefaultVO 검색조건
	 * @return List<FoxBsshInfoManageVO> 
	 * @throws Exception
	 */
	public List<FoxBsshInfoManageVO> retrieveBsshInfoList(FoxBsshInfoDefaultVO foxBsshInfoDefaultVO) throws Exception;

    /**
     * 업소기본정보 목록조회 건수 
     * @param foxBsshInfoDefaultVO 검색조건
     * @return 업소기본정보 목록 수 (int)
     * @throws Exception
     */
    public int retrieveBsshInfoListTotCnt(FoxBsshInfoDefaultVO foxBsshInfoDefaultVO) throws Exception;



	/**
	 * 업소기본정보삭제 (수정) 
	 * @param bsshEsntlId 삭제대상 
	 * @throws Exception
	 */
	public void deleteBsshInfo(String bsshEsntlId) throws Exception;
	
	/**
	 * 업체사용자 가입요청  
	 * @param bsshEsntlId 
	 * @throws Exception
	 */
	public void entrpsEmplyrSbscrbRequst(FoxEntrpsEmplyrSbscrbRequstVO foxEntrpsEmplyrSbscrbRequstVO) throws Exception;
	
	
	/**
	 *  회원의 업소고유 ID 목록 조회 
	 * @param 
	 * @return List<FoxBsshInfoManageVO> 
	 */
	public List<FoxBsshInfoManageVO> retrievBsshEsntlIdList(String id) throws Exception;

	
	
	/**
	 *  영업기본정보 수정 
	 * @param 
	 * @return List<FoxBsshInfoManageVO> 
	 */
	public void updateBsnBassInfo(FoxBsshInfoManageVO foxBsshInfoManageVO)throws Exception;

	/**
	 *  회원의 업소고유 ID  조회 
	 * @param 
	 * @return List<FoxBsshInfoManageVO> 
	 */
	public FoxBsshInfoManageVO retrievBsshEsntlId(String esntlId);

	/**
	 * 업소의 시군구 코드 리스트 조회 
	 * @param 
	 * @return List<FoxBsshInfoManageVO> 
	 */
	public List<FoxBsshInfoManageVO> retrieveSignguCodeList(FoxBsshInfoDefaultVO foxBsshInfoDefaultVO);
	
	
}

	