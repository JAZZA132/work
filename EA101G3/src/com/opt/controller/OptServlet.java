package com.opt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.div.model.DivService;
import com.doc.model.DocVO;
import com.opt.model.OptService;
import com.opt.model.OptVO;

/**
 * Servlet implementation class OptServlet
 */

public class OptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String sessionNo = req.getParameter("sessionNo");
				if (sessionNo == null || (sessionNo.trim()).length() == 0) {
					errorMsgs.add("請輸入員工編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/hospital/opt/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				sessionNo = null;
				try {
					sessionNo = req.getParameter("sessionNo");
				} catch (Exception e) {
					errorMsgs.add("員工編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/hospital/opt/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				OptService optSvc = new OptService();
				OptVO optVO = optSvc.getOneOptSession(sessionNo);
				if (optVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/hospital/opt/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("optVO", optVO); // 資料庫取出的empVO物件,存入req
				String url = "/back-end/hospital/opt/listOneOpt.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/hospital/opt/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getDoclist".equals(action)) { // 來自select_page.jsp的請求

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
//				String divno = "D01";
//				JSONArray jObj = new JSONArray();
				String divno = req.getParameter("divno");
				/*************************** 2.開始查詢資料 *****************************************/
				DivService divSvc = new DivService();
				Set<DocVO> set = divSvc.getDocsByDivno(divno);
//				System.out.println(divno);
//				System.out.println(set);
				Map<String, String> map = new HashMap<String, String>();
				for (DocVO vo : set) {
					map.put(vo.getDocno(), vo.getDocname());

				}
//				System.out.println(map);

				JSONArray arr = new JSONArray();
				for (String key : map.keySet()) {
					String value = map.get(key);

					JSONObject obj = new JSONObject();
					obj.put(key, value);

					arr.put(obj);
				}

//				out.print(map);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
//				req.setAttribute("optVO", optVO); // 資料庫取出的empVO物件,存入req
//				String url = "/back-end/hospital/opt/listOneOpt.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
//				successView.forward(req, res);

				res.setContentType("plain/text");
				PrintWriter wr = res.getWriter();
				wr.write(arr.toString());
				wr.flush();
				wr.close();

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/hospital/opt/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
//			 Store this set in the request scope, in case we need to
//			 send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
//				String divno = req.getParameter("divno");
				String docno = req.getParameter("docno");
//				System.out.println(docno);
				if (docno == null || docno.trim().length() == 0) {
					errorMsgs.add("必須選擇一位醫師");

				}
				String optSession = req.getParameter("optSession");
				if (optSession == null || optSession.trim().length() == 0) {
					errorMsgs.add("必須選擇一個時段");

				}

				java.sql.Date optDate = java.sql.Date.valueOf(req.getParameter("optDate"));
				

				Integer currentCount = 0;

				Integer maximum = null;
				try {
					maximum = new Integer(req.getParameter("maximum").trim());

				} catch (NumberFormatException e) {
					errorMsgs.add("必須輸入限制數量");
				}

				OptVO optVO = new OptVO();
//				optVO.setDocNo(divno);
				optVO.setDocNo(docno);
				optVO.setOptDate(optDate);
				optVO.setOptSession(optSession);
				optVO.setMaximum(maximum);
				optVO.setCurrentCount(currentCount);
//				System.out.println(docno);
//				System.out.println(optDate);
//				System.out.println(optSession);

				// 以下為重複資料處理
				OptService optSvcCheck = new OptService();
				OptVO optVO_PK = optSvcCheck.findSession(docno, optDate, optSession);

				if (optVO_PK != null) {
//					System.out.println("重複了");
					errorMsgs.add("此時段已新增過");

				}

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("optVO", optVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/hospital/opt/selectAll.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				OptService optSvc = new OptService();
				optVO = optSvc.addOptSession(docno, optDate, optSession, currentCount, maximum);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/

				String url = "/back-end/hospital/opt/selectAll.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage() + "未知的錯誤");
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/hospital/opt/selectAll.jsp");
				failureView.forward(req, res);
			}
		}
		
//		if ("insertByAjax".equals(action)) { 
//
//			PrintWriter wr = res.getWriter();
//			res.setContentType("text");
//			try {
//				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
//				String docno = req.getParameter("docno");
//				if (docno == null || docno.trim().length() == 0) {
//					wr.write("必須選擇一位醫師");
//					return;
//
//				}
//				String optSession = req.getParameter("optSession");
//				if (optSession == null || optSession.trim().length() == 0) {
//					wr.write("必須選擇一個時段");
//					return;
//				}
//
//				java.sql.Date optDate = java.sql.Date.valueOf(req.getParameter("optDate"));
//				
//
//				Integer currentCount = 0;
//
//				Integer maximum = null;
//				try {
//					maximum = new Integer(req.getParameter("maximum").trim());
//
//				} catch (NumberFormatException e) {
//					wr.write("必須輸入最大人數");
//					return;
//				}
//
//				OptVO optVO = new OptVO();
//				optVO.setDocNo(docno);
//				optVO.setOptDate(optDate);
//				optVO.setOptSession(optSession);
//				optVO.setMaximum(maximum);
//				optVO.setCurrentCount(currentCount);
//
//				// 以下為重複資料處理
//				OptService optSvcCheck = new OptService();
//				OptVO optVO_PK = optSvcCheck.findSession(docno, optDate, optSession);
//
//				if (optVO_PK != null) {
//					wr.write("重複了");
//					return;
//
//				}
//
//				
//
//				/*************************** 2.開始新增資料 ***************************************/
//				OptService optSvc = new OptService();
//				optVO = optSvc.addOptSession(docno, optDate, optSession, currentCount, maximum);
//				OptVO optVO_ID = optSvcCheck.findSession(docno, optDate, optSession);
//				System.out.println(optVO_ID.getSessionNo());
//				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
//
//				wr.write(optVO_ID.getSessionNo());
//
//				/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				wr.write("NG");
//				return;
//			}
//		}
		
		if ("delete".equals(action)) { 



			
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				PrintWriter wr = res.getWriter();
				String sessionNo = req.getParameter("sessionNo");
				OptVO optVO = new OptVO();
				OptService optSvc = new OptService();
				optVO = optSvc.getOneOptSession(sessionNo);
				res.setContentType("text");
				if(optVO.getCurrentCount()==0) {
					
					
					wr.write("OK");
					/*************************** 2.開始刪除資料 ***************************************/
					
					optSvc.deleteOptSession(sessionNo);
				}else {
					wr.write("NG");
				}
				
				
				

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/


				/*************************** 其他可能的錯誤處理 **********************************/
		
		}

		// 看診進度查詢
		if ("listQueue1".equals(action)) { // �Ӧ�select_page.jsp���ƦX�d�߽ШD
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				/*************************** 1.�N��J����ରMap **********************************/
				// �ĥ�Map<String,String[]> getParameterMap()����k
				// �`�N:an immutable java.util.Map
				Map<String, String[]> map = req.getParameterMap();

				/***************************
				 * 2.�}�l�ƦX�d��
				 ***************************************/
				OptService optSvc = new OptService();
				List<OptVO> list = optSvc.getQueue(map);

				/***************************
				 * 3.�d�ߧ���,�ǳ����(Send the Success view)
				 ************/
				req.setAttribute("listQueue1", list); // ��Ʈw���X��list����,�s�Jrequest
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/hospital/appt/listQueue1.jsp"); // ���\���listEmps_ByCompositeQuery.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/hospital/appt/select_page3.jsp");
				failureView.forward(req, res);
			}
		}

	}

}
