package com.GymInfo.gymManagementSystem.dao;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import com.GymInfo.gymManagementSystem.bean.SlotItem;
import com.GymInfo.gymManagementSystem.bean.SlotItemEmbed;

@Service
@Repository
public class SlotItemDaoImpl implements SlotItemDao{
	@Autowired
	private SlotItemRepository repository;
	@Override
	public void save(SlotItem slotItem)
	{
		repository.save(slotItem);
	}
	@Override
	public Integer findSeatBookedById(SlotItemEmbed id) {
		return repository.findSeatBookedById(id);
	}
	@Override
	public Set<SlotItemEmbed> findAllEmbeds() {
		return repository.findAllEmbeds();
	}
}