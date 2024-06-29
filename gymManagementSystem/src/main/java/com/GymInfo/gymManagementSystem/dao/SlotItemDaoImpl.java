package com.GymInfo.gymManagementSystem.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import com.GymInfo.gymManagementSystem.bean.SlotItem;

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
}