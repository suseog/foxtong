package egovframework.fox.com.uss.umt.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.fox.com.uss.umt.service.FoxMberManageVO;
import egovframework.fox.com.uss.umt.service.FoxUserDefaultVO;

/**
 * 일반회원관리에 관한 데이터 접근 클래스를 정의한다.
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
@Repository("foxMberManageDAO")
public class FoxMberManageDAO extends EgovComAbstractDAO{ 

    /**
     * 기 등록된 특정 일반회원의 정보를 데이터베이스에서 읽어와 화면에 출력
     * @param foxUserDefaultVO 검색조건
     * @return List<FoxMberManageVO> 기업회원 목록정보
     */
    @SuppressWarnings("unchecked")
	public List<FoxMberManageVO> selectMberList(FoxUserDefaultVO foxUserDefaultVO){
        return (List<FoxMberManageVO>) list("foxMberManageDAO.selectMberList", foxUserDefaultVO);
    }

    /**
     * 일반회원 총 갯수를 조회한다.
     * @param foxUserDefaultVO 검색조건
     * @return int 일반회원총갯수
     */
    public int selectMberListTotCnt(FoxUserDefaultVO foxUserDefaultVO) {
        return (Integer)select("foxMberManageDAO.selectMberListTotCnt", foxUserDefaultVO);
    }

    /**
     * 화면에 조회된 일반회원의 정보를 데이터베이스에서 삭제
     * @param delId 삭제 대상 일반회원아이디
     */
    public void deleteMber(String delId){
        delete("foxMberManageDAO.deleteMber_S", delId);
    }

    /**
     * 일반회원의 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
     * @param foxMberManageVO 일반회원 등록정보
     * @return String 등록결과
     */
    public String insertMber(FoxMberManageVO foxMberManageVO){
        return (String)insert("foxMberManageDAO.insertMber", foxMberManageVO);
    }                          

    /**
     * 기 등록된 사용자 중 검색조건에 맞는일반회원의 정보를 데이터베이스에서 읽어와 화면에 출력
     * @param mberId 상세조회대상 일반회원아이디
     * @return FoxMberManageVO 일반회원 상세정보
     */
    public FoxMberManageVO selectMber(String mberEmailAdres){
        return (FoxMberManageVO) select("foxMberManageDAO.selectMber", mberEmailAdres);
    }

    /**
     * 화면에 조회된일반회원의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
     * @param foxMberManageVO 일반회원수정정보
     */
    public void updateMber(FoxMberManageVO foxMberManageVO){
        update("foxMberManageDAO.updateMber",foxMberManageVO);
    }

    /**
     * 일반회원 약관확인
     * @param stplatId 일반회원약관아이디
     * @return List 일반회원약관정보
     */
    public List<?> selectStplat(String stplatId){
    	return list("foxMberManageDAO.selectStplat_S", stplatId);
    }

    /**
     * 일반회원 암호수정
     * @param passVO 기업회원수정정보(비밀번호)
     */
    public void updatePassword(FoxMberManageVO passVO) {
        update("foxMberManageDAO.updatePassword_S", passVO);
    }

    /**
     * 일반회원이 비밀번호를 기억하지 못할 때 비밀번호를 찾을 수 있도록 함
     * @param foxMberManageVO 일반회원암호 조회조건정보
     * @return FoxMberManageVO 일반회원 암호정보
     */
    public FoxMberManageVO selectPassword(FoxMberManageVO foxMberManageVO){
    	return (FoxMberManageVO) select("foxMberManageDAO.selectPassword_S", foxMberManageVO);
    }

}