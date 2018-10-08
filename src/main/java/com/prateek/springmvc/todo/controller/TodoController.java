package com.prateek.springmvc.todo.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.prateek.springmvc.todo.model.Todo;
import com.prateek.springmvc.todo.service.TodoService;

@Controller
public class TodoController {
	
	@Autowired
	TodoService service;
	
	/*
	 * Refer: www.udemy.com/spring-mvc-tutorial-for-beginners-step-by-step/learn/v4/t/lecture/4374612
	 * This willlbe invoked before start of any controller method.
	 * We need to tell the binder, Date format which we want to specify.
	 * 
	 */
	@InitBinder
	protected void InitBinder(WebDataBinder binder) 
	{
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	
	@RequestMapping(value="/list-todos",method=RequestMethod.GET)
	public String listTodo(ModelMap model)
	{
		model.addAttribute("todos",service.retrieveTodos("prateek"));
		return "list-todos";
	}
	
	@RequestMapping(value="/add-todo",method=RequestMethod.GET)
	public String showTodo(ModelMap model)
	{
		model.addAttribute("todo",new Todo(0,"prateek","",new Date(),false));
		return "todo";
	}
	
	/*
	 * Refer: www.udemy.com/spring-mvc-tutorial-for-beginners-step-by-step/learn/v4/t/lecture/4374608
	 * We are getting Todo object as parameter in function because we have used
	 * spring mvc form in jsp will which to form fields to object binding for us
	 * using path="" attribute name.
	 * 
	 * During validation, validation errors will be stores in BindingResult
	 */
	@RequestMapping(value="/add-todo",method=RequestMethod.POST)
	public String addTodo(ModelMap model, @Valid Todo todo, BindingResult result)
	{
		/* Check for validation error using hibernate validator*/
		if(result.hasErrors())
		{
			return "todo";
		}
		
		service.addTodo("prateek", todo.getDesc(), new Date(), false);
		return "redirect:list-todos";
	}
	
	@RequestMapping(value="/delete-todo",method=RequestMethod.GET)
	public String deleteTodo(ModelMap model,  @RequestParam int id)
	{
		service.deleteTodo(id);
		return "redirect:list-todos";
	}
	
	@RequestMapping(value="/update-todo",method=RequestMethod.GET)
	public String updateTodo(ModelMap model,  @RequestParam int id)
	{
		model.addAttribute("todo", service.retrieveTodo(id));
		return "todo";
	}
	
	@RequestMapping(value="/update-todo",method=RequestMethod.POST)
	public String updateTodo2(ModelMap model, @Valid Todo todo, BindingResult result)
	{
		/* Check for validation error using hibernate validator*/
		if(result.hasErrors())
		{
			return "todo";
		}
		
		service.updateTodo(todo);
		return "redirect:list-todos";
	}
	
}
