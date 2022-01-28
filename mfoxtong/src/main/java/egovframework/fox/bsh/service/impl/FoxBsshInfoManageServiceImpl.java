package egovframework.fox.bsh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.fox.bsh.service.FoxBsshInfoDefaultVO;
import egovframework.fox.bsh.service.FoxBsshInfoManageService;
import egovframework.fox.bsh.service.FoxBsshInfoManageVO;
import egovframework.fox.bsh.service.FoxEntrpsEmplyrSbscrbRequstVO;
import egovframework.fox.com.uss.umt.service.FoxMberManageService;
import egovframework.fox.com.uss.umt.service.FoxMberManageVO;
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


@Service("foxBsshInfoManageService")
public class FoxBsshInfoManageServiceImpl extends EgovAbstractServiceImpl implements FoxBsshInfoManageService {

	/** foxBsshInfoManageDAO */
	@Resource(name="foxBsshInfoManageDAO")
	private FoxBsshInfoManageDAO foxBsshInfoManageDAO;

	/** egovUsrCnfrmIdGnrService */
	@Resource(name="egovUsrCnfrmIdGnrService")
	private EgovIdGnrService idgenService;
	
	/** mberManageService */
	@Resource(name = "foxMberManageService")
	private FoxMberManageService foxMberManageService;
	
	/**
	 * 업체사용자 가입요청  
	 * 처음 가입시 일반사용자 이며, 이후 본인의 업소를 등록요청 하는 기능 
	 * @param bsshEsntlId 
	 * @throws Exception
	 */
	public void entrpsEmplyrSbscrbRequst(FoxEntrpsEmplyrSbscrbRequstVO foxEntrpsEmplyrSbscrbRequstVO) throws Exception {
		
		// 사용자 고유 ID 셋팅 
		String esntlId = foxEntrpsEmplyrSbscrbRequstVO.getEsntlId();
		
        //업소 고유ID 셋팅
    	String bsshEsntlId = idgenService.getNextStringId();
		
		
		// 업소기본정보	
    	//vo를 둘로 나누어 등록 한다.
    	FoxBsshInfoManageVO vo = new FoxBsshInfoManageVO();
    	vo.setBsshEsntlId(bsshEsntlId);  
		vo.setCtgryId(foxEntrpsEmplyrSbscrbRequstVO.getCtgryId());
		vo.setMtltyNm(foxEntrpsEmplyrSbscrbRequstVO.getMtltyNm());
		vo.setBsshPhotoId(foxEntrpsEmplyrSbscrbRequstVO.getBsshPhotoId());
		vo.setMoblphonNo(foxEntrpsEmplyrSbscrbRequstVO.getMoblphonNo());

		vo.setBrtcCode(foxEntrpsEmplyrSbscrbRequstVO.getBrtcCode());
		vo.setSignguCode(foxEntrpsEmplyrSbscrbRequstVO.getSignguCode());
		vo.setDongCode(foxEntrpsEmplyrSbscrbRequstVO.getDongCode());

		// 주소영역 
		vo.setAdres(foxEntrpsEmplyrSbscrbRequstVO.getAdres());
		vo.setDetailAdres(foxEntrpsEmplyrSbscrbRequstVO.getDetailAdres());
		vo.setBsshCmpgnWords(foxEntrpsEmplyrSbscrbRequstVO.getBsshCmpgnWords());
		vo.setBuldNm(foxEntrpsEmplyrSbscrbRequstVO.getBuldNm());
		
		// 업체상태정보 
		vo.setCoprtnSttus(foxEntrpsEmplyrSbscrbRequstVO.getCoprtnSttus());
		vo.setBsnSttus(foxEntrpsEmplyrSbscrbRequstVO.getBsnSttus());
		
		
		// 업체기본정보 등록 
		String resulta = foxBsshInfoManageDAO.createBsshInfo(vo);
		
		// 매핑테이블 등록 
		foxEntrpsEmplyrSbscrbRequstVO.setEsntlId(esntlId);
		foxEntrpsEmplyrSbscrbRequstVO.setBsshEsntlId(bsshEsntlId);
		foxEntrpsEmplyrSbscrbRequstVO.setSbscrbSttus("01");
		String resultb= foxBsshInfoManageDAO.createMberBsshMap(foxEntrpsEmplyrSbscrbRequstVO);
		
		
		// 회웥구분 변경
		FoxMberManageVO foxMberManageVO = new FoxMberManageVO();
		foxMberManageVO.setEsntlId(esntlId);
		foxMberManageVO.setMberSe("02");
		foxMberManageService.updateMberSe(foxMberManageVO);
		
	}
	

