package gd.fintech.lms.manager.restmapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ManagerLectureRestMapper {
	// 강좌의 총 인원 가져오기
	int selectLectureTotal(int lectureNo);
}
