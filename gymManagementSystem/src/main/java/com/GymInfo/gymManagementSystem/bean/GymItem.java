package com.GymInfo.gymManagementSystem.bean;

import javax.persistence.Entity;

import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="gym_item")
public class GymItem  {
  @Id
  private long itemId;
  private String itemName;
  private Integer totalSeat;
  public GymItem() {
  super();
  // TODO Auto-generated constructor stub
  }
  public GymItem(long itemId, String itemName, Integer totalSeat) {
  super();
  this.itemId = itemId;
  this.itemName = itemName;
  this.totalSeat = totalSeat;
  }
  public long getItemId() {
  return itemId;
  }
  public void setItemId(long itemId) {
  this.itemId = itemId;
  }
  public String getItemName() {
  return itemName;
  }
  public void setItemName(String itemName) {
  this.itemName = itemName;
  }
  public Integer getTotalSeat() {
  return totalSeat;
  }
  public void setTotalSeat(Integer totalSeat) {
  this.totalSeat = totalSeat;
  }
}