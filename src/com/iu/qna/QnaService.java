package com.iu.qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.ActionFoward;
import com.iu.board.BoardDTO;
import com.iu.page.MakePager;
import com.iu.page.Pager;
import com.iu.page.RowNumber;
import com.sun.rowset.internal.Row;

public class QnaService {
	private QnaDAO qnaDAO;
	
	public QnaService() {
		qnaDAO=new QnaDAO();
	}
	//select One
	public ActionFoward selectOne(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		actionFoward.setCheck(false);
		actionFoward.setPath("./qnaList.do");
		BoardDTO boardDTO = null;
		try {
		int num = Integer.parseInt(request.getParameter("num"));
		boardDTO = qnaDAO.selectOne(num);
		
		request.setAttribute("dto", boardDTO);
		
		actionFoward.setPath("../WEB-INF/qna/qnaSelectOne.jsp");
		actionFoward.setCheck(true);
		
		}catch(Exception e){
			
		}
		if(boardDTO == null) {
			actionFoward.setCheck(false);
			actionFoward.setPath("./qnaList.do");
		}
		
		return actionFoward;
	}
	
	
	//selectList
	
	public ActionFoward selectList(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward =new ActionFoward();
		
		int curPage=1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		String kind = request.getParameter("kind");
		String search = request.getParameter("search");
		MakePager mk = new MakePager(curPage, search, kind);
		RowNumber rowNumber = mk.makeRow();
		
		try {
			List<BoardDTO> ar = qnaDAO.selectList(rowNumber);
			int totalCount = qnaDAO.getCount(rowNumber.getSearch());
			Pager pager = mk.makePage(totalCount);
			request.setAttribute("list", ar);
			request.setAttribute("pager", pager);
			actionFoward.setPath("../WEB-INF/qna/qnaList.jsp");
		} catch (Exception e) {
		
			
			e.printStackTrace();
		}
		actionFoward.setCheck(true);
		
		return actionFoward;
		
	}
	

}
