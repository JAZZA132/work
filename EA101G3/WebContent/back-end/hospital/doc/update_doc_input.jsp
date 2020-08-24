<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.doc.model.*"%>

<%
  DocVO docVO = (DocVO) request.getAttribute("docVO"); //DocServlet.java (Concroller) 存入req的docVO物件 (包括幫忙取出的docVO, 也包括輸入資料錯誤時的docVO物件)
%>
<%= docVO==null %>--${docVO.divno}-- 
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
img
{
  max-width:200px; height:auto;
  vertical-align: middle;
}

</style>
<%@ include file="/back-end/backEndInclude/head.jsp"%>
</head>

<body>
		<%@ include file="/back-end/backEndInclude/header.jsp" %>

	<!-- ****************************以下為實際功能頁變更區域**************************** -->

<span class="mainTitle">醫師管理</span><button type="button" class="btn btn-info" id="addbtn" onclick="location.href='<%=request.getContextPath()%>/back-end/hospital/doc/select_page.jsp'">返回</button>

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
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/doc/doc.do" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>醫師編號:<font color=red><b>*</b></font></td>
		<td><h6 align="left"><%=docVO.getDocno()%></h6></td>
	</tr>
<!-- 	<tr> -->
<!-- 		<td>科別編號:</td> -->
<%-- 		<td><input type="TEXT" name="divno" size="45" value="<%=docVO.getDivno()%>" /></td> --%>
<!-- 	</tr> -->
<jsp:useBean id="divSvc" scope="page" class="com.div.model.DivService" />
	<tr>
		<td>科別:<font color=red><b>*</b></font></td>
		<td><select size="1" name="divno" style="align:left"">
			<c:forEach var="divVO" items="${divSvc.all}">
				<option value="${divVO.divno}" ${(docVO.divno==divVO.divno)?'selected':'' } >${divVO.divname}</option>
			</c:forEach>
		</select></td>
	</tr>
	<tr>
		<td>醫生姓名:</td>
	<td><input type="TEXT"  name="docname" size="60" value="<%=docVO.getDocname()%>" /></td>
<%-- 	<td><input type="TEXT"  name="docname" size="60" readonly="readonly" style="border-style : hidden;" value="<%=docVO.getDocname()%>" /></td> --%>
	</tr>
	<tr>
		<td>診間號碼</td>
		<td><input type="TEXT" name="roomno" size="60"	value="<%=docVO.getRoomno()%>" /></td>
	</tr>
	<tr>
		<td>年資:</td>
		<td><input type="TEXT" name="seniority" size="60" value="<%=docVO.getSeniority()%>" /></td>
	</tr>
	<tr>
		<td>介紹:</td>
		<td><textarea name="intro" rows="5" cols="65"><%=docVO.getIntro()%></textarea></td>
<%-- 		<td><input type="TEXT" name="intro" size="60" value="<%=docVO.getIntro()%>" /></td> --%>
	</tr>
	<tr>
		<td>醫生照片:</td>
		<td>
			<label for ="upload">
				<img alt="" src="<%=request.getContextPath()%>/back-end/doc/ShowDocPic.do?docno=<%=docVO.getDocno()%>" id="display">
			</label>
			<input type="FILE" name="docpic" id = "upload"">
		</td>
	</tr>
	<tr>
		<td>醫生在職狀態:</td>
		<td>
<!-- 			<select name="docstatus" size="1"> -->
<%-- 			<option value="<%=docVO.getDocstatus()%>"  disabled selected hidden></option> --%>
<!-- 			<option value="1">在職中</option> -->
<!-- 			<option value="2">休假中</option> -->
<!-- 　			<option value="3">已離職</option> -->
			<input type="TEXT" name="docstatus" size="60" value="<%=docVO.getDocstatus()%>" />
		</td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="docno" value="<%=docVO.getDocno()%>">
<button type="submit" class="btn btn-primary">送出修改</button></FORM>
<script>
	function init(){
		var display = document.getElementById("display");
		var upload = document.getElementById("upload");
		
		upload.addEventListener("change", function(e){
			var files = upload.files;
			if (files && files[0]){
				for (i = 0; i< files.length; i++){
					if (files[i].type.indexOf("image") <0){
						alert("上傳格式不符");
						upload.value = null;
					} else {
						var file = files[i];
						var reader = new FileReader();
						
						reader.onload = function(e){
							var result = e.target.result;
							
							display.setAttribute("src", result);
						}
						reader.readAsDataURL(file);
					}
				}
			}
		});
	}
	window.onload = init;

</script>
	<!-- ****************************以上為實際功能頁變更區域*************************** -->
</div>




<footer class="Footer">Copyright © 萌寵家族 Cute Family
</footer>


</div>

</div>


</body>
</html>