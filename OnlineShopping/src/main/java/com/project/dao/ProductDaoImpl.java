package com.project.dao;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.model.Product;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	SessionFactory sessionfactory;

	@Transactional
	@Override
	public int insert(Product product) {
		int i = 0;
		sessionfactory.getCurrentSession().save(product);
		System.out.println(product.getProductname() + "\t" + product.getProductprice());
		return i;
	}

	@Transactional
	@Override
	public List<Product> getAllProducts() {
		Query q = sessionfactory.getCurrentSession().createQuery("from Product");
		return q.getResultList();
	}

	@Transactional
	@Override
	public int delete(Product product) {
		int i = 0;
		sessionfactory.getCurrentSession().delete(product);
		// System.out.println(book.getBookname()+"\t"+book.getBookprice());
		return i;
	}

}
