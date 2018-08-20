package com.firedogs.grandpringles.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.firedogs.grandpringles.util.ResizeImageUtil;

@RestController
public class ImageUpload {

	
	@RequestMapping(value = "/ajax/upload", method = RequestMethod.POST)
	public String upload(
			@RequestParam(required = false) Integer width,
			@RequestParam(required = false) Integer height,
			@RequestParam(required = false) Integer size,
			@RequestParam String folder,
			MultipartFile upload,
			HttpServletRequest request)
	throws Exception {

		// 1) ServletContext���
		ServletContext sc = request.getServletContext();

		// 2) �⺻��� ���
		String path = sc.getRealPath("img");

		// 3) upload���
		String uploadPath = path+File.separator + "upload" + File.separator;

		// 4)  image���
		String resizePath = path+ File.separator + folder + File.separator;

		System.out.println(resizePath);
		// 5) ������ ���� ���� UUID
		UUID uuid = UUID.randomUUID();

		String ext = upload.getOriginalFilename();

		int dotIdx = ext.lastIndexOf(".");

		ext = ext.substring(dotIdx, ext.length());

		System.out.println(ext);

		String fileName = uuid + ext;

		// 6) ���+�����̸�
		String fullPath = uploadPath + fileName;

		// 7) ���� ������ ����
		File file = new File(fullPath);

		// 8) ���� �ű��
		upload.transferTo(file);
		System.out.println("���� ���� ����");
		// 9) ������¡ (200x200)
		if(size!=null) {
			width = size;
			height = size;
		}
		
		ResizeImageUtil.resize(fullPath, resizePath + fileName, width, height);
	
		return "{\"image\":\"" + fileName + "\"}";

	}
}
