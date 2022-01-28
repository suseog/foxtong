package egovframework.fox.bsh.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.fox.bsh.service.FoxSvcGoodsInfoDefaultVO;
import egovframework.fox.bsh.service.FoxSvcGoodsInfoManageService;
import egovframework.fox.bsh.service.FoxSvcGoodsInfoVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 일반회원관리에 관한비지니스클래스를 정의한다.
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


@Service("foxSvcGoodsInfoManageService")
public class FoxSvcGoodsInfoManageServiceImpl extends EgovAbstractServiceImpl implements FoxSvcGoodsInfoManageService {
	
	/** foxSvcGoodsInfoManageDAO */
	@Resource(name="foxSvcGoodsInfoManageDAO")
	private FoxSvcGoodsInfoManageDAO foxSvcGoodsInfoManageDAO;
	

	/** egovUsrCnfrmIdGnrService */
	@Resource(name="egovUsrCnfrmIdGnrService")
	private EgovIdGnrService idgenService;
	
	/**
	 * 서비스상품정보 조회
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return 등록결과
	 * @throws Exception   
	 */
	@Override
	public FoxSvcGoodsInfoVO retrieveSvcGoodsInfo(FoxSvcGoodsInfoVO foxSvcGoodsInfoVO) throws Exception {
		
//		FoxSvcGoodsInfoVO vo = new FoxSvcGoodsInfoVO();
		
		FoxSvcGoodsInfoVO resultFoxSvcGoodsInfoVO = foxSvcGoodsInfoManageDAO.retrieveSvcGoodsInfo(foxSvcGoodsInfoVO);
		
		
		return resultFoxSvcGoodsInfoVO;
		
	}

	/**
	 * 서비스상품정보 등록
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return 등록결과
	 * @throws Exception   
	 */
	@Override
	public String createSvcGoodsInfo(FoxSvcGoodsInfoVO foxSvcGoodsInfoVO) throws Exception{
		
		//고유아이디 셋팅
		String uniqId = idgenService.getNextStringId();
		foxSvcGoodsInfoVO.setSvcId(uniqId);
		
		
		String result = foxSvcGoodsInfoManageDAO.createSvcGoodsInfo(foxSvcGoodsInfoVO);
		return result;
	}

	/**
	 * 서비스상품정보 수정
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return 등록결과
	 * @throws Exception   
	 */
	@Override
	public void updateSvcGoodsInfo(FoxSvcGoodsInfoVO foxSvcGoodsInfoVO) throws Exception{
		
	}
	
	/**
	 * 서비스상품정보 삭제(수정)
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return 등록결과
	 * @throws Exception   
	 */
	@Override
	public void deleteSvcGoodsInfo(FoxSvcGoodsInfoVO foxSvcGoodsInfoVO) throws Exception{
		
	}
	
	
	/**
	 * 서비스상품정보 목록 조회 
	 * @param foxBsshInfoDefaultVO 검색조건
	 * @return List<FoxSvcGoodsInfoVO> 
	 * @throws Exception
	 */
	@Override
	public List<FoxSvcGoodsInfoVO> retrieveSvcGoodsInfoList(FoxSvcGoodsInfoVO foxSvcGoodsInfoVO) throws Exception{
		
		//List<FoxSvcGoodsInfoVO> list = new ArrayList<FoxSvcGoodsInfoVO>();
		
		return (List<FoxSvcGoodsInfoVO>) foxSvcGoodsInfoManageDAO.retrieveSvcGoodsInfoList(foxSvcGoodsInfoVO);
		
	}

    /**
     * 서비스상품정보 목록 조회 건수 
     * @param foxSvcGoodsInfoVO 검색조건
     * @return 업소기본정보 목록 수 (int)
     * @throws Exception
     */
	@Override
    public int retrieveSvcGoodsInfoListTotCnt(FoxSvcGoodsInfoDefaultVO foxSvcGoodsInfoDefaultVO) throws Exception{
    	
    	int cnt = 0;
    	
    	
    	return cnt;
    }
    
    




}