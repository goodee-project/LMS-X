package gd.fintech.lms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Classroom;

@Mapper
public interface ManagerClassroomMapper {
	List<Classroom> selectClassroomList(); // 리스트
	
	// 삭제
	// 추가
	// 수정
}
