package com.jspider.hotelmvc.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.jspider.hotelmvc.pojo.GuestHistoryPOJO;

@Repository
public class GuestHistoryRepository {

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

	public void addGuestHistory(int room,String name,String city,String id_name,String id_no, String date_in,String date_out) {
		openConnection();
		transaction.begin();
		GuestHistoryPOJO historyPOJO=new GuestHistoryPOJO();
		historyPOJO.setRoom_no(room);
		historyPOJO.setGuest_name(name);
		historyPOJO.setCity(city);
		historyPOJO.setId_proof_name(id_name);
		historyPOJO.setId_proof_no(id_no);
		historyPOJO.setDate_in(date_in);
		historyPOJO.setDate_out(date_out);
		manager.persist(historyPOJO);
		transaction.commit();
		closeConnection();
	}
	public List<GuestHistoryPOJO> searchAll() {
		openConnection();
		transaction.begin();
		jpql= "from GuestHistoryPOJO";
		query = manager.createQuery(jpql);
		List<GuestHistoryPOJO> history = query.getResultList();
		transaction.commit();
		closeConnection();
		return history;
	}
	
	public List<GuestHistoryPOJO> searchGuestHistory(String text) {
		openConnection();
		transaction.begin();
		jpql= "from GuestHistoryPOJO where guest_name like '%"+text+"%'";
		query = manager.createQuery(jpql);
		List<GuestHistoryPOJO> history = query.getResultList();
		transaction.commit();
		closeConnection();
		return history;
	}

}
