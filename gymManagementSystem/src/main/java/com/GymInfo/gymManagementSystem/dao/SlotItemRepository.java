package com.GymInfo.gymManagementSystem.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.GymInfo.gymManagementSystem.bean.SlotItem;
import com.GymInfo.gymManagementSystem.bean.SlotItemEmbed;

public interface SlotItemRepository extends JpaRepository<SlotItem, SlotItemEmbed> {

}