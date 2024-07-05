package com.GymInfo.gymManagementSystem.dao;

import java.util.List;

import com.GymInfo.gymManagementSystem.bean.GymItem;

public interface GymItemDao {
    void saveNewItem(GymItem gymItem);
    List<GymItem> displayAllItems();
    GymItem findItemById(Long id);
    Long generateItemId();
    void deleteItemById(Long id);
    public void updateItem(GymItem gymItem);
    public Integer findTotalSeatById(Long id);
}