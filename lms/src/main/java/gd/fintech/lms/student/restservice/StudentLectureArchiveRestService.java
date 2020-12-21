package gd.fintech.lms.student.restservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.student.restmapper.StudentLectureArchiveRestMapper;

@Service
public class StudentLectureArchiveRestService {
	@Autowired StudentLectureArchiveRestMapper studentLectureArchiveRestMapper;
	// 강좌 자료실 첨부파일 다운로드 횟수 증가
	public int updateLectureArchiveFileCount(String uuid) {
		studentLectureArchiveRestMapper.updateLectureArchiveFileCount(uuid);
		return studentLectureArchiveRestMapper.selectLectureArchiveFileCount(uuid);
	}
}
