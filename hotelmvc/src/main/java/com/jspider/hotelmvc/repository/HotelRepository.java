package com.jspider.hotelmvc.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.jspider.hotelmvc.pojo.GuestHistoryPOJO;
import com.jspider.hotelmvc.pojo.HotelPOJO;

@Repository
public class HotelRepository {

	private static EntityManagerFactory factory;
	private static EntityManager manager;
	private static EntityTransaction transaction;
	private static Query query;
	private String jpql;
	
	private static void openConnection() {
		factory = Persistence.createEntityManagerFactory("hotel");
		manager = factory.createEntityManager();
		transaction = manager.getTransaction();
	}

	private static void closeConnection() {
		if (factory != null) {
			factory.close();
		}
		if (manager != null) {
			manager.close();
		}
		if (transaction.isActive()) {
			transaction.rollback();
		}
	}

	public HotelPOJO addGuest(int room,String name,String city,String id_name,String id_no, String date_in,String date_out) {
		openConnection();
		transaction.begin();
		HotelPOJO hotel = new HotelPOJO();
		hotel.setRoom_no(room);
		hotel.setGuest_name(name);
		hotel.setCity(city);
		hotel.setId_proof_name(id_name);
		hotel.setId_proof_no(id_no);
		hotel.setDate_in(date_in);
		hotel.setDate_out(date_out);
		manager.persist(hotel);
		transaction.commit();
		closeConnection();
		return hotel;
	}

	public HotelPOJO searchGuest(int room) {
		openConnection();
		transaction.begin();
		HotelPOJO hotel = manager.find(HotelPOJO.class, room);
		transaction.commit();
		closeConnection();
		return hotel;
	}
	
	public List<HotelPOJO> searchAllGuest() {
		openConnection();
		transaction.begin();
		jpql = "from HotelPOJO";
		query = manager.createQuery(jpql);
		List<HotelPOJO> guests = query.getResultList();
		transaction.commit();
		closeConnection();
		return guests;
	}

	public void removeGuest(int room) {
		openConnection();
		transaction.begin();
		HotelPOJO hotel = manager.find(HotelPOJO.class, room);
		manager.remove(hotel);
		transaction.commit();
		closeConnection();
	}

	public HotelPOJO updateGuest(int room, String name, String city,String id_name, String id_no, String date_in, String  date_out) {
		openConnection();
		transaction.begin();
		HotelPOJO hotel = manager.find(HotelPOJO.class, room);
		hotel.setRoom_no(room);
		hotel.setGuest_name(name);
		hotel.setCity(city);
		hotel.setId_proof_name(id_name);
		hotel.setId_proof_no(id_no);
		hotel.setDate_in(date_in);
		hotel.setDate_out(date_out);
		manager.persist(hotel);
		transaction.commit();
		closeConnection();
		return hotel;
	}
}