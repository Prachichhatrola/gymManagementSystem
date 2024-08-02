package com.GymInfo.gymManagementSystem.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;
import org.springframework.security.core.userdetails.UserDetails;

import com.GymInfo.gymManagementSystem.bean.Feedback;
import com.GymInfo.gymManagementSystem.bean.GymBook;
import com.GymInfo.gymManagementSystem.bean.GymItem;
import com.GymInfo.gymManagementSystem.bean.GymUser;
import com.GymInfo.gymManagementSystem.bean.Item;
import com.GymInfo.gymManagementSystem.bean.Slot;
import com.GymInfo.gymManagementSystem.bean.SlotItem;
import com.GymInfo.gymManagementSystem.bean.SlotItemEmbed;
import com.GymInfo.gymManagementSystem.dao.FeedbackDao;
import com.GymInfo.gymManagementSystem.dao.GymBookDao;
import com.GymInfo.gymManagementSystem.dao.GymBookRepository;
import com.GymInfo.gymManagementSystem.dao.GymItemDao;
import com.GymInfo.gymManagementSystem.dao.SlotDao;
import com.GymInfo.gymManagementSystem.dao.SlotItemDao;
import com.GymInfo.gymManagementSystem.exception.DeleteUserException;
import com.GymInfo.gymManagementSystem.exception.SeatNotAvailableException;
import com.GymInfo.gymManagementSystem.exception.SlotAlreadyBookedException;
import com.GymInfo.gymManagementSystem.service.GymItemService;
import com.GymInfo.gymManagementSystem.service.GymUserService;

@RestController
public class GymController {
  @Autowired
    private GymItemDao gymItemDao;
    @Autowired 
    private SlotDao slotDao;
    @Autowired 
    private SlotItemDao slotItemDao;
    @Autowired
    private FeedbackDao feedbackDao;
    @Autowired
    private GymItemService itemService;
    @Autowired
    private GymUserService userService;
    @Autowired
    private GymBookDao gymBookDao;
    @Autowired
    private GymBookRepository gymBookRepository;
    
