package gd.fintech.lms.student.restservice;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.student.restmapper.StudentReportRestMapper;

@Service
public class StudentReportRestService {
	@Autowired StudentReportRestMapper studentReportRestMapper;

	// localhost로 작업 할 때의 경로
    File file = new File("");
	String PATH = file.getAbsolutePath() + "\\src\\main\\webapp\\resource\\reportSubmitFile\\";  
	
	// aws에 업로드 시 사용하는 경로
	// String PATH = "/home/ubuntu/tomcat9/webapps/lms/resource/";  
	
	// 과제 제출 첨부파일 다운로드 횟수 증가
	public int updateReportSubmitFileCount(String uuid) {
		studentReportRestMapper.updateReportSubmitFileCount(uuid);
		return studentReportRestMapper.selectReportSubmitFileCount(uuid);
	}
	
	// 과제 제출 첨부파일 한개 삭제
	public int deleteReportSubmitFileOne(String uuid) {

		// 실제 파일 삭제
		File f = new File(PATH + uuid);
		f.delete();
		
		return studentReportRestMapper.deleteReportSubmitFileOne(uuid);
	}
	
	// 해당 과제가 제출 기간 인지
	public int selectCheckReportSubmitDate(int reportNo) {
		return studentReportRestMapper.selectCheckReportSubmitDate(reportNo);
	}
}
