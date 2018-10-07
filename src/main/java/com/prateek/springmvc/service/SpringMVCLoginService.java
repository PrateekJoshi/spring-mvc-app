package com.prateek.springmvc.service;

public class SpringMVCLoginService {
	
	public boolean validateUser(String user,String password)
	{
		return user.equalsIgnoreCase("prateek") && password.equals("springmvc");
	}
}
