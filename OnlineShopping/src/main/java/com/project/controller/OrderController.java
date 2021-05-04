package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.OrdersDao;
import com.project.model.Cart;
import com.project.model.Orders;

@Controller
public class OrderController {

	@Autowired
	private OrdersDao ordersDao;

	@PostMapping("/order")
	public String orders(Orders orders) {
		System.out.println(orders.getProductid() + "\t" + orders.getProductname() + "\t" + orders.getProductprice()
				+ "\t" + orders.getProductimage() + "\t" + orders.getBuyerid() + "\t" + orders.getSellerid() + "\t"
				+ orders.getSellername());
		int i = ordersDao.insert(orders);
		return "redirect:/showorder";
	}

	@GetMapping("/showorder")
	public String showorder(HttpSession hs) {
		List<Orders> orders = ordersDao.getAllOrders();
		hs.setAttribute("orders", orders);
		return "showorder";
	}

	@PostMapping("/deleteorder")
	public String deleteorder(Orders orders) {
		System.out.println(orders.getProductid() + "\t" + orders.getProductname() + "\t" + orders.getProductprice()
				+ "\t" + orders.getProductimage() + "\t" + orders.getBuyerid() + "\t" + orders.getSellerid() + "\t"
				+ orders.getSellername());
		int i = ordersDao.delete(orders);
		return "showorder";
	}

}
