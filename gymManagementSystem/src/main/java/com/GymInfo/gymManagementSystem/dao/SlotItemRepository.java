package com.GymInfo.gymManagementSystem.dao;

import java.util.Set;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.GymInfo.gymManagementSystem.bean.SlotItem;
import com.GymInfo.gymManagementSystem.bean.SlotItemEmbed;

public interface SlotItemRepository extends JpaRepository<SlotItem, SlotItemEmbed> {
	@Query("SELECT s.seatBooked FROM SlotItem s WHERE s.embeddedId = :embeddedId")
    Integer findSeatBookedById(@Param("embeddedId") SlotItemEmbed embeddedId);
	@Query("SELECT embeddedId from SlotItem")
	public Set<SlotItemEmbed> findAllEmbeds();
}