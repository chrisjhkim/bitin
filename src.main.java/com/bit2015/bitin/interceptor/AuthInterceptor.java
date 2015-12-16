package com.bit2015.bitin.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bit2015.bitin.annotation.Auth;
import com.bit2015.bitin.vo.UserVo;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(
		HttpServletRequest request,
		HttpServletResponse response,
		Object handler ) throws Exception {
		System.out.println("interceptor 들어옴");
		
		//TODO: 실행은되는데 에러가뜸 "cannot be cast to org.springframework.web.method.HandlerMethod" 선생님한테 물어보기
		/*
		-----------원인-------------
		<mvc:interceptor> 
    	<mvc:mapping path="/**" />
		<mvc:exclude-mapping path="/user/login" />
		<mvc:exclude-mapping path="/user/logout" />
		<mvc:exclude-mapping path="/assets/**" />
		<bean class="com.bit2015.bitin.interceptor.AuthInterceptor" />
    	</mvc:interceptor>
    	
    	위에서 login,logout, assets에 있는 자료들은 exclude하는데 jsp파일에서 assets에 존재하지않는데 assets에 있어야할 데이터들이 읽히면 그데이터들을exclude해주지못하기 때문에   우리가 설정해준 ServletHttpRequestHandler으로
    	가지 않고 DefaultServletHttpRequestHandler으로가 게되서 생기는 에러이다.
		 */
		
		if (handler instanceof HandlerMethod == false) {
//		    HandlerMethod maControl = (HandlerMethod) handler;  
//		    Method pmrResolver = (Method) maControl.getMethod();  
//		    String methodName = pmrResolver.getName(); 
		    System.out.println( "------------------>> jsp파일에있는 assets안에 없는 데이터들을 assets안에 넣어 줄것" + handler.getClass().getName() );
			return false;	
		}
		
		Auth auth = ( ( HandlerMethod ) handler ).getMethodAnnotation( Auth.class );
		if( auth == null ) {
		    return true;
		}
		
	
		HttpSession session = request.getSession();
		if( session == null ) { //로그인 안함
			//TODO : 로그인부 만들고 수정
			response.sendRedirect( "/bitin/main/loginform" );
			//
			return false;
		}
		
		UserVo authUser = (UserVo)session.getAttribute( "authUser" );
		if( authUser == null ) { //로그인 안함
			//TODO : 로그인부 만들고 수정
			response.sendRedirect( "/bitin/main/loginform" );
			//
			return false;
		}
		
		return true;
	}
}
