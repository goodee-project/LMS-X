package gd.fintech.lms.student.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.student.mapper.StudentLectureNoticeMapper;
import gd.fintech.lms.vo.LectureNotice;

@Service
@Transactional
public class StudentLectureNoticeService {
	// autowired 어노테이션 사용 StudentLectureNoticeMapper 의존성 주입
	@Autowired private StudentLectureNoticeMapper studentLectureNoticeMapper;
	
	// 학생이 강의 공지사항 목록을 출력
	public List<LectureNotice> getStudentLectureNoticeListByPage(Map<String, Object>map) {
		// currentPage와 rowPerPage에서 beginRow, RowPerPage로 전달 -> controller로 이동
		return studentLectureNoticeMapper.selectStudentLectureNoticeListByPage(map);

	}
	// 게시글 수 구하기
	public int getCountLectureNotice() {
		return studentLectureNoticeMapper.selectLectureNoticeCount();
	}
	
	// 학생이 강의 공지사항을 상세보기
	public LectureNotice getStudentLectureNoticeOne(int lectureNoticeNo) {
		return studentLectureNoticeMapper.selectStudentLectureNoticeOne(lectureNoticeNo);
	}
}
