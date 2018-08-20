package com.firedogs.grandpringles.fileupload;

import org.springframework.web.multipart.MultipartFile;

public class MultiImageUpload {
	
	 private MultipartFile[] upload;
	 
	 public MultiImageUpload() {
		// TODO Auto-generated constructor stub
	}

	public MultipartFile[] getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile[] upload) {
		this.upload = upload;
	}
	 

}
