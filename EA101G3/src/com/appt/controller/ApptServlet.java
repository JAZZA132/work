package com.appt.controller;

import java.io.*;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import com.appt.model.*;
import com.google.gson.JsonArray;
import com.mr.model.MrService;
import com.mr.model.MrVO;

@MultipartConfig
public class ApptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("listAppt".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				HttpSession session = req.getSession();
				/*************************** 1.將輸入資料轉為Map **********************************/
				// 採用Map<String,String[]> getParameterMap()的方法
				// 注意:an immutable java.util.Map
				Map<String, String[]> map = req.getParameterMap();

				HashMap<String, String[]> mapS = new HashMap<String, String[]>(req.getParameterMap());
				session.setAttribute("map", mapS);

				/*************************** 2.開始複合查詢 ***************************************/
				ApptService apptSvc = new ApptService();
				List<ApptVO> list = apptSvc.getAll(map);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("listAppt", list); // 資料庫取出的list物件,存入request
				RequestDispatcher successView = req.getRequestDispatcher("/back-end/hospital/appt/select_page.jsp"); // 成功轉交listEmps_ByCompositeQuery.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/hospital/appt/select_page.jsp");
				failureView.forward(req, res);
			}

		}
		
		
		if ("getDetail".equals(action)) { // 來自addEmp.jsp的請求
			 res.setContentType("application/json;charset=UTF-8");
			String apptno = req.getParameter("apptno");
			JsonArray jsobj = new JsonArray();
//			PrintWriter out = res.getWriter();
			
			ApptService apptsvc = new ApptService();
			ApptVO apptVO = new ApptVO();
			apptVO = apptsvc.getOneAppt(apptno);
			JSONArray jObj = new JSONArray();
			jObj.put(apptVO.getSymdesc());
			jObj.put(apptVO.getSymphoto());
//			String symdesc=apptVO.getSymdesc();
//			byte[] symphoto=apptVO.getSymphoto();
			System.out.println(apptVO.getSymdesc());
			
//			Map<String, Object> data = new HashMap<String, Object>(); 
//			data.put("date", new Date()); 
//			data.put("email", "accountwcx@qq.com"); 
//			data.put("age", 30); 
//			data.put("name", "csdn"); 
//			data.put("array", new int[]{1,2,3,4}); 
			
			// Get the printwriter object from response to write the required json object to the output stream      
			PrintWriter out = res.getWriter();
			// Assuming your json object is **jsonObject**, perform the following, it will return your json object  
			out.print(jObj);
			out.flush();
			
//			String symphotoStr = byteToString(symphoto);
//			String finalPhoto = compress(symphotoStr);
			
//			res.getWriter("FUCK);
//            res.getWriter().flush();
//			
// 			
//			out.println(apptno);
//			out.println(symdesc);
		}
		
		
		if ("update".equals(action)) { // 來自listAppt的請求
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL");

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				String apptno = req.getParameter("apptno").trim();
				String docno = req.getParameter("docno").trim();
				String petno = req.getParameter("petno").trim();

				Integer optstate = 1;

				ApptVO apptVO = new ApptVO();
				apptVO.setApptno(apptno);
				apptVO.setOptstate(optstate);

				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("apptVO", apptVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/hospital/appt/select_page.jsp");
//					failureView.forward(req, res);
//					return; // 程式中斷
//				}

				/*************************** 2.開始修改資料 *****************************************/
				ApptService apptSvc = new ApptService();
				apptVO = apptSvc.updateState(apptno, optstate);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("apptVO", apptVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back-end/hospital/appt/listAppt.jsp";

				HttpSession session = req.getSession();
				Map<String, String[]> map = (Map<String, String[]>)session.getAttribute("map");
				List<ApptVO> list = apptSvc.getAll(map);
				req.setAttribute("listAppt", list);
				
//				MrVO mrVO = new MrVO();
				MrService mrSvc = new MrService();
				mrSvc.addMr(apptno, docno, petno, "", "", 0, 0, 0);
				

				RequestDispatcher successView = req.getRequestDispatcher(requestURL); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
//				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/hospital/appt/listAppt.jsp");
				failureView.forward(req, res);
			}
		}
		if ("updateAjax".equals(action)) { // 來自listAppt的請求
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);

			PrintWriter wr = res.getWriter();
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				String apptno = req.getParameter("apptno").trim();
				String docno = req.getParameter("docno").trim();
				String petno = req.getParameter("petno").trim();

				Integer optstate = 1;

				ApptVO apptVO = new ApptVO();
				apptVO.setApptno(apptno);
				apptVO.setOptstate(optstate);

				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("apptVO", apptVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/hospital/appt/select_page.jsp");
//					failureView.forward(req, res);
//					return; // 程式中斷
//				}

				/*************************** 2.1開始修改資料 *****************************************/
				ApptService apptSvc = new ApptService();
				apptVO = apptSvc.updateState(apptno, optstate);
				/*************************** 2.2開始新增診療資料 *****************************************/
				MrService mrSvc = new MrService();
				mrSvc.addMr(apptno, docno, petno, "", "", 0, 0, 0);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/

				
				wr.write("OK");

				


				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				wr.write("NG");
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/hospital/appt/listAppt.jsp");
				failureView.forward(req, res);
			}
		}

	}
	


}
