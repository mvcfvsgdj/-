package com.sh.address.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.address.domain.AddressDTO;
import com.sh.address.repository.AddressRepositoryI;

@Service
public class AddressServiceImp implements AddressServiceI {

	@Autowired
	AddressRepositoryI dao;

	@Override
	public int registerMember(AddressDTO addressDTO) {
		//주소저장
		return dao.insert(addressDTO);
	}

}
