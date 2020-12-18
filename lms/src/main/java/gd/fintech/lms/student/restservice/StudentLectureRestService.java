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
	
}
