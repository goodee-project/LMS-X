package gd.fintech.lms.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LectureArchiveFile;

@Mapper
public interface ManagerLectureArchiveFileMapper {
	// 자료 첨부파일 목록
	List<String> selectManagerLectureArchiveFileList(int archiveNo);
	
	// 자료 첨부파일 추가
	int insertManagerLectureArchiveFile(LectureArchiveFile lectureArchiveFile);
	
	// 자료 첨부파일 전체 삭제
	int deleteManagerLectureArchiveFileAll(int archiveNo);
}
