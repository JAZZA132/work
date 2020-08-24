<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.opt.model.*"%>
<%@ page import="com.doc.model.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.GsonBuilder"%>
<%@ page import="com.google.gson.JsonArray"%>
<%@ page import="com.google.gson.JsonElement"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="com.google.gson.reflect.TypeToken"%>


<%
	OptService optSvc = new OptService();
	// List<OptVO> list = optSvc.getCalInfoByDoc(docno);
	List<OptVO> list = optSvc.getCalInfo();
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	String jsonStr = gson.toJson(list);

	// 	System.out.println("Object to JSON: " + jsonStr);

	pageContext.setAttribute("jsonStr", jsonStr);
	
	OptVO optVO = (OptVO) request.getAttribute("OptVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>



<html>
<head>
<%@ include file="/back-end/backEndInclude/head.jsp"%>

<link
	href='<%=request.getContextPath()%>/front-end/hospital/fullcalendar/main.css'
	rel='stylesheet' />
<script
	src='<%=request.getContextPath()%>/front-end/hospital/fullcalendar/main.js'></script>
<script
	src='<%=request.getContextPath()%>/front-end/hospital/fullcalendar/locales-all.js'></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
		
	var dateStr = '';

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
      selectable: true,
      select: function(info) {
    	 
    	  dateStr = info.startStr;
    	  
    	  console.log(dateStr);
    	  $('#formDate').html('');
    	  $('#formDate').append(dateStr);
		  var optDate =  document.getElementById('optDate');
		  $('#optDate').val(dateStr);
    	  $('#exampleModal').modal('show');
//           var title = prompt('Event Title:');
//           if (title) {
//             calendar.addEvent({
//               title: title,
//               start: arg.start,
//               allDay: arg.allDay
//             })
//           }
//           calendar.unselect()
        },
        eventClick: function(arg) {
        	swal({
        		  title: "你確定要刪除這個時段嗎?",
        		  text: "無人預約可被刪除，有被預約的則無法刪除",
        		  icon: "warning",
        		  buttons: true,
        		  dangerMode: true,
        		})
        		.then((willDelete) => {
        		  if (willDelete) {
        			  var sessionNoStr = arg.event.id;
        	        	 console.log(sessionNoStr);
        	        	$.ajax({
        			         url: "opt.do",   //後端的URL
        			         type: "POST",   //用POST的方式
        			         dataType: "text",   //response的資料格式
        			         cache: false,   //是否暫存
        			         data: {action : 'delete', sessionNo : sessionNoStr }, //傳送給後端的資料
        			         success: function(res) { //成功後回傳的資料
        			        	 if(res==='OK'){
        			        		 arg.event.remove();
        			        		 
        			        	 }else{
        			        		 swal("刪除失敗！", "此時段已有人預約，不可隨意刪除", "error");
        			        	 }
        			         }
        			     });
        		    swal("刪除成功！", {
        		      icon: "success",
        		    });
        		  } else {
        		    swal("刪除未被執行");
        		  }
        		});
        	
        	
        	 
            
          },
      selectMirror: true,
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: ${jsonStr}
//       events: [{'title':123,'start':'2020-07-02'}]

    });
    calendar.render();
  });
  
	
  
	
	//option發生改變
	
// 	divno.onchange=function(){
		
		
// 			str = divno.value;
// 			if(str==='D01'){
// 				var obj = JSON.parse(json1);
// 			$('#doc').html("");
// 			$('#doc').append("<option value=''>查詢全部</option>");
// 			$.each(obj, function (index,item) {
// 	            var docno = obj[index].docno;
// 	            var docname = obj[index].docname;
// 	            //構造動態option
	            
// 	            $('#doc').append("<option value='"+docname+"'>"+docname+"</option>");
// 	        });
// 			}
	

// 	}

  </script>

<style>
#calendar {
	max-width: 80%;
	margin: 0 auto;
}
/* .modal{ */
/* background-color: rgba(0,0,0,0); */
/* } */

.modal * {
	font-size: 24px;
	
}
.modal-header{
box-shadow: 0px 0px 4px black;
background:linear-gradient(teal,darkslategray);
border-color:black;
color:white;

}


