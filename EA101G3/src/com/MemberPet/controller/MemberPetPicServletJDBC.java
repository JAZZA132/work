package com.MemberPet.controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.MemberPet.model.MemberPetService;
import com.MemberPet.model.MemberPetVO;
import com.adoptedpets.model.*;


public class MemberPetPicServletJDBC extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
		
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();
	
		try {
			String petNo = req.getParameter("petNo");
			MemberPetService MemberPetsrv = new MemberPetService();
			MemberPetVO memberPetVO = MemberPetsrv.getOneMemberPet(petNo) ;
			byte[] buf = memberPetVO.getPetPic();
			out.write(buf);
		
		}catch (Exception e){
			e.printStackTrace();
		}
		
	}
}

