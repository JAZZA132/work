<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mr.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    MrService mrSvc = new MrService();
    List<MrVO> list = mrSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<jsp:useBean id="docSvc" scope="page" class="com.doc.model.DocService" />


<!DOCTYPE html>
<html>
<%@ include file="/back-end/backEndInclude/head.jsp"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<style>
table {
	width: 100%;
	background-color: white;
	
}

table, th, td {
	
}

th {
	background-color: lightcoral;
}


.form-control{
display:inline;
width:200px;
}



#addbtn {
	float: right;
	font-size: 26px;
	padding: 5px 20px;
	margin-bottom: 20px;
}




</style>

</head>
<body>


	<%@ include file="/back-end/backEndInclude/header.jsp"%>
	
	<!-- ****************************以下為實際功能頁變更區域**************************** -->
<span class="mainTitle">診療紀錄管理</span>

	<hr class="mainTitlehr">
		 


<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/mr/mr.do" name="form1">
       
   <b>選擇日期:</b><input class= "form-control" type="text" name="mrno" id="f_date1" type="text" autocomplete="off">
             
               
       <b>選擇醫師:</b>
       <select class= "form-control" size="1" name="docno" >
          <option value="">
         <c:forEach var="docVO" items="${docSvc.all}" > 
          <option value="${docVO.docno}">${docVO.docname}
         </c:forEach>   
       </select>        
        <input type="submit" value="送出">
        <input type="hidden" name="action" value="listMr_ByCompositeQuery">
     </FORM>
	<table class="table table-striped">
	<tr>
		<th>就診紀錄編號</th>
		<th>約診編號</th>
		<th>醫生姓名</th>
		<th>會員寵物編號</th>
		<th>診斷症狀</th>
		<th>診斷處方</th>
		<th>預約費用</th>
		<th>藥品費用</th>
		<th>手術費用</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="mrVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${mrVO.mrno}</td>
			<td>${mrVO.apptno}</td>
			<td>
			
			<c:forEach var="docVO" items="${docSvc.all}">
            <c:if test="${mrVO.docno==docVO.docno}">
	                   ${docVO.docname}</font>
            </c:if>
            </c:forEach>
			</td>
			<td>${mrVO.petno}</td>
			<td>${mrVO.symptom}</td>
			<td>${mrVO.prescription}</td>
			<td>${mrVO.apptfee}</td> 
			<td>${mrVO.medfee}</td>  
			<td>${mrVO.operfee}</td>   
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/mr/mr.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="mrno"  value="${mrVO.mrno}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/mr/mr.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="mrno"  value="${mrVO.mrno}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

	<!-- ****************************以上為實際功能頁變更區域*************************** -->
</div>




<footer class="Footer">Copyright © 萌寵家族 Cute Family
</footer>


</div>

</div>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front-end/hospital/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/front-end/hospital/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/front-end/hospital/datetimepicker/jquery.datetimepicker.full.js"></script>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
 	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Ymd',         //format:'Y-m-d H:i:s',
		   value: 'new Date()', 
		   validateOnBlur: false  // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>
</html>