package gd.fintech.lms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.mapper.StudentLectureNoticeMapper;
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
	public int getCountLectureNotice(int rowPerPage) {
		// endPage 수를 구하기 위해 변수 생성
		int endPage = studentLectureNoticeMapper.selectLectureNoticeCount(); 
		
		if(endPage % rowPerPage == 0) {
			return endPage / rowPerPage;
		} else {
			return endPage / rowPerPage + 1;
		}
	}
	
	// 학생이 강의 공지사항을 상세보기
	public LectureNotice getStudentLectureNoticeOne(int lectureNoticeNo) {
		return studentLectureNoticeMapper.selectStudentLectureNoticeOne(lectureNoticeNo);
	}

}
