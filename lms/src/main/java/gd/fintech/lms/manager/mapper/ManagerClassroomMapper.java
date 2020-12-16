package gd.fintech.lms.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Classroom;

@Mapper
public interface ManagerClassroomMapper {
	List<Classroom> selectClassroomList(); // 강의실 리스트
	int insertClassroom(Classroom classroom);// 강의실 추가
	int deleteClassroom(int classroomNo);// 강의실 삭제
	int updateClassroom(Classroom classroom);// 강의실 수정
}
