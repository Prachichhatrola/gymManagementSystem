package com.GymInfo.gymManagementSystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.GymInfo.gymManagementSystem.bean.GymUser;
import com.GymInfo.gymManagementSystem.service.GymUserService;

@RestController
public class LoginController {
  @Autowired
  private BCryptPasswordEncoder bcrypt;
  @Autowired 
  private GymUserService service;
  @GetMapping("/register")
  public ModelAndView showUserRegistrationPage() {
    GymUser user=new GymUser();
    ModelAndView mv=new ModelAndView("newUserRegistration");
    mv.addObject("userRecord",user);
    return mv;
  }
  @PostMapping("/register")
  public ModelAndView saveUserRegisterPage(@ModelAttribute("userRecord") GymUser user) {
    GymUser gymUser=new GymUser();
    String encodedPassword=bcrypt.encode(user.getPassword());
    gymUser.setFirstName(user.getFirstName());
    gymUser.setLastName(user.getLastName());
    gymUser.setType(user.getType());
    gymUser.setEmail(user.getEmail());
    gymUser.setUsername(user.getUsername());
    gymUser.setPassword(encodedPassword);
    service.save(gymUser);
    return new ModelAndView("loginPage");
  }
  @GetMapping("/loginpage")
  public ModelAndView showLoginPage(@RequestParam(name = "error", required = false) String error) {
      ModelAndView mv = new ModelAndView("loginPage");
      if (error != null) {
          mv.addObject("errorMessage", "Wrong credentials, please re-enter.");
      }
      return mv;
  }
  @GetMapping("/loginerror")
  public ModelAndView showLoginErrorPage() {
      ModelAndView mv = new ModelAndView("loginPage");
      mv.addObject("errorMessage", "Wrong credentials, please re-enter.");
      return mv;
  }
}
