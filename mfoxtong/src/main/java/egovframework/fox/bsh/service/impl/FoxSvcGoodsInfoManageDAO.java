package egovframework.fox.bsh.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.fox.bsh.service.FoxSvcGoodsInfoDefaultVO;
import egovframework.fox.bsh.service.FoxSvcGoodsInfoVO;




@Repository("foxSvcGoodsInfoManageDAO")
public class FoxSvcGoodsInfoManageDAO extends EgovComAbstractDAO {
	

	 /**
     * 서비스상품정보 조회
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return 등록결과
	 * @throws Exception   
	 */
	public FoxSvcGoodsInfoVO retrieveSvcGoodsInfo(FoxSvcGoodsInfoVO foxSvcGoodsInfoVO) throws Exception {
		
		return (FoxSvcGoodsInfoVO) select("foxSvcGoodsInfoManageDAO.selectSvcGoodsInfo", foxSvcGoodsInfoVO);
		
	}

	/**
	 * 서비스상품정보 등록
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return 등록결과
	 * @throws Exception   
	 */
	public String createSvcGoodsInfo(FoxSvcGoodsInfoVO foxSvcGoodsInfoVO) throws Exception{

		return (String)insert("foxSvcGoodsInfoManageDAO.insertSvcGoodsInfo", foxSvcGoodsInfoVO);
		
	}

	/**
	 * 서비스상품정보 수정
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return 등록결과
	 * @throws Exception   
	 */
	public void updateSvcGoodsInfo(FoxSvcGoodsInfoVO foxSvcGoodsInfoVO) throws Exception{
		
		   update("foxSvcGoodsInfoManageDAO.updateSvcGoodsInfo",foxSvcGoodsInfoVO);
		   
	}
	
	/**
	 * 서비스상품정보 삭제(수정)
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return 등록결과
	 * @throws Exception   
	 */
	public void deleteSvcGoodsInfo(FoxSvcGoodsInfoVO foxSvcGoodsInfoVO) throws Exception{
		
		 update("foxSvcGoodsInfoManageDAO.updateSvcGoodsInfoDelAt",foxSvcGoodsInfoVO);
		 
	}
	
	/**
	 * 서비스상품정보 목록 조회 
	 * @param foxBsshInfoDefaultVO 검색조건
	 * @return List<FoxSvcGoodsInfoVO> 
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<FoxSvcGoodsInfoVO> retrieveSvcGoodsInfoList(FoxSvcGoodsInfoVO foxSvcGoodsInfoVO) throws Exception{
		
		return (List<FoxSvcGoodsInfoVO>) list("foxSvcGoodsInfoManageDAO.selectSvcGoodsInfoList", foxSvcGoodsInfoVO);
		
		
	}

   /**
    * 서비스상품정보 목록 조회 건수 
    * @param foxSvcGoodsInfoVO 검색조건
    * @return 조회 건수 (int)
    * @throws Exception
    */
   public int retrieveSvcGoodsInfoListTotCnt(FoxSvcGoodsInfoDefaultVO foxSvcGoodsInfoDefaultVO) throws Exception{
   	
   	return (Integer)select("foxSvcGoodsInfoManageDAO.selectBsshInfoListTotCnt", foxSvcGoodsInfoDefaultVO);
   	
   }
   
	 /**
	 * 서비스상품분류관리: 등록
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return String 
	 * @throws Exception   
	 */
	public String createSvcGoodsCl(FoxSvcGoodsInfoVO foxSvcGoodsInfoVO) {
		return (String)insert("foxSvcGoodsInfoManageDAO.insertSvcGoodsCl", foxSvcGoodsInfoVO);
	}
	
	/**
	 * 서비스상품분류관리: 목록조회
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return String 
	 * @throws Exception   
	 */
	public List<FoxSvcGoodsInfoVO> retrieveSvcGoodsClList(FoxSvcGoodsInfoVO foxSvcGoodsInfoVO) {
		// TODO Auto-generated method stub
		return (List<FoxSvcGoodsInfoVO>) list("foxSvcGoodsInfoManageDAO.selectSvcGoodsClList", foxSvcGoodsInfoVO);
	}
	
	/**
	 * 서비스상품분류관리: 삭제
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return String 
	 * @throws Exception   
	 */
	public void deleteSvcGoodsCl(FoxSvcGoodsInfoVO foxSvcGoodsInfoVO) {
		// TODO Auto-generated method stub
		delete("foxSvcGoodsInfoManageDAO.deleteSvcGoodsCl", foxSvcGoodsInfoVO);
	}
	
	/**
	 * 서비스상품분류관리: 수정
	 * @param foxSvcGoodsInfVO 서비스상품정보
	 * @return String 
	 * @throws Exception   
	 */
	public void updateSvcGoodsCl(FoxSvcGoodsInfoVO foxSvcGoodsInfoVO) {
		// TODO Auto-generated method stub
		update("foxSvcGoodsInfoManageDAO.updateSvcGoodsCl",foxSvcGoodsInfoVO);
	}
	

	
	
	

	
	

		
	

}
