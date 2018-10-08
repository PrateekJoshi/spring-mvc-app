package com.prateek.springmvc.service;

import org.springframework.stereotype.Service;

@Service
public class SpringMVCLoginService {
	
	public boolean validateUser(String user,String password)
	{
		return user.equalsIgnoreCase("prateek") && password.equals("springmvc");
	}
}
