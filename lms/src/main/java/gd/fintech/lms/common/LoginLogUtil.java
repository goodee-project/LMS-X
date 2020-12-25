package gd.fintech.lms.common;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class LoginLogUtil {

	private static final Logger log = LoggerFactory.getLogger(LoginLogUtil.class);
	// 사용자 브라우저 구하기
	public static String getClientBrowser(HttpServletRequest req) {
		String browser = "";
		try { 
			String browserInfo = req.getHeader("User-Agent"); // 사용자 User-Agent 값 얻기 
			log.debug("getHeader : " + req.getHeader("User-Agent"));
			log.debug("getClientBrowser : " + browserInfo);
			// 익스플로러
			if (browserInfo != null) {
				if (browserInfo.indexOf("Trident") != -1) {
					browser = "Internet Explorer";
				// 엣지
				} else if (browserInfo.indexOf("Edg") != -1) {
					browser = "Edge";
				// 크롬
				} else if (browserInfo.indexOf("Chrome") != -1) {
					browser = "Chrome";
				// 파이어 폭스
				} else if (browserInfo.indexOf("Firefox") != -1) {
					browser = "Firefox";
				// 사파리
				} else if (browserInfo.indexOf("Safari") != -1) {
					browser = "Safari";
				// 오페라
				} else if (browserInfo.indexOf("Opera") != -1) {
					browser = "Opera";
				} else if (browserInfo.indexOf("iPhone") != -1 && browserInfo.indexOf("Mobile") != -1) {  // 모바일 - 아이폰
					browser = "iPhone"; 
				} else if (browserInfo.indexOf("Android") != -1 && browserInfo.indexOf("Mobile") != -1) {  // 모바일 - 안드로이드
					browser = "Android"; 
				} else {
					browser = "알 수 없는 브라우저";
				}
			}
		} catch (Exception e) { 
			e.printStackTrace(); 
		} 

		return browser; 
	}		
	
	// 사용자 ip 구하기
	public static String getClientIp(HttpServletRequest req) {
		String ip = "";
		try {
			String clientIp = req.getHeader("HTTP_X_FORWARDED_FOR");
			log.debug("getClientIp : " + clientIp);
			if (null == clientIp || clientIp.length() == 0 || clientIp.toLowerCase().equals("unknown")) {
				ip = req.getHeader("REMOTE_ADDR");
			}
			if (null == clientIp || clientIp.length() == 0 || clientIp.toLowerCase().equals("unknown")) { 
				ip = req.getRemoteAddr(); 
			}
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		return ip;
	}
	
	// 사용자 운영체제 구하기
	public static String getClientOs(HttpServletRequest req) {
		String os = "";
		String clientOs = req.getHeader("User-Agent");
		log.debug("getClientOs : " + clientOs);
		try {
			if (clientOs.indexOf("NT 10.0") != -1) {
			os = "Windows 10";
			} else if (clientOs.indexOf("NT 7.0") != -1) {
				os = "Windows 7";
			} else if (clientOs.indexOf("NT 6.0") != -1) {
				os = "Windows Vista/Server 2008";
			} else if (clientOs.indexOf("NT 5.2") != -1) {
				os = "Windows Server 2003";
			} else if (clientOs.indexOf("NT 5.1") != -1) {
				os = "Windows XP";
			} else if (clientOs.indexOf("NT 5.0") != -1) {
				os = "Windows 2000";
			} else if (clientOs.indexOf("NT") != -1) {
				os = "Windows NT";
			} else if (clientOs.indexOf("NT 9x 4.90") != -1) {
				os = "Windows Me";
			} else if (clientOs.indexOf("98") != -1) {
				os = "Windows 98";
			} else if (clientOs.indexOf("95") != -1) {
				os = "Windows 95";
			} else if (clientOs.indexOf("Win16") != -1) {
				os = "Windows 3.x";
			} else if (clientOs.indexOf("Windows") != -1) {
				os = "Windows";
			} else if (clientOs.indexOf("Linux") != -1) {
				os = "Linux";
			} else if (clientOs.indexOf("Macintosh") != -1) {
				os = "Macintosh";
			} else {
				os = "알 수 없는 운영체제";
			}
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		return os;
	}
}

