package com.xiagn.bs.spring.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xiagn.bs.spring.User;
import com.xiagn.bs.spring.service.IUserService;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	IUserService userService;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String login(@Valid User user,BindingResult validateResult, Model model) {
		if (validateResult.hasErrors()) {
			return "login";
		}
		if (userService.isAdmin(user)) {
			return "welcome";
		} else {
			return "login";
		}
		
	}
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@ModelAttribute("user")
	public User getPerson(){
	    return new User();
	}
}
