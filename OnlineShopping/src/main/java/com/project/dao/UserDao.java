package com.project.dao;

import java.sql.SQLException;

import com.project.model.User;

public interface UserDao {

	int insert(User user);

	User login(String email, String password, String role);

	int deleteSeller(User user);

	int deleteBuyer(User user);

	int emailcheck(String email);
}
