package gd.fintech.lms.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Lecture;

@Mapper
public interface ManagerChartMapper {
	public List<Lecture> selectLecture();
}
