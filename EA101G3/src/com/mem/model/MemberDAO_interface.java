package com.mem.model;


import java.util.*;

import javax.servlet.http.Part;

import com.mem.model.*;

public interface MemberDAO_interface {
	public String insert(MemberVO memberVO);
	public void update(MemberVO memberVO);
	public void delete(String memNo);
	public List<MemberVO> getAll();
	public MemberVO findByPrimaryKey(String memno);
	public void insertall(MemberVO memberVO);
	public MemberVO findBymemNO(String memAccount,String memPassword);
	public List<MemberVO> getAll(Map<String, String[]> map); 
	public void updatestatus(Integer status,String memno);
    public boolean checkaccount(String account);
}
