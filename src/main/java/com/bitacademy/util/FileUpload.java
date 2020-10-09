package com.bitacademy.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.bitacademy.vo.FileVo;

public class FileUpload {

	public FileVo upload(String servieName, MultipartFile file) {
		FileVo fileVo = new FileVo();
		System.out.println("운영체제 종류: " + System.getProperty("os.name") );
		
		String baseDir = File.separator +"upload"+ File.separator; 
		Random random = new Random();
		int subDir1 = random.nextInt(10);
		int subDir2 = random.nextInt(10);
		
		String saveDir =  subDir1 + File.separator + subDir2 + File.separator;
		
		//원파일이름
		String orgName = file.getOriginalFilename();
		System.out.println("orgName:" + orgName);
		
		//확장자
		String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		System.out.println("exName:" + exName);
		
		//저장파일이름
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + "_" + subDir1 + subDir2 + exName;
		System.out.println("saveName:" + saveName);
		
		//파일패스 생성
		String filePath = saveDir + saveName;
		System.out.println("filePath:" + filePath);
		
		//파일 사이즈
		long fileSize = file.getSize();
		System.out.println("fileSize:" + fileSize);
		
		
		//파일업로드
		try {
			byte[] fileData = file.getBytes();
			OutputStream out = new FileOutputStream( baseDir + saveDir + saveName);
			BufferedOutputStream bout = new BufferedOutputStream(out);
			
			bout.write( fileData );
			
			if (bout != null) {
				bout.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		fileVo.setOrgName(orgName);
		fileVo.setExName(exName);
		fileVo.setSaveName(saveName);
		fileVo.setFilePath(filePath);
		fileVo.setFileSize(fileSize);
				
		return fileVo;
	}
	
}
