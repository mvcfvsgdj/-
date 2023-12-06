package com.sh.address.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sh.address.domain.AddressDTO;
import com.sh.address.service.AddressServiceI;

@Controller
public class AddressController {

	@Autowired
	AddressServiceI service;
	
	// 주소api 호출
	@GetMapping("/address")
	public String addressF() {
		return "/address/address";
	}
	
	// 주소api form 저장
	@PostMapping("/addressForm")
	public String registerMember(AddressDTO addressDTO) {
		service.registerMember(addressDTO);
		return "/address/address";
	}
}
