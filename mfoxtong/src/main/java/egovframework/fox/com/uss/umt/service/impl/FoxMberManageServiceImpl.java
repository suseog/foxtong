package egovframework.fox.com.uss.umt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.fox.com.uss.umt.service.FoxMberManageService;
import egovframework.fox.com.uss.umt.service.FoxMberManageVO;
import egovframework.fox.com.uss.umt.service.FoxUserDefaultVO;
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


@Service("foxMberManageService")
public class FoxMberManageServiceImpl extends EgovAbstractServiceImpl implements FoxMberManageService {

	/** userManageDAO */
	@Resource(name="foxUserManageDAO")
	private FoxUserManageDAO foxUserManageDAO;

	/** foxMberManageDAO */
	@Resource(name="foxMberManageDAO")
	private FoxMberManageDAO foxMberManageDAO;


	/** egovUsrCnfrmIdGnrService */
	@Resource(name="egovUsrCnfrmIdGnrService")
	private EgovIdGnrService idgenService;

	/**
	 * 사용자의 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
	 * @param foxMberManageVO 일반회원 등록정보
	 * @return result 등록결과
	 * @throws Exception
	 */
	@Override
	public String insertMber(FoxMberManageVO foxMberManageVO) throws Exception  {
		//고유아이디 셋팅
		String uniqId = idgenService.getNextStringId();
		foxMberManageVO.setEsntlId(uniqId);
		
		//패스워드 암호화
		String pass = EgovFileScrty.encryptPassword(foxMberManageVO.getPassword(), foxMberManageVO.getMberEmailAdres());
		foxMberManageVO.setPassword(pass);

		String result = foxMberManageDAO.insertMber(foxMberManageVO);
		return result;
	}

	/**
	 * 기 등록된 사용자 중 검색조건에 맞는 일반회원의 정보를 데이터베이스에서 읽어와 화면에 출력
	 * @param uniqId 상세조회대상 일반회원아이디
	 * @return foxMberManageVO 일반회원상세정보
	 * @throws Exception
	 */
	@Override
	public FoxMberManageVO selectMber(String mberEmailAdres) {
		FoxMberManageVO foxMberManageVO = foxMberManageDAO.selectMber(mberEmailAdres);
		return foxMberManageVO;
	}

	/**
	 * 기 등록된 회원 중 검색조건에 맞는 회원들의 정보를 데이터베이스에서 읽어와 화면에 출력
	 * @param userSearchVO 검색조건
	 * @return List<FoxMberManageVO> 일반회원목록정보
	 */
	@Override
	public List<FoxMberManageVO> selectMberList(FoxUserDefaultVO foxUserDefaultVO) {
		return foxMberManageDAO.selectMberList(foxUserDefaultVO);
	}

    /**
     * 일반회원 총 갯수를 조회한다.
     * @param userSearchVO 검색조건
     * @return 일반회원총갯수(int)
     */
    @Override
	public int selectMberListTotCnt(FoxUserDefaultVO foxUserDefaultVO) {
    	return foxMberManageDAO.selectMberListTotCnt(foxUserDefaultVO);
    }

	/**
	 * 화면에 조회된 일반회원의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
	 * @param foxMberManageVO 일반회원수정정보
	 * @throws Exception
	 */
	@Override
	public void updateMber(FoxMberManageVO foxMberManageVO) throws Exception {
		//패스워드 암호화
		String pass = EgovFileScrty.encryptPassword(foxMberManageVO.getPassword(), foxMberManageVO.getMberEmailAdres());
		foxMberManageVO.setPassword(pass);
		foxMberManageDAO.updateMber(foxMberManageVO);
	}

	
	 /**
     * 회원구분 변경 
     * 업체사용자 요청시 회원정보를 일반회원에서 업체 사용자로 변경 01--> '02'
     * @param foxMberManageVO 일반회원암호 조회조건정보
     * @return FoxMberManageVO 일반회원 암호정보
     */
	public void updateMberSe(FoxMberManageVO foxMberManageVO) throws Exception {
    	foxMberManageDAO.updateMberSe(foxMberManageVO);
    }
    
		
	/**
	 * 화면에 조회된 사용자의 정보를 데이터베이스에서 삭제
	 * @param checkedIdForDel 삭제대상 일반회원아이디
	 * @throws Exception
	 */
	@Override
	public void deleteMber(String mberEmailAdres)  {
		
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
		foxMberManageDAO.deleteMber(mberEmailAdres);
	}

	/**
	 * 일반회원 약관확인
	 * @param stplatId 일반회원약관아이디
	 * @return 일반회원약관정보(List)
	 * @throws Exception
	 */
	@Override
	public List<?> selectStplat(String stplatId)  {
        return foxMberManageDAO.selectStplat(stplatId);
	}

	/**
	 * 일반회원암호수정
	 * @param foxMberManageVO 일반회원수정정보(비밀번호)
	 * @throws Exception
	 */
	@Override
	public void updatePassword(FoxMberManageVO foxMberManageVO) {
		foxMberManageDAO.updatePassword(foxMberManageVO);
	}

	/**
	 * 일반회원이 비밀번호를 기억하지 못할 때 비밀번호를 찾을 수 있도록 함
	 * @param passVO 일반회원암호 조회조건정보
	 * @return foxMberManageVO 일반회원암호정보
	 * @throws Exception
	 */
	@Override
	public FoxMberManageVO selectPassword(FoxMberManageVO passVO) {
		FoxMberManageVO foxMberManageVO = foxMberManageDAO.selectPassword(passVO);
		return foxMberManageVO;
	}

}