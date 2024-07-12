package com.GymInfo.gymManagementSystem.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.GymInfo.gymManagementSystem.bean.GymBook;
import com.GymInfo.gymManagementSystem.bean.GymItem;
import com.GymInfo.gymManagementSystem.bean.Item;
import com.GymInfo.gymManagementSystem.bean.Slot;
import com.GymInfo.gymManagementSystem.bean.SlotItem;
import com.GymInfo.gymManagementSystem.bean.SlotItemEmbed;
import com.GymInfo.gymManagementSystem.dao.GymBookDao;
import com.GymInfo.gymManagementSystem.dao.GymItemDao;
import com.GymInfo.gymManagementSystem.dao.SlotDao;
import com.GymInfo.gymManagementSystem.dao.SlotItemDao;
import com.GymInfo.gymManagementSystem.exception.SeatNotAvailableException;
import com.GymInfo.gymManagementSystem.service.GymItemService;
import com.GymInfo.gymManagementSystem.service.GymUserService;

@RestController
public class GymController {
  @Autowired
    private GymItemDao gymItemService;
  @Autowired
    private GymItemDao gymItemDao;
    @Autowired 
    private SlotDao slotDao;
    @Autowired 
    private SlotItemDao slotItemDao;
    @Autowired
    private GymItemService itemService;
    @Autowired
    private GymUserService userService;
    @Autowired
    private GymBookDao gymBookDao;
    
    @GetMapping("/index")
    public ModelAndView showIndexPage() {
      String indexPage="";
      String userType=userService.getType();
      if(userType.equalsIgnoreCase("Admin"))
        indexPage="index1";
      else if(userType.equalsIgnoreCase("Member"))
        indexPage="index2";
      return new ModelAndView(indexPage);
    }

    @GetMapping("/about")
    public ModelAndView showAboutUSPage() {
        return new ModelAndView("about");
    }

    @GetMapping("/gymitem")
    public ModelAndView showItemEntryPage() {
        GymItem gymItem = new GymItem();
        Long newId = gymItemDao.generateItemId();
        gymItem.setItemId(newId);
        ModelAndView mv = new ModelAndView("gymItemEntryPage");
        mv.addObject("itemRecord", gymItem);
        return mv;
    }

    @PostMapping("/gymitem")
    public ModelAndView saveItem(@ModelAttribute("itemRecord") GymItem gymItem) {
        gymItemDao.saveNewItem(gymItem);
        return new ModelAndView("redirect:/index");
        //return new ModelAndView("gymItemReportPage");
        /*List<GymItem> itemList = gymItemDao.displayAllItems();
        ModelAndView mv = new ModelAndView("gymItemReportPage");
        mv.addObject("itemList", itemList);
        return mv;*/
    }

    @GetMapping("/gymitems")
    public ModelAndView showItemReportPage() {
        List<GymItem> itemList = gymItemDao.displayAllItems();
        ModelAndView mv = new ModelAndView("gymItemReportPage");
        mv.addObject("itemList", itemList);
        return mv;
    }

    @GetMapping("/slot")
    public ModelAndView showSlotEntryPage() {
        Slot slot = new Slot();
        Long newId = slotDao.generateSlotId(); 
        slot.setSlotId(newId); 
        ModelAndView mv = new ModelAndView("slotEntryPage"); 
        mv.addObject("slotRecord", slot); 
        return mv; 
    }

@PostMapping("/slot")
    public ModelAndView saveSlot(@ModelAttribute("slotRecord") Slot slot) {
        slotDao.saveNewSlot(slot);
        List<GymItem> itemList=gymItemDao.displayAllItems();
        for(GymItem item:itemList)
        {
          SlotItemEmbed embed=new SlotItemEmbed(slot.getSlotId(), item.getItemId());
          SlotItem slotItem=new SlotItem(embed);
          slotItemDao.save(slotItem);
        }
        return new ModelAndView("redirect:/index");
        //return new ModelAndView("slotReportPage1");
        /*List<Slot> slotList = slotDao.displayAllSlots();
        ModelAndView mv = new ModelAndView("slotReportPage1");
        mv.addObject("slotList", slotList);
        return mv;*/
    }
    
    @GetMapping("/slots")
    public ModelAndView showSlotReportPage1() {
        List<Slot> slotList = slotDao.displayAllSlots();
        ModelAndView mv = new ModelAndView("slotReportPage1");
        mv.addObject("slotList", slotList);
        return mv;
    }
    
    @GetMapping("/slots2")
    public ModelAndView showSlotReportPage2() {
        List<Slot> slotList = slotDao.displayAllSlots();
        ModelAndView mv = new ModelAndView("slotReportPage2");
        mv.addObject("slotList", slotList);
        return mv;
    }
    
