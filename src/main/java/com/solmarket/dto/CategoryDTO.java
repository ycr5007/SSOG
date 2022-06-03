package com.solmarket.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CategoryDTO {
	private int categoryNo; // 카테고리 번호
	private String categoryName; // 카테고리 명
}
