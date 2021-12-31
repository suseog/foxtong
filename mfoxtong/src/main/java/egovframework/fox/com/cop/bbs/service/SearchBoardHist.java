package egovframework.fox.com.cop.bbs.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @Class Name  : Board.java
 * @Description : 게시물에 대한 데이터 처리 모델
 * @Modification Information
 * 
 *     수정일         수정자                   수정내용
 *     -------          --------        ---------------------------
 *   2009.03.06       이삼섭                  최초 생성
 *
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009. 02. 13
 * @version 1.0
 * @see 
 * 
 */
@SuppressWarnings("serial")
public class SearchBoardHist implements Serializable {

    
    /** 검색히스토리 sn */
    private int sn;
    
    /** 검색히스토리 사용자ID */
    private String mberId = "";
    
    /** 검색히스토리키워드 */
    private String srchWrd = "";
    
    /** 검색히스토리키워드 */
    private String useAt = "";
    
	/**
	 * 최초등록자 아이디
	 */
	private String frstRegisterId = "";
	/**
	 * 최초등록시점
	 */
	private String frstRegisterPnttm = "";
	/**
	 * 최종수정자 아이디
	 */
	private String lastUpdusrId = "";
	/**
	 * 최종수정시점
	 */
	private String lastUpdusrPnttm = "";
	
    
	/**
	 * 검색 flag : 1: 개인용, 2 전체검색랭크
	 */
	private String searchFlag = "";
	

	/**
	 * frstRegisterId attribute를 리턴한다.
	 * @return the frstRegisterId
	 */
	public String getFrstRegisterId() {
		return frstRegisterId;
	}

	/**
	 * frstRegisterId attribute 값을 설정한다.
	 * @param frstRegisterId the frstRegisterId to set
	 */
	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}

	/**
	 * frstRegisterPnttm attribute를 리턴한다.
	 * @return the frstRegisterPnttm
	 */
	public String getFrstRegisterPnttm() {
		return frstRegisterPnttm;
	}

	/**
	 * frstRegisterPnttm attribute 값을 설정한다.
	 * @param frstRegisterPnttm the frstRegisterPnttm to set
	 */
	public void setFrstRegisterPnttm(String frstRegisterPnttm) {
		this.frstRegisterPnttm = frstRegisterPnttm;
	}

	/**
	 * lastUpdusrId attribute를 리턴한다.
	 * @return the lastUpdusrId
	 */
	public String getLastUpdusrId() {
		return lastUpdusrId;
	}

	/**
	 * lastUpdusrId attribute 값을 설정한다.
	 * @param lastUpdusrId the lastUpdusrId to set
	 */
	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}

	/**
	 * lastUpdusrPnttm attribute를 리턴한다.
	 * @return the lastUpdusrPnttm
	 */
	public String getLastUpdusrPnttm() {
		return lastUpdusrPnttm;
	}

	/**
	 * lastUpdusrPnttm attribute 값을 설정한다.
	 * @param lastUpdusrPnttm the lastUpdusrPnttm to set
	 */
	public void setLastUpdusrPnttm(String lastUpdusrPnttm) {
		this.lastUpdusrPnttm = lastUpdusrPnttm;
	}


	/**
	 * @return the srchWrd
	 */
	public String getSrchWrd() {
		return srchWrd;
	}

	/**
	 * @param srchWrd the srchWrd to set
	 */
	public void setSrchWrd(String srchWrd) {
		this.srchWrd = srchWrd;
	}

	/**
	 * @return the sn
	 */
	public int getSn() {
		return sn;
	}

	/**
	 * @param sn the sn to set
	 */
	public void setSn(int sn) {
		this.sn = sn;
	}

	/**
	 * @return the mberId
	 */
	public String getMberId() {
		return mberId;
	}

	/**
	 * @param mberId the mberId to set
	 */
	public void setMberId(String mberId) {
		this.mberId = mberId;
	}

	/**
	 * @return the useAt
	 */
	public String getUseAt() {
		return useAt;
	}

	/**
	 * @param useAt the useAt to set
	 */
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}

	/**
	 * @return the searchFlag
	 */
	public String getSearchFlag() {
		return searchFlag;
	}

	/**
	 * @param searchFlag the searchFlag to set
	 */
	public void setSearchFlag(String searchFlag) {
		this.searchFlag = searchFlag;
	}
	
	
	
}
