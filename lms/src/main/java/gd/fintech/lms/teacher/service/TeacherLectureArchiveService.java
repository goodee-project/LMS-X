package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherLectureArchiveMapper;
import gd.fintech.lms.vo.LectureArchive;

@Service
@Transactional
public class TeacherLectureArchiveService {
	@Autowired private TeacherLectureArchiveMapper teacherLectureArchiveMapper;
	
	// 강좌 자료실 목록
	// 강좌 고유번호(lectureNo)를 이용
	public List<LectureArchive> getTeacherLectureArchiveListByPage(int lectureNo, int beginRow, int rowPerPage) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("lectureNo", lectureNo);		// 강의실 고유번호
		map.put("beginRow", beginRow);			// 시작 데이터
		map.put("rowPerPage", rowPerPage);		// 한 페이지당 표시할 데이터 수
		
		List<LectureArchive> lectureArchiveList = teacherLectureArchiveMapper.selectTeacherLectureArchiveListByPage(map);
		
		return lectureArchiveList;
	}
	
	// 자료실 데이터의 총 갯수 계산
	// 강좌 고유번호(lectureNo)를 이용
	public int getCountTeacherLectureArchive(int lectureNo) {
		return teacherLectureArchiveMapper.selectTeacherLectureArchiveListCount(lectureNo);
	}
}
