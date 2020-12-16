package gd.fintech.lms.restmapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Address;

@Mapper
public interface SignupRestMapper {
	//주소 검색
	public List<Address> selectAddress(Address address);
	
}
