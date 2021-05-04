package com.project.dao;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.model.Product;
import com.project.model.Cart;
import com.project.model.Orders;
import com.project.model.User;

@Repository
public class CartDaoImpl implements CartDao {

	@Autowired
	private SessionFactory sessionfactory;

	@Transactional
	@Override
	public int insert(Cart cart) {
		int i = 0;
		sessionfactory.getCurrentSession().save(cart);
		System.out.println(cart.getProductid() + "\t" + cart.getBuyerid() + "\t" + cart.getSellerid());
		i = 1;
		return i;
	}

	@Transactional
	@Override
	public List<Cart> getAllCart() {
		Query q = sessionfactory.getCurrentSession().createQuery("from Cart");
		return q.getResultList();
	}

	@Transactional
	@Override
	public int delete(Cart cart) {
		int i = 0;
		sessionfactory.getCurrentSession().delete(cart);
		// System.out.println(orders.getBookid() + "\t" + orders.getBuyername() + "\t" +
		// orders.getSellername());
		i = 1;
		return i;
	}

}
