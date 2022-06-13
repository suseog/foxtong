package egovframework.fox.gct.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.fox.bsh.service.FoxSvcGoodsInfoVO;
import egovframework.fox.bsh.service.impl.FoxBsshInfoManageDAO;
import egovframework.fox.gct.service.FoxGcctInfoDefaultVO;
import egovframework.fox.gct.service.FoxGcctInfoManageService;
import egovframework.fox.gct.service.FoxGcctInfoVO;

@Service("foxGcctInfoManageService")
public class FoxGcctInfoManageServiceImpl implements FoxGcctInfoManageService {	
	
	/** foxGcctInfoManageDAO */
	@Resource(name="foxGcctInfoManageDAO")
	private FoxGcctInfoManageDAO foxGcctInfoManageDAO;	
	
	/**
	 * 상품권 조회 목록  
	 * @param 
	 * @return 상품권 조회 목록   
	 * @throws Exception   
	 */
	@Override
	public List<FoxGcctInfoVO> retrieveGcctInfoList( FoxGcctInfoDefaultVO foxGcctInfoDefaultVO) 
			throws Exception{
		
		//List<FoxGcctInfoVO> list = foxGcctInfoManageDAO.retrieveGcctInfoList(foxGcctInfoDefaultVO);
		//return list;
		return (List<FoxGcctInfoVO>) foxGcctInfoManageDAO.retrieveGcctInfoList(foxGcctInfoDefaultVO);
		
	}
	
	/**
	 * 상품권조회 
	 * @param 상품권 정보 키값 
	 * @return 상품권정보   
	 * @throws Exception   
	 */
	@Override
	public FoxGcctInfoVO retrieveGcctInfo( FoxGcctInfoVO foxGcctInfoVO  ) 
			throws Exception{
		
		FoxGcctInfoVO resultVo = new FoxGcctInfoVO();
		resultVo = foxGcctInfoManageDAO.retrieveGcctInfo(foxGcctInfoVO);		
		
		return resultVo;		
	}
		
	/**
	 * 상품권등록  
	 * @param  
	 * @return 상품권 등록 결과   
	 * @throws Exception   
	 */
	@Override
	public void createGcctInfo( FoxGcctInfoVO foxGcctInfoVO  ) 
			throws Exception{
		
		foxGcctInfoManageDAO.createGcctInfo(foxGcctInfoVO);
		
	}
	
	
	/**
	 * 상품권수정 
	 * @param  
	 * @return 상품권 등록 결과   
	 * @throws Exception   
	 */
	@Override
	public void updateGcctInfo( FoxGcctInfoVO foxGcctInfoVO  ) 
			throws Exception{
			
		foxGcctInfoManageDAO.updateGcctInfo(foxGcctInfoVO);
		
	}
	
	/**
	 * 상품권 삭제 
	 * @param  
	 * @return 상품권 삭제 결과   
	 * @throws Exception   
	 */
	@Override
	public void deleteGcctInfo( FoxGcctInfoVO foxGcctInfoVO  ) 
			throws Exception{
		
		foxGcctInfoManageDAO.deleteGcctInfo(foxGcctInfoVO);
	}
	
	
	/**
	 * 사용자 상품권 등 
	 * @param  
	 * @return 상품권 등 결과   
	 * @throws Exception   
	 */
	@Override
	public void createEmplyrGcctInfo( FoxGcctInfoVO foxGcctInfoVO  ) 
			throws Exception{
		
		foxGcctInfoManageDAO.createEmplyrGcctInfo(foxGcctInfoVO);
	}
	
	/**
	 * 사용자 상품권 삭제 
	 * @param  
	 * @return 상품권 삭제 결과   
	 * @throws Exception   
	 */
	@Override
	public void deleteEmplyrGcctInfo( FoxGcctInfoVO foxGcctInfoVO  ) 
			throws Exception{
		
		foxGcctInfoManageDAO.deleteEmplyrGcctInfo(foxGcctInfoVO);
	}
	
	/**
	 * 위경도 업데이트를 위한 조회 
	 * @param  
	 * @return   
	 * @throws Exception   
	 */
	@Override
	public List<FoxGcctInfoVO> retrieveGcctInfoList_new( FoxGcctInfoDefaultVO foxGcctInfoDefaultVO) 
			throws Exception{
		
		return (List<FoxGcctInfoVO>) foxGcctInfoManageDAO.retrieveGcctInfoList_new(foxGcctInfoDefaultVO);
		
	}
	
	@Override
	public void updatelatlongGcctInfo( FoxGcctInfoVO foxGcctInfoVO  ) 
			throws Exception{
		
		foxGcctInfoManageDAO.updatelatlongGcctInfo(foxGcctInfoVO);
	}
	
	
	
	
}