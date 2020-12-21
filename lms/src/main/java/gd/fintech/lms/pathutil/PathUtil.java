package gd.fintech.lms.pathutil;

import java.io.File;

public class PathUtil {
    static File file = new File("");
    
	// localhost로 작업 할 때의 경로
	public final static String PATH = file.getAbsolutePath() + "\\src\\main\\webapp\\resource\\";	
	
	// aws에 업로드 시 사용하는 경로
	// String PATH = "/home/ubuntu/tomcat9/webapps/lms/";  		
}
