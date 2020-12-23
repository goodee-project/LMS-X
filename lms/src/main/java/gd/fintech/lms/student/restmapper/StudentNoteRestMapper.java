package gd.fintech.lms.student.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentNoteRestMapper {
	// 검색으로 계정 목록 가져오기
	public List<Map<String, Object>> selectAccountList(String searchAccount);
}
