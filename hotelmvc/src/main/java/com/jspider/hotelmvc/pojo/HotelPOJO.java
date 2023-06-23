package com.jspider.hotelmvc.pojo;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

	
@Data
@Entity
public class HotelPOJO {

	
	@Id
	private int room_no;
	private String guest_name;
	private String city;
	private String id_proof_name;
	private String id_proof_no;
	private String date_in;
	private String date_out;
}

