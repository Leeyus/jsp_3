package com.iu.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.iu.board.BoardDAO;
import com.iu.board.BoardDTO;
import com.iu.board.BoardReply;
import com.iu.board.BoardReplyDTO;
import com.iu.page.RowNumber;
import com.iu.page.Search;
import com.iu.util.DBConnector;
import com.oreilly.servlet.MultipartRequest;
import com.sun.org.apache.xalan.internal.xsltc.dom.MultiValuedNodeHeapIterator;

public class NoticeDAO implements BoardDAO, BoardReply{
	
	@Override
	public int reply(BoardReplyDTO boardReplyDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int replyUpdate(BoardReplyDTO boardReplyDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	

	@Override
	public List<BoardDTO> selectList(RowNumber rowNumber) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select * from "
				+ "(select rownum R, N.* from "
				+ "(select num, title,writer,reg_date, hit from notice "
				+ "where "+rowNumber.getSearch().getKind()+" like ? "
				+ "order by num desc) N) "
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+rowNumber.getSearch().getSearch()+"%");
		st.setInt(2, rowNumber.getStartRow());
		st.setInt(3, rowNumber.getLastRow());
		ResultSet rs = st.executeQuery();
		ArrayList<BoardDTO>noticeDTO = new ArrayList<>();
		NoticeDTO nd =null;
		
		while(rs.next()) {
			nd  =new NoticeDTO();
			nd.setNum(rs.getInt("num"));
			nd.setTitle(rs.getString("title"));
			
			nd.setWriter(rs.getString("writer"));
			nd.setReg_date(rs.getDate("reg_date"));
			nd.setHit(rs.getInt("hit"));
			noticeDTO.add(nd);
		}
		DBConnector.disConnect(rs, st, con);
		return noticeDTO;
		
	}

	@Override
	public BoardDTO selectOne(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select * from notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		NoticeDTO noticeDTO= null;
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			noticeDTO=new NoticeDTO();
		noticeDTO.setNum(rs.getInt(1));
		noticeDTO.setTitle(rs.getString(2));
		noticeDTO.setContents(rs.getString(3));
		noticeDTO.setWriter(rs.getString(4));
		noticeDTO.setReg_date(rs.getDate(5));
		noticeDTO.setHit(rs.getInt(6));
		}
		DBConnector.disConnect(rs, st, con);
		return noticeDTO;
	}
	
	//seq 갔고오기
	public int getNum() throws Exception {
		Connection con = DBConnector.getConnect();
		String sql= "select notice_seq.nextval from dual";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		int num=rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		return num;
	}
	

	@Override
	public int insert(BoardDTO boardDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "insert into notice values(?,?,?,?,sysdate,0)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, boardDTO.getNum());
		st.setString(2, boardDTO.getTitle());
		st.setString(3, boardDTO.getContents());
		st.setString(4, boardDTO.getWriter());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		return result;
		
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		
		return 0;
	}

	@Override
	public int delete(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getCount(Search search) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select count(num) from notice "
				+ "where "+search.getKind()+" like ?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search.getSearch()+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);
		
		DBConnector.disConnect(rs, st, con);
		return result;
		
	}
	
	
	
	

}
