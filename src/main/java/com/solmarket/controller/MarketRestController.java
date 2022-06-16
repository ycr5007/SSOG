package com.solmarket.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class MarketRestController {

	/* ===================== 네이버 지도 API (주소 → 좌표 변환) =====================*/
	@RequestMapping(value = "/map")
	@ResponseBody
	public ResponseEntity<List<String>> trans(String address) throws UnsupportedEncodingException {
		String searchaddr = address;
		System.out.println(searchaddr);
		if(searchaddr.contains("지하")) {
			searchaddr = searchaddr.replace("지하", "");
		}
		if(searchaddr.contains("서울특별시")) {
			searchaddr = searchaddr.replace("서울특별시", "");
		}
		System.out.println(searchaddr);

		searchaddr = URLEncoder.encode(searchaddr, "UTF-8");

		String api = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=" + searchaddr;
		StringBuffer sb = new StringBuffer();

		List<String> list = null;
		try {
			URL url = new URL(api);
			HttpsURLConnection http = (HttpsURLConnection) url.openConnection();
			http.setRequestProperty("X-NCP-APIGW-API-KEY-ID", "bbgkngo31i");
			http.setRequestProperty("X-NCP-APIGW-API-KEY", "tdbvi7GfsHKvGFwgNogzK4u5Jzm1NblSXS6l1u7B");
			http.setRequestMethod("GET"); // 네이버는 반드시 GET 방식으로 호출해야 함
			http.connect();
			
			InputStreamReader in = new InputStreamReader(http.getInputStream(),"utf-8");
			BufferedReader br = new BufferedReader(in);

			String line;
			while ((line = br.readLine()) != null) {
				sb.append(line).append("\n");
			}

			JSONParser parser = new JSONParser();
			JSONObject jsonObject;
			JSONObject jsonObject2;
			JSONArray jsonArray;
			String x = "";
			String y = "";
			
			System.out.println(sb.toString());
		
			jsonObject = (JSONObject)parser.parse(sb.toString());
			jsonArray = (JSONArray)jsonObject.get("addresses");
			
			for(int i=0;i<jsonArray.size();i++){
				jsonObject2 = (JSONObject) jsonArray.get(i);
				
				x = (String) jsonObject2.get("x").toString();
				y = (String) jsonObject2.get("y").toString();
			}
			
			System.out.println("x 좌표 : " + x + ", y 좌표 : " + y);
			
			list = new ArrayList<String>();
			list.add(x);
			list.add(y);
			
			br.close();
			in.close();
			http.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<List<String>>(list, HttpStatus.OK);  
	}
}