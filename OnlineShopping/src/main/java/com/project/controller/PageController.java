package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

	@GetMapping("/")
	public String Welcome() {
		return "index";
	}

	@GetMapping("/register")
	public String register() {
		return "register";
	}

	@GetMapping("/registerseller")
	public String registerseller() {
		return "registerseller";
	}

	@GetMapping("/registeradmin")
	public String registeradmin() {
		return "registeradmin";
	}

	@GetMapping("/loginseller")
	public String loginseller() {
		return "loginseller";
	}

	@GetMapping("/loginadmin")
	public String loginadmin() {
		return "loginadmin";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@GetMapping("/addproduct")
	public String addproduct() {
		return "addproduct";
	}

	@GetMapping("/logout")
	public String logout(HttpSession hs) {
		hs.removeAttribute("user");
		hs.invalidate();
		return "index";
	}
	/*
	 * @GetMapping("/showbook") public String showbook() { return "login"; }
	 */

}
