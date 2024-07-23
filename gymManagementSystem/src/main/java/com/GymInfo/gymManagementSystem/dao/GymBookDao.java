package com.GymInfo.gymManagementSystem.dao;

import java.util.List;

import com.GymInfo.gymManagementSystem.bean.GymBook;

//gymbookdao

public interface GymBookDao {
 public void save(GymBook gymBook);
 public Long generateBookingId();
 public List<GymBook> getBookList();
 public GymBook findBookInfoById(Long id);
 public void deleteById(Long id);
public List<GymBook> getEntitiesByUsername(String username);

}