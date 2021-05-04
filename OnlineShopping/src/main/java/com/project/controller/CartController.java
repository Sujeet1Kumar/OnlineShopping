package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.CartDao;
import com.project.dao.UserDao;
import com.project.model.Cart;
import com.project.model.Orders;
import com.project.model.User;

@Controller
public class CartController {

	@Autowired
	private CartDao cartDao;

	@PostMapping("/cart")
	public String cart(Cart cart) {
		System.out.println(cart.getProductid() + "\t" + cart.getProductname() + "\t" + cart.getProductprice() + "\t"
				+ cart.getProductimage() + "\t" + cart.getBuyerid() + "\t" + cart.getBuyername() + "\t"
				+ cart.getSellerid() + "\t" + cart.getSellername());
		int i = cartDao.insert(cart);
		return "login";
	}

	@GetMapping("/showcart")
	public String showcart(HttpSession hs) {
		List<Cart> cart = cartDao.getAllCart();
		hs.setAttribute("cart", cart);
		return "showcart";
	}

	@PostMapping("/deletecart")
	public String deleteorder(Cart cart) {
		System.out.println(cart.getProductid() + "\t" + cart.getProductname() + "\t" + cart.getProductprice() + "\t"
				+ cart.getProductimage() + "\t" + cart.getBuyerid() + "\t" + cart.getBuyername() + "\t"
				+ cart.getSellerid() + "\t" + cart.getSellername());
		int i = cartDao.delete(cart);
		return "showcart";
	}
}
