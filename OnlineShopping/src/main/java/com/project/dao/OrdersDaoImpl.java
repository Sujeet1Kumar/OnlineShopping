package com.project.dao;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.model.Product;
import com.project.model.Orders;

@Repository
public class OrdersDaoImpl implements OrdersDao {

	@Autowired
	private SessionFactory sessionfactory;

	@Transactional
	@Override
	public int insert(Orders orders) {
		int i = 0;
		sessionfactory.getCurrentSession().save(orders);
		System.out.println(orders.getProductid() + "\t" + orders.getBuyername() + "\t" + orders.getSellername());
		i = 1;
		return i;
	}

	@Transactional
	@Override
	public List<Orders> getAllOrders() {
		Query q = sessionfactory.getCurrentSession().createQuery("from Orders");
		return q.getResultList();
	}

	@Transactional
	@Override
	public int delete(Orders orders) {
		int i = 0;
		sessionfactory.getCurrentSession().delete(orders);
		// System.out.println(orders.getBookid() + "\t" + orders.getBuyername() + "\t" +
		// orders.getSellername());
		i = 1;
		return i;
	}

}
