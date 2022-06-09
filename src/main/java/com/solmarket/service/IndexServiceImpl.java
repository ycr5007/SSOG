package com.solmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solmarket.dto.MarketDTO;
import com.solmarket.mapper.IndexMapper;

@Service
public class IndexServiceImpl implements IndexService {
	
	@Autowired
	private IndexMapper mapper;
	
	@Override
	public List<MarketDTO> getList(){
		return mapper.list();
	}

}
