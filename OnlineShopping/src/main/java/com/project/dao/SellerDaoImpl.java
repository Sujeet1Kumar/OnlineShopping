package com.project.dao;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.model.Product;
import com.project.model.User;

@Repository
public class SellerDaoImpl implements SellerDao {

	@Autowired
	SessionFactory sessionfactory;

	@Transactional
	@Override
	public List<User> getAllSellers() {
		Query q = sessionfactory.getCurrentSession().createQuery("from User where role=:role");
		q.setParameter("role", "Seller");
		return q.getResultList();
	}

}
