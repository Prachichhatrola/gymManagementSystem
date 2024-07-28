package com.GymInfo.gymManagementSystem.bean;


public class Item  {

  private long itemId;
  private String itemName;
  private Integer totalSeat;
  private Integer seatVacant;
  public Item() {
  super();
  // TODO Auto-generated constructor stub
  }
  public Item(GymItem gym) {
		this.itemId = gym.getItemId();
		this.itemName = gym.getItemName();
		this.totalSeat = gym.getTotalSeat();
		this.seatVacant = 0;
	}
public Item(long itemId, String itemName, Integer totalSeat, Integer seatVacant) {
	super();
	this.itemId = itemId;
	this.itemName = itemName;
	this.totalSeat = totalSeat;
	this.seatVacant = seatVacant;
}
@Override
public String toString() {
	return "Item [itemId=" + itemId + ", itemName=" + itemName + ", totalSeat=" + totalSeat + ", seatVacant="
			+ seatVacant + "]";
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
public Integer getSeatVacant() {
	return seatVacant;
}
public void setSeatVacant(Integer seatVacant) {
	this.seatVacant = seatVacant;
}
}