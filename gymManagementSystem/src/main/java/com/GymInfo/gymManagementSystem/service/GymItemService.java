package com.GymInfo.gymManagementSystem.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.GymInfo.gymManagementSystem.bean.GymItem;
import com.GymInfo.gymManagementSystem.bean.Item;
import com.GymInfo.gymManagementSystem.bean.SlotItem;
import com.GymInfo.gymManagementSystem.bean.SlotItemEmbed;
import com.GymInfo.gymManagementSystem.dao.GymItemDao;
import com.GymInfo.gymManagementSystem.dao.SlotItemDao;

@Service
public class GymItemService {
  
  @Autowired
  private GymItemDao gymItemDao;
  @Autowired
  private SlotItemDao slotItemDao;
  
  public List<Item> getItemList(Long slotId){
    List<Item> itemList=new ArrayList<>();
    List<GymItem> gymList=gymItemDao.displayAllItems();
    for(GymItem gym:gymList) {
      Item item=new Item(gym);
      SlotItemEmbed embed=new SlotItemEmbed(slotId, gym.getItemId());
      Integer seatBooked=slotItemDao.findSeatBookedById(embed);
      if(seatBooked==null)
        seatBooked=0;
      int seatVacant=gym.getTotalSeat()-seatBooked.intValue();
      item.setSeatVacant(seatVacant);
      itemList.add(item);
    }
    return itemList;
  }
  
  public void addNewItemToSlots(Long itemId)
  {
    Set<SlotItemEmbed> embedSet=slotItemDao.findAllEmbeds();
    Set<Long> itemSet=new HashSet<>();
    Set<Long> slotSet=new HashSet<>();
    for(SlotItemEmbed embed:embedSet) {
      itemSet.add(embed.getItemId());
      slotSet.add(embed.getSlotId());
    }
    if(itemSet.contains(itemId)==false) {
      for(Long slotId:slotSet) {
        SlotItemEmbed embed=new SlotItemEmbed(slotId, itemId);
        SlotItem slotItem=new SlotItem(embed);
        slotItemDao.save(slotItem);
      } //end of for
    } //end of if
  } //end of function
  
}