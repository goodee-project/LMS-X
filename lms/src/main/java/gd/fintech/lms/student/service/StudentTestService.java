package gd.fintech.lms.student.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.student.mapper.StudentTestMapper;
import gd.fintech.lms.vo.Multiplechoice;
import gd.fintech.lms.vo.Test;

@Service
public class StudentTestService {
	@Autowired StudentTestMapper studentTestMapper;
	// 평가 목록 가져오기
	public Test selectTestListByPage(int lectureNo){
		return studentTestMapper.selectTestListByPage(lectureNo);
	}
	// 평가 상세보기
	public List<Multiplechoice> selectTestOne(Map<String, Object> map){
		return studentTestMapper.selectTestOne(map);
	}
	
	// 평가 - 문제 개수 가져오기
	public int selectMultiplechoiceCount(int lectureNo) {
		return studentTestMapper.selectMultiplechoiceCount(lectureNo);
	}
}
