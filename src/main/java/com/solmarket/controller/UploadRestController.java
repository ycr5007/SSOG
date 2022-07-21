package com.solmarket.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.solmarket.dto.AttachDTO;
import com.solmarket.service.AttachService;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Slf4j
@RestController
public class UploadRestController {

	@Autowired
	private AttachService attachService;
	
	@PostMapping("/uploadAjax/{section}")
	public ResponseEntity<List<AttachDTO>> uploadAjaxPost(@PathVariable("section") String section ,MultipartFile[] uploadFile) {
		log.info("[POST] ajax 업로드 폼 요청 " + section);
		
		List<AttachDTO> attachList = new ArrayList<AttachDTO>();
		
		// 업로드 기본 폴더 지정
		String uploadBasicPath = "c:\\solmarket\\" + section;
		int width = 0, height = 0;
		
		// 페이지 별 썸네일 이미지 사이즈 지정
		switch(section) {
		case "user" : // user_img
			width = 150;
			height = 200;
			break;
		case "market" : // market_img
			width = 150;
			height = 200;
			break;
		case "product" : // product_img
			width = 100;
			height = 100;
			break;
		case "notice" : // notice_img
			width = 0;
			height = 0;
			break;
		case "recruit" : // recruit_img
			width = 150;
			height = 200;
			break;
		case "board" : // board_img
			width = 0;
			height = 0;
			break;
		default :
			return new ResponseEntity<List<AttachDTO>>(new ArrayList<AttachDTO>() , HttpStatus.BAD_REQUEST);
		}
		
		// 업로드 세부 폴더 지정
		String uploadFolderPath = getFolder();
		
		log.info(uploadBasicPath + "" + uploadFolderPath);
		// 전체 업로드 경로 지정
		File uploadPath = new File(uploadBasicPath, uploadFolderPath);
		log.info(uploadPath.getPath());
		if(!uploadPath.exists()) { // 폴더가 없다면 폴더들 생성
			uploadPath.mkdirs();
		}
		
		// 업로드 파일명
		String uploadFileName = "";
		File save = null;
		for(MultipartFile f : uploadFile) {
			
			// 파일명 가져오기
			String oriFileName = f.getOriginalFilename();

			// 중복 파일명 해결하기
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + oriFileName;
			
			// 업로드 파일 객체 생성 ( JS 전달 목적 )
			AttachDTO attachDto = new AttachDTO();
			attachDto.setUploadPath(uploadFolderPath);
			attachDto.setFileName(oriFileName);
			attachDto.setUuid(uuid.toString());
			
			save = new File(uploadPath, uploadFileName);
			try {
				
				if(checkImageType(save)) {
					// 썸네일 저장
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					InputStream in  = f.getInputStream();
					Thumbnailator.createThumbnail(in, thumbnail, width, height);

					in.close();
					thumbnail.close();
				}
				
				// 파일저장
				f.transferTo(save);

				attachList.add(attachDto);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return new ResponseEntity<List<AttachDTO>>(attachList, HttpStatus.OK);
	}
	
	// 썸네일 이미지 보여주기
	@GetMapping(path = "/display/{section}/{no}")
	public ResponseEntity<byte[]> getFile(@PathVariable("section") String section, @PathVariable("no") int no){
		log.info("[GET] 썸네일 파일 보여주기 " + no);
		AttachDTO dto = attachService.getImg(section, no); 
		
		String fileName = dto.getUploadPath() + "\\s_" + dto.getUuid() + "_" + dto.getFileName();
		log.info("fileName ::: " + fileName);
		File file = new File("c:\\solmarket\\" + section + "\\" + fileName);
		ResponseEntity<byte[]> image = null;
		HttpHeaders header = new HttpHeaders();
		try {
			header.add("Content-type", Files.probeContentType(file.toPath()));
			image = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return image;
	}

	// 썸네일 이미지 보여주기
	@GetMapping(path = "/display/{section}")
	public ResponseEntity<byte[]> getFile(@PathVariable("section") String section, String fileName){
		log.info("[GET] 썸네일 파일 보여주기 " + fileName);
		
		log.info("fileName ::: " + fileName);
		File file = new File("c:\\solmarket\\" + section + "\\" + fileName);
		ResponseEntity<byte[]> image = null;
		HttpHeaders header = new HttpHeaders();
		try {
			header.add("Content-type", Files.probeContentType(file.toPath()));
			image = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return image;
	}
	
	// 서버 파일 삭제
	@PostMapping(path = "/deleteFile/{section}")
	public ResponseEntity<String> deleteFile(@PathVariable("section") String section, String fileName){
		log.info("[POST] 파일 삭제 요청 " + fileName);
		
		try {
			File file = new File("c:\\solmarket\\" + section + "\\" +  URLDecoder.decode(fileName, "UTF-8"));
			file.delete(); // Image 의 경우 썸네일 삭제, 일반 파일의 경우 원본 파일 삭제
			
			String largeName = file.getAbsolutePath().replace("s_", "");
			file = new File(largeName);
			file.delete();
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	// 이미지 파일 여부 확인
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
		
	}
	
	// 폴더 생성 메소드
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date(); // Wed Dec 08 16:40:05 KST 2022
		String str = sdf.format(date); // "2022-05-06"
		
		return str.replace("-", File.separator); // "2022\05\06
	}
}