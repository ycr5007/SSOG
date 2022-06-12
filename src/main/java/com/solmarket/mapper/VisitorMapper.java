package com.solmarket.mapper;

import java.util.List;

public interface VisitorMapper {
	public int visitInsert(String sessionId);
	public String dupSession(String sessionId);
	public List<Integer> getVisitorTotal();
	public int getTodayVisitorCount();
	public int visitTotalInsert(int total);
	public int visitorDeleteAll();
}
