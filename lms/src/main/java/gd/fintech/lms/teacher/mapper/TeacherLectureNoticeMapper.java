package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LectureNotice;

@Mapper
public interface TeacherLectureNoticeMapper {
	// 각 강좌별 공지사항 최근 5개 리스트 출력
	// 강좌 고유번호(lectureNo) 사용
	List<LectureNotice> selectLatestTeacherLectureNoticeList(int lectureNo);
	
	// 각 강좌별 공지사항 리스트 출력
	// 강좌 고유번호(lectureNo), 시작 데이터 번호(beginRow), 페이지당 표시 데이터 수 (rowPerPage)를 이용
	List<LectureNotice> selectTeacherLectuceNoticeListByPage(Map<String, Integer> map);
	
	// 각 강좌별 공지사항 페이지 카운트
	// 강좌 고유번호(lectureNo) 사용
	int selectTeacherLectureNoticeListCount(int lectureNo);
	
	// 공지사항 상세보기
	// 강좌 공지사항 번호(lectureNoticeNo) 사용
	LectureNotice selectTeacherLectureNoticeOne(int lectureNoticeNo);
	
	// 공지사항 조회수 증가
	// 강좌 공지사항 번호(lectureNoticeNo) 사용
	int updateTeacherLectureNoticeCountUp(int lectureNoticeNo);
	// 공지사항 작성
	// LectureNotice 객체에 담겨 있는 정보 사용
	int insertTeacherLectureNotice(LectureNotice lectureNotice);
	
	// 공지사항 삭제
	// 강좌 공지사항 번호(lectureNoticeNo) 사용
	int deleteTeacherLectureNotice(int lectureNoticeNo);
}
