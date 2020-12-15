package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherLectureMapper;
import gd.fintech.lms.vo.Lecture;

@Service
@Transactional
public class TeacherLectureService {
	@Autowired private TeacherLectureMapper teacherLectureMapper;
	
	// 강사가 수업중인 강좌 목록을 출력
	// 강사 아이디(teacherId)를 이용
	public List<Lecture> getTeacherLectureListByPage(String teacherId, int currentPage, int rowPerPage) {
		// currentPage, rowPerPage를 통해 beginRow, rowPerPage 전달하여
		// TeacherLectureMapper의 메소드를 호출한다.
		// 이후 결과값을 받아 return 한다.
		
		int beginRow = (currentPage - 1) * rowPerPage;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("teacherId", teacherId);		// 강사 아이디
		map.put("beginRow", beginRow);			// 시작 데이터
		map.put("rowPerPage", rowPerPage);		// 한 페이지당 표시할 데이터 수
		
		List<Lecture> teacherLectureList = teacherLectureMapper.selectTeacherLectureListByPage(map);
		
		return teacherLectureList;
	}
	
	// 강사가 수업중인 강좌의 총 갯수 계산
	// 강사 아이디(teacherId)를 이용
	public int getCountTeacherLecture(String teacherId) {
		return teacherLectureMapper.selectTeacherLectureListCount(teacherId);
	}
	
	// 각 강좌별 정보를 출력
	// 강좌 고유번호(lectureNo)를 이용
	public Lecture getTeacherLectureOne(int lectureNo) {
		return teacherLectureMapper.selectTeacherLectureOne(lectureNo);
	}
}
