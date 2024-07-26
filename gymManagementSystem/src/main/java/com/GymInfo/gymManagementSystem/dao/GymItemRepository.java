package com.GymInfo.gymManagementSystem.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.GymInfo.gymManagementSystem.bean.GymItem;

public interface GymItemRepository extends JpaRepository<GymItem, Long> {
	@Query("select max(itemId) from GymItem")
	public Long findLastItemId();
	
	@Query("select totalSeat from GymItem where itemId=?1")
	public Integer findTotalSeatById(Long id);
}