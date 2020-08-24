package com.mem.model;

import java.util.*;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

import com.mem.model.*;

import oracle.sql.BLOB;

public class MemberService {
	private MemberDAO_interface dao;

	public MemberService() {
		dao = new MemberDAO();
	}

	public String addM(String memname, String memaccount, String mempassword, String memcreditcardid, String memphone,
			String mememail, String memaddress, Integer memstatus, byte[] mempic) {
		MemberVO memberVO = new MemberVO();
		memberVO.setMemName(memname);
		memberVO.setMemAccount(memaccount);
		memberVO.setMemPassword(mempassword);
		memberVO.setMemCreditCardId(memcreditcardid);
		memberVO.setMemPhone(memphone);
		memberVO.setMemEmail(mememail);
		memberVO.setMemAddress(memaddress);
		memberVO.setMemStatus(memstatus);
		memberVO.setMempic(mempic);

		return dao.insert(memberVO);
	}

	public MemberVO updateM(String memNo, String memName, String memAccount, String memPassword, String memCreditCardId,
			String memPhone, String memEmail, String memAddress, Integer memStatus, byte[] mempic) {
		MemberVO memberVO = new MemberVO();

		memberVO.setMemNo(memNo);
		memberVO.setMemName(memName);
		memberVO.setMemAccount(memAccount);
		memberVO.setMemPassword(memPassword);
		memberVO.setMemCreditCardId(memCreditCardId);
		memberVO.setMemPhone(memPhone);
		memberVO.setMemEmail(memEmail);
		memberVO.setMemAddress(memAddress);
		memberVO.setMemStatus(memStatus);
		memberVO.setMempic(mempic);
		dao.update(memberVO);

		return memberVO;
	}

	public void deleteM(String memNo) {

		dao.delete(memNo);

	}

	public List<MemberVO> getAll() {
		return dao.getAll();
	}

	public MemberVO getOneEmp(String memno) {
		return dao.findByPrimaryKey(memno);
	}

	// 上傳圖片
	public MemberVO addpic(String memName, String memAccount, String memPassword, String memCreditCardId,
			String memPhone, String memEmail, String memAddress, Integer memStatus, byte[] mempic) {
		MemberVO memberVO = new MemberVO();

		memberVO.setMemName(memName);
		memberVO.setMemAccount(memAccount);
		memberVO.setMemPassword(memPassword);
		memberVO.setMemCreditCardId(memCreditCardId);
		memberVO.setMemPhone(memPhone);
		memberVO.setMemEmail(memEmail);
		memberVO.setMemAddress(memAddress);
		memberVO.setMemStatus(memStatus);
		memberVO.setMempic(mempic);
		dao.insertall(memberVO);

		return memberVO;
	}

	public MemberVO getOnememNO(String memAccount, String memPassword) {
		return dao.findBymemNO(memAccount, memPassword);
	}

	public List<MemberVO> getAll(Map<String, String[]> map) {
		return dao.getAll(map);
	}
	public boolean checkaccount(String account) {
		return dao.checkaccount(account);
	}
	public void updatememstatus(Integer status,String memno) {
		dao.updatestatus(status, memno);
	}

}
