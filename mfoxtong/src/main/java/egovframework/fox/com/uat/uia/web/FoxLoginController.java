package egovframework.fox.com.uat.uia.web;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.Globals;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.uss.umt.service.EgovMberManageService;
import egovframework.fox.com.uat.uia.service.FoxLoginService;
import egovframework.mbl.com.cmm.annotation.IncludedMblInfo;

/*
import com.gpki.servlet.GPKIHttpServletRequest;
import com.gpki.servlet.GPKIHttpServletResponse;
import com.gpki.io.GPKIJspWriter;
import com.gpki.secureweb.GPKIKeyInfo;
import com.dsjdf.jdf.*;

import com.gpki.gpkiapi.GpkiApi;
import com.gpki.gpkiapi.cert.X509Certificate;
import com.gpki.gpkiapi.cms.SignedData;
import com.gpki.gpkiapi.crypto.PrivateKey;
import com.gpki.gpkiapi.crypto.Random;
import com.gpki.gpkiapi.storage.*;
import com.gpki.gpkiapi.util.*;
import com.gpki.gpkiapi.exception.GpkiApiException;
*/


import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;



/**
 * 일반 로그인, 인증서 로그인을 처리하는 컨트롤러 클래스
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
 *
 *  </pre>
 */
@Controller
public class FoxLoginController implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/** FoxLoginService */
	@Resource(name = "foxLoginService")
    private FoxLoginService foxLoginService;

	/** EgovCmmUseService */
	@Resource(name="EgovCmmUseService")
	private EgovCmmUseService cmmUseService;


	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

	/** log */
    private static final Logger LOGGER = LoggerFactory.getLogger(FoxLoginController.class);

	/**
	 * 로그인 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
    @IncludedMblInfo(name="모바일 Login",order = 300 ,gid = 30)
    @RequestMapping(value="/uat/uia/egovLoginUsr.fo")
	public String loginUsrView(@ModelAttribute("loginVO") LoginVO loginVO,
			HttpServletRequest request,
			HttpServletResponse response,
			ModelMap model)
			throws Exception {

    	return "egovframework/fox/com/uat/uia/FoxLoginUsr";
	}


//	/**
//	 * PC로그인 화면으로 들어간다
//	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
//	 * @return 로그인 페이지
//	 * @exception Exception
//	 */
//    @RequestMapping(value="/uat/uia/egovLoginUsrPC.do")
//	public String loginUsrPCView(@ModelAttribute("loginVO") LoginVO loginVO,
//			HttpServletRequest request,
//			HttpServletResponse response,
//			ModelMap model)
//			throws Exception {
//
//    	return "egovframework/fox/uat/uia/FoxLoginUsr";
//	}

    /**
	 * 일반(세션) 로그인을 처리한다
	 * @param vo - 아이디, 비밀번호가 담긴 LoginVO
	 * @param request - 세션처리를 위한 HttpServletRequest
	 * @return result - 로그인결과(세션정보)
	 * @exception Exception
	 */
    @RequestMapping(value="/uat/uia/actionLogin.fo")
    public String actionLogin(@ModelAttribute("loginVO") LoginVO loginVO,
    		                   HttpServletRequest request,
    		                   ModelMap model)
            throws Exception {



    	// 1. 일반 로그인 처리
        LoginVO resultVO = foxLoginService.actionLogin(loginVO);


        if (resultVO != null && resultVO.getMberEmailAddres() != null && !resultVO.getMberEmailAddres().equals("")) {

        	// 2-1. 로그인 정보를 세션에 저장
        	request.getSession().setAttribute("loginVO", resultVO);

    		return "redirect:/uat/uia/actionMain.fo";

        } else {

        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/fox/com/uat/uia/FoxLoginUsr";
        }
    }

    /**
	 * 일반(스프링 시큐리티) 로그인을 처리한다
	 * @param vo - 아이디, 비밀번호가 담긴 LoginVO
	 * @param request - 세션처리를 위한 HttpServletRequest
	 * @return result - 로그인결과(세션정보)
	 * @exception Exception
	 */
    @RequestMapping(value="/uat/uia/actionSecurityLogin.fo")
    public String actionSecurityLogin(@ModelAttribute("loginVO") LoginVO loginVO,
    		                   HttpServletRequest request,
    		                   ModelMap model)
            throws Exception {

    	// 1. 일반 로그인 처리
        LoginVO resultVO = foxLoginService.actionLogin(loginVO);

        if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("")) {

        	// 2. 스프링 시큐리티를 이용한 로그인처리
        	// 관련 설정 파일인 context-security.xml 파일이 있어야 하며, web.xml에 필터가 등록되어 있어야 한다.
        return "redirect:/j_spring_security_check?j_username=" + resultVO.getUserSe() + resultVO.getId() + "&j_password=" + resultVO.getUniqId();


        } else {
           	model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/fox/com/uat/uia/FoxLoginUsr";
        }
    }
    /**
	 * 로그인 후 메인화면으로 들어간다
	 * @param
	 * @return 로그인 페이지
	 * @exception Exception
	 */
    @SuppressWarnings("unused")
	@RequestMapping(value="/uat/uia/actionMain.fo")
	public String actionMain(ModelMap model, HttpServletRequest request)
			throws Exception {

    	// 1. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/fox/com/uat/uia/FoxLoginUsr";
    	}
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	/*
    	// 2. 메뉴조회
		MenuManageVO menuManageVO = new MenuManageVO();
    	menuManageVO.setTmp_Id(user.getId());
    	menuManageVO.setTmp_UserSe(user.getUserSe());
    	menuManageVO.setTmp_Name(user.getName());
    	menuManageVO.setTmp_Email(user.getEmail());
    	menuManageVO.setTmp_OrgnztId(user.getOrgnztId());
    	menuManageVO.setTmp_UniqId(user.getUniqId());
    	List list_headmenu = menuManageService.selectMainMenuHead(menuManageVO);
		model.addAttribute("list_headmenu", list_headmenu);
    	*/

		// 3. 메인 페이지 이동
		String main_page = Globals.MAIN_PAGE;

		LOGGER.debug("Globals.MAIN_PAGE > {}", Globals.MAIN_PAGE);
		LOGGER.debug("main_page_Mobile > {}", main_page);

		if (main_page.startsWith("/")) {

			return "forward:" + main_page;

		} else {

		    return main_page;

		}

		/*
		if (main_page != null && !main_page.equals("")) {

			// 3-1. 설정된 메인화면이 있는 경우
			return main_page;

		} else {

			// 3-2. 설정된 메인화면이 없는 경우
			if (user.getUserSe().equals("USR")) {
	    		return "EgovMainView";
	    	} else {
	    		return "EgovMainViewG";
	    	}
		}
		*/
	}
    
