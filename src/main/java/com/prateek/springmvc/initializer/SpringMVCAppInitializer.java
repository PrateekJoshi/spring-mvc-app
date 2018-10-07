package com.prateek.springmvc.initializer;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import com.prateek.springmvc.config.SpringConfig;

/* Spring MVC App initilazer */
/* Refer: http://websystique.com/springmvc/spring-4-mvc-helloworld-tutorial-annotation-javaconfig-full-example
 * 		   udemy.com/spring-mvc-tutorial-for-beginners-step-by-step/learn/v4/t/lecture/4374566?start=0
 * 
 * 1) Since we are not defining Dispatcher Servlet in web.xml, we will load our Spring MVC config class
 *	in the context and assign dispatcher servlet here.
 *
 * 2) Here, we have mapped dispatcher servlet mapped to any request which comes on URL /webapp/*
 */

public class SpringMVCAppInitializer implements WebApplicationInitializer{

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();
		context.register(SpringConfig.class);
		context.setServletContext(servletContext);
		
		ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", new DispatcherServlet(context));
		servlet.setLoadOnStartup(1);
		servlet.addMapping("/");
		
	}

}
