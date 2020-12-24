package gd.fintech.lms.teacher.service;

import java.util.List;import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherLectureStudentMapper;
import gd.fintech.lms.vo.LectureAndStudentAndClassRegistrationAndTeacher;

@Service
@Transactional
public class TeacherLectureStudentService {
	@Autowired TeacherLectureStudentMapper teacherLectureStudentMapper;
	
	public List<LectureAndStudentAndClassRegistrationAndTeacher> selectTeacherLecutreStudentListByPage(Map<String, Object> map) {
		System.out.println(selectTeacherLecutreStudentListByPage(map));
		return teacherLectureStudentMapper.selectTeacherLectureStudentListByPage(map);
	}
	
	public LectureAndStudentAndClassRegistrationAndTeacher selectStudentOne(Map<String, Object> map) {
		return teacherLectureStudentMapper.selectTeacherLectureStudentOne(map);
	}
	
	public int getTeacherLectureStudentCount() {
		return teacherLectureStudentMapper.selectTeacherLectureStudentCount();
	}
}