//    /**
//	 * 로그인 후 메인화면으로 들어간다
//	 * @param
//	 * @return 로그인 페이지
//	 * @exception Exception
//	 */
//    @SuppressWarnings("unused")
//	@RequestMapping(value="/uat/uia/actionMainPC.fo")
//	public String actionMainPC(ModelMap model, HttpServletRequest request)
//			throws Exception {
//
//    	// 1. Spring Security 사용자권한 처리
//    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//    	if(!isAuthenticated) {
//    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//        	return "egovframework/fox/com/uat/uia/FoxLoginUsr";
//    	}
//    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
//
//    	/*
//    	// 2. 메뉴조회
//		MenuManageVO menuManageVO = new MenuManageVO();
//    	menuManageVO.setTmp_Id(user.getId());
//    	menuManageVO.setTmp_UserSe(user.getUserSe());
//    	menuManageVO.setTmp_Name(user.getName());
//    	menuManageVO.setTmp_Email(user.getEmail());
//    	menuManageVO.setTmp_OrgnztId(user.getOrgnztId());
//    	menuManageVO.setTmp_UniqId(user.getUniqId());
//    	List list_headmenu = menuManageService.selectMainMenuHead(menuManageVO);
//		model.addAttribute("list_headmenu", list_headmenu);
//    	*/
//
//		// 3. 메인 페이지 이동
//		String main_page = Globals.MAIN_PAGE;
//
//		LOGGER.debug("Globals.MAIN_PAGE > {}", Globals.MAIN_PAGE);
//		LOGGER.debug("main_page_Mobile > {}", main_page);
//
//		// 4. 접속 기기에 따라서 모바일용/일반웹용 처음 페이지를 다르게 호출한다.
//    	String userAgent = request.getHeader("user-agent");
//    	// Window에서 접속할 경우 PC버젼 홈으로 이동한다.
//    	if(userAgent.contains("Windows NT")){
//    		LOGGER.debug("main_page_PC > {}", main_page);
//    		//main_page = "/sym/mnu/mpm/EgovMainMenuHome.do";
//    		main_page = "/index.do";
//    	}
//
//
//		if (main_page.startsWith("/")) {
//
//			return "forward:" + main_page;
//
//		} else {
//
//		    return main_page;
//
//		}
//
//		/*
//		if (main_page != null && !main_page.equals("")) {
//
//			// 3-1. 설정된 메인화면이 있는 경우
//			return main_page;
//
//		} else {
//
//			// 3-2. 설정된 메인화면이 없는 경우
//			if (user.getUserSe().equals("USR")) {
//	    		return "EgovMainView";
//	    	} else {
//	    		return "EgovMainViewG";
//	    	}
//		}
//		*/
//	}
    /**
	 * 로그아웃한다.
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/uat/uia/actionLogout.fo")
	public String actionLogout(HttpServletRequest request, ModelMap model)
			throws Exception {

    	/*String userIp = EgovClntInfo.getClntIP(request);

    	// 1. Security 연동
    	return "redirect:/j_spring_security_logout";*/

    	request.getSession().setAttribute("loginVO", null);


    	//return "redirect:" + request.getRequestURI();  href="${pageContext.request.contextPath}/FoxMobileMain.fo"
