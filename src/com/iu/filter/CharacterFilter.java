package com.iu.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class CharacterFilter
 */
@WebFilter("/CharacterFilter")
public class CharacterFilter implements Filter {
	private String encode ; 
    /**
     * Default constructor. 
     */
    public CharacterFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		// 이 클래스의 객체가 소멸시
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		//요청이 발생 시 실행  (Controller들어가기전)
		System.out.println("Character Filter in");
		request.setCharacterEncoding(encode);
		response.setCharacterEncoding(encode);
		chain.doFilter(request, response);
		//응답 발생 시 실행(Controller들어갔다 나오는것)
		System.out.println("Character Filter out");
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		//이 클래스의  객체가 생성 될때  new 할때(init가있으면 초기호ㅏ라고 생각하면됌)
		 encode = fConfig.getInitParameter("encode");
	}

}
