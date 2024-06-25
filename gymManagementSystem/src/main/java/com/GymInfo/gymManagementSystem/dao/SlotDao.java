package com.GymInfo.gymManagementSystem.dao;

import java.util.List;
import com.GymInfo.gymManagementSystem.bean.Slot;

public interface SlotDao {
    public void saveNewSlot(Slot slot);
    public List<Slot> displayAllSlots();
    public Slot findSlotById(Long id);
    public void deleteSlotById(Long id);  // Method to delete slot by ID
    public void updateSlot(Slot slot);
    public Long generateSlotId();
    
}