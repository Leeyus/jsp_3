package com.iu.file;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.ActionFoward;

public class FileService {
	
	public ActionFoward delete(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		int fnum = 0;
		try {
		fnum = Integer.parseInt(request.getParameter("fnum"));
		}catch (Exception e) {
			// TODO: handle exception
		}
		FileDAO fileDAO = new FileDAO();
		String fname = request.getParameter("fname");
		try {
			fnum=fileDAO.delete(fnum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("message", fnum);
		System.out.println("ddddd");
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/common/resultjax.jsp");
		
		return actionFoward;
	}

}
