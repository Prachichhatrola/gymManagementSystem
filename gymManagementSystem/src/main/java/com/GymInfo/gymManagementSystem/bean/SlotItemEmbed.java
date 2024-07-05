package com.GymInfo.gymManagementSystem.bean;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

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
    return Objects.hash(slotId, itemId);
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj) return true;
    if (obj == null || getClass() != obj.getClass()) return false;
    SlotItemEmbed that = (SlotItemEmbed) obj;
    return Objects.equals(slotId, that.slotId) && Objects.equals(itemId, that.itemId);
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