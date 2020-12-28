package gd.fintech.lms.manager.restservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.manager.restmapper.ManagerLectureArchiveRestMapper;

@Service
public class ManagerLectureArchiveRestService {
	@Autowired ManagerLectureArchiveRestMapper managerLectureArchiveRestMapper;
	
	// 강좌 자료실 첨부파일 다운로드 횟수 증가
	public int updateLectureArchiveFileCount(String lectureArchiveFileUuid) {
		managerLectureArchiveRestMapper.updateLectureArchiveFileCount(lectureArchiveFileUuid);
		return managerLectureArchiveRestMapper.selectLectureArchiveFileCount(lectureArchiveFileUuid);
	}
}
