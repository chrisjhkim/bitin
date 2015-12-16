package com.bit2015.bitin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bit2015.bitin.service.UserService;
import com.bit2015.bitin.vo.UserVo;


public class AuthLoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String userId = request.getParameter( "userId" );
		String userPassword = request.getParameter( "userPassword" );
		
		UserVo vo = new UserVo();
		vo.setUserId(userId);
		vo.setUserPassword(userPassword);
		
		ApplicationContext applicationContext = 
			WebApplicationContextUtils.getWebApplicationContext( request.getServletContext() );
		UserService userService = applicationContext.getBean( UserService.class );
		UserVo authUser = userService.login(vo);
		
		if( authUser == null ) {
			response.sendRedirect( "/bitin/loginform?result=error" );
			return false;
		}
		
		HttpSession session = request.getSession( true );
		session.setAttribute( "authUser", authUser );
		
		response.sendRedirect( "/bitin/index" );
		return false;
	}
}