   @DeleteMapping("/gymitem/{id}") public ResponseEntity<?>
   deleteItem(@PathVariable Long id) { try { gymItemService.deleteItemById(id);
   return ResponseEntity.ok().build(); } catch (IllegalArgumentException e) {
   return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Item with ID " + id
   + " not found"); } catch (Exception e) { return
   ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).
   body("An error occurred: " + e.getMessage()); } 
   }
   
    @GetMapping("/gymitem/edit/{id}")
    public ModelAndView showEditItemPage(@PathVariable Long id) {
        GymItem gymItem = gymItemDao.findItemById(id);
        ModelAndView mv = new ModelAndView("gymItemEntryPage");
        mv.addObject("itemRecord", gymItem);
        return mv;
    }
    
    @PostMapping("/gymitem/edit/{id}")
    public ModelAndView processEditItem(@ModelAttribute("itemRecord") GymItem gymItem) {
        gymItemDao.updateItem(gymItem);
        return new ModelAndView("redirect:/gymitems");
    }
    
    @DeleteMapping("/slot/{id}")
    public ResponseEntity<?> deleteSlot(@PathVariable Long id) {
        try {
            slotDao.deleteSlotById(id);
            return ResponseEntity.ok().build();
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Slot with ID " + id + " not found");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred: " + e.getMessage());
        }
    }
    
    @GetMapping("/slot/edit/{id}")
    public ModelAndView showEditSlotPage(@PathVariable Long id) {
        Slot slot = slotDao.findSlotById(id);
        ModelAndView mv = new ModelAndView("slotEntryPage");
        mv.addObject("slotRecord", slot);
        return mv;
    }
    
    @PostMapping("/slot/edit/{id}")
    public ModelAndView processEditSlot(@ModelAttribute("slotRecord") Slot slot) {
        slotDao.updateSlot(slot);
        return new ModelAndView("redirect:/slots");
    }
    
    /*@GetMapping("/slot-show/{id}")  
      public ModelAndView showSlotEnquirePage(@PathVariable Long id)  {
        Slot slot=slotDao.findSlotById(id);
        List<Item> itemList=itemService.getItemList(id);
        ModelAndView mv = new ModelAndView("slotBookPage");
        mv.addObject("slot",slot);
        mv.addObject("itemList",itemList);
        return mv;
    }*/
    
    @GetMapping("/slot-book/{id}")  
  public ModelAndView showSlotBookPage(@PathVariable Long id)  {
    String fname="";
    String userType=userService.getType();
    if(userType.equalsIgnoreCase("Admin"))
      fname="slotBookPage1";
    else if(userType.equalsIgnoreCase("Member"))
      fname="slotBookPage2";
    GymBook book=new GymBook();
      Long newId=gymBookDao.generateBookingId();
      book.setBookingId(newId);
      Slot slot=slotDao.findSlotById(id);
      List<Item> itemList=itemService.getItemList(id);
    ModelAndView mv = new ModelAndView(fname);
    mv.addObject("slot",slot);
    mv.addObject("itemList",itemList);
    mv.addObject("gymBookRecord",book);
    if(userType.equalsIgnoreCase("Admin")) {
      List<String> userList=userService.getAllMembers();
      mv.addObject("userList",userList);
    }
    return mv;
}
    
    @PostMapping("/slot-book")
    public ModelAndView saveSlotbookPage(@RequestParam("slotId") Long slotId,@RequestParam("selectItem") Long itemId,@RequestParam("userId") String userId,@ModelAttribute("gymBookRecord") GymBook gymBook) {
      String userType=userService.getType();
      String username="";
        if (userId != null && !userId.isEmpty()) {
          if(userType.equalsIgnoreCase("Admin")) 
            username=userId;
          else if(userType.equalsIgnoreCase("Member"))
            username=userId;
        } 
        else {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            username = authentication.getName();
        }
      GymItem gymItem=gymItemDao.findItemById(itemId);
      SlotItemEmbed embed=new SlotItemEmbed(slotId, itemId);
      int totalSeat=gymItem.getTotalSeat();
      SlotItem slotItem=slotItemDao.findById(embed);
      int seatBooked=slotItemDao.findSeatBookedById(embed);
      int available=totalSeat-seatBooked;
      Long newId=gymBookDao.generateBookingId();
      gymBook.setBookingId(newId);
      gymBook.setSlotId(slotId);
        gymBook.setItemId(itemId);
        gymBook.setUsername(username);
        gymBookDao.save(gymBook);
      if (available>0) {
        seatBooked++;
        slotItem.setseatBooked(seatBooked);
        slotItemDao.save(slotItem);
        gymBookDao.save(gymBook);
      }
      else
        throw new SeatNotAvailableException();
      GymBook gymbook=gymBookDao.findBookInfoById(newId);
      String fname="";
    if(userType.equalsIgnoreCase("Admin"))
      fname="bookReportPage1";
    else if(userType.equalsIgnoreCase("Member"))
      fname="bookReportPage2";
      ModelAndView mv=new ModelAndView(fname);
    mv.addObject("gymbook",gymbook);
      return mv;
    }
    
    @GetMapping("/slot-item-add/{id}")
    public ModelAndView saveItemSlots(@PathVariable Long id) {
      itemService.addNewItemToSlots(id);
      return new ModelAndView("redirect:/index");
    }
    
     @GetMapping("/booked")
    public ModelAndView showBookingPage() {
      String username="";
      String userType=userService.getType();
      List<GymBook> bookList=gymBookDao.getBookList();
      if(userType.equalsIgnoreCase("Member")) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            username = authentication.getName();
            bookList=gymBookDao.getEntitiesByUsername(username);
      }
      String fname="";
    if(userType.equalsIgnoreCase("Admin"))
      fname="slotBookedPage1";
    else if(userType.equalsIgnoreCase("Member"))
      fname="slotBookedPage2";
      ModelAndView mv=new ModelAndView(fname);
      mv.addObject("bookList", bookList);
      return mv;
    }
     
    /*
    @PostMapping("/booked")
    public ModelAndView cancelBooking(@RequestParam("slot_id") Long slotId,
                                      @RequestParam("item_id") Long itemId,
                                      @RequestParam("selectBookingId") Long bookingId) {
        SlotItemEmbed embed = new SlotItemEmbed(slotId, itemId);
        SlotItem slotItem = slotItemDao.findItemById(embed);
        if (slotItem != null) {
            int seatBooked = slotItem.getSeatBooked();
            if (seatBooked > 0) {
                seatBooked--;
                slotItem.setSeatBooked(seatBooked);
                slotItemDao.save(slotItem);
                gymBookDao.deleteById(bookingId);
            }
        }
        ModelAndView mv = new ModelAndView("redirect:/index");
        return mv;
    }
     */
}
