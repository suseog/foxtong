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
public class FoxSvcGoodsInfoVO {

//	private static final long serialVersionUID = -4255594107023139972L;
	
	/** 사용자고유ID */
	private String esntlId = "";

	/** 업소고유ID */
	private String bsshEsntlId = "";
	
	/** 서비스 ID */
	private String svcId = "";

	/** 서비스대분류 */
	private String svcLrgeclas = "";

	/** 서비스소분류 */
	private String svcSmallclas = "";
	
	/** 서비스소분류 */
	private String svcSmallclasNm = "";

	/** 서비스상품명 */
	private String svcGoodsNm = "";
	
	/** 서비스시간 */
	private String svcTime = "";
	
	/** 서비스요약설명 */
	private String svcSumryDc = "";
	
	
	/** 서비스소비자가격 */
	private String svcCnsmrPc = "";
	
	/** 서비스할인율 */
	private String svcDscntRt = "";
	
	/** 최종할인가격 */
	private String lastDscntPc = "";
	
	/** 추가설명 */
	private String aditDc = "";
	
	/** 여분1 */
	private String extraOne = "";
	
	/** 여분2 */
	private String extraTwo = "";
		
	
	/** 최종수정시점 */
	private String frstRegistPnttm = "";
	
	/** 최종수정시점 */
	private String frstRegistId = "";	
	
	/** 최종수정시점 */
	private String lastUpdtPnttm = "";
	
	/** 최종수정자ID  */
	private String lastUpdtId = "";
	
	/** 삭제여부 추가 */
	private String deleteAt = "";
	

	
	public String getSvcSmallclasNm() {
		return svcSmallclasNm;
	}

	public void setSvcSmallclasNm(String svcSmallclasNm) {
		this.svcSmallclasNm = svcSmallclasNm;
	}

	public String getDeleteAt() {
		return deleteAt;
	}

	public void setDeleteAt(String deleteAt) {
		this.deleteAt = deleteAt;
	}

	/**
	 * @return the svcId
	 */
	public String getSvcId() {
		return svcId;
	}

	/**
	 * @param svcId the svcId to set
	 */
	public void setSvcId(String svcId) {
		this.svcId = svcId;
	}

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
	 * @return the svcLrgeclas
	 */
	public String getSvcLrgeclas() {
		return svcLrgeclas;
	}

	/**
	 * @param svcLrgeclas the svcLrgeclas to set
	 */
	public void setSvcLrgeclas(String svcLrgeclas) {
		this.svcLrgeclas = svcLrgeclas;
	}

	/**
	 * @return the svcSmallclas
	 */
	public String getSvcSmallclas() {
		return svcSmallclas;
	}

	/**
	 * @param svcSmallclas the svcSmallclas to set
	 */
	public void setSvcSmallclas(String svcSmallclas) {
		this.svcSmallclas = svcSmallclas;
	}

	/**
	 * @return the svcGoodsNm
	 */
	public String getSvcGoodsNm() {
		return svcGoodsNm;
	}

	/**
	 * @param svcGoodsNm the svcGoodsNm to set
	 */
	public void setSvcGoodsNm(String svcGoodsNm) {
		this.svcGoodsNm = svcGoodsNm;
	}

	/**
	 * @return the svcTime
	 */
	public String getSvcTime() {
		return svcTime;
	}

	/**
	 * @param svcTime the svcTime to set
	 */
	public void setSvcTime(String svcTime) {
		this.svcTime = svcTime;
	}

	/**
	 * @return the svcSumryDc
	 */
	public String getSvcSumryDc() {
		return svcSumryDc;
	}

	/**
	 * @param svcSumryDc the svcSumryDc to set
	 */
	public void setSvcSumryDc(String svcSumryDc) {
		this.svcSumryDc = svcSumryDc;
	}

	/**
	 * @return the svcCnsmrPc
	 */
	public String getSvcCnsmrPc() {
		return svcCnsmrPc;
	}

	/**
	 * @param svcCnsmrPc the svcCnsmrPc to set
	 */
	public void setSvcCnsmrPc(String svcCnsmrPc) {
		this.svcCnsmrPc = svcCnsmrPc;
	}

	/**
	 * @return the svcDscntRt
	 */
	public String getSvcDscntRt() {
		return svcDscntRt;
	}

	/**
	 * @param svcDscntRt the svcDscntRt to set
	 */
	public void setSvcDscntRt(String svcDscntRt) {
		this.svcDscntRt = svcDscntRt;
	}

	/**
	 * @return the lastDscntPc
	 */
	public String getLastDscntPc() {
		return lastDscntPc;
	}

	/**
	 * @param lastDscntPc the lastDscntPc to set
	 */
	public void setLastDscntPc(String lastDscntPc) {
		this.lastDscntPc = lastDscntPc;
	}

	/**
	 * @return the aditDc
	 */
	public String getAditDc() {
		return aditDc;
	}

	/**
	 * @param aditDc the aditDc to set
	 */
	public void setAditDc(String aditDc) {
		this.aditDc = aditDc;
	}

	/**
	 * @return the extraOne
	 */
	public String getExtraOne() {
		return extraOne;
	}

	/**
	 * @param extraOne the extraOne to set
	 */
	public void setExtraOne(String extraOne) {
		this.extraOne = extraOne;
	}

	/**
	 * @return the extraTwo
	 */
	public String getExtraTwo() {
		return extraTwo;
	}

	/**
	 * @param extraTwo the extraTwo to set
	 */
	public void setExtraTwo(String extraTwo) {
		this.extraTwo = extraTwo;
	}

	/**
	 * @return the frstRegistPnttm
	 */
	public String getFrstRegistPnttm() {
		return frstRegistPnttm;
	}

	/**
	 * @param frstRegistPnttm the frstRegistPnttm to set
	 */
	public void setFrstRegistPnttm(String frstRegistPnttm) {
		this.frstRegistPnttm = frstRegistPnttm;
	}

	/**
	 * @return the frstRegistId
	 */
	public String getFrstRegistId() {
		return frstRegistId;
	}

	/**
	 * @param frstRegistId the frstRegistId to set
	 */
	public void setFrstRegistId(String frstRegistId) {
		this.frstRegistId = frstRegistId;
	}

	/**
	 * @return the lastUpdtPnttm
	 */
	public String getLastUpdtPnttm() {
		return lastUpdtPnttm;
	}

	/**
	 * @param lastUpdtPnttm the lastUpdtPnttm to set
	 */
	public void setLastUpdtPnttm(String lastUpdtPnttm) {
		this.lastUpdtPnttm = lastUpdtPnttm;
	}

	/**
	 * @return the lastUpdtId
	 */
	public String getLastUpdtId() {
		return lastUpdtId;
	}

	/**
	 * @param lastUpdtId the lastUpdtId to set
	 */
	public void setLastUpdtId(String lastUpdtId) {
		this.lastUpdtId = lastUpdtId;
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

	
	

}