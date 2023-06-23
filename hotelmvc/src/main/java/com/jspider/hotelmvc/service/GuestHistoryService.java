package com.jspider.hotelmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jspider.hotelmvc.pojo.GuestHistoryPOJO;
import com.jspider.hotelmvc.repository.GuestHistoryRepository;

@Service
public class GuestHistoryService {

	@Autowired
	private GuestHistoryRepository repository;

	public void addGuestHistory(int room,String name,String city,String id_name,String id_no, String date_in,String date_out) {
		repository.addGuestHistory(room, name, city, id_name, id_no, date_in, date_out);
	}
	public List<GuestHistoryPOJO> searchAll() {
		List<GuestHistoryPOJO> history = repository.searchAll();
		return history;
	}
	
	public List<GuestHistoryPOJO> searchGuestHistory(String text) {
		List<GuestHistoryPOJO> history = repository.searchGuestHistory(text);
		return history;
	}

	
}
