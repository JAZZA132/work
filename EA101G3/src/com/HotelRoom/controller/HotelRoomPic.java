
package com.HotelRoom.controller;

import java.io.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;
import com.MemberPet.model.*;

public class HotelRoomPic extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		try {
			ServletOutputStream out = res.getOutputStream();
			res.setContentType("image/gif");
			String petNo = req.getParameter("petNo");
			
			
			if (petNo != null) {
				MemberPetService memberPetSvc = new MemberPetService();
				MemberPetVO memberPetVO = memberPetSvc.getOneMemberPet(petNo);
				out.write(memberPetVO.getPetPic());
			}
			
		} catch (Exception e) {
			System.out.println("旅館房間內無寵物");
		}
	}
}
