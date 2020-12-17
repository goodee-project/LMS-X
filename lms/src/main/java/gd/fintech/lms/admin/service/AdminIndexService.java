package gd.fintech.lms.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.admin.mapper.AdminIndexMapper;
import gd.fintech.lms.vo.Manager;

@Service
@Transactional
public class AdminIndexService {
	@Autowired private AdminIndexMapper adminIndexMapper;
	
	// 운영자 목록 출력
	public List<Manager> getManagerList(){
		return adminIndexMapper.selectManagerList();
	}
	

}
