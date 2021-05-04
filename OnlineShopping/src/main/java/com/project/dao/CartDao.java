package com.project.dao;

import java.util.List;

import com.project.model.Product;
import com.project.model.Cart;
import com.project.model.Orders;

public interface CartDao {

	int insert(Cart cart);

	List<Cart> getAllCart();

	int delete(Cart cart);
}
