package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Multiplechoice;
import gd.fintech.lms.vo.Test;

@Mapper
public interface StudentTestMapper {
	// 평가 목록 가져오기
	public Test selectTestListByPage(int lectureNo);
	
	// 평가 상세보기
	public List<Multiplechoice> selectTestOne(Map<String, Object> map);
	// 평가 - 문제 개수 가져오기
	public int selectMultiplechoiceCount(int lectureNo);
}
