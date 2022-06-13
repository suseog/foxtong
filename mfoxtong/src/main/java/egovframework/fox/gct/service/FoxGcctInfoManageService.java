package egovframework.fox.gct.service;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.fox.bsh.service.FoxBsshInfoManageVO;

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
 *   2022.02.09  kdg          최초 생성
 *
 * </pre>
 */
public interface FoxGcctInfoManageService {	
	/**
	 * 상품권 조회 목록  
	 * @param 
	 * @return 상품권 조회 목록   
	 * @throws Exception   
	 */

	public List<FoxGcctInfoVO> retrieveGcctInfoList( FoxGcctInfoDefaultVO foxGcctInfoDefaultVO) 
			throws Exception;
	
	/**
	 * 상품권조회 
	 * @param 상품권 정보 키값 
	 * @return 상품권정보   
	 * @throws Exception   
	 */
	public FoxGcctInfoVO retrieveGcctInfo( FoxGcctInfoVO foxGcctInfoVO  ) 
			throws Exception;
	
	/**
	 * 상품권등록  
	 * @param  
	 * @return 상품권 등록 결과   
	 * @throws Exception   
	 */
	public void createGcctInfo( FoxGcctInfoVO foxGcctInfoVO  ) 
			throws Exception;	
	
	/**
	 * 상품권수정 
	 * @param  
	 * @return 상품권 등록 결과   
	 * @throws Exception   
	 */
	public void updateGcctInfo( FoxGcctInfoVO foxGcctInfoVO  ) 
			throws Exception;
	
	/**
	 * 상품권 삭제 
	 * @param  
	 * @return 상품권 삭제 결과   
	 * @throws Exception   
	 */
	public void deleteGcctInfo( FoxGcctInfoVO foxGcctInfoVO  ) 
			throws Exception;
	
	/**
	 * 사용자 상품권 등록 
	 * @param  
	 * @return    
	 * @throws Exception   
	 */
	public void createEmplyrGcctInfo( FoxGcctInfoVO foxGcctInfoVO  ) 
			throws Exception;
	
	/**
	 * 사용자 상품권 삭제 
	 * @param  
	 * @return    
	 * @throws Exception   
	 */
	public void deleteEmplyrGcctInfo( FoxGcctInfoVO foxGcctInfoVO  ) 
			throws Exception;
	
	/**
	 * 위경도 변경을 위한 조회
	 * @param  
	 * @return    
	 * @throws Exception   
	 */
	public List<FoxGcctInfoVO> retrieveGcctInfoList_new( FoxGcctInfoDefaultVO foxGcctInfoDefaultVO) 
			throws Exception;
	
	
	public void updatelatlongGcctInfo( FoxGcctInfoVO foxGcctInfoVO  ) 
			throws Exception;	
	
			
}