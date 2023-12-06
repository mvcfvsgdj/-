package com.sh.product.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class cateDTO {

	String loc_code; // 대분류
	String detail_loc; // 중분류
}
