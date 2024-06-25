package com.GymInfo.gymManagementSystem.dao;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.GymInfo.gymManagementSystem.bean.GymUser;

public interface GymUserRepository extends JpaRepository<GymUser, String> {
 Optional<GymUser> findByUsername(String username);
}