package com.solmarket.mapper;

import java.util.List;

import com.solmarket.dto.CategoryDTO;
import com.solmarket.dto.Criteria;
import com.solmarket.dto.ProductDTO;
import com.solmarket.dto.UserDTO;

public interface ShopMapper {
	public List<CategoryDTO> getCategory();
	public List<ProductDTO> getProduct(Criteria cri);
	public int totalCnt(Criteria cri);
	public ProductDTO getDetail(int productNo);
	
	public UserDTO getOrderUser(int userNo);
	public ProductDTO getOrderProduct(int productNo);
}
