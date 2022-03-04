package com.example.demo.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.demo.dao.ManagerDAO;

import lombok.Setter;

@Controller
@Setter
public class ManagerController {

	@Autowired
	private ManagerDAO dao;

}
