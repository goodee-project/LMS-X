package gd.fintech.lms.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Manager;

@Mapper
public interface AdminIndexMapper {
	// 운영자 리스트 출력
	public List<Manager> selectManagerList(); 
}
