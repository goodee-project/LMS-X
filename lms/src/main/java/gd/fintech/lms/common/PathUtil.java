package gd.fintech.lms.common;

import java.io.File;

public class PathUtil {

    private static String OS = System.getProperty("os.name").toLowerCase(); // 현재 운영체제가 무엇인지

    public static String PATH() {       
    	// 윈도우일 경우의 경로
        if (OS.indexOf("win") >= 0) {
            File file = new File("");
        	return file.getAbsolutePath() + "\\src\\main\\webapp\\resource\\";
        } else if (OS.indexOf("nix") >= 0 || OS.indexOf("nux") >= 0 || OS.indexOf("aix") > 0) {
        	return "/home/ubuntu/tomcat9/webapps/lms/resource/";
        } else {
        	return "그 외의 운영체제";
        }
    }	
}
