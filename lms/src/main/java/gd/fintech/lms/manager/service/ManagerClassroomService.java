package gd.fintech.lms.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerClassroomMapper;
import gd.fintech.lms.vo.Classroom;

@Service
@Transactional
public class ManagerClassroomService {
	@Autowired ManagerClassroomMapper managerClassroomMapper;
	
	public List<Classroom> getClassroomList() {
		return managerClassroomMapper.selectClassroomList();
	}
	
	public int insertClassroom(Classroom classroom) {
		return managerClassroomMapper.insertClassroom(classroom);
	}
	
	public int deleteClassroom(int classroomNo) {
		return managerClassroomMapper.deleteClassroom(classroomNo);
	}
	
	public int updateClassroom(Classroom classroom) {
		return managerClassroomMapper.updateClassroom(classroom);
	}
	
	public Classroom classroomOne(int classroomNo) {
		return managerClassroomMapper.classroomOne(classroomNo);
	}
}
