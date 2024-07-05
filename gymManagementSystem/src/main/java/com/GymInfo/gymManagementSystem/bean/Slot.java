package com.GymInfo.gymManagementSystem.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="slot")
public class Slot {
  @Id
    private Long slotId;
    private String slotTime;
    private Double pricing;
  public Slot() {
    super();
    // TODO Auto-generated constructor stub
  }
  public Slot(Long slotId, String slotTime, Double pricing) {
    super();
    this.slotId = slotId;
    this.slotTime = slotTime;
    this.pricing = pricing;
  }
  public Long getSlotId() {
    return slotId;
  }
  public void setSlotId(Long slotId) {
    this.slotId = slotId;
  }
  public String getSlotTime() {
    return slotTime;
  }
  public void setSlotTime(String slotTime) {
    this.slotTime = slotTime;
  }
  public Double getPricing() {
    return pricing;
  }
  public void setPricing(Double pricing) {
    this.pricing = pricing;
  }
}