package com.prateek.springmvc.todo.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.prateek.springmvc.todo.model.Todo;
import com.prateek.springmvc.todo.service.TodoService;

/*
 * We have used @RestController not @Controller
 */
@RestController
public class TodoRestController {
	
	@Autowired
	private TodoService service;
	
	@RequestMapping(value="/todos")
	public List<Todo> retrieveAllTodos()
	{
		return service.retrieveTodos("prateek");
	}
	
	@RequestMapping(value="/todos/{id}")
	public Todo retrieveTodos(@PathVariable int id)
	{
		return service.retrieveTodo(id);
	}

}
