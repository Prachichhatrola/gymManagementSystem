package com.GymInfo.gymManagementSystem.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.GymInfo.gymManagementSystem.bean.GymBook;

public interface GymBookRepository extends JpaRepository<GymBook, Long> {

	@Query("select max(bookingId) from GymBook")
	public Long findLastBookingId();
	
	@Query("SELECT gb FROM GymBook gb WHERE gb.username = :username")
	List<GymBook> findByUsername(String username);
	
	@Query("SELECT CASE WHEN COUNT(gb) > 0 THEN true ELSE false END FROM GymBook gb WHERE gb.username = :username AND gb.slotId = :slotId")
    boolean isSlotBooked(@Param("slotId") Long slotId, @Param("username") String username);
}