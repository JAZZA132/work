package com.MemberPet.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.MemberPet.model.MemberPetService;
import com.MemberPet.model.MemberPetVO;
import com.adoptedpets.model.AdoptedPetsService;
import com.adoptedpets.model.AdoptedPetsVO;
import com.mem.controller.MailService;

@MultipartConfig
public class MemberPetServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("insert".equals(action)) { // 來自 memberPet 的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
//		
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String petNo = req.getParameter("petNo");

				String memNo = req.getParameter("memNo");

				String petName = req.getParameter("petName");
				if (petName == null || petName.trim().length() == 0) {
					errorMsgs.add("寵物名稱: 請勿空白");
				}

				String petVariety = req.getParameter("petVariety");

				Integer petAge = new Integer(req.getParameter("petAge"));

				String petGender = req.getParameter("petGender");

				Integer petStatus = new Integer(req.getParameter("petStatus"));

				byte[] petPic = null;
				Part petPicPart = req.getPart("petPic");
				InputStream petPicIn = petPicPart.getInputStream();
				petPic = new byte[petPicIn.available()];
				petPicIn.read(petPic);
				petPicIn.close();

				MemberPetVO memberPetVO = new MemberPetVO();
				memberPetVO.setPetNo(petNo);
				memberPetVO.setMemNo(memNo);
				memberPetVO.setPetName(petName);
				memberPetVO.setPetVariety(petVariety);
				memberPetVO.setPetAge(petAge);
				memberPetVO.setPetGender(petGender);
				memberPetVO.setPetStatus(petStatus);
				memberPetVO.setPetPic(petPic);

//				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberPetVO", memberPetVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/memberpet/AddMemberPets.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}
//				
				/*************************** 2.開始修改資料 *****************************************/
				MemberPetService memberPetSvc = new MemberPetService();
				memberPetVO = memberPetSvc.addMemberPet(petNo, memNo, petName, petVariety, petAge, petGender, petStatus,
						petPic);
				
				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				String url = "/front-end/member/memberpet/ListAllPetsByMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/memberpet/AddMemberPets.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				String petNo = new String(req.getParameter("petNo"));

				/*************************** 2.開始查詢資料 ****************************************/
				MemberPetService memberPetSvc = new MemberPetService();
				MemberPetVO memberPetVO = memberPetSvc.getOneMemberPet(petNo);
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("memberPetVO", memberPetVO); // 資料庫取出的adoptedpetsVO物件,存入req
				String url = "/front-end/member/memberpet/UpdateMemberPets.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_AdoptedPets_Input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/memberpet/ListAllPetsByMember.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		if ("update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
//		
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				System.out.println("1");
				
				String petNo = req.getParameter("petNo");

				String memNo = req.getParameter("memNo");

				String petName = req.getParameter("petName");
				if (petName == null || petName.trim().length() == 0) {
					errorMsgs.add("寵物名稱: 請勿空白");
				}

				String petVariety = req.getParameter("petVariety");

				Integer petAge = new Integer(req.getParameter("petAge").trim());
				try {
					petAge = new Integer(req.getParameter("petAge").trim());
				} catch (Exception e) {
					errorMsgs.add("年齡格式不正確");
				}

				String petGender = req.getParameter("petGender");

				Integer petStatus = new Integer(req.getParameter("petStatus"));

				byte[] petPic = null;
				if ((req.getPart("petPic").getSize()) == 0) {
					MemberPetService memberPetSrv = new MemberPetService();
					MemberPetVO memberPetVO = memberPetSrv.getOneMemberPet(petNo);
					petPic = memberPetVO.getPetPic();
				} else {
					Part petPicPart = req.getPart("petPic");
					InputStream petPicIn = petPicPart.getInputStream();
					petPic = new byte[petPicIn.available()];
					petPicIn.read(petPic);
					petPicIn.close();
				}

				MemberPetVO memberPetVO = new MemberPetVO();
				memberPetVO.setPetNo(petNo);
				memberPetVO.setMemNo(memNo);
				memberPetVO.setPetName(petName);
				memberPetVO.setPetVariety(petVariety);
				memberPetVO.setPetAge(petAge);
				memberPetVO.setPetGender(petGender);
				memberPetVO.setPetStatus(petStatus);
				memberPetVO.setPetPic(petPic);
				
				System.out.println("here");
				
//				 Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberPetVO", memberPetVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/memberpet/ListAllPetsByMember.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				MemberPetService memberPetSvc = new MemberPetService();
				memberPetVO = memberPetSvc.updateMemberPet(petNo, memNo, petName, petVariety, petAge, petGender, petStatus,
						petPic);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				String url = "/front-end/member/memberpet/ListAllPetsByMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/memberpet/ListAllPetsByMember.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) { // 來自listAllAdopter.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				String petNo = req.getParameter("petNo");

				String memNo = req.getParameter("memNo");
//				String memNo = "M0001";

				String petName = req.getParameter("petName");
				if (petName == null || petName.trim().length() == 0) {
					errorMsgs.add("寵物名稱: 請勿空白");
				}

				String petVariety = req.getParameter("petVariety");

				Integer petAge = new Integer(req.getParameter("petAge"));

				String petGender = req.getParameter("petGender");

				/*************************** 2.開始刪除資料 ***************************************/
				Integer petStatus = new Integer("1");

				byte[] petPic = null;
				MemberPetService memberPetPicSrv = new MemberPetService();
				MemberPetVO memberPetPicVO = memberPetPicSrv.getOneMemberPet(petNo);
				petPic = memberPetPicVO.getPetPic();
				
				MemberPetVO memberPetVO = new MemberPetVO();
				memberPetVO.setPetNo(petNo);
				memberPetVO.setMemNo(memNo);
				memberPetVO.setPetName(petName);
				memberPetVO.setPetVariety(petVariety);
				memberPetVO.setPetAge(petAge);
				memberPetVO.setPetGender(petGender);
				memberPetVO.setPetStatus(petStatus);
				memberPetVO.setPetPic(petPic);

//				 Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberPetVO", memberPetVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/memberpet/ListAllPetsByMember.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				MemberPetService memberPetSvc = new MemberPetService();
				memberPetVO = memberPetSvc.updateMemberPet(petNo, memNo, petName, petVariety, petAge, petGender, petStatus,
						petPic);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				String url = "/front-end/member/memberpet/ListAllPetsByMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/memberpet/ListAllPetsByMember.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
