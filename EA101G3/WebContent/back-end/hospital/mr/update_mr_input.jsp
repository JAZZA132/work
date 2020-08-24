<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mr.model.*"%>

<%
  MrVO mrVO = (MrVO) request.getAttribute("mrVO"); //DocServlet.java (Concroller) 存入req的docVO物件 (包括幫忙取出的docVO, 也包括輸入資料錯誤時的docVO物件)
%>
<%= mrVO==null %>--${mrVO.apptno}-- 
<!DOCTYPE html>
<html>
<head>
<%@ include file="/back-end/backEndInclude/head.jsp"%>

<style type="text/css">

.select{
/* border-style: solid; */
/*   border-color: red; */
  width:900px;

}
.select td{
/* border-style: solid; */
/*   border-color: red; */
}
.select th{
text-align: right;
/* border-style: solid; */
/*   border-color: red; */
}

/* form{ */
/* display:inline; */
/* margin:0px; */
/* } */

</style>





</head>

<body>
	<%@ include file="/back-end/backEndInclude/header.jsp"%>

	<!-- ****************************以下為實際功能頁變更區域**************************** -->
<span class="mainTitle">診療紀錄修改 <button type="button" class="btn btn-info" id="addbtn" onclick="location.href='<%=request.getContextPath()%>/back-end/hospital/mr/select_page.jsp'">返回</button>	
</span>

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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/mr/mr.do" name="form1" enctype="multipart/form-data">
<table>
<!-- 	<tr> -->
<!-- 		<td>科別編號:</td> -->
<!-- 		<td><input type="TEXT" name="divno" size="45"  -->
<%-- 			 value="<%= (docVO==null)? "20" : docVO.getDivno()%>" /></td> --%>
<!-- 	</tr> -->

	<tr>
		
			<input type="hidden" name="apptno" size="60"
			 value="<%=mrVO.getApptno()%>" />
			 
			 <input type="hidden" name="docno" size="60"
			 value="<%=mrVO.getDocno()%>" />
			 
			 <input type="hidden" name="petno" size="60"
			 value="<%=mrVO.getPetno()%>" />
<!-- 		<input name="apptno" type="text" id="apptno" /> -->
<!-- 		<script type="text/javascript"> -->
<!-- 		window.onload = function(){ -->
<!--     		 var date = new Date(); -->
<!--      	document.getElementById("apptno").value = "GZ" + new Date().toLocaleString().match(/\d+/g).join("") + "0001"; -->
<!--  		}; -->
<!-- </script> -->
	</tr>
<!-- 	<tr> -->
<!-- 		<td>醫生編號</td> -->
<!-- 		<td><input type="TEXT" name="docno" size="60" -->
<%-- 			 value="<%= (mrVO==null)? "1001" : mrVO.getDocno()%>" /></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>會員寵物編號</td> -->
<!-- 		<td><input type="TEXT" name="petno" size="60" -->
<%-- 			 value="<%= (mrVO==null)? "P001" : mrVO.getPetno()%>" /></td> --%>
<!-- 	</tr> -->
	<tr>
		<td>診斷症狀</td>
		<td><textarea name="symptom" id="symptom" rows="5" cols="65"><%=(mrVO.getSymptom()==null)? "請填診斷症狀" : mrVO.getSymptom()%></textarea></td> 
	</tr>
	<tr>
		<td>診斷處方</td>
		<td><textarea name="prescription" id="prescription"  rows="5" cols="65"><%=(mrVO.getPrescription()==null)? "請填診斷處方" : mrVO.getPrescription()%></textarea>
		</td> 
	</tr>
	
	<tr>
		<td>預約費用</td>
		<td><input type="TEXT" name="apptfee" id="apptfee" size="60"
			 value="<%=(mrVO==null)? "" : mrVO.getApptfee()%>" /></td>
	</tr>
	
	<tr>
		<td>藥品費用</td>
		<td><input type="TEXT" name="medfee" id="medfee" size="60"
			 value="<%=(mrVO==null)? "" : mrVO.getMedfee()%>" /></td>
	</tr>
	
	<tr>
		<td>手術費用</td>
		<td><input type="TEXT" name="operfee" id="operfee" size="60"
			 value="<%=(mrVO==null)? "" : mrVO.getOperfee()%>" /></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="mrno" value="<%=mrVO.getMrno()%>">
<button type="submit" class="btn btn-primary">送出修改</button></FORM>
<button href="#" class="btn btn-success" id="addbtn" onClick="autoFill(); return false;" >神奇小按鈕</button>

	
<script type="text/javascript">
    function autoFill() {
    document.getElementById('symptom').value = "急性腸胃炎";
    document.getElementById('prescription').value = "寵物益生菌、處方飼料";
    document.getElementById('apptfee').value = "250";
    document.getElementById('medfee').value = "800";
    document.getElementById('operfee').value = "0";
    }
    
  </script>
	<!-- ****************************以上為實際功能頁變更區域*************************** -->
<%@ include file="/back-end/backEndInclude/footer.jsp"%>

</body>
</html>