.modal-footer{
box-shadow: 0px 0px 2px black;
}

.form-control {
	color: #1757A5;
}

#formDate {
	color: #B32F2F;
	
}

.errorMsgs{
 width:100%;
 text-align:center;
 background-color:#B52B2B;
 color:white;
 box-shadow: 0px 0px 1px grey;
}

.errorMsgs *{
 font-size: 16px;
}
</style>



</head>

<body>
	<%@ include file="/back-end/backEndInclude/header.jsp"%>

	<span class="mainTitle">班表管理-全院排班</span>
	<a href="select_page.jsp">返回班表管理首頁</a>

	<hr class="mainTitlehr">


	<div id='calendar'></div>

	<jsp:useBean id="divSvc" scope="page" class="com.div.model.DivService" />
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">新增門診時段</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form METHOD="post" ACTION="opt.do" id="form1">
						<div class="form-group">
							日期
							<p id="formDate">${optVO.optDate}</p>
						</div>

						<div class="form-group">
							科別 <select class="form-control form-control-sm" id="divno">
								<option value="">未選擇
									<c:forEach var="divVO" items="${divSvc.all}">
										<option value="${divVO.divno}">${divVO.divname}
									</c:forEach>
							</select>

						</div>
						<div class="form-group">
							醫生 <select id="doctor" class="form-control form-control-sm"
								id="docno" name="docno">

							</select>
						</div>
						<div class="form-group">
							時段<br>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="optSession"
									id="inlineRadio1" value="10:00~12:00" ${(optVO.optSession=='10:00~12:00')?'checked':''}> <label
									class="form-check-label" for="inlineRadio1">早上</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="optSession"
									id="inlineRadio2" value="14:00~17:00" ${(optVO.optSession=='14:00~17:00')?'checked':''}> <label
									class="form-check-label" for="inlineRadio2">下午</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="optSession"
									id="inlineRadio3" value="18:00~20:00" ${(optVO.optSession=='18:00~20:00')?'checked':''}> <label
									class="form-check-label" for="inlineRadio3">晚上</label>
							</div>
						</div>
						<div class="form-group">
							最大人數 <input type="text" name="maximum"
								class="form-control form-control-sm" value="10">
						</div>
						<input type="hidden" name="action" value="insert"> <input
							type="hidden" name="optDate" value="" id="optDate">
					</form>
				</div>
				<div class="errorMsgs" id="errorMsgs">
				<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<p>請修正以下錯誤:</p>
					<script>
					$(function() {
						$('#exampleModal').modal('show');
					});
					</script>
						<c:forEach var="message" items="${errorMsgs}">
							<p>${message}</p>
						</c:forEach>
				</c:if></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary"
						onclick="document.getElementById('form1').submit()">新增</button>
				</div>
			</div>
		</div>
	</div>

	<jsp:useBean id="docVO" scope="page" class="com.doc.model.DocService"></jsp:useBean>

	<%@ include file="/back-end/backEndInclude/footer.jsp"%>
</body>
<script>
	$(function(){
		
// 		var divnoStr = divnoTemp.value;
		$("#divno").change(function(){
			$("#doctor").html('');
			var divnoTemp =  document.getElementById('divno').value;
			$.ajax({
		         url: "opt.do",   //後端的URL
		         type: "POST",   //用POST的方式
		         dataType: "json",   //response的資料格式
		         cache: false,   //是否暫存
		         data: {action : 'getDoclist',divno : divnoTemp}, //傳送給後端的資料
		         success: function(res) { //成功後回傳的資料
		        	 for(var i = 0; i < res.length; i++) {
		        		 var obj = res[i];
		        		 for (var key in obj) {
		        			 console.log(key)
		        			 console.log(obj[key])
		        			 console.log("===========")
		        			 $("#doctor").append("<option value='"+key+"'>"+obj[key]+"</option>");
		        		 }
		        	 }
		            
		         }
		     });
		})
		
	})
	$('#exampleModal').on('hidden.bs.modal', function (e) {
		$('#errorMsgs').html('');
	})
</script>

</html>