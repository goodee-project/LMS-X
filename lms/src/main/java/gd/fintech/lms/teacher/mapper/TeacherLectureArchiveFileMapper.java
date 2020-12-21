package gd.fintech.lms.teacher.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LectureArchiveFile;

@Mapper
public interface TeacherLectureArchiveFileMapper {	
	// 자료 첨부파일 목록
	// 자료 고유번호(archiveNo)
	List<String> selectTeacherLectureArchiveFileList(int archiveNo);
	
	// 자료 첨부파일 입력
	// 자료실 파일 객체(lectureArchiveFile)
	int insertTeacherLectureArchiveFile(LectureArchiveFile lectureArchiveFile);
	
	// 자료 첨부파일 전체 삭제
	// 자료 고유번호(archiveNo)
	int deleteTeacherLectureArchiveFileAll(int archiveNo);
}
