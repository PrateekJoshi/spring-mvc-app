package com.prateek.springmvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.prateek.springmvc.service.SpringMVCLoginService;

@Controller
@SessionAttributes("name")			//${name} will be available in views for whole session (not just for one request)
public class LoginController {
	
	@Autowired
	SpringMVCLoginService loginService;
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String showLoginPage() 
	{
		return "login";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String processLogin(@RequestParam String name, @RequestParam String password, ModelMap model) 
	{
		if(loginService.validateUser(name, password))
		{
			/* whatever we set in the model, will be available to the view */
			model.put("name", name);
			return "welcome";
		}
		model.put("errorMessage", "Invalid credentials !!!");
		return "login";
	}
	
	
	@RequestMapping(value="/hello",method=RequestMethod.GET)
	@ResponseBody				//Response will be sent back as string (ViewResolver will not be called)
	public String sayHello()
	{
		return "Hello World";
	}
}
