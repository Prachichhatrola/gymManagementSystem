package com.GymInfo.gymManagementSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import com.GymInfo.gymManagementSystem.bean.Feedback;

@Repository
@Service
public class FeedbackDaoImpl implements FeedbackDao {

	 @Autowired
	    private FeedbackRepository repository;
	
	@Override
	public void saveNewFeedback(Feedback feedback) {
		repository.save(feedback); 
	}
	@Override
	public List<Feedback> displayAllFeedbacks() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}

	@Override
	public Long generateFeedbackId() {
		// TODO Auto-generated method stub
		Long val = repository.findLastFeedbackId();
        if (val == null)
            val = 1L;
        else
            val = val + 1;
        return val;
	}

}