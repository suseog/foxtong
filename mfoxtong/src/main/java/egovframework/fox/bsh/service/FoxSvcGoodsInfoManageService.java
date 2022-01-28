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
public interface FoxSvcGoodsInfoManageService {
	
	/**
	 * 서비스상품정보 조회
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return FoxSvcGoodsInfoVO
	 * @throws Exception   
	 */
	public FoxSvcGoodsInfoVO retrieveSvcGoodsInfo(FoxSvcGoodsInfoVO foxSvcGoodsInfoVO) throws Exception;	
	

	/**
	 * 서비스상품정보 등록
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return 등록결과
	 * @throws Exception   
	 */
	public String createSvcGoodsInfo(FoxSvcGoodsInfoVO foxSvcGoodsInfoVO) throws Exception;
	

	/**
	 * 서비스상품정보 수정
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return 등록결과
	 * @throws Exception   
	 */
	public void updateSvcGoodsInfo(FoxSvcGoodsInfoVO foxSvcGoodsInfoVO) throws Exception;	
	
	
	/**
	 * 서비스상품정보 삭제(수정)
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return 등록결과
	 * @throws Exception   
	 */
	public void deleteSvcGoodsInfo(FoxSvcGoodsInfoVO foxSvcGoodsInfoVO) throws Exception;	
	
	
	/**
	 * 서비스상품정보 목록 조회 
	 * @param foxBsshInfoDefaultVO 검색조건
	 * @return List<FoxSvcGoodsInfoVO> 
	 * @throws Exception
	 */
	public List<FoxSvcGoodsInfoVO> retrieveSvcGoodsInfoList(FoxSvcGoodsInfoVO foxSvcGoodsInfoVO ) throws Exception;

    /**
     * 서비스상품정보 목록 조회 건수 
     * @param foxSvcGoodsInfoVO 검색조건
     * @return 업소기본정보 목록 수 (int)
     * @throws Exception
     */
    public int retrieveSvcGoodsInfoListTotCnt(FoxSvcGoodsInfoDefaultVO foxSvcGoodsInfoDefaultVO) throws Exception;
    
    
	
	
}

	