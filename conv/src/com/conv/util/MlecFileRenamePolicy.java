package com.conv.util;

import java.io.File;
import java.util.UUID;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MlecFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File f) {
//		f = new File("c:/java/upload/Test.java");
		
		// c:/java/upload
		String parent = f.getParent();
		// a.jpg
		String name = f.getName();
		
		// 확장자는 유지한 채 파일의 이름부분을 변경
		// 사용자가 선택한 파일의 확장자만 가져오기
		String ext = "";
		int index = name.lastIndexOf(".");
		if(index != -1) {
			ext = name.substring(index);	// ext = .jpg
		}
		String fName = UUID.randomUUID().toString();
		return new File(parent, fName+ext);
	}

}
