package com.sh.address.domain;

import lombok.Data;

@Data
public class AddressDTO {

	private String member_post; // 지번
	private String member_addr; // 도로명
	private String detailed_address; //상세주소
}
