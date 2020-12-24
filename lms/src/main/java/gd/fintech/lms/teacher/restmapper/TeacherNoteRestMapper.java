package gd.fintech.lms.teacher.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TeacherNoteRestMapper {
	// 검색으로 계정 리스트 가져오기
	public List<Map<String, Object>> selectAccountList(String searchAccount);
	
}
