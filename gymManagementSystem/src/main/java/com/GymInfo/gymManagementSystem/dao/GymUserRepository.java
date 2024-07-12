package com.GymInfo.gymManagementSystem.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.GymInfo.gymManagementSystem.bean.GymUser;


public interface GymUserRepository extends JpaRepository<GymUser, String> {
 Optional<GymUser> findByUsername(String username);
 
 @Query("SELECT username from GymUser where type='Customer'")
 public List<String> findAllMemberUsers();
}