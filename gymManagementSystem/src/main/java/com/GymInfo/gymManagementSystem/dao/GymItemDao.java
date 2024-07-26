package com.GymInfo.gymManagementSystem.dao;

import java.util.List;
import com.GymInfo.gymManagementSystem.bean.GymItem;

public interface GymItemDao {
    public void saveNewItem(GymItem gymItem);
    public List<GymItem> displayAllItems();
    public GymItem findItemById(Long id);
    public Long generateItemId();
    public void updateItem(GymItem gymItem);
    public Integer findTotalSeatById(Long id);
}