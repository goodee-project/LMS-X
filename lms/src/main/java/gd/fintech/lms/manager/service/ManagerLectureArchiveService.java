package gd.fintech.lms.manager.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.common.PathUtil;
import gd.fintech.lms.manager.mapper.ManagerLectureArchiveFileMapper;
import gd.fintech.lms.manager.mapper.ManagerLectureArchiveMapper;
import gd.fintech.lms.vo.LectureArchive;

@Service
public class ManagerLectureArchiveService {
	@Autowired ManagerLectureArchiveMapper managerLectureArchiveMapper;
	@Autowired private ManagerLectureArchiveFileMapper managerLectureArchiveFileMapper;
	@Autowired private PathUtil pathUtil;
	
	// 자료 목록
	public List<LectureArchive> getLectureArchiveListByPage(Map<String, Object> map) {
		return managerLectureArchiveMapper.selectLectureArchiveListByPage(map);
	}
		
	// 자료 카운팅
	public int selectLectureArchiveCount(int lectureNo) {
		return managerLectureArchiveMapper.selectLectureArchiveListCount(lectureNo);
	}
	
	// 자료 상세보기
	public LectureArchive getLectureArchiveOne(int lectureArchiveNo) {
		return managerLectureArchiveMapper.selectLectureArchiveOne(lectureArchiveNo);
	}
	
	// 자료 게시판 상세보기 조회수 증가
	public int updateLectureArchiveCountUp(int lectureArchiveNo) {
		return managerLectureArchiveMapper.updateLectureArchiveCount(lectureArchiveNo);
	}
	
	// 자료 첨부파일 전체 삭제
	// 자료 고유번호(archiveNo)
	public void deleteManagerLectureArchive(int archiveNo ,
			HttpServletRequest request) {
		// 게시물에 속해있는 첨부파일 목록 조회
		List<String> managerLectureArchiveFileList = managerLectureArchiveFileMapper.selectManagerLectureArchiveFileList(archiveNo);
		
		// 첨부파일 목록에서 파일을 하나씩 불러온다
		for (String s: managerLectureArchiveFileList) {
			// 첨부파일 경로 + 첨부파일 이름
			File file = new File(pathUtil.PATH("archiveFile", request) + s);
			
			// 파일이 존재하는 경우
			if (file.exists()) {
				// 파일삭제
				file.delete();
			}
		}
		
		// 데이터베이스의 첨부파일 목록 삭제
		managerLectureArchiveFileMapper.deleteManagerLectureArchiveFileAll(archiveNo);
		
		// 데이터베이스의 게시물 삭제
		managerLectureArchiveMapper.deleteManagerLectureArchive(archiveNo);
	}
}
