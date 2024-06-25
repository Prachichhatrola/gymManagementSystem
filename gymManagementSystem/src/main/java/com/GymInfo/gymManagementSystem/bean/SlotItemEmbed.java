package com.GymInfo.gymManagementSystem.bean;

import java.io.Serializable;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

@SuppressWarnings("serial")
@Embeddable
public class SlotItemEmbed implements Serializable{
  @NotNull
  private Long slotId;
  @NotNull
  private Long itemId;
  public SlotItemEmbed() {
    super();
    // TODO Auto-generated constructor stub
  }
  public SlotItemEmbed(@NotNull Long slotId, @NotNull Long itemId) {
    super();
    this.slotId = slotId;
    this.itemId = itemId;
  }
  @Override
  public int hashCode() {
    String ss=" "+slotId+itemId;
    int val=Integer.parseInt(ss);
    return val;
  }
  @Override
  public boolean equals(Object obj) {
    SlotItemEmbed other=(SlotItemEmbed) obj;
    if(this.hashCode()== other.hashCode())
      return true;
    else
      return false;
  }
  public Long getSlotId() {
    return slotId;
  }
  public void setSlotId(Long slotId) {
    this.slotId = slotId;
  }
  public Long getItemId() {
    return itemId;
  }
  public void setItemId(Long itemId) {
    this.itemId = itemId;
  }
}