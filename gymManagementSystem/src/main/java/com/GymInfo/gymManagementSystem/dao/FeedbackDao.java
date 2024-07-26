package com.GymInfo.gymManagementSystem.dao;

import java.util.List;
import com.GymInfo.gymManagementSystem.bean.Feedback;

public interface FeedbackDao {
	public void saveNewFeedback(Feedback feedback);
    public List<Feedback> displayAllFeedbacks(); 
    public Long generateFeedbackId();
}