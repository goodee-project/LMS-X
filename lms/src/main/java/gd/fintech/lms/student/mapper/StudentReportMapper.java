package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ClassRegistration;
import gd.fintech.lms.vo.Report;

@Mapper
public interface StudentReportMapper {
	// 강사가 출제한 과제 목록
	public ClassRegistration selectReportListByPage(Map<String, Object> map);
	// 강사가 출제한 과제 개수
	public int selectReportListCount(int classNo);
}
