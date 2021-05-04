package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.ProductDao;
import com.project.dao.SellerDao;
import com.project.model.Product;
import com.project.model.User;

@Controller
public class SellerController {

	@Autowired
	private SellerDao sellerDao;

	@GetMapping("/showseller")
	public String showseller(HttpSession hs) {
		List<User> sellers = sellerDao.getAllSellers();
		hs.setAttribute("sellers", sellers);
		return "showseller";
	}
}
