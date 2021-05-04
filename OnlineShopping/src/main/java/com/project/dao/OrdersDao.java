package com.project.dao;

import java.util.List;

import com.project.model.Product;
import com.project.model.Orders;

public interface OrdersDao {

	int insert(Orders orders);

	List<Orders> getAllOrders();

	int delete(Orders orders);

}
