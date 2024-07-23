package com.GymInfo.gymManagementSystem.dao;

import java.util.List;
import java.util.Set;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.GymInfo.gymManagementSystem.bean.SlotItem;
import com.GymInfo.gymManagementSystem.bean.SlotItemEmbed;

public interface SlotItemRepository extends JpaRepository<SlotItem, SlotItemEmbed> {
	@Query("SELECT s.seatBooked FROM SlotItem s WHERE s.embeddedId = :embeddedId")
    Integer findSeatBookedById(@Param("embeddedId") SlotItemEmbed embeddedId);
	@Query("SELECT embeddedId FROM SlotItem")
	public Set<SlotItemEmbed> findAllEmbeds();
	@Query("SELECT s FROM SlotItem s WHERE s.seatBooked=0")
	public List<SlotItem> displayEmptySlots();
	@Query("SELECT s FROM SlotItem s WHERE s.seatBooked>0")
	public List<SlotItem> displayBookedSlots();
}