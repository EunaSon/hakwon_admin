package org.academy.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.academy.domain.CourseAttachFileDTO;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class CourseUploadController {
	
	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}
	
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		String uploadFolder = "c:\\projectUpload";
		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("==================================");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: "+multipartFile.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			
			try {
				
				multipartFile.transferTo(saveFile);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}
	

	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/uploadAjaxAction", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<CourseAttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		//이미지 정보 담는 객체
		List<CourseAttachFileDTO> list = new ArrayList<>();
		
		String uploadFolder = "c:\\projectUpload\\coursefile";
		
		File uploadPath = new File(uploadFolder);
		
		
		if(uploadPath.exists() == false) {
				uploadPath.mkdir();
			
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			//이미지정보
			CourseAttachFileDTO CADTO = new CourseAttachFileDTO();
			
			//파일이름
			String uploadFileName = multipartFile.getOriginalFilename();
			
			
			CADTO.setFileName(uploadFileName);
			CADTO.setUploadPath(uploadFolder);
			
			//IE has file path 
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info("only file name : " + uploadFileName);
			
			
			//uuid적용
			String uuid = UUID.randomUUID().toString();
			
			CADTO.setUuid(uuid);
			uploadFileName = uuid+"_"+uploadFileName;
			
			//파일 위치
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				
				//파일 저장
				multipartFile.transferTo(saveFile);
					
				if(checkImageType(saveFile)) {
				CADTO.setImage(true);
					
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
				Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail, 100, 100);
					
				thumbnail.close();
				}
			
				list.add(CADTO);
				
			}catch(Exception e) {
				log.error(e.getMessage());
			}
		}
		
		return new ResponseEntity<List<CourseAttachFileDTO>>(list, HttpStatus.OK);
	}

	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		
		log.info("fileName: "+fileName);
		
		File file = new File(fileName);
		
		log.info("file:" +file);

		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type){
		
		log.info("deleteFile: "+fileName);
		
		File file;
		
		try {
			//섬네일 파일삭제
			file = new File(URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
			if(type.equals("image")) {
			//원본파일삭제
			String OriginFileName = file.getAbsolutePath().replace("s_", "");
				
			log.info("OriginFileName: "+OriginFileName );
				
			file = new File(OriginFileName);
			file.delete();
			}
			
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail", HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
}
