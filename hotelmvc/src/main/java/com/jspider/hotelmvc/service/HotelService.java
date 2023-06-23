package com.jspider.hotelmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jspider.hotelmvc.pojo.HotelPOJO;
import com.jspider.hotelmvc.repository.HotelRepository;

@Service
public class HotelService {

	
	@Autowired
	private HotelRepository repository;
	
	public HotelPOJO addGuest(int room,String name,String city,String id_name,String id_no, String date_in,String date_out) {
		HotelPOJO employee = repository.addGuest(room,name,city,id_name,id_no,date_in,date_out);
		return employee;
	}
	
	public HotelPOJO searchGuest(int id) {
		HotelPOJO employee = repository.searchGuest(id);
		return employee;
	}
//	
	public List<HotelPOJO> searchAllGuest() {
		List<HotelPOJO> guests = repository.searchAllGuest();
		return guests;
	}
//
	public void removeGuest(int id) {
		repository.removeGuest(id);
	}

	public HotelPOJO updateGuest(int room,String name,String city,String id_name,String id_no, String date_in,String date_out) {
		HotelPOJO employee = repository.updateGuest(room,name,city,id_name,id_no,date_in,date_out);
		return employee;
	}

}
