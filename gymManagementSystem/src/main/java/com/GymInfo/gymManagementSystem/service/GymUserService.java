package com.GymInfo.gymManagementSystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.GymInfo.gymManagementSystem.bean.GymUser;
import com.GymInfo.gymManagementSystem.dao.GymUserRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

@Service
public class GymUserService implements UserDetailsService {
   @Autowired
   private GymUserRepository repository;
   private String type;
   private GymUser users;
   
   public void save(GymUser user) {
    repository.save(user);
   }
   
   public String getType() {
    return type;
   }
   
   public void delete(String username) {
	    repository.deleteById(username);
   }
   
   @Override
   public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
       users = repository.findByUsername(username).get();
       type = users.getType();
       return users;
   }

   public GymUser findByUsername(String username) {
       return repository.findByUsername(username).orElse(null);
   }
   
   public GymUser getUser()  {
	   return users;
   }
   
   public List<String> getAllMembers() {
	   return repository.findAllMemberUsers();
   }
   
   public List<GymUser> getAllUsers() {
	   return repository.findAll();
   }
   
}