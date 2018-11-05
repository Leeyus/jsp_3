package com.iu.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.ActionFoward;
import com.iu.qna.QnaService;

/**
 * Servlet implementation class QnaController
 */
@WebServlet("/QnaController")
public class QnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private QnaService qnaService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaController() {
    	qnaService = new QnaService();
        
        // TODO Auto-generated constructor stub
    }
    
    @Override
    public void init(ServletConfig config) throws ServletException {
    	String board=config.getInitParameter("board");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String board=this.getServletConfig().getInitParameter("board");
		System.out.println(board);
		*/
		
		String command = request.getPathInfo();
		ActionFoward actionFoward=null;
		/*QnaService qnaService = new QnaService();*/
		
		if(command.equals("/qnaList.do")) {
			actionFoward = qnaService.selectList(request, response);
		}else if(command.equals("/qnaSelectOne.do")){
			actionFoward = qnaService.selectOne(request, response);
		}else if(command.equals("/qnaWrite.do")) {
			actionFoward = qnaService.insert(request, response);
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
