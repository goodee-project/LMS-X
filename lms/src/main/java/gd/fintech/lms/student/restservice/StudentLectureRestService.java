package gd.fintech.lms.student.restservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.student.restmapper.StudentLectureRestMapper;
import gd.fintech.lms.vo.ClassRegistration;

@Service
public class StudentLectureRestService {
	@Autowired StudentLectureRestMapper studentLectureRestMapper;
	
	public boolean selectCheckClassRegistration(ClassRegistration classRegistration) {
		int cnt = studentLectureRestMapper.selectCheckClassRegistration(classRegistration);
		
		if (cnt == 0) {
			return true;
		}
		return false;
	}
	
	// 과제 제출 첨부파일 다운로드 횟수 증가
	public int updateReportSubmitFileCount(String uuid) {
		studentLectureRestMapper.updateReportSubmitFileCount(uuid);
		return studentLectureRestMapper.selectReportSubmitFileCount(uuid);
	}
}
