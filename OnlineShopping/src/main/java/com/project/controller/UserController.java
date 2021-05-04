package com.project.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.dao.UserDao;
import com.project.model.User;

@Controller
public class UserController {

	@Autowired
	private UserDao userDao;

	@PostMapping("/signup")
	public void signup(User user, HttpServletResponse resp) throws IOException {
		int i = emailcheck(user.getEmail());
		if (i == 1) {
			System.out.println("already h");
			resp.getWriter().print("Sorry, This Email Has Already Taken");
		} else {
			System.out.println("ni h");
			int j = userDao.insert(user);
			resp.getWriter().print("Successful Register");
		}
	}

	@PostMapping
	public int emailcheck(String email) {
		int i = userDao.emailcheck(email);
		return i;
	}

	@PostMapping("/signin")
	public void signin(String email, String password, String role, HttpSession session, HttpServletResponse resp)
			throws IOException {
		System.out.println(email + "\t" + password + "\t" + role);
		User user = userDao.login(email, password, role);
		if (user != null) {
			session.setAttribute("user", user);
			resp.getWriter().print("Welcome " + user.getUsername());
		} else {
			resp.getWriter().print("Invalid Email And Password");
		}
	}

	@GetMapping("/home")
	public String home() {
		return "index";
	}

	@PostMapping("/deleteseller")
	public String deleteseller(User user) {
		int i = userDao.deleteSeller(user);
		return "index";
	}

	@PostMapping("/deletebuyer")
	public String deletebuyer(User user) {
		int i = userDao.deleteBuyer(user);
		return "index";
	}
}
