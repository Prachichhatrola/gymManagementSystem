package com.GymInfo.gymManagementSystem.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(SlotAlreadyBookedException.class)
    public ModelAndView handleSlotAlreadyBookedException(SlotAlreadyBookedException ex) {
        ModelAndView modelAndView = new ModelAndView("slotErrorPage");
        modelAndView.addObject("message", ex.getMessage());
        return modelAndView;
    }

    @ExceptionHandler(SeatNotAvailableException.class)
    public ModelAndView handleSeatNotAvailableException(SeatNotAvailableException ex) {
        ModelAndView modelAndView = new ModelAndView("seatErrorPage");
        modelAndView.addObject("message", ex.getMessage());
        return modelAndView;
    }
    
    @ExceptionHandler(DeleteUserException.class)
    public ModelAndView handleDeleteUserException(DeleteUserException ex) {
        ModelAndView modelAndView = new ModelAndView("userErrorPage");
        modelAndView.addObject("message", ex.getMessage());
        return modelAndView;
    }
}