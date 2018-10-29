<%@page import="com.iu.file.FileDAO"%>
<%@page import="com.iu.file.FileDTO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="javax.swing.plaf.multi.MultiOptionPaneUI"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.iu.board.BoardDTO"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	NoticeDAO no = new NoticeDAO();
        NoticeDTO noticeDTO = new NoticeDTO();
       
        String path =request.getServletContext().getRealPath("upload");
        System.out.println(path);
        int max = 1024*1024*10;
        
        MultipartRequest multi=new MultipartRequest(request,path, max, "UTF-8", new DefaultFileRenamePolicy());
        //path 경로에 파일 업로드 끝
        BoardDTO boardDTO = new BoardDTO();
        boardDTO.setTitle(multi.getParameter("title"));
        boardDTO.setWriter(multi.getParameter("writer"));
        boardDTO.setContents(multi.getParameter("contents"));
        
        //파일의 정보
        
        FileDTO fileDTO = new FileDTO();
        fileDTO.setFname(multi.getFilesystemName("f1"));//파라미터의 이름
        fileDTO.setOname(multi.getOriginalFileName("f1"));
       	FileDTO fileDTO2 = new FileDTO();
       	fileDTO2.setFname(multi.getFilesystemName("f2"));
       	fileDTO2.setOname(multi.getOriginalFileName("f2"));
       	
       /*  File f =multi.getFile("f1");
        Enumeration e=multi.getFileNames();//파라미터 이름들 */
        
        int num=no.getNum();
        boardDTO.setNum(num);
        int result = no.insert(boardDTO);
        fileDTO.setNum(num);
        fileDTO2.setNum(num);
        fileDTO.setKind("N");
        fileDTO2.setKind("N");
        FileDAO fileDAO = new FileDAO();
        fileDAO.insert(fileDTO);
        fileDAO.insert(fileDTO2);
       
        
        
        String n = "Fill";
        if(result>0){
        	n= "success";
        }
        request.setAttribute("message", n);
        request.setAttribute("path", "./noticeList.jsp?curPage=1");
        
       /*  RequestDispatcher view = request.getRequestDispatcher("../common/result.jsp");
        view.forward(request, response); */
        
        //redirect
        response.sendRedirect("../index.jsp");//이동 해야할 주소
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

</body>
</html>