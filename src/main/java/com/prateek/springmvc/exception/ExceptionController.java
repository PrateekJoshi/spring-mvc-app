package com.prateek.springmvc.exception;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/*
 * Refer: www.udemy.com/spring-mvc-tutorial-for-beginners-step-by-step/learn/v4/t/lecture/4374626
 * Whatever is defined inside a class
 * annotated with @ControllerAdvice is made available to all the
 * controller in the app.
 */

@ControllerAdvice
public class ExceptionController {
	
	private Log logger = LogFactory.getLog(ExceptionController.class);
	
	/*
	 * Handle all exception (ie Exception.class)
	 */
	@ExceptionHandler(value=Exception.class)
	public String handleException(HttpServletRequest request, Exception exp)
	{
		logger.error("Request" + request.getRequestURL()+" Exception: ", exp);
		return "error";
	}
}
