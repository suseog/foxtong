package egovframework.fox.com.uat.uia.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cop.ems.service.EgovSndngMailRegistService;
import egovframework.com.cop.ems.service.SndngMailVO;
import egovframework.com.utl.fcc.service.EgovNumberUtil;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.fox.com.uat.uia.service.FoxLoginService;
import egovframework.fox.com.uss.umt.service.FoxMberManageVO;
import egovframework.fox.com.uss.umt.service.impl.FoxMberManageDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 일반 로그인, 인증서 로그인을 처리하는 비즈니스 구현 클래스
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
@Service("foxLoginService")
public class FoxLoginServiceImpl extends EgovAbstractServiceImpl implements FoxLoginService {

    @Resource(name="foxLoginDAO")
    private FoxLoginDAO foxLoginDAO;
    
	/** foxMberManageDAO */
	@Resource(name="foxMberManageDAO")
	private FoxMberManageDAO foxMberManageDAO;
	

    /** EgovSndngMailRegistService */
	@Resource(name = "sndngMailRegistService")
    private EgovSndngMailRegistService sndngMailRegistService;
	
	/** egovUsrCnfrmIdGnrService */
	@Resource(name="egovUsrCnfrmIdGnrService")
	private EgovIdGnrService idgenService;




//	/**
//     * 2011.08.26
//	 * EsntlId를 이용한 로그인을 처리한다
//	 * @param vo LoginVO
//	 * @return LoginVO
//	 * @exception Exception
//	 */
//    @Override
//	public LoginVO actionLoginByEsntlId(LoginVO vo) throws Exception {
//
//
//    	LoginVO loginVO = foxLoginDAO.actionLoginByEsntlId(vo);
//
//    	// 3. 결과를 리턴한다.
//    	if (loginVO != null && !loginVO.getId().equals("") && !loginVO.getPassword().equals("")) {
//    		return loginVO;
//    	} else {
//    		loginVO = new LoginVO();
//    	}
//
//    	return loginVO;
//    }


    /**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    @Override
	public LoginVO actionLogin(LoginVO vo) throws Exception {

    	// 1. 입력한 비밀번호를 암호화한다.
    	String enpassword = EgovFileScrty.encryptPassword(vo.getPassword(), vo.getMberEmailAddres());
    	vo.setPassword(enpassword);

    	// 2. 아이디와 암호화된 비밀번호가 DB와 일치하는지 확인한다.
    	LoginVO loginVO = foxLoginDAO.actionLogin(vo);

    	// 3. 결과를 리턴한다.
    	if (loginVO != null && !loginVO.getMberEmailAddres().equals("") && !loginVO.getPassword().equals("")) {
    		return loginVO;
    	} else {
    		loginVO = new LoginVO();
    	}

    	return loginVO;
    }
    
	@Override
	public LoginVO actionAPILogin(LoginVO loginVO) throws Exception {

		// 1. 카카오 아이디(이메일) 정보확인
		LoginVO resultVO = foxLoginDAO.actionAPILogin(loginVO);
		
		// 2. 카카오 아이디(이메일)가 없으면, 사용자 등록 : 카카오에서 제공되는 항목만으로 등록 : resultTempVO로 비교 null 체크 
		//LoginVO loginVO = foxLoginDAO.actionAPILogin(vo);
		
		if(resultVO == null) {
			
				//고유아이디 셋팅
				String esntlId = idgenService.getNextStringId();
				FoxMberManageVO mvo = new FoxMberManageVO();
				mvo.setEsntlId(esntlId);
				mvo.setMberEmailAdres(loginVO.getMberEmailAddres());  //이메일 
				mvo.setNcnm(loginVO.getNcnm());	       //닉네임 
				//mvo.setMberNm(loginVO.getMberNm());  //회원명 
				mvo.setMberSe("01");
				mvo.setSbscrbSe("03");
				mvo.setMberSttus("01");
			
				String result = foxMberManageDAO.insertMber(mvo);
				
				//3.카카오 가입사용자의 정보 조회 
				LoginVO resultTempVO = foxLoginDAO.actionAPILogin(loginVO);
				
				resultVO = resultTempVO;
		}

    	// 3. 결과를 리턴한다.
    	if (resultVO != null && !resultVO.getMberEmailAddres().equals("")) {
    		return resultVO;
    	} else {
    		resultVO = new LoginVO();
    	}

    	return loginVO;
    	
	}
	

//    /**
//	 * 인증서 로그인을 처리한다
//	 * @param vo LoginVO
//	 * @return LoginVO
//	 * @exception Exception
//	 */
//    @Override
//	public LoginVO actionCrtfctLogin(LoginVO vo) throws Exception {
//
//    	// 1. DN값으로 ID, PW를 조회한다.
//    	LoginVO loginVO = foxLoginDAO.actionCrtfctLogin(vo);
//
//    	// 3. 결과를 리턴한다.
//    	if (loginVO != null && !loginVO.getId().equals("") && !loginVO.getPassword().equals("")) {
//    		return loginVO;
//    	} else {
//    		loginVO = new LoginVO();
//    	}
//
//    	return loginVO;
//    }

