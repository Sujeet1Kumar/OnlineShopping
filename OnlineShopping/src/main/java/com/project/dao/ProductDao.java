package com.project.dao;

import java.util.List;

import com.project.model.Product;

public interface ProductDao {

	int insert(Product roduct);

	List<Product> getAllProducts();

	int delete(Product product);
}
