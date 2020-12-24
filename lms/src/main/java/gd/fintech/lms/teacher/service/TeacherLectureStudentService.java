package gd.fintech.lms.teacher.service;

import java.util.List;import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherLectureStudentMapper;
import gd.fintech.lms.vo.LectureAndStudentAndClassRegistration;

@Service
@Transactional
public class TeacherLectureStudentService {
	@Autowired TeacherLectureStudentMapper teacherLectureStudentMapper;
	
	public List<LectureAndStudentAndClassRegistration> selectTeacherLecutreStudentListByPage(Map<String, Object> map) {
		return teacherLectureStudentMapper.selectTeacherLectureStudentListByPage(map);
	}
	
	public LectureAndStudentAndClassRegistration getStudentOne(Map<String, Object> map) {
		return teacherLectureStudentMapper.selectTeacherLectureStudentOne(map);
	}
	
	public int getTeacherLectureStudentCount(Map<String, Object> map) {
		return teacherLectureStudentMapper.selectTeacherLectureStudentCount(map);
	}
}
