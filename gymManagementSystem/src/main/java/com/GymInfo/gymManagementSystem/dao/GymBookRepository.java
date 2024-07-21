package com.GymInfo.gymManagementSystem.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.GymInfo.gymManagementSystem.bean.GymBook;

public interface GymBookRepository extends JpaRepository<GymBook, Long> {

	@Query("select max(bookingId) from GymBook")
	public Long findLastBookingId();
	
	@Query("SELECT gb FROM GymBook gb WHERE gb.username = :username")
	List<GymBook> findByUsername(String username);
}