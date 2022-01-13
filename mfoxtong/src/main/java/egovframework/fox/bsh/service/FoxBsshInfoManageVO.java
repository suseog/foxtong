package egovframework.fox.bsh.service;

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
public class FoxBsshInfoManageVO {

//	private static final long serialVersionUID = -4255594107023139972L;

	/** 업소고유ID */
	private String bsshEsntlId = "";
	
	/** 카테고리ID */
	private String ctgryId = "";
	
	
	/** 광역시도코드 */
	private String brtcCode = "";
	
	
	/** 시군구코드 */
	private String signguCode = "";
	
	/** 동리코드 */
	private String dongCode = "";
	
	/** 상호명 */
	private String mtltyNm = "";
	
	/** 업소캠페인문구 */
	private String bsshCmpgnWords = "";
	
	/** 업소사진ID */
	private String bsshPhotoId = "";
	
	/** 영업시작시간 */
	private String bsnBeginTime = "";
	
	/** 영업종료시간 */
	private String bsnEndTime = "";
	
	/** 전화번호 */
	private String tlphonNo = "";
	
	/** 휴대폰번호 */
	private String moblphonNo = "";
	
	/** 우편번호 */
	private String postNo = "";
	
	/** 주소 */
	private String adres = "";
	
	/** 상세 주소 */
	private String detailAdres = "";
	
	/** 건물명 */
	private String buldNm = "";
	
	/** 영업상태 
	(01:시스템등록, 02:영업중, 02:휴업, 03:폐업, 04:기타)*/
	private String bsnSttus = "";
	
	/** 제휴상태 */
	/** 
	(01:시스템등록, 02:제휴요청대상, 03:영업중, 04:제휴, 05:미제휴, 06:기타)*/
	private String coprtnSttus = "";
	
	/** 선호수 */
	private String preferCo = "";
	
	/** 후기수 */
	private String postscriptCo = "";
	
	

	/**
	 * @return the bsshEsntlId
	 */
	public String getBsshEsntlId() {
		return bsshEsntlId;
	}

	/**
	 * @param bsshEsntlId the bsshEsntlId to set
	 */
	public void setBsshEsntlId(String bsshEsntlId) {
		this.bsshEsntlId = bsshEsntlId;
	}

	/**
	 * @return the ctgryId
	 */
	public String getCtgryId() {
		return ctgryId;
	}

	/**
	 * @param ctgryId the ctgryId to set
	 */
	public void setCtgryId(String ctgryId) {
		this.ctgryId = ctgryId;
	}

	/**
	 * @return the brtcCode
	 */
	public String getBrtcCode() {
		return brtcCode;
	}

	/**
	 * @param brtcCode the brtcCode to set
	 */
	public void setBrtcCode(String brtcCode) {
		this.brtcCode = brtcCode;
	}

	/**
	 * @return the signguCode
	 */
	public String getSignguCode() {
		return signguCode;
	}

	/**
	 * @param signguCode the signguCode to set
	 */
	public void setSignguCode(String signguCode) {
		this.signguCode = signguCode;
	}

	/**
	 * @return the dongliCode
	 */
	public String getDongCode() {
		return dongCode;
	}

	/**
	 * @param dongliCode the dongliCode to set
	 */
	public void setDongCode(String dongCode) {
		this.dongCode = dongCode;
	}

	/**
	 * @return the mtltyNm
	 */
	public String getMtltyNm() {
		return mtltyNm;
	}

	/**
	 * @param mtltyNm the mtltyNm to set
	 */
	public void setMtltyNm(String mtltyNm) {
		this.mtltyNm = mtltyNm;
	}


	/**
	 * @return the bsshPhotoId
	 */
	public String getBsshPhotoId() {
		return bsshPhotoId;
	}

	/**
	 * @param bsshPhotoId the bsshPhotoId to set
	 */
	public void setBsshPhotoId(String bsshPhotoId) {
		this.bsshPhotoId = bsshPhotoId;
	}

	/**
	 * @return the bsnBeginTime
	 */
	public String getBsnBeginTime() {
		return bsnBeginTime;
	}

	/**
	 * @param bsnBeginTime the bsnBeginTime to set
	 */
	public void setBsnBeginTime(String bsnBeginTime) {
		this.bsnBeginTime = bsnBeginTime;
	}

	/**
	 * @return the bsnEndTime
	 */
	public String getBsnEndTime() {
		return bsnEndTime;
	}

	/**
	 * @param bsnEndTime the bsnEndTime to set
	 */
	public void setBsnEndTime(String bsnEndTime) {
		this.bsnEndTime = bsnEndTime;
	}

	/**
	 * @return the tlphonNo
	 */
	public String getTlphonNo() {
		return tlphonNo;
	}

	/**
	 * @param tlphonNo the tlphonNo to set
	 */
	public void setTlphonNo(String tlphonNo) {
		this.tlphonNo = tlphonNo;
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
	 * @return the postNo
	 */
	public String getPostNo() {
		return postNo;
	}

	/**
	 * @param postNo the postNo to set
	 */
	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}

	/**
	 * @return the adres
	 */
	public String getAdres() {
		return adres;
	}

	/**
	 * @param adres the adres to set
	 */
	public void setAdres(String adres) {
		this.adres = adres;
	}

	/**
	 * @return the detailAdres
	 */
	public String getDetailAdres() {
		return detailAdres;
	}

	/**
	 * @param detailAdres the detailAdres to set
	 */
	public void setDetailAdres(String detailAdres) {
		this.detailAdres = detailAdres;
	}

	/**
	 * @return the buldNm
	 */
	public String getBuldNm() {
		return buldNm;
	}

	/**
	 * @param buldNm the buldNm to set
	 */
	public void setBuldNm(String buldNm) {
		this.buldNm = buldNm;
	}

	/**
	 * @return the bsnSttus
	 */
	public String getBsnSttus() {
		return bsnSttus;
	}

	/**
	 * @param bsnSttus the bsnSttus to set
	 */
	public void setBsnSttus(String bsnSttus) {
		this.bsnSttus = bsnSttus;
	}

	/**
	 * @return the coprtnSttus
	 */
	public String getCoprtnSttus() {
		return coprtnSttus;
	}

	/**
	 * @param coprtnSttus the coprtnSttus to set
	 */
	public void setCoprtnSttus(String coprtnSttus) {
		this.coprtnSttus = coprtnSttus;
	}

	/**
	 * @return the preferCo
	 */
	public String getPreferCo() {
		return preferCo;
	}

	/**
	 * @param preferCo the preferCo to set
	 */
	public void setPreferCo(String preferCo) {
		this.preferCo = preferCo;
	}

	/**
	 * @return the postscriptCo
	 */
	public String getPostscriptCo() {
		return postscriptCo;
	}

	/**
	 * @param postscriptCo the postscriptCo to set
	 */
	public void setPostscriptCo(String postscriptCo) {
		this.postscriptCo = postscriptCo;
	}

	/**
	 * @return the bsshcmpgnWords
	 */
	public String getBsshCmpgnWords() {
		return bsshCmpgnWords;
	}

	/**
	 * @param bsshcmpgnWords the bsshcmpgnWords to set
	 */
	public void setBsshCmpgnWords(String bsshCmpgnWords) {
		this.bsshCmpgnWords = bsshCmpgnWords;
	}
	
	
	
	

}