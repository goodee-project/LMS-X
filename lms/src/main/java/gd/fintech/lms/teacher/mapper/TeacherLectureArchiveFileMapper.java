package gd.fintech.lms.teacher.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LectureArchiveFile;

@Mapper
public interface TeacherLectureArchiveFileMapper {
	int insertTeacherLectureArchiveFile(LectureArchiveFile lectureArchiveFile);
}
