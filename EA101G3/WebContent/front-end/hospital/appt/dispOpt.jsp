<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.opt.model.*"%>
<%@ page import="com.doc.model.*"%>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.GsonBuilder" %>
<%@ page import="com.google.gson.JsonArray" %>
<%@ page import="com.google.gson.JsonElement" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="com.google.gson.reflect.TypeToken" %>


<%

request.setCharacterEncoding("UTF-8");
String divNo = request.getParameter("divNo");
String docName = request.getParameter("docName");
//String docno = request.getParameter("doc");
Map<String, String[]> map = request.getParameterMap();
// System.out.print(request.getParameter("doc"));
pageContext.setAttribute("divNo", divNo);
pageContext.setAttribute("docName", docName);
// System.out.print(docno);


OptService optSvc = new OptService();
// List<OptVO> list = optSvc.getCalInfoByDoc(docno);
List<OptVO> list = optSvc.getCalInfo(map);
Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
String jsonStr = gson.toJson(list);

// System.out.println("Object to JSON: " + jsonStr);

pageContext.setAttribute("jsonStr", jsonStr);


%>



<html>
<head>
<%@ include file="/front-end/frontEndInclude/head.jsp"%>

<link href='<%=request.getContextPath()%>/front-end/hospital/fullcalendar/main.css' rel='stylesheet'/>
<script src='<%=request.getContextPath()%>/front-end/hospital/fullcalendar/main.js'></script>
<script src='<%=request.getContextPath()%>/front-end/hospital/fullcalendar/locales-all.js'></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
	var eventDate = '';

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
    	
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      hiddenDays: [0],
      slotMinTime: "09:00:00",
      slotMaxTime: "22:00:00",
      locale: 'zh-tw',
      initialDate: new Date(),
      navLinks: true, // can click day/week names to navigate views
//       selectable: true,
      selectMirror: true,

     
      
      eventClick: function(arg) {
    	  var str = arg.event.id;
    	  var strTitle = arg.event.title;
    	  //JQ post寫法，無法使用，但可接收後端處理資料
//     	  $.post("apptStart.do?action=addAppt&sessionNo="+str+"");
    	  
           	  console.log(arg.event.start);
   	     	  console.log(arg.event.title);	  
   	     	  console.log(arg.event.id);

    	 
    		  if(strTitle.indexOf('已額滿')==-1){
    			  window.location.href='apptStart.do?action=addAppt&sessionNo='+str+'';

    		  }
    		  else{
    			  swal("已額滿", "請選擇其他時段喔!", "error");
    		  }

      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: ${jsonStr}
//       events: [{'title':123,'start':'2020-07-02'}]

    });
    calendar.render();
  });
  
  console.log(eventDate);


  </script>
  
  <style>
  
  #calendar {
	    max-width: 1000px;
	    margin: 0 auto;
	    
		background-color: rgba(255,255,255,0.70);
	   
	    }
  .calendarTitle{
  		text-align:center;
  		font-size:40px;
  		font-weight:bold;
  		color:#1D5D57;
  
  }
  .main {
	width: 90%;
	margin: 0 auto;
	font-family: 'Noto Sans TC';
}
.myMain{
min-height:800px;
 background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
     background-size: cover;
	
	background-image: url("../appt/uploads/apptStartImg.png");
}
	    
  </style>
  


</head>

<body>
<%@ include file="/front-end/frontEndInclude/header.jsp"%>	

	<div class="main">

	<div class="calendarTitle">
		<jsp:useBean id="docSvc" scope="page" class="com.doc.model.DocService" />
		<jsp:useBean id="divSvc" scope="page" class="com.div.model.DivService" />
			<c:forEach var="divVO" items="${divSvc.all}">
				<c:if test="${divNo==divVO.divno}"> 
 				${(divVO.divname)}
 				</c:if> 		
			</c:forEach> 	
			<c:forEach var="docVO" items="${docSvc.all}">
				<c:if test="${docName==docVO.docname}"> 
 				${(docVO.docname)} 醫師 
 				</c:if> 		
			</c:forEach> 			
				門診值班表
	</div>
	<hr class="mainTitlehr">
	<div class="myMain">
	<div id='calendar'></div>

	</div>
	<hr class="mainTitlehr">
	</div>
	
<%@ include file="/front-end/frontEndInclude/footer.jsp"%>
</body>


</html>