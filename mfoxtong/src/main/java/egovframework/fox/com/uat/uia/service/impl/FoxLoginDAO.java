package egovframework.fox.com.uat.uia.service.impl;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

import org.springframework.stereotype.Repository;

/**
 * 일반 로그인, 인증서 로그인을 처리하는 DAO 클래스
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.06
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.06  박지욱          최초 생성
 *  2011.08.26  서준식          EsntlId를 이용한 로그인 추가
 *  </pre>
 */
@Repository("foxLoginDAO")
public class FoxLoginDAO extends EgovComAbstractDAO {


	/**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO actionLogin(LoginVO vo) throws Exception {
    	
//    	LoginVO loginVO = new LoginVO();
//	    	loginVO =  (LoginVO)select("foxLoginDAO.actionLogin", vo);
//	    return loginVO;
	    
	    return (LoginVO)select("foxLoginDAO.actionLogin", vo);
	    		
    }

    /**
	 * 아이디를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO searchId(LoginVO vo) throws Exception {

    	return (LoginVO)select("foxLoginDAO.searchId", vo);
    }

    /**
	 * 비밀번호를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO searchPassword(LoginVO vo) throws Exception {

    	return (LoginVO)select("foxLoginDAO.searchPassword", vo);
    }

    /**
	 * 변경된 비밀번호를 저장한다.
	 * @param vo LoginVO
	 * @exception Exception
	 */
    public void updatePassword(LoginVO vo) throws Exception {
    	update("foxLoginDAO.updatePassword", vo);
    }
}
