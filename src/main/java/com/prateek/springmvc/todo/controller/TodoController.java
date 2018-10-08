package com.prateek.springmvc.todo.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.prateek.springmvc.todo.service.TodoService;

@Controller
public class TodoController {
	
	@Autowired
	TodoService service;
	
	@RequestMapping(value="/list-todos",method=RequestMethod.GET)
	public String listTodo(ModelMap model)
	{
		model.addAttribute("todos",service.retrieveTodos("prateek"));
		return "list-todos";
	}
	
	@RequestMapping(value="/add-todo",method=RequestMethod.GET)
	public String showTodo()
	{
		return "todo";
	}
	
	@RequestMapping(value="/add-todo",method=RequestMethod.POST)
	public String addTodo(ModelMap model, @RequestParam String desc)
	{
		service.addTodo("prateek", desc, new Date(), false);
		return "redirect:list-todos";
	}
	
}
