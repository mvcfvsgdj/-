package com.sh.address.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sh.address.domain.AddressDTO;

@Repository
public class AddressRepositoryRealImp implements AddressRepositoryI {

	@Autowired
	private SqlSession session;
	private static String namespace = "com.sh.address.AddressMapper.";

	@Override
	public int insert(AddressDTO addressDTO) {
		// 주소저장
		return session.insert(namespace + "insertUser", addressDTO);
	}

}
