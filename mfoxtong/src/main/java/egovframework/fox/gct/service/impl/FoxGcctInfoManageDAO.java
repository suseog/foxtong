package egovframework.fox.gct.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.fox.bsh.service.FoxBsshInfoManageVO;
import egovframework.fox.gct.service.FoxGcctInfoDefaultVO;
import egovframework.fox.gct.service.FoxGcctInfoVO;


@Repository("foxGcctInfoManageDAO")
public class FoxGcctInfoManageDAO extends EgovComAbstractDAO {

	/**
	 * 상품권 조회 목록  
	 * @param 
	 * @return 상품권 조회 목록   
	 * @throws Exception   
	 */
	public List<FoxGcctInfoVO> retrieveGcctInfoList(FoxGcctInfoDefaultVO foxGcctInfoDefaultVO) {
		return (List<FoxGcctInfoVO>) list("foxGcctInfoManageDAO.selectGcctInfoList", foxGcctInfoDefaultVO);
		
	}

	/**
	 * 상품권조회 
	 * @param 상품권 정보 키값 
	 * @return 상품권정보   
	 * @throws Exception   
	 */
	public FoxGcctInfoVO retrieveGcctInfo(FoxGcctInfoVO foxGcctInfoVO) {
		return (FoxGcctInfoVO) select("foxGcctInfoManageDAO.selectGcctInfo", foxGcctInfoVO);
	}

	/**
	 * 상품권등록  
	 * @param  
	 * @return 상품권 등록 결과   
	 * @throws Exception   
	 */
	
	public void createGcctInfo(FoxGcctInfoVO foxGcctInfoVO) {
		// TODO Auto-generated method stub
		//return (String)insert("foxGcctInfoManageDAO.insertGcctInfo", foxGcctInfoVO);	
		insert("foxGcctInfoManageDAO.insertGcctInfo", foxGcctInfoVO);	
	}
	/**
	 * 상품권수정 
	 * @param  
	 * @return 상품권 등록 결과   
	 * @throws Exception   
	 */

	public void updateGcctInfo(FoxGcctInfoVO foxGcctInfoVO) {
		// TODO Auto-generated method stub
		update("foxGcctInfoManageDAO.updateGcctInfo", foxGcctInfoVO);	
		
	}
	/**
	 * 상품권 삭제 
	 * @param  
	 * @return 상품권 삭제 결과   
	 * @throws Exception   
	 */

	public void deleteGcctInfo(FoxGcctInfoVO foxGcctInfoVO) {
		// TODO Auto-generated method stub
		delete("foxGcctInfoManageDAO.deleteGcctInfo", foxGcctInfoVO);	
	}


	/**
	 * 사용자 상품권등록  
	 * @param  
	 * @return 사용자 상품권등록 결과   
	 * @throws Exception   
	 */
	
	public void createEmplyrGcctInfo(FoxGcctInfoVO foxGcctInfoVO) {
		// TODO Auto-generated method stub
			
		insert("foxGcctInfoManageDAO.insertEmplyrGcctInfo", foxGcctInfoVO);	
	}
	/**
	 * 사용자 상품권등록  
	 * @param  
	 * @return 사용자 상품권등록 결과   
	 * @throws Exception   
	 */
	
	public void deleteEmplyrGcctInfo(FoxGcctInfoVO foxGcctInfoVO) {
		// TODO Auto-generated method stub
			
		delete("foxGcctInfoManageDAO.deleteEmplyrGcctInfo", foxGcctInfoVO);	
		
	}
		/**
		 * 상품권 조회 목록  
		 * @param 
		 * @return 상품권 조회 목록   
		 * @throws Exception   
		 */
				
		public List<FoxGcctInfoVO> retrieveGcctInfoList_new(FoxGcctInfoDefaultVO foxGcctInfoDefaultVO) {
			return (List<FoxGcctInfoVO>) list("foxGcctInfoManageDAO.selectGcctInfoList_new", foxGcctInfoDefaultVO);
			
		}
		
		public void updatelatlongGcctInfo(FoxGcctInfoVO foxGcctInfoVO) {
			// TODO Auto-generated method stub
			update("foxGcctInfoManageDAO.updatelatlongGcctInfo", foxGcctInfoVO);	
			
		}
		
}
