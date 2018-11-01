package com.iu.member;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.iu.action.ActionFoward;
import com.iu.file.FileDAO;
import com.iu.file.FileDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.org.apache.bcel.internal.generic.ACONST_NULL;


public class MemberService {
	//대부분 DAO를 소환함
	private MemberDAO memberDAO;
	
	public MemberService() {
		memberDAO= new MemberDAO();
	}
	
	//update
	public ActionFoward update(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward=new ActionFoward();
		String method = request.getMethod();
		if(method.equals("POST")) {
			//POST
			int max = 1024*1024*10;
			String path = request.getServletContext().getRealPath("upload");
			File file = new File(path);
			if(!file.exists()) {
				file.mkdirs();
			}
			String message = "Update Fail";
			try {
				MultipartRequest multi = new MultipartRequest(request, path, max, "UTF-8", 	new DefaultFileRenamePolicy());
				MemberDTO memberDTO = new MemberDTO();
				MemberDTO sessionDTO = (MemberDTO)request.getSession().getAttribute("member");
				memberDTO.setId(multi.getParameter("id"));
				memberDTO.setPw(multi.getParameter("pw"));
				memberDTO.setName(multi.getParameter("name"));
				memberDTO.setEmail(multi.getParameter("email"));
				memberDTO.setFname(sessionDTO.getFname());
				memberDTO.setOname(sessionDTO.getOname());
				memberDTO.setKind(sessionDTO.getKind());
				memberDTO.setClassmate(sessionDTO.getClassmate());
				file = multi.getFile("f1");
				if(file!=null) {
					file = new File(path, memberDTO.getFname());
					file.delete();
					memberDTO.setFname(multi.getFilesystemName("f1"));
					memberDTO.setOname(multi.getOriginalFileName("f1"));
				}
				
				int result = memberDAO.Update(memberDTO);
				
				if(result>0) {
					request.getSession().setAttribute("member", memberDTO);
					message = "Update Success";
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("message", message);
			request.setAttribute("path", "./memberMypage.do");
			
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
			
		}else {
			//GET
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/member/memberUpdate.jsp");
		}
		
		
		/*MemberDTO memberDTO = null;
		HttpSession session = request.getSession();
		memberDTO = (MemberDTO)session.getAttribute("member");
		String message = "Update Fail";
		try {
			int result = memberDAO.Update(memberDTO);
				
			if(result>0) {
				message = "Update Success";
				String path=session.getServletContext().getRealPath("upload");
				File file = new File(path, memberDTO.getFname());
				file.mkdir();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		/*request.setAttribute("message", message);
		request.setAttribute("path", "../index.jsp");
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/common/result.jsp");*/
		
		return actionFoward;
	}
	
	
	
	//delete
	public  ActionFoward delete(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		MemberDTO memberDTO = null;
		HttpSession session = request.getSession();
		memberDTO = (MemberDTO)session.getAttribute("member");
		String  message = "Delete Fail";
		try {
			int result = memberDAO.delete(memberDTO);
			
			if(result>0) {
				message = "Success";
				String path=session.getServletContext().getRealPath("upload");
				File file = new File(path, memberDTO.getFname());
				file.delete();
				session.invalidate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("message", message);
		request.setAttribute("path", "../index.jsp");
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		return actionFoward;
	}
	
	
	//마이페이지
	public ActionFoward myPage(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/member/memberMypage.jsp");
		
		return actionFoward;
	}
	
	
	
	//로그아웃
	public ActionFoward logout(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		HttpSession session = request.getSession();
		session.invalidate();
		actionFoward.setCheck(false);
		actionFoward.setPath("../index.jsp");
		
		return actionFoward;
	}
	
	
	//로그인
	public ActionFoward login(HttpServletRequest request, HttpServletResponse response) {
		//아이디 비번 받아서 처리하는 일을함
		ActionFoward actionFoward= new ActionFoward();
		String method = request.getMethod();
		if(method.equals("POST")) {
		
		MemberDTO memberDTO = new MemberDTO();
    	memberDTO.setId(request.getParameter("id"));
    	memberDTO.setPw(request.getParameter("pw"));
    	memberDTO.setKind(request.getParameter("kind"));
    	try {
			memberDTO = memberDAO.login(memberDTO);
			
		} catch (Exception e) {
			memberDTO= null;
			e.printStackTrace();
		}
    	if(memberDTO!=null) {
    		HttpSession session = request.getSession();
    		session.setAttribute("member", memberDTO);
    		actionFoward.setCheck(false);
    		actionFoward.setPath("../index.jsp");
    	}else {
    		request.setAttribute("message", "Login Fail");
    		actionFoward.setCheck(true);
    		actionFoward.setPath("../WEB-INF/view/member/memberLogin.jsp");
    	}
		
		}else {
			//GET
			actionFoward.setCheck(true);
    		actionFoward.setPath("../WEB-INF/view/member/memberLogin.jsp");
		}
		
		return actionFoward;
	}
	
	
	
	
	//join
	public ActionFoward join(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		
		String method = request.getMethod();
		
		if(method.equals("POST")) {
		
		int max = 1024*1024*10;
		String path = request.getServletContext().getRealPath("upload");
		System.out.println(path);
		
		File file = new File(path);
		if(!file.exists()) {
			file.mkdirs();
		}
		try {
			//파일저장
			MultipartRequest multi = new MultipartRequest(request, path, max, "utf-8", new DefaultFileRenamePolicy());
			//Member Date
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setId(multi.getParameter("id"));
			memberDTO.setPw(multi.getParameter("pw"));
			memberDTO.setName(multi.getParameter("name"));
			memberDTO.setEmail(multi.getParameter("email"));
			memberDTO.setKind(multi.getParameter("kind"));
			memberDTO.setClassmate(multi.getParameter("classmate"));
			memberDTO.setFname(multi.getFilesystemName("f1"));
			memberDTO.setOname(multi.getOriginalFileName("f1"));
			
			int result=memberDAO.join(memberDTO);
			
			if(result>0) {
				//파일의 정보를 DB에  insert
				/*FileDAO fileDAO = new FileDAO();
				Enumeration<Object> e=multi.getFileNames();
				String p =(String)e.nextElement();
				FileDTO fileDTO = new FileDTO();
				fileDTO.setKind("N");
				fileDTO.setFname(multi.getFilesystemName(p));
				fileDTO.setOname(multi.getOriginalFileName(p));
				fileDAO.insert(fileDTO);*/
				
				request.setAttribute("message", "Join Success");
				request.setAttribute("path", "../index.jsp");
			}else {
				request.setAttribute("message", "Join Fail");
				request.setAttribute("path", "./memberJoin.do");
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		
		}else {
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/member/memberJoin.jsp");
		}//post
		return actionFoward;
	}
	

}
