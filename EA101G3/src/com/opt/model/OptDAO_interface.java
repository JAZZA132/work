package com.opt.model;

import java.sql.Date;
import java.util.*;

import com.appt.model.ApptVO;

public interface OptDAO_interface {
    public void insert(OptVO optVO);
    public void update(OptVO optVO);
    public void updateCurrentCount(OptVO optVO);
    public void delete(String sessionNo);
    public OptVO findByPrimaryKey(String sessionNo);
    public OptVO findRepeat(String docNo,Date optDate,String optSession);
    public List<OptVO> getAll();
    public List<OptVO> getCalInfo();

    //看診進度//
    public List<OptVO> getQueue(Map<String, String[]> map);

    //萬用複合查詢(傳入參數型態Map)(回傳 List)
    public List<OptVO> getCalInfo(Map<String, String[]> map);
    
    //棄用
//    public List<OptVO> getCalInfoByDoc(String docno);
}


