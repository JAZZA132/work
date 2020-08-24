<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.opt.model.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.GsonBuilder"%>
<%@ page import="com.google.gson.JsonArray"%>
<%@ page import="com.google.gson.JsonElement"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="com.google.gson.reflect.TypeToken"%>


<%
	OptService optSvc = new OptService();
	List<OptVO> list = optSvc.getCalInfo();
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	String jsonStr = gson.toJson(list);

// 	System.out.println("Object to JSON: " + jsonStr);

	pageContext.setAttribute("list", jsonStr);
%>



<html>
<head>
<%@ include file="/back-end/backEndInclude/head.jsp"%>

<link
	href='<%=request.getContextPath()%>/back-end/hospital/fullcalendar/main.css'
	rel='stylesheet' />
<script
	src='<%=request.getContextPath()%>/back-end/hospital/fullcalendar/main.js'></script>
<script
	src='<%=request.getContextPath()%>/back-end/hospital/fullcalendar/locales-all.js'></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>

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
      selectable: false,
      selectMirror: true,
      select: function(arg) {
        var title = prompt('Event Title:');
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
      },
//       eventClick: function(arg) {
//         if (confirm('Are you sure you want to delete this event?')) {
//           arg.event.remove()
//         }
//       },
     editable: false,
      dayMaxEvents: true, // allow "more" link when too many events
      events: ${list}
//       events: [{'title':123,'start':'2020-07-02','color':'green'}]


    });
    calendar.render();
  });

	
  
  
  function selectAll(){
	  window.location.href='selectAll.jsp';
  
  }
  
  function selectDiv(){
	  swal("此功能尚未開放", "(還沒做完)", "info");
	  
  }
  
  function selectDoctor(){
	  swal("此功能尚未開放", "(還沒做完)", "info");
	  
  }
  </script>

<style>
#calendar {
	max-width: 1000px;
	margin: 0 auto;
}

.card {
	height: 200px;
}

.card-body {
	
}

#card1 {
	background-color: #EADAE2;
}

#card2 {
	background-color: #B7DEC9;
}

#card3 {
	background-color: #7FAADF;
}
</style>



</head>

<body>
	<%@ include file="/back-end/backEndInclude/header.jsp"%>

	<span class="mainTitle">班表管理</span>

	<hr class="mainTitlehr">

	<div class="row">
		<div class="col-sm-4">
			<div class="card" id="card1">
				<div class="card-body">
					<h5 class="card-title">全院排班</h5>
					<p class="card-text">效率較差的排班方式，但可以總覽全院醫師的班別</p>
					<a href="#" class="btn btn-primary" onclick="selectAll()">開始排班</a>
				</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="card" id="card2">
				<div class="card-body">
					<h5 class="card-title">依科別排班</h5>
					<p class="card-text">
						一般效率的排班方式<br>邊排班可觀察其他同科別醫生的時段
					</p>
					<a href="#" class="btn btn-primary" onclick="selectDiv()">開始排班</a>
				</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="card" id="card3">
				<div class="card-body">
					<h5 class="card-title">依醫生排班</h5>
					<p class="card-text">最具效率的排班方式，只需點按時段即可新增</p>
					<a href="#" class="btn btn-primary" onclick="selectDoctor()">開始排班</a>
				</div>
			</div>
		</div>
	</div>




	<br>


	<!-- 	<FORM METHOD="post" ACTION="opt.do"> -->
	<!-- 		<b>選擇醫生:</b> <select size="1" name="sessionNo"> -->
	<%-- 			<c:forEach var="optVO" items="${optSvc.all}"> --%>
	<%-- 				<option value="${optVO.sessionNo}">${optVO.sessionNo} --%>
	<%-- 			</c:forEach> --%>
	<!-- 		</select> <input type="hidden" name="action" value="getOne_For_Display"> -->
	<!-- 		<input type="submit" value="送出"> -->
	<!-- 	</FORM> -->



	<div id='calendar'></div>

	<div>
		<a style="font-size: 24px" class="btn btn-primary"
			href="addOptSession.jsp" role="button">開始排班</a>
	</div>

	<%@ include file="/back-end/backEndInclude/footer.jsp"%>

</body>



</html>