package egovframework.fox.gct.service;

public class FoxGcctInfoVO {
	
	private String gcctId ="";
	private String esntlId ="";
	private String bsshEsntlId="";
	private int gcctAmount=0;
	private String distbBeginDe="";
	private String distbEndDe="";
	private String usePnttm="";
	private String gcctSttus="";
	private String frstRegistPnttm="";
	private String frstRegistId="";
	private String lastUpdtPnttm="";
	private String lastUpdtId="";
	
	// 업체목록 정보 추가
	private String dongCode="";
	private String mtltyNm="";
	private String tlphonNo="";
	private String moblphonNo="";
	private String adRes="";
	private String laadRes="";
	
	//사용자 쿠폰 정보 추가
	private String emplyrgcctflag = "";
	
	//위경도 정보 추가
	private String latiTude="";
	private String longiTude="";
	
	//내위치 정보
    private String nowlatitude ="";
    private String nowlongitude ="";
    
    //두지점간 거리
    private String distance ="";
    
	

	public String getGcctId() {
		return gcctId;
	}
	public void setGcctId(String gcctId) {
		this.gcctId = gcctId;
	}
	public String getEsntlId() {
		return esntlId;
	}
	public void setEsntlId(String esntlId) {
		this.esntlId = esntlId;
	}
	public String getBsshEsntlId() {
		return bsshEsntlId;
	}
	public void setBsshEsntlId(String bsshEsntlId) {
		this.bsshEsntlId = bsshEsntlId;
	}
	public int getGcctAmount() {
		return gcctAmount;
	}
	public void setGcctAmount(int gcctAmount) {
		this.gcctAmount = gcctAmount;
	}
	public String getDistbBeginDe() {
		return distbBeginDe;
	}
	public void setDistbBeginDe(String distbBeginDe) {
		this.distbBeginDe = distbBeginDe;
	}
	public String getDistbEndDe() {
		return distbEndDe;
	}
	public void setDistbEndDe(String distbEndDe) {
		this.distbEndDe = distbEndDe;
	}
	public String getUsePnttm() {
		return usePnttm;
	}
	public void setUsePnttm(String usePnttm) {
		this.usePnttm = usePnttm;
	}
	public String getGcctSttus() {
		return gcctSttus;
	}
	public void setGcctSttus(String gcctSttus) {
		this.gcctSttus = gcctSttus;
	}
	public String getFrstRegistPnttm() {
		return frstRegistPnttm;
	}
	public void setFrstRegistPnttm(String frstRegistPnttm) {
		this.frstRegistPnttm = frstRegistPnttm;
	}
	public String getFrstRegistId() {
		return frstRegistId;
	}
	public void setFrstRegistId(String frstRegistId) {
		this.frstRegistId = frstRegistId;
	}
	public String getLastUpdtPnttm() {
		return lastUpdtPnttm;
	}
	public void setLastUpdtPnttm(String lastUpdtPnttm) {
		this.lastUpdtPnttm = lastUpdtPnttm;
	}
	public String getLastUpdtId() {
		return lastUpdtId;
	}
	public void setLastUpdtId(String lastUpdtId) {
		this.lastUpdtId = lastUpdtId;
	}
	public String getDongCode() {
		return dongCode;
	}
	public void setDongCode(String dongCode) {
		this.dongCode = dongCode;
	}
	public String getMtltyNm() {
		return mtltyNm;
	}
	public void setMtltyNm(String mtltyNm) {
		this.mtltyNm = mtltyNm;
	}
	public String getTlphonNo() {
		return tlphonNo;
	}
	public void setTlphonNo(String tlphonNo) {
		this.tlphonNo = tlphonNo;
	}
	public String getMoblphonNo() {
		return moblphonNo;
	}
	public void setMoblphonNo(String moblphonNo) {
		this.moblphonNo = moblphonNo;
	}
		
	public String getAdRes() {
		return adRes;
	}
	public void setAdRes(String adRes) {
		this.adRes = adRes;
	}
	public String getLaadRes() {
		return laadRes;
	}
	public void setLaadRes(String laadRes) {
		this.laadRes = laadRes;
	}
	//사용자 상품권 정보 추가
	public String getEmplyrgcctflag() {
		return emplyrgcctflag;
	}
	public void setEmplyrgcctflag(String emplyrgcctflag) {
		this.emplyrgcctflag = emplyrgcctflag;
	}
	
	//위경도 변수 추가 
	public String getLatiTude() {
		return latiTude;
	}
	public void setLatiTude(String latiTude) {
		this.latiTude = latiTude;
	}
	public String getLongiTude() {
		return longiTude;
	}
	public void setLongiTude(String longiTude) {
		this.longiTude = longiTude;
	}
	
	// 내위치
	public String getNowlatitude() {
		return nowlatitude;
	}
	public void setNowlatitude(String nowlatitude) {
		this.nowlatitude = nowlatitude;
	}
	public String getNowlongitude() {
		return nowlongitude;
	}
	public void setNowlongitude(String nowlongitude) {
		this.nowlongitude = nowlongitude;
	}
	
	//두지점사이 거리
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	


}
