package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Classroom;

@Mapper
public interface ManagerClassroomMapper {
	public List<Classroom> selectClassroomListByPage(Map<String, Object> map);	// 강의실 리스트
	int selectClassroomCount();						// 강의실 페이징 카운트
	int insertClassroom(Classroom classroom);		// 강의실 추가
	int deleteClassroom(int classroomNo);			// 강의실 삭제
	int updateClassroom(Classroom classroom);		// 강의실 수정
	Classroom selectClassroomOne(int classroomNo);	// 강좌 정보
	
}