	/**
	 * 업소기본정보등록
	 * @param foxBsshInfoManageVO 일반회원 등록정보
	 * @return 등록결과
	 * @throws Exception
	 */
	@Override
	public String createBsshInfo(FoxBsshInfoManageVO foxBsshInfoManageVO) throws Exception{
		
		//고유아이디 셋팅
		String uniqId = idgenService.getNextStringId();
		foxBsshInfoManageVO.setBsshEsntlId(uniqId);		
		
		String result = foxBsshInfoManageDAO.createBsshInfo(foxBsshInfoManageVO);
		
		return result;
	}

	/**
	 * 업소기본정보상세조회
	 * @parm 업소고id 	상세조회대상 업소고id
	 * @return foxBsshInfoManageVO 일반회원상세정보
	 * @throws Exception
	 */
	@Override
	public FoxBsshInfoManageVO retrieveBsshInfo(String bsshEsntlId) {
		
		FoxBsshInfoManageVO foxBsshInfoManageVO = foxBsshInfoManageDAO.retrieveBsshInfo(bsshEsntlId);
		return foxBsshInfoManageVO;
	}
	
	/**
	 * 업소기본정보 수정
	 * @param foxBsshInfoManageVO 일반회원수정정보
	 * @throws Exception
	 */
	@Override
	public void updateBsshInfo(FoxBsshInfoManageVO foxBsshInfoManageVO) throws Exception{
		
		foxBsshInfoManageDAO.updateBsshInfo(foxBsshInfoManageVO);
		
	}
	
	/**
	 * 영업기본정보 수정 
	 * @param foxBsshInfoManageVO 일반회원수정정보
	 * @throws Exception
	 */
	@Override
	public void updateBsnBassInfo(FoxBsshInfoManageVO foxBsshInfoManageVO) throws Exception {
		foxBsshInfoManageDAO.updateBsnBassInfo(foxBsshInfoManageVO);
		
	}
	
	
	/**
	 *  회원의 업소고유 ID 목록 조회 
	 * @param 
	 * @return List<FoxBsshInfoManageVO> 일반회원목록정보
	 */
	@Override
	public List<FoxBsshInfoManageVO> retrievBsshEsntlIdList(String esntlId) throws Exception{
		return foxBsshInfoManageDAO.retrievBsshEsntlIdList(esntlId);
	}
	 
	

	/**
	 * 기 등록된 회원 중 검색조건에 맞는 회원들의 정보를 데이터베이스에서 읽어와 화면에 출력
	 * @param userSearchVO 검색조건
	 * @return List<FoxBsshInfoManageVO> 일반회원목록정보
	 */
	@Override
	public List<FoxBsshInfoManageVO> retrieveBsshInfoList(FoxBsshInfoDefaultVO foxBsshInfoDefaultVO) throws Exception{
		return foxBsshInfoManageDAO.retrieveBsshInfoList(foxBsshInfoDefaultVO);
	}

    /**
     * 일반회원 총 갯수를 조회한다.
     * @param userSearchVO 검색조건
     * @return 일반회원총갯수(int)
     */
    @Override
    public int retrieveBsshInfoListTotCnt(FoxBsshInfoDefaultVO foxBsshInfoDefaultVO) throws Exception{
    	return foxBsshInfoManageDAO.retrieveBsshInfoListTotCnt(foxBsshInfoDefaultVO);
    }



	/**
	 * 화면에 조회된 사용자의 정보를 데이터베이스에서 삭제
	 * @param checkedIdForDel 삭제대상 일반회원아이디
	 * @throws Exception
	 */
	@Override
	public void deleteBsshInfo(String bsshEsntlId) throws Exception{
		
//		String [] delId = checkedIdForDel.split(",");
//		for (int i=0; i<delId.length ; i++){
//			String [] id = delId[i].split(":");
//			if (id[0].equals("USR03")){
//		        //업무사용자(직원)삭제
////				foxUserManageDAO.deleteUser(id[1]);
//			}else if(id[0].equals("USR01")){
//				//일반회원삭제
//				foxMberManageDAO.deleteMber(id[1]);
//			}
//		}
		foxBsshInfoManageDAO.deleteBsshInfo(bsshEsntlId);
	}




}