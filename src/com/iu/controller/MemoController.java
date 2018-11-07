package com.iu.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.ActionFoward;
import com.iu.memo.MemoService;

/**
 * Servlet implementation class MemoController
 */
@WebServlet("/MemoController")
public class MemoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MemoService memoService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemoController() {
        super();
        // TODO Auto-generated constructor stub
        memoService = new MemoService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String command = request.getPathInfo();
		
		ActionFoward actionFoward = null;
		
		
		if(command.equals("/memoList.do")) {
			actionFoward = memoService.selectList(request, response);
		}else if(command.equals("/memoMore.do")) {
			actionFoward = memoService.selectList(request, response);
		}else if(command.equals("/memoWrite.do")) {
			actionFoward = memoService.insert(request, response);
		}else if(command.equals("/memoDelete.do")) {
			actionFoward = memoService.delete(request, response);
		}
		
		
		if(actionFoward.isCheck()) {
			RequestDispatcher view = request.getRequestDispatcher(actionFoward.getPath());
			view.forward(request, response);
		}else {
			response.sendRedirect(actionFoward.getPath());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}