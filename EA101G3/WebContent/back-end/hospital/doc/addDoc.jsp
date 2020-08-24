<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.doc.model.*"%>

<%
  DocVO docVO = (DocVO) request.getAttribute("docVO");
%>
<%= docVO==null %> ${docVO.divno}  //跟第100行有關
<!DOCTYPE html>
<html>
<head>
<%@ include file="/back-end/backEndInclude/head.jsp"%>

<style type="text/css">


#addbtn {
	float: right;
	font-size: 50px;
	padding: 5px 20px;
	margin-bottom: 20px;
}

img
{
  max-width:200px; height:auto;
  vertical-align: middle;
}

</style>



</head>

<body>

		<%@ include file="/back-end/backEndInclude/header.jsp" %>

	<!-- ****************************以下為實際功能頁變更區域**************************** -->

<span class="mainTitle">新增醫師<button type="button" class="btn btn-info"  onclick="location.href='<%=request.getContextPath()%>/back-end/hospital/doc/select_page.jsp'">返回</button></span>

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
<!-- 	<tr> -->
<!-- 		<td>科別編號:</td> -->
<!-- 		<td><input type="TEXT" name="divno" size="45"  -->
<%-- 			 value="<%= (docVO==null)? "20" : docVO.getDivno()%>" /></td> --%>
<!-- 	</tr> -->
<jsp:useBean id="divSvc" scope="page" class="com.div.model.DivService" />
	<tr>
		<td>科別:<font color=red><b>*</b></font></td>
		<td><select size="1" name="divno">
			<c:forEach var="divVO" items="${divSvc.all}">
				<option value="${divVO.divno}" ${(docVO.divno==divVO.divno)?'selected':'' } >${divVO.divname}</option>
			</c:forEach>
		</select></td>
	</tr>
	<tr>
		<td>醫生姓名:</td>
		<td><input type="TEXT" id="docname" name="docname" size="60"
			 value="" /></td>
	</tr>
	<tr>
		<td>診間號碼</td>
		<td><input type="TEXT" id="roomno" name="roomno" size="60"
			 value="" /></td>
	</tr>
	<tr>
		<td>年資</td>
		<td><input type="TEXT" id="seniority" name="seniority" size="60"
			 value="" /></td>
	</tr>
	<tr>
		<td>介紹</td>
		<td><textarea name="intro" id="intro" rows="5" cols="65"></textarea></td> 
<!-- 		<td><input type="TEXT" name="intro" size="60" -->
<%-- 			 value="<%= (docVO==null)? "我是一位獸醫，致力於為毛小孩治病。" : docVO.getIntro()%>" /></td> --%>
	</tr>
	<tr>
		<td>醫生照片</td>
		<td>
			<label for ="upload">
			<img alt="" src="<%=request.getContextPath()%>/back-end/doc/ShowDocPic.do?docno=${docVO.docno}" id="display">
			</label>
			<input type="FILE" name="docpic" id = "upload">
		</td>
	</tr>
	<tr>
		<td>醫生在職狀態</td>
		<td><select id="docstatus" name="docstatus" size="1">
				<option value="" disabled selected></option>
				<option value="1">1-(在職中)</option>
				<option value="2">2-(休假中)</option>
　				<option value="3">3-(已離職)</option>
			</select>
			 </td>
<!-- 			 <td><input type="TEXT" name="docstatus" size="60" -->
<%-- 			 value="<%= (docVO==null)? "1" : docVO.getDocstatus()%>" /></td> --%>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="insert">
<button type="submit" class="btn btn-primary">送出新增</button></FORM>
<button href="#" class="btn btn-success" id="addbtn" onClick="autoFill(); return false;" >神奇大按鈕</button>

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
 <script type="text/javascript">
    function autoFill() {
    document.getElementById('docname').value = "貓貓醫師";
    document.getElementById('roomno').value = "2";
    document.getElementById('seniority').value = "50";
    document.getElementById('intro').value = "貓咪的疑難雜症都交給我吧喵喵喵喵喵喵喵喵喵喵喵喵";
    document.getElementById('docstatus').value = "1";
    }
    
  </script>
	<!-- ****************************以上為實際功能頁變更區域*************************** -->
</div>




<%@ include file="/back-end/backEndInclude/footer.jsp"%>



</div>

</div>


</body>
</html>



