package egovframework.fox.bsh.service;

import java.io.Serializable;

/**
 * 사용자정보 VO클래스로서일반회원, 기업회원, 업무사용자의  비지니스로직 처리시 기타조건성 항을 구성한다.
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
public class FoxBsshInfoDefaultVO extends FoxBsshInfoManageVO implements Serializable {

	private static final long serialVersionUID = 4829684178121022508L;

	/** 검색조건-제휴상태조건 (01:시스템등록, 02:제휴요청대상, 03:영업중, 04:제휴, 05:미제휴, 06:기타)*/
    private String searchCoprtnSttus = "0";
    
	/** 검색조건-상호명 */
    private String searchMtltyNm = "";

    /** 검색조건-카테고id */
    private String searchCtgryId = "";
    
    /** 검색조건-카테고id */
    private String searchCtgryIdArr;
    
    /** 검색조건-광역시 */
    private String searcBrtcCode = "";
    
    /** 검색조건-시군구 */
    private String searchSignguCode = "";

    /** 검색조건-동id */
    private String searchDongCode = "";

	/** 현재페이지 */
    private int pageIndex = 1;

    /** 페이지갯수 */
    private int pageUnit = 10;

    /** 페이지사이즈 */
    private int pageSize = 10;

    /** firstIndex */
    private int firstIndex = 1;

    /** lastIndex */
    private int lastIndex = 1;

    /** recordCountPerPage */
    private int recordCountPerPage = 10;


    
    


    /**
	 * @return the searchCtgryIdArr
	 */
	public String getSearchCtgryIdArr() {
		return searchCtgryIdArr;
	}

	/**
	 * @param searchCtgryIdArr the searchCtgryIdArr to set
	 */
	public void setSearchCtgryIdArr(String searchCtgryIdArr) {
		this.searchCtgryIdArr = searchCtgryIdArr;
	}

	
	
    
	/**
	 * @return the searchCoprtnSttus
	 */
	public String getSearchCoprtnSttus() {
		return searchCoprtnSttus;
	}

	/**
	 * @param searchCoprtnSttus the searchCoprtnSttus to set
	 */
	public void setSearchCoprtnSttus(String searchCoprtnSttus) {
		this.searchCoprtnSttus = searchCoprtnSttus;
	}

	/**
	 * @return the searchMtltyNm
	 */
	public String getSearchMtltyNm() {
		return searchMtltyNm;
	}

	/**
	 * @param searchMtltyNm the searchMtltyNm to set
	 */
	public void setSearchMtltyNm(String searchMtltyNm) {
		this.searchMtltyNm = searchMtltyNm;
	}

	/**
	 * @return the searchCtgryId
	 */
	public String getSearchCtgryId() {
		return searchCtgryId;
	}

	/**
	 * @param searchCtgryId the searchCtgryId to set
	 */
	public void setSearchCtgryId(String searchCtgryId) {
		this.searchCtgryId = searchCtgryId;
	}

	/**
	 * @return the searcBrtcCode
	 */
	public String getSearcBrtcCode() {
		return searcBrtcCode;
	}

	/**
	 * @param searcBrtcCode the searcBrtcCode to set
	 */
	public void setSearcBrtcCode(String searcBrtcCode) {
		this.searcBrtcCode = searcBrtcCode;
	}

	/**
	 * @return the searchSignguCode
	 */
	public String getSearchSignguCode() {
		return searchSignguCode;
	}

	/**
	 * @param searchSignguCode the searchSignguCode to set
	 */
	public void setSearchSignguCode(String searchSignguCode) {
		this.searchSignguCode = searchSignguCode;
	}

	/**
	 * @return the searchDongliCode
	 */
	public String getSearchDongCode() {
		return searchDongCode;
	}

	/**
	 * @param searchDongliCode the searchDongliCode to set
	 */
	public void setSearchDongCode(String searchDongCode) {
		this.searchDongCode = searchDongCode;
	}

	/**
	 * pageIndex attribute 값을  리턴한다.
	 * @return int
	 */
	public int getPageIndex() {
		return pageIndex;
	}

	/**
	 * pageIndex attribute 값을 설정한다.
	 * @param pageIndex int
	 */
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	/**
	 * pageUnit attribute 값을  리턴한다.
	 * @return int
	 */
	public int getPageUnit() {
		return pageUnit;
	}

	/**
	 * pageUnit attribute 값을 설정한다.
	 * @param pageUnit int
	 */
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	/**
	 * pageSize attribute 값을  리턴한다.
	 * @return int
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * pageSize attribute 값을 설정한다.
	 * @param pageSize int
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * firstIndex attribute 값을  리턴한다.
	 * @return int
	 */
	public int getFirstIndex() {
		return firstIndex;
	}

	/**
	 * firstIndex attribute 값을 설정한다.
	 * @param firstIndex int
	 */
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	/**
	 * lastIndex attribute 값을  리턴한다.
	 * @return int
	 */
	public int getLastIndex() {
		return lastIndex;
	}

	/**
	 * lastIndex attribute 값을 설정한다.
	 * @param lastIndex int
	 */
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	/**
	 * recordCountPerPage attribute 값을  리턴한다.
	 * @return int
	 */
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	/**
	 * recordCountPerPage attribute 값을 설정한다.
	 * @param recordCountPerPage int
	 */
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}



}
