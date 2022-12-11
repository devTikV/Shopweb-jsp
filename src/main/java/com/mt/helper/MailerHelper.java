package com.mt.helper;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import org.springframework.web.multipart.MultipartFile;

public class MailerHelper {

	public String[] parseStringEmailToArray(String emailString) {
		String[] arrEmail = null;
		if (emailString.length() > 0) {
			emailString = removeSpace(emailString);
			arrEmail = emailString.split(",");
		}
		return arrEmail;
	}

	private String removeSpace(String string) {
		return string.replaceAll(" ", "");
	}

	public File convertMultipartFileToFile(MultipartFile multipartFile) throws IOException {
		// Tạo 1 thư mục tạm thời để chứa file, sau này có thể xóa thư mục tạm thời đó
		// đi
		File convFile = new File(System.getProperty("java.io.tmpdir") + "/" + multipartFile.getOriginalFilename());
		multipartFile.transferTo(convFile);
		return convFile;
	}

	public String randomAlphaNumeric(int numberOfCharactor) {
		String alpha = "abcdefghijklmnopqrstuvwxyz"; // a-z
		String alphaUpperCase = alpha.toUpperCase(); // A-Z
		String digits = "0123456789"; // 0-9
		String ALPHA_NUMERIC =alphaUpperCase + digits;
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < numberOfCharactor; i++) {
			int number = randomNumber(0, ALPHA_NUMERIC.length() - 1);
			char ch = ALPHA_NUMERIC.charAt(number);
			sb.append(ch);
		}
		return sb.toString();
	}
	
	private int randomNumber(int min, int max) {
		Random generator = new Random();
        return generator.nextInt((max - min) + 1) + min;
    }
}