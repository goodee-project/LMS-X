package gd.fintech.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ClassRegistration;
import gd.fintech.lms.vo.LectureAndClassRegistrationAndSubject;
import gd.fintech.lms.vo.LectureAndClassRegistrationAndSubjectAndTextbookAndClassroom;

@Mapper
public interface StudentLectureMapper {
	// 학생 : 자신이 수강중인 강좌 목록
	public List<LectureAndClassRegistrationAndSubject> selectStudentClassListByPage(Map<String, Object> map);
	// 학생 : 자신이 수강중인 강좌의 개수
	public int selectStudentClassListCount(String studentId);
	
	// 자신이 수강중인 강좌 상세보기
	public LectureAndClassRegistrationAndSubjectAndTextbookAndClassroom selectStudentClassOne(int classRegistrationNo);
	// 수강중인 강좌의 후기를 수정
	public int updateStudentClassReview(ClassRegistration classRegistration);
}
