package egovframework.fox.com.uss.umt.service;

/**
 * 일반회원VO클래스로서 일반회원관리 비지니스로직 처리용 항목을 구성한다.
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
public class FoxMberManageVO extends FoxUserDefaultVO {

	private static final long serialVersionUID = -4255594107023139972L;

	/** 이전비밀번호 - 비밀번호 변경시 사용*/
    private String oldPassword = "";
    

    /**
	 * 순번
	 */
	private String sn="";
	
	/**
	 * 이메일주소
	 */
	private String mberEmailAdres;
	
	/**
	 * 가입유형 : 01: 직접 , 02: 네이버, 03: 카카오, 09:기타 
	 */
	private String sbscrbSe;
	
	/**
	 * 회원구분 : 01:일반회원, 02: 영업점(업체)회원, 03: 업체대표(다중업체운영),  98:시스템운영자, 99: 시스템관리자
	 */
	private String mberSe;
	
    /**
	 * 닉네임 
	 */
	private String ncnm="";
	
	/**
	 * 회원명
	 */
	private String mberNm;
		
	/**
	 * 핸드폰번호
	 */
	private String moblphonNo;
	
	/**
	 * 성별코드
	 */
	private String sexdstnCode;

	/**
	 * 프로필사진 URL
	 */
	private String proflPhotoUrl;
	
    /**
	 * 사용자고유아이디
	 */
	private String esntlId="";
	
	/**
	 * 그룹 ID
	 */
	private String groupId;
	
	/**
	 * 가입 일자
	 */
	private String sbscrbDe;

	/**
	 * 회원상태
	 */
	private String mberSttus;
	
	/**
	 * 잠금여부 
	 */
	private String lockAt;
	
	/**
	 * 잠금최종시점  
	 */
	private String lockLastPnttm;
	
	/**
	 * 잠금패스변경시점  
	 */
	private String chgPwdLastPnttm;
	
	/**
	 * 연령대 
	 */
	private String agrde;
	
	/**
	 * 출생년도 
	 */
	private String birthYear;
	
	/**
	 * 이용약관 동의 여부 
	 */
	private String useStplatAgreAt;
	
	/**
	 * 개인정보 수집 이용 동의여부 
	 */
	private String indvdlinfoColctAgreAt;
	
	/**
	 * 마켓딩 정보 수신동의 여부 
	 */
	private String marktRecptnAgreAt;

	/**
	 * 위치정보 이용약관 동의여부 
	 */
	private String lcinfoUseAgreAt;
	
	/**
	 * 비밀번호
	 */
	private String password;
	
	/**
	 * 최초등록ID
	 */
	private String frstRegisterId;
	
	/**
	 * 최종수정ID
	 */
	private String lastUpdusrId;
	
	/**
	 * 사용자입력인증번호 
	 */
	private String userCertNum;
	
	

	/**
	 * @return the oldPassword
	 */
	public String getOldPassword() {
		return oldPassword;
	}

	/**
	 * @param oldPassword the oldPassword to set
	 */
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	/**
	 * @return the sn
	 */
	public String getSn() {
		return sn;
	}

	/**
	 * @param sn the sn to set
	 */
	public void setSn(String sn) {
		this.sn = sn;
	}

	/**
	 * @return the mberEmailAdres
	 */
	public String getMberEmailAdres() {
		return mberEmailAdres;
	}

	/**
	 * @param mberEmailAdres the mberEmailAdres to set
	 */
	public void setMberEmailAdres(String mberEmailAdres) {
		this.mberEmailAdres = mberEmailAdres;
	}

	/**
	 * @return the sbscrbSe
	 */
	public String getSbscrbSe() {
		return sbscrbSe;
	}

	/**
	 * @param sbscrbSe the sbscrbSe to set
	 */
	public void setSbscrbSe(String sbscrbSe) {
		this.sbscrbSe = sbscrbSe;
	}

	/**
	 * @return the mberSe
	 */
	public String getMberSe() {
		return mberSe;
	}

	/**
	 * @param mberSe the mberSe to set
	 */
	public void setMberSe(String mberSe) {
		this.mberSe = mberSe;
	}

	/**
	 * @return the ncnm
	 */
	public String getNcnm() {
		return ncnm;
	}

	/**
	 * @param ncnm the ncnm to set
	 */
	public void setNcnm(String ncnm) {
		this.ncnm = ncnm;
	}

	/**
	 * @return the mberNm
	 */
	public String getMberNm() {
		return mberNm;
	}

	/**
	 * @param mberNm the mberNm to set
	 */
	public void setMberNm(String mberNm) {
		this.mberNm = mberNm;
	}

	/**
	 * @return the moblphonNo
	 */
	public String getMoblphonNo() {
		return moblphonNo;
	}

	/**
	 * @param moblphonNo the moblphonNo to set
	 */
	public void setMoblphonNo(String moblphonNo) {
		this.moblphonNo = moblphonNo;
	}

	/**
	 * @return the sexdstnCode
	 */
	public String getSexdstnCode() {
		return sexdstnCode;
	}

	/**
	 * @param sexdstnCode the sexdstnCode to set
	 */
	public void setSexdstnCode(String sexdstnCode) {
		this.sexdstnCode = sexdstnCode;
	}

	/**
	 * @return the proflPhotoUrl
	 */
	public String getProflPhotoUrl() {
		return proflPhotoUrl;
	}

	/**
	 * @param proflPhotoUrl the proflPhotoUrl to set
	 */
	public void setProflPhotoUrl(String proflPhotoUrl) {
		this.proflPhotoUrl = proflPhotoUrl;
	}

	/**
	 * @return the esntlId
	 */
	public String getEsntlId() {
		return esntlId;
	}

	/**
	 * @param esntlId the esntlId to set
	 */
	public void setEsntlId(String esntlId) {
		this.esntlId = esntlId;
	}

	/**
	 * @return the groupId
	 */
	public String getGroupId() {
		return groupId;
	}

	/**
	 * @param groupId the groupId to set
	 */
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	/**
	 * @return the sbscrbDe
	 */
	public String getSbscrbDe() {
		return sbscrbDe;
	}

	/**
	 * @param sbscrbDe the sbscrbDe to set
	 */
	public void setSbscrbDe(String sbscrbDe) {
		this.sbscrbDe = sbscrbDe;
	}

	/**
	 * @return the mberSttus
	 */
	public String getMberSttus() {
		return mberSttus;
	}

	/**
	 * @param mberSttus the mberSttus to set
	 */
	public void setMberSttus(String mberSttus) {
		this.mberSttus = mberSttus;
	}

	/**
	 * @return the lockAt
	 */
	public String getLockAt() {
		return lockAt;
	}

	/**
	 * @param lockAt the lockAt to set
	 */
	public void setLockAt(String lockAt) {
		this.lockAt = lockAt;
	}

	/**
	 * @return the lockLastPnttm
	 */
	public String getLockLastPnttm() {
		return lockLastPnttm;
	}

	/**
	 * @param lockLastPnttm the lockLastPnttm to set
	 */
	public void setLockLastPnttm(String lockLastPnttm) {
		this.lockLastPnttm = lockLastPnttm;
	}

	/**
	 * @return the chgPwdLastPnttm
	 */
	public String getChgPwdLastPnttm() {
		return chgPwdLastPnttm;
	}

	/**
	 * @param chgPwdLastPnttm the chgPwdLastPnttm to set
	 */
	public void setChgPwdLastPnttm(String chgPwdLastPnttm) {
		this.chgPwdLastPnttm = chgPwdLastPnttm;
	}

	/**
	 * @return the agrde
	 */
	public String getAgrde() {
		return agrde;
	}

	/**
	 * @param agrde the agrde to set
	 */
	public void setAgrde(String agrde) {
		this.agrde = agrde;
	}

	/**
	 * @return the birthYear
	 */
	public String getBirthYear() {
		return birthYear;
	}

	/**
	 * @param birthYear the birthYear to set
	 */
	public void setBirthYear(String birthYear) {
		this.birthYear = birthYear;
	}

	/**
	 * @return the useStplatAgreAt
	 */
	public String getUseStplatAgreAt() {
		return useStplatAgreAt;
	}

	/**
	 * @param useStplatAgreAt the useStplatAgreAt to set
	 */
	public void setUseStplatAgreAt(String useStplatAgreAt) {
		this.useStplatAgreAt = useStplatAgreAt;
	}

	/**
	 * @return the indvdlinfoColctAgreAt
	 */
	public String getIndvdlinfoColctAgreAt() {
		return indvdlinfoColctAgreAt;
	}

	/**
	 * @param indvdlinfoColctAgreAt the indvdlinfoColctAgreAt to set
	 */
	public void setIndvdlinfoColctAgreAt(String indvdlinfoColctAgreAt) {
		this.indvdlinfoColctAgreAt = indvdlinfoColctAgreAt;
	}

	/**
	 * @return the marktRecptnAgreAt
	 */
	public String getMarktRecptnAgreAt() {
		return marktRecptnAgreAt;
	}

	/**
	 * @param marktRecptnAgreAt the marktRecptnAgreAt to set
	 */
	public void setMarktRecptnAgreAt(String marktRecptnAgreAt) {
		this.marktRecptnAgreAt = marktRecptnAgreAt;
	}

	/**
	 * @return the lcinfoUseAgreAt
	 */
	public String getLcinfoUseAgreAt() {
		return lcinfoUseAgreAt;
	}

	/**
	 * @param lcinfoUseAgreAt the lcinfoUseAgreAt to set
	 */
	public void setLcinfoUseAgreAt(String lcinfoUseAgreAt) {
		this.lcinfoUseAgreAt = lcinfoUseAgreAt;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the frstRegisterId
	 */
	public String getFrstRegisterId() {
		return frstRegisterId;
	}

	/**
	 * @param frstRegisterId the frstRegisterId to set
	 */
	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}

	/**
	 * @return the lastUpdusrId
	 */
	public String getLastUpdusrId() {
		return lastUpdusrId;
	}

	/**
	 * @param lastUpdusrId the lastUpdusrId to set
	 */
	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}

	/**
	 * @return the userCertNum
	 */
	public String getUserCertNum() {
		return userCertNum;
	}

	/**
	 * @param userCertNum the userCertNum to set
	 */
	public void setUserCertNum(String userCertNum) {
		this.userCertNum = userCertNum;
	}
	
	

	
	
	
	
	
	
	

}