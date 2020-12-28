package gd.fintech.lms.manager.restmapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ManagerLectureArchiveRestMapper {
	// 자료실 파일 다운 횟수 증가
	public int updateLectureArchiveFileCount(String lectureArchiveFileUuid);
	
	// 자료실 파일 다운 횟수 가져오기
	public int selectLectureArchiveFileCount(String lectureArchiveFileUuid);
}
