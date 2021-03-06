package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherLectureNoticeMapper;
import gd.fintech.lms.vo.LectureNotice;

@Service
@Transactional
public class TeacherLectureNoticeService {
	@Autowired private TeacherLectureNoticeMapper teacherLectureNoticeMapper;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 최근 5개에 해당하는 공지사항 목록 출력
	// 강좌 공지사항 번호(lectureNoticeNo)
	public List<LectureNotice> getLatestTeacherNoticeList(int lectureNo) {
		List<LectureNotice> teacherLectureNoticeList = teacherLectureNoticeMapper.selectLatestTeacherLectureNoticeList(lectureNo);
		
		// [Logger] 강좌 공지사항 목록(teacherLectureNoticeList)
		logger.trace("teacherLectureNoticeList[" + teacherLectureNoticeList + "]");
		
		return teacherLectureNoticeList;
	}
	
	// 강좌 공지사항 목록 출력
	// 강좌 공지사항 번호(lectureNoticeNo)
	public List<LectureNotice> getTeacherNoticeListByPage(int lectureNo, int beginRow, int rowPerPage){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("lectureNo", lectureNo);	// 강의실 고유 번호
		map.put("beginRow", beginRow);		// 시작 데이터
		map.put("rowPerPage", rowPerPage);	// 한 페이지 당 표시할 데이터 수
		
		List<LectureNotice> teacherLectureNoticeList = teacherLectureNoticeMapper.selectTeacherLectuceNoticeListByPage(map);
		
		// [Logger] 강좌 공지사항 목록(teacherLectureNoticeList)
		logger.trace("teacherLectureNoticeList[" + teacherLectureNoticeList + "]");
		
		return teacherLectureNoticeList;
	}
	
	// 강사가 수업 중인 강좌의 공지사항 총 개수 계산
	// 강좌 공지사항 번호(lectureNoticeNo)
	public int getCountTeacherLectureNotice(int lectureNo) {
		return teacherLectureNoticeMapper.selectTeacherLectureNoticeListCount(lectureNo);
	}
	
	// 강좌 공지사항 상세보기
	// 강좌 공지사항 번호(lectureNoticeNo)
	public LectureNotice getTeacherNoticeOne(int lectureNoticeNo) {
		return teacherLectureNoticeMapper.selectTeacherLectureNoticeOne(lectureNoticeNo);
	}
	
	// 강좌 공지사항 상세보기 조회수 증가
	// 강좌 공지사항 번호(lectureNoticeNo)
	public int updateTeacherLectureNoticeCountUp(int lectureNoticeNo) {
		return teacherLectureNoticeMapper.updateTeacherLectureNoticeCountUp(lectureNoticeNo);
	}
	
	// 강좌 공지사항 작성
	public int insertTeacherLectureNotice(LectureNotice lectureNotice) {
		return teacherLectureNoticeMapper.insertTeacherLectureNotice(lectureNotice);	
	}
	
	// 강좌 공지사항 삭제
	// 강좌 공지사항 번호(lectureNoticeNo)
	public void deleteTeacherLectureNotice(int lectureNoticeNo) {
		teacherLectureNoticeMapper.deleteTeacherLectureNotice(lectureNoticeNo);
	}
	
	// 강좌 공지사항 수정
	// lectureNotice에 객체에 담긴 데이터 수정
	public void updateTeacherLectureNotice(LectureNotice lectureNotice) {
		teacherLectureNoticeMapper.updateTeacherLectureNotice(lectureNotice);
	}
}
