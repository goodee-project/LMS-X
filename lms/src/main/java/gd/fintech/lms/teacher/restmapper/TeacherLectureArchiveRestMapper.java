package gd.fintech.lms.teacher.restmapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TeacherLectureArchiveRestMapper {
	// 강좌 자료실 파일 다운 횟수 증가
	public int updateLectureArchiveFileCount(String uuid);
	
	// 강좌 자료실 파일 다운 횟수 가져오기
	public int selectLectureArchiveFileCount(String uuid);
}
