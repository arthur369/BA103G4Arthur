package com.act.model;

import java.util.List;



public interface ActDAO_interface {
	 public void insert(Act_vo act_VO);
     public void update(Act_vo act_VO);
     public void delete(String ACT_NO);
     public Act_vo findByPrimaryKey(String ACT_NO);
     public List<Act_vo> getAll();
     
}
