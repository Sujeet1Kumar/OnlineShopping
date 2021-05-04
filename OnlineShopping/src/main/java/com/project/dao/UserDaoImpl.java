package com.project.dao;

import java.sql.SQLException;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.model.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionfactory;

	@Transactional
	@Override
	public int insert(User user){
		int i = 0;
		sessionfactory.getCurrentSession().save(user);
		System.out.println(
				user.getUsername() + "\t" + user.getEmail() + "\t" + user.getPassword() + "\t" + user.getRole());
		i = 1;
		System.out.println(i);
		return i;
	}

	@Transactional
	@Override
	public User login(String email, String password, String role) {
		Query query = sessionfactory.getCurrentSession()
				.createQuery("from User where email=:email and password=:password and role=:role");
		query.setParameter("email", email);
		query.setParameter("password", password);
		query.setParameter("role", role);
		if (query.getResultList().size() > 0) {
			return (User) query.getResultList().get(0);
		}System.out.println(query.getResultList().size());
		return null;
	}

	@Transactional
	@Override
	public int deleteSeller(User user) {
		int i = 0;
		sessionfactory.getCurrentSession().delete(user);
		i = 1;
		return i;
	}

	@Transactional
	@Override
	public int deleteBuyer(User user) {
		int i = 0;
		sessionfactory.getCurrentSession().delete(user);
		i = 1;
		return i;
	}

	@Transactional
	@Override
	public int emailcheck(String email) {
		int i = 0;
		Query query = sessionfactory.getCurrentSession()
				.createQuery("from User where email=:email");
		query.setParameter("email", email);
		if (query.getResultList().size() > 0) {
			i = 1;
		}System.out.println(query.getResultList().size());
		return i;
	}

}
