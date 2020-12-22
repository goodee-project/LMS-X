package gd.fintech.lms.teacher.restservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.teacher.restmapper.TeacherSyllabusRestMapper;

@Service
public class TeacherSyllabusRestService {
	@Autowired TeacherSyllabusRestMapper teacherSyllabusRestMapper;
	
	// 강의 계획서 첨부파일 다운로드 횟수 증가
	public int updateTeacherSyllabusCountUp(String uuid) {
		teacherSyllabusRestMapper.updateTeacherSyllabusCountUp(uuid);
		
		return teacherSyllabusRestMapper.selectTeacherSyllabusCountUp(uuid);
		
	}
}
