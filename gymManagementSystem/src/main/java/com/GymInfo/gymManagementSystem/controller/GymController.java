package com.GymInfo.gymManagementSystem.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.GymInfo.gymManagementSystem.bean.GymItem;
import com.GymInfo.gymManagementSystem.bean.Slot;
import com.GymInfo.gymManagementSystem.dao.GymItemDao;
import com.GymInfo.gymManagementSystem.dao.SlotDao;

@RestController
public class GymController {
    @Autowired
    private GymItemDao gymItemService;
    @Autowired
    private GymItemDao gymItemDao;
    @Autowired 
    private SlotDao slotDao;

    @GetMapping("/index")
    public ModelAndView showIndexPage() {
        return new ModelAndView("index");
    }

    @GetMapping("/about")
    public ModelAndView showAboutUSPage() {
        return new ModelAndView("about");
    }

    @GetMapping("/slotbooking")
    public ModelAndView showSlotBookingPage() {
        return new ModelAndView("slotBooking");
    }

    @GetMapping("/booking")
    public ModelAndView showSlotBookingForm() {
        return new ModelAndView("slotBookingForm");
    }

    @PostMapping("/booking")
    public ModelAndView saveUserRegisterPage() {
        return new ModelAndView("index");
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
        return new ModelAndView("index");
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
        return new ModelAndView("index");
    }

    @GetMapping("/slots")
    public ModelAndView showSlotReportPage() {
        List<Slot> slotList = slotDao.displayAllSlots();
        ModelAndView mv = new ModelAndView("slotReportPage");
        mv.addObject("slotList", slotList);
        return mv;
    }

    @DeleteMapping("/gymitem/{id}")
    public ResponseEntity<?> deleteItem(@PathVariable Long id) {
        try {
            gymItemService.deleteItemById(id);
            return ResponseEntity.ok().build();
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Item with ID " + id + " not found");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred: " + e.getMessage());
        }
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
}