    /**
	 * 아이디를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    @Override
	public LoginVO searchId(LoginVO vo) throws Exception {

    	// 1. 이름, 이메일주소가 DB와 일치하는 사용자 ID를 조회한다.
    	LoginVO loginVO = foxLoginDAO.searchId(vo);
    	
    	// 2. 결과를 리턴한다.
    	if (loginVO != null && !loginVO.getEmail().equals("")) {
    		return loginVO;
    	} else {
    		loginVO = new LoginVO();
    	}
    	return loginVO;
    }
    

    /**
	 * 비밀번호를 찾는다.
	 * @param vo LoginVO
	 * @return boolean
	 * @exception Exception
	 */
    @Override
	public boolean searchPassword(LoginVO vo) throws Exception {

    	boolean result = true;

    	// 1. 아이디, 이름, 이메일주소, 비밀번호 힌트, 비밀번호 정답이 DB와 일치하는 사용자 Password를 조회한다.
    	LoginVO loginVO = foxLoginDAO.searchPassword(vo);
    	if (loginVO == null || loginVO.getPassword() == null || loginVO.getPassword().equals("")) {
    		return false;
    	}

    	// 2. 임시 비밀번호를 생성한다.(영+영+숫+영+영+숫=6자리)
    	String newpassword = "";
    	for (int i = 1; i <= 6; i++) {
    		// 영자
    		if (i % 3 != 0) {
    			newpassword += EgovStringUtil.getRandomStr('a', 'z');
    		// 숫자
    		} else {
    			newpassword += EgovNumberUtil.getRandomNum(0, 9);
    		}
    	}

    	// 3. 임시 비밀번호를 암호화하여 DB에 저장한다.
    	LoginVO pwVO = new LoginVO();
    	String enpassword = EgovFileScrty.encryptPassword(newpassword, vo.getId());
    	pwVO.setId(vo.getId());
    	pwVO.setPassword(enpassword);
    	pwVO.setUserSe(vo.getUserSe());
    	foxLoginDAO.updatePassword(pwVO);

    	// 4. 임시 비밀번호를 이메일 발송한다.(메일연동솔루션 활용)
    	SndngMailVO sndngMailVO = new SndngMailVO();
    	sndngMailVO.setDsptchPerson("webmaster");
    	sndngMailVO.setRecptnPerson(vo.getEmail());
    	sndngMailVO.setSj("[MOPAS] 임시 비밀번호를 발송했습니다.");
    	sndngMailVO.setEmailCn("고객님의 임시 비밀번호는 " + newpassword + " 입니다.");
    	sndngMailVO.setAtchFileId("");

    	result = sndngMailRegistService.insertSndngMail(sndngMailVO);

    	return result;
    }


}
