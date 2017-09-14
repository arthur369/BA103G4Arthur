package com.act.model;

import java.util.List;
import java.util.Set;


import com.act_comm.model.Act_commVO;
import com.act_pair.model.Act_pairVO;
import com.fo_act.model.Fo_actVO;


public interface ActDAO_interface {
	 public void insert(Act_vo act_VO);
     public void update(Act_vo act_VO);
     public void delete(String ACT_NO);
     public Act_vo findByPrimaryKey(String ACT_NO);
     public List<Act_vo> getAll();
     
     public Set<Act_commVO> getAct_commByAct_no(String ACT_NO);
     public Set<Act_pairVO> getAct_pairByAct_no(String ACT_NO);
     public Set<Fo_actVO> getFo_actByAct_no(String ACT_NO);
     
     
}
