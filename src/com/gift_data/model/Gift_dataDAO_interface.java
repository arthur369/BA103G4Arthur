package com.gift_data.model;
import java.util.List;
import java.util.Set;



public interface Gift_dataDAO_interface {
	 public void insert(Gift_dataVO gift_data_VO);
     public void update(Gift_dataVO gift_data_VO);
     public void delete(String GIFT_NO);
     public Gift_dataVO findByPrimaryKey(String GIFT_NO);
     public List<Gift_dataVO> getAll();

     
}
