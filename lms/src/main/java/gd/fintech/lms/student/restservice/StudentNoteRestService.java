package gd.fintech.lms.student.restservice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.student.restmapper.StudentNoteRestMapper;

@Service
public class StudentNoteRestService {
	@Autowired StudentNoteRestMapper studentNoteRestMapper;
	
	// 검색으로 계정 목록 가져오기
	public List<Map<String, Object>> selectAccountList(String searchAccount){
		return studentNoteRestMapper.selectAccountList(searchAccount);
	}
}