    @ModelAttribute
    public void addAttributes(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            String currentUsername = authentication.getName(); 
            model.addAttribute("username", currentUsername);
        }
    }
    
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
      String uname="";
        if (userId != null && !userId.isEmpty()) {
          if(userType.equalsIgnoreCase("Member"))
            uname=userId;
          else if(userType.equalsIgnoreCase("Admin"))
            uname=userId;
        } 
        else {
          Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            uname = authentication.getName();
        }
        if(gymBookRepository.isSlotBooked(slotId,uname))
           throw new SlotAlreadyBookedException("You are already booked this Slot!! ");  
        else
        {


GymItem gymItem=gymItemDao.findItemById(itemId);
          SlotItemEmbed embed=new SlotItemEmbed(slotId, itemId);
          int totalSeat=gymItem.getTotalSeat();
          SlotItem slotItem=slotItemDao.findById(embed);
          int seatBooked=slotItemDao.findSeatBookedById(embed);
          int available=totalSeat-seatBooked;
      if (available>0) {
          Long newId=gymBookDao.generateBookingId();
          gymBook.setBookingId(newId);
          gymBook.setSlotId(slotId);
            gymBook.setItemId(itemId);
            gymBook.setUsername(uname);
            gymBookDao.save(gymBook);
        seatBooked++;
        slotItem.setSeatBooked(seatBooked);
        slotItemDao.save(slotItem);
        gymBookDao.save(gymBook);
        GymBook gymbook=gymBookDao.findBookInfoById(newId);
          ModelAndView mv=new ModelAndView("bookReportPage");
        mv.addObject("gymbook",gymbook);
          return mv;
      }
      else
        throw new SeatNotAvailableException("No seats available for booking!!");
        }
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
            bookList=gymBookDao.getBookingByUsername(username);
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
     
    @GetMapping("/cancel")
    public ModelAndView cancelBooking(@RequestParam("slotId") Long slotId,
                                      @RequestParam("itemId") Long itemId,
                                      @RequestParam("selectBookingId") Long bookingId) {
        SlotItemEmbed embed = new SlotItemEmbed(slotId, itemId);
        SlotItem slotItem = slotItemDao.findById(embed);
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
    
    @GetMapping("/seaterror")
    public ModelAndView showSeatErrorPage() {
      String fname="";
    String userType=userService.getType();
    if(userType.equalsIgnoreCase("Admin"))
      fname="slotBookPage1";
    else if(userType.equalsIgnoreCase("Member"))
      fname="slotBookPage2";
        ModelAndView mv = new ModelAndView(fname);
        return mv;
    }
    
    @GetMapping("/sloterror")
    public ModelAndView showSlotErrorPage() {
      String fname="";
    String userType=userService.getType();
    if(userType.equalsIgnoreCase("Admin"))
      fname="slotBookPage1";
    else if(userType.equalsIgnoreCase("Member"))
      fname="slotBookPage2";
        ModelAndView mv = new ModelAndView(fname);
        return mv;
    }
    
    @GetMapping("/eslot")
    public ModelAndView showEmptySlotPage() {
      List<SlotItem> slotList = slotItemDao.displayEmptySlots();
        ModelAndView mv = new ModelAndView("emptySlotReportPage");
        mv.addObject("slot_item", slotList);
        return mv;
    }
    
    @GetMapping("/bslot")
    public ModelAndView showBookedSlotPage() {
      List<SlotItem> slotList = slotItemDao.displayBookedSlots();
        ModelAndView mv = new ModelAndView("bookedSlotReportPage");
        mv.addObject("slot_item", slotList);
        return mv;


}
    
    @ModelAttribute
    public void addUserAttributes(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String currentUsername = null;
        if (auth.getPrincipal() instanceof UserDetails) {
            currentUsername = ((UserDetails) auth.getPrincipal()).getUsername();
        } else {
            currentUsername = auth.getPrincipal().toString();
        }
        
        GymUser user = userService.findByUsername(currentUsername);
        model.addAttribute("currentUser", user);
    }

    @GetMapping("/users")
    public ModelAndView showUsersPage() {
    String userType=userService.getType();
    if(userType.equalsIgnoreCase("Admin"))
    {
      List<GymUser> userList = userService.getAllUsers();
        ModelAndView mv = new ModelAndView("userReportPage");
        mv.addObject("users", userList);
        return mv;
    }
    else
      return new ModelAndView("redirect:/index");
    }
    
   @GetMapping("/users/{username}") 
   public ModelAndView deleteUser(@PathVariable String username) { 
     Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String currentUsername = null;
        if (auth.getPrincipal() instanceof UserDetails) {
            currentUsername = ((UserDetails) auth.getPrincipal()).getUsername();
        } else {
            currentUsername = auth.getPrincipal().toString();
        }
        if (username.equals(currentUsername)) {
            throw new DeleteUserException("You cannot delete the currently logged-in user.");
        }
      List<GymBook> book=gymBookDao.getBookingByUsername(username);
          if(book.isEmpty()) {
              userService.delete(username);
              return new ModelAndView("redirect:/users");
          }
          else 
            throw new DeleteUserException(username+" has booked slots. If you want to delete "+username+" then cancel the booking first");
   }
    
    @GetMapping("/feedback-report")
    public ModelAndView showFeedbackReportPage() {
      List<Feedback> feedbackList = feedbackDao.displayAllFeedbacks();
        ModelAndView mv = new ModelAndView("feedbackReportPage");
        mv.addObject("feedback", feedbackList);
        return mv;
    }
    
    @GetMapping("/feedback")
    public ModelAndView showFeedbackPage() {
        return new ModelAndView("feedbackPage", "feedbackRecord", new Feedback());
    }
    
    @PostMapping("/feedback")
    public ModelAndView saveFeedback(@ModelAttribute("feedbackRecord") Feedback feedback) {
      feedback.setfId(feedbackDao.generateFeedbackId());  
        feedbackDao.saveNewFeedback(feedback);
        return new ModelAndView("redirect:/index");
    }
    
    @GetMapping("/contactUs")
    public ModelAndView showcontactUs() {
        return new ModelAndView("contactUs");
    }
}