//    	return "/index";
    	return "forward:/FoxMobileMain.fo";
    }
    
	/**
	 * 아이디,패스워드 찾기 SMS인증화면 
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
    @IncludedMblInfo(name="모바일 Login",order = 300 ,gid = 30)
    @RequestMapping(value="/uat/uia/foxIdPwSMSCertView.fo")
	public String foxIdPwSMSCertView(@ModelAttribute("loginVO") LoginVO loginVO,
			HttpServletRequest request,
			HttpServletResponse response,
			ModelMap model)
			throws Exception {
    	
    	model.addAttribute("loginVO", loginVO);

    	return "egovframework/fox/com/uat/uia/FoxIdPwSMSCertView";
	}
    
	/**
	 * 아이디 찾기 결과 
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
    @IncludedMblInfo(name="모바일 Login",order = 300 ,gid = 30)
    @RequestMapping(value="/uat/uia/foxIdPwSearchResult.fo")
	public String foxIdSearchResult(@ModelAttribute("loginVO") LoginVO loginVO,
			HttpServletRequest request,
			HttpServletResponse response,
			ModelMap model)
			throws Exception {
    	
        LoginVO resultVO = foxLoginService.searchId(loginVO);
    	
    	model.addAttribute("loginVO", loginVO);
    	model.addAttribute("resultVO", resultVO);
    	
    	return "egovframework/fox/com/uat/uia/FoxIdPWSearchResult";
	}
    
    
    
	/**
	 * 나의 페이지 (여우정보)
	 * @param 
	 * @return 로그인 페이지
	 * @exception Exception
	 */
    @RequestMapping(value="/uat/uia/foxMypage.fo")
	public String foxMyPage(@ModelAttribute("loginVO") LoginVO loginVO,
			HttpServletRequest request,
			HttpServletResponse response,
			ModelMap model)
			throws Exception {
    	
        LoginVO resultVO = foxLoginService.searchId(loginVO);
    	
    	model.addAttribute("loginVO", loginVO);
    	model.addAttribute("resultVO", resultVO);
    	
    	return "egovframework/fox/com/uat/uia/FoxMyPage";
	}
    

  //20220107 naver sms 문자인증 start    
    @RequestMapping(value = "/uat/uai/phoneCheck.fo", method = RequestMethod.POST)     
    @ResponseBody 
    private String sendSMS(@RequestParam("smoblphonNo") String userPhoneNumber) {
		String hostNameUrl = "https://sens.apigw.ntruss.com";     		// 호스트 URL
		String requestUrl= "/sms/v2/services/";                   		// 요청 URL
		String requestUrlType = "/messages";                      		// 요청 URL
		String accessKey = "HrtFAfb6obqep76OBONE";                     	// 네이버 클라우드 플랫폼 회원에게 발급되는 개인 인증키			// Access Key : https://www.ncloud.com/mypage/manage/info > 인증키 관리 > Access Key ID
		//String secretKey = "b331f0437f3749f1a5d3e8f77d4f5d13";  // 2차 인증을 위해 서비스마다 할당되는 service secret key	// Service Key : https://www.ncloud.com/mypage/manage/info > 인증키 관리 > Access Key ID	
		String secretKey = "Mb8PLsTiJe3e9MpLWpcWEJ0TJiNnJwjJ233uI9D6"; 
		String serviceId = "ncp:sms:kr:278091939821:sms-test";       // 프로젝트에 할당된 SMS 서비스 ID							// service ID : https://console.ncloud.com/sens/project > Simple & ... > Project > 서비스 ID
		String method = "POST";											// 요청 method
		String timestamp = Long.toString(System.currentTimeMillis()); 	// current timestamp (epoch)
		requestUrl += serviceId + requestUrlType;
		String apiUrl = hostNameUrl + requestUrl;
		
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성 
		
		
		// JSON 을 활용한 body data 생성
		JSONObject bodyJson = new JSONObject();
		JSONObject toJson = new JSONObject();
	   JSONArray  toArr = new JSONArray();

	    //toJson.put("subject","");							// Optional, messages.subject	개별 메시지 제목, LMS, MMS에서만 사용 가능
	    //toJson.put("content","sms test in spring 111");	// Optional, messages.content	개별 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
	    toJson.put("to",userPhoneNumber);						// Mandatory(필수), messages.to	수신번호, -를 제외한 숫자만 입력 가능
	    toArr.put(toJson);
	    
	    bodyJson.put("type","SMS");							// Madantory, 메시지 Type (SMS | LMS | MMS), (소문자 가능)
	    bodyJson.put("contentType","COMM");					// Optional, 메시지 내용 Type (AD | COMM) * AD: 광고용, COMM: 일반용 (default: COMM) * 광고용 메시지 발송 시 불법 스팸 방지를 위한 정보통신망법 (제 50조)가 적용됩니다.
	    bodyJson.put("countryCode","82");					// Optional, 국가 전화번호, (default: 82)
	    bodyJson.put("from","01028688051");					// Mandatory, 발신번호, 사전 등록된 발신번호만 사용 가능		
	    //bodyJson.put("subject","");						// Optional, 기본 메시지 제목, LMS, MMS에서만 사용 가능
	    bodyJson.put("content","[통통통]인증번호는 [" + randomNumber + "]입니다.");	// Mandatory(필수), 기본 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
	    bodyJson.put("messages", toArr);					// Mandatory(필수), 아래 항목들 참조 (messages.XXX), 최대 1,000개
	    
	    //String body = bodyJson.toJSONString();
	    String body = bodyJson.toString();	    	    
	    
	    
	    
	    System.out.println(body);
	    
        try {
            URL url = new URL(apiUrl);

            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            con.setRequestProperty("content-type", "application/json");
            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
            con.setRequestMethod(method);
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            
            wr.write(body.getBytes());
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            System.out.println("responseCode" +" " + responseCode);
            if(responseCode == 202) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else { // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            
            System.out.println(response.toString());

        } catch (Exception e) {
            System.out.println(e);
        }
        return Integer.toString(randomNumber);
	}
  
 // https://api.ncloud-docs.com/docs/common-ncpapi
 	private String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey) throws NoSuchAlgorithmException, InvalidKeyException {
 	    String space = " ";                    // one space
 	    String newLine = "\n";                 // new line
 	    

 	    String message = new StringBuilder()
 	        .append(method)
 	        .append(space)
 	        .append(url)
 	        .append(newLine)
 	        .append(timestamp)
 	        .append(newLine)
 	        .append(accessKey)
 	        .toString();

 	    SecretKeySpec signingKey;
 	    String encodeBase64String;
 		try {
 			
 			signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
 			Mac mac = Mac.getInstance("HmacSHA256");
 			mac.init(signingKey);
 			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
 		    encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
 		} catch (UnsupportedEncodingException e) {
 			// TODO Auto-generated catch block
 			encodeBase64String = e.toString();
 		}
 	    

 	  return encodeBase64String;
 	}
 	  //20220107 naver sms 문자인증 end  
}