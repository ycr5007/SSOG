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
		String searchaddr = address.substring(6, address.length());
		System.out.println(searchaddr);
		if(searchaddr.contains("지하")) {
			searchaddr = searchaddr.replace("지하", "");
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
			// jsonObject = (JSONObject)jsonObject.get("result");
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

	/* ===================== 이미지 보여주기 =====================*/
//	@GetMapping("/display")
//	public ResponseEntity<byte[]> getFile(String uploadPath, String uuid, String fileName) {
//		log.info("썸네일 요청");
//		File file = new File(uploadPath + "\\" + uuid + "_" + fileName);
//
//		ResponseEntity<byte[]> image = null;
//
//		HttpHeaders header = new HttpHeaders();
//
//		try {
//			header.add("Content-Type", Files.probeContentType(file.toPath()));
//			image = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//
//		return image;
//	}
}