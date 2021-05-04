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
public class BuyerDaoImpl implements BuyerDao {

	@Autowired
	SessionFactory sessionfactory;

	@Transactional
	@Override
	public List<User> getAllBuyers() {
		Query q = sessionfactory.getCurrentSession().createQuery("from User where role=:role");
		q.setParameter("role", "Buyer");
		return q.getResultList();
	}

}
