<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*"%>

<%@page import="java.util.UUID"%>

<%@page import="java.text.SimpleDateFormat"%>
<%
	String sFileInfo = "";
	String filename = request.getHeader("file-name");
	String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);
	filename_ext = filename_ext.toLowerCase();
	String[] allow_file = { "jpg", "png", "bmp", "gif" };

	int cnt = 0;
	for (int i = 0; i < allow_file.length; i++) {
		if (filename_ext.equals(allow_file[i])) {
			cnt++;
		}
	}
	if (cnt == 0) {
		out.println("NOTALLOW_" + filename);
	} else {
		String dftFilePath = request.getServletContext().getRealPath("/");
		String filePath = dftFilePath + "editor" + File.separator + "upload" + File.separator;
		System.out.println(filePath);
		File file = new File(filePath);
		if (!file.exists()) {
			file.mkdirs();
		}
		String realFileNm = "";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String today = formatter.format(new java.util.Date());
		realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
		String rlFileNm = filePath + realFileNm;
		System.out.println("rlFileNm::"+rlFileNm);
		
		InputStream is = request.getInputStream();
		OutputStream os = new FileOutputStream(rlFileNm);
		int numRead;
		byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
		while ((numRead = is.read(b, 0, b.length)) != -1) {
			os.write(b, 0, numRead);
		}
		if (is != null) {
			is.close();
		}
		os.flush();
		os.close();
				
		sFileInfo += "&bNewLine=true"; //sFileInfo +="&sFileName=" + realFileNm;; 
		sFileInfo += "&sFileName=" + filename;
		sFileInfo += "&sFileURL=" + "./editor/upload/" + realFileNm;// 경로 설정 잘해야함 ./ / ../ 구분 확실히 할것
		out.println(sFileInfo);
	}
%>