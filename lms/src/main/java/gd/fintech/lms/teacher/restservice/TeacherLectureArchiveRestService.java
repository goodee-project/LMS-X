package gd.fintech.lms.teacher.restservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.teacher.restmapper.TeacherLectureArchiveRestMapper;

@Service
public class TeacherLectureArchiveRestService {
	@Autowired TeacherLectureArchiveRestMapper teacherLectureArchiveRestMapper;
	
	// 강좌 자료실 첨부파일 다운로드 횟수 증가
	public int updateLectureArchiveFileCount(String uuid) {
		teacherLectureArchiveRestMapper.updateLectureArchiveFileCount(uuid);
		
		return teacherLectureArchiveRestMapper.selectLectureArchiveFileCount(uuid);
	}
}
