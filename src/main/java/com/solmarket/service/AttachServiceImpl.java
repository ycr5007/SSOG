package com.solmarket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solmarket.dto.AttachDTO;
import com.solmarket.mapper.AttachMapper;

@Service
public class AttachServiceImpl implements AttachService{
	
	@Autowired
	private AttachMapper attachMapper;
	
	@Override
	public AttachDTO getImg(String section ,int userNo) {
		return attachMapper.getImg(section, userNo);
	}
	
}
