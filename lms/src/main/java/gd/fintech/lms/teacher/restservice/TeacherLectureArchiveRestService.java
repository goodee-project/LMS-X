package gd.fintech.lms.teacher.restservice;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.pathutil.PathUtil;
import gd.fintech.lms.teacher.restmapper.TeacherLectureArchiveRestMapper;

@Service
public class TeacherLectureArchiveRestService {
	@Autowired TeacherLectureArchiveRestMapper teacherLectureArchiveRestMapper;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	// 첨부파일 경로
	private String PATH = PathUtil.PATH + "archiveFile\\";
	
	// 강좌 자료실 첨부파일 다운로드 횟수 증가
	public int updateLectureArchiveFileCount(String uuid) {
		teacherLectureArchiveRestMapper.updateLectureArchiveFileCount(uuid);
		
		return teacherLectureArchiveRestMapper.selectLectureArchiveFileCount(uuid);
	}
	
	// 강좌 자료실 첨부파일 단일 삭제
	public int deleteArchiveFileOne(String uuid) {
		// 첨부파일 경로 + 첨부파일 이름
		File file = new File(PATH + uuid);
		
		// 파일이 존재하는 경우
		if (file.exists()) {
			// 파일삭제
			file.delete();
		}
		
		return teacherLectureArchiveRestMapper.deleteArchiveFileOne(uuid);
	}
}
