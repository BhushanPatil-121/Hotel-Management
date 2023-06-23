package com.jspider.hotelmvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jspider.hotelmvc.pojo.AdminPOJO;
import com.jspider.hotelmvc.repository.AdminRepository;

@Service
public class AdminService {

	@Autowired
	private AdminRepository repository;
	
	public AdminPOJO addAdmin(String username, String password, String user, String pass) {
		AdminPOJO admin = repository.addAdmin(username, password,user,pass);
		return admin;
	}

	public AdminPOJO login(String username, String password) {
		AdminPOJO admin = repository.login(username, password);
		return admin;
	}
}
