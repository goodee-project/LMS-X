package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.teacher.mapper.TeacherLectureNoticeMapper;
import gd.fintech.lms.vo.LectureNotice;

@Service
public class TeacherLectureNoticeService {
	@Autowired private TeacherLectureNoticeMapper teacherLectureNoticeMapper;
	
	// 강좌별 최근 5개에 해당하는 공지사항 목록 출력
	// 강좌 공지사항 번호(lectureNoticeNo) 이용
	public List<LectureNotice> getLatestTeacherNoticeList(int lectureNo) {
		List<LectureNotice> teacherLectureNoticeList = teacherLectureNoticeMapper.selectLatestTeacherLectureNoticeList(lectureNo);
		
		return teacherLectureNoticeList;
	}
	
	// 강좌별 공지사항 목록 출력
	// 강좌 공지사항 번호(lectureNoticeNo) 이용
	public List<LectureNotice> getTeacherNoticeListByPage(int lectureNo, int beginRow, int rowPerPage){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("lectureNo", lectureNo);	// 강의실 고유 번호
		map.put("beginRow", beginRow);		// 시작 데이터
		map.put("rowPerPage", rowPerPage);	// 한 페이지 당 표시할 데이터 수
		
		List<LectureNotice> teacherLectureNoticeList = teacherLectureNoticeMapper.selectTeacherLectuceNoticeListByPage(map);
		
		return teacherLectureNoticeList;
	}
	
	// 강사가 수업 중인 강좌의 공지사항 총 개수 계산
	// 강좌 공지사항 번호(lectureNoticeNo) 이용
	public int getCountTeacherLectureNotice(int lectureNo) {
		return teacherLectureNoticeMapper.selectTeacherLectureNoticeListCount(lectureNo);
	}
	
	// 강좌별 공지사항 상세보기
	// 강좌 공지사항 번호(lectureNoticeNo) 이용
	public LectureNotice getTeacherNoticeOne(int lectureNoticeNo) {
		return teacherLectureNoticeMapper.selectTeacherLectureNoticeOne(lectureNoticeNo);
	}
	
	// 강좌별 공지사항 상세보기 조회수 증가
	// 강좌 공지사항 번호(lectureNoticeNo) 이용
	public int updateTeacherLectureNoticeCountUp(int lectureNoticeNo) {
		return teacherLectureNoticeMapper.updateTeacherLectureNoticeCountUp(lectureNoticeNo);
	}
	// 강좌별 공지사항 작성
	public int insertTeacherLectureNotice(LectureNotice lectureNotice) {
		return teacherLectureNoticeMapper.insertTeacherLectureNotice(lectureNotice);	
	}
}
