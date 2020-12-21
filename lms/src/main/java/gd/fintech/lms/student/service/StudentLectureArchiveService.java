package gd.fintech.lms.student.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.student.mapper.StudentLectureArchiveMapper;
import gd.fintech.lms.vo.LectureArchive;

@Service
public class StudentLectureArchiveService {
	@Autowired StudentLectureArchiveMapper studentLectureArchiveMapper;
	
	// 자료실 목록 가져오기
	public List<LectureArchive> selectLectureArchiveListByPage(Map<String, Object> map){
		return studentLectureArchiveMapper.selectLectureArchiveListByPage(map);
	}
	
	// 자료실 개수 가져오기
	public int selectLectureArchiveCount(int lectureNo) {
		return studentLectureArchiveMapper.selectLectureArchiveListCount(lectureNo);
	}
	
	// 자료실 상세보기
	public LectureArchive selectLectureArchiveOne(int lectureArchiveNo) {
		studentLectureArchiveMapper.updateLectureArchiveCount(lectureArchiveNo);
		return studentLectureArchiveMapper.selectLectureArchiveOne(lectureArchiveNo);
	}
}
