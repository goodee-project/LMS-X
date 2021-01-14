package gd.fintech.lms.common;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class PathUtil {

	private final Logger logger = LoggerFactory.getLogger(PathUtil.class);
	
    private String OS = System.getProperty("os.name").toLowerCase(); // 현재 운영체제가 무엇인지
    
    public String PATH(String dirName, HttpServletRequest request) { 
        logger.debug("Server OS = " + OS);      
    	// 운영체제가 리눅스일 경우
        if ( OS.indexOf("nux") >= 0) {
			// return "/home/ubuntu/tomcat9/webapps/lms/resource/" + dirName + "/";
			return request.getSession().getServletContext().getRealPath("/") + "/resource/" + dirName + "/";
        // 운영체제가 윈도우일 경우
        } else {
            File file = new File("");
        	return file.getAbsolutePath() + "\\src\\main\\webapp\\resource\\" + dirName + "\\";
        }
    }
}
