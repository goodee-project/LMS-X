package gd.fintech.lms.teacher.restservice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.student.restmapper.StudentNoteRestMapper;
import gd.fintech.lms.teacher.restmapper.TeacherNoteRestMapper;

@Service
public class TeacherNoteRestService {
	@Autowired TeacherNoteRestMapper teacherNoteRestMapper;
	
	// 검색으로 계정 목록 가져오기
	public List<Map<String, Object>> selectAccountList(String searchAccount){
		return teacherNoteRestMapper.selectAccountList(searchAccount);
	}
}
