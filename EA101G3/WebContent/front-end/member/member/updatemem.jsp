<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mem.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/frontEndInclude/style.css">
<!DOCTYPE html>

<% 
	MemberVO memVO = (MemberVO) request.getAttribute("memVO");
%>



<html>
<head>
<%@ include file="/front-end/frontEndInclude/head.jsp"%>
<%@ include file="/front-end/frontEndInclude/header.jsp"%>

<style>
.navbar-brand {
	font-family: 'Pacifico';
	font-size: 35px; 
	color: lightcoral !important;
}  
.menu-right-btn {
	padding: 13px 46px;
	margin-right: 4%;
	background-color: transparent;
	transition: all 300ms ease-in;
	font-family: 'Noto Sans TC';
	white-space: nowrap;
}

.menu-right-btn:hover {
	color: white;
	background-color: #00E8E8;
}
</style>


</head>

<body background="<%= request.getContextPath()%>/front-end/member/member/images/cat2.jpg" style="background-size:Cover;" >


<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<div class="container" style="background-color:rgba(210,210,210,0.6);">
<div class="row  justify-content-center align-items-center ">
	<div class="col-3"></div>
	<div class="col-8" >
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Puppy/mem.do" name="form1" enctype="multipart/form-data" class=""  >
  <h3>資料修改:</h3>  
  	<div class="form-group row ">
    <label for="inputEmail3" class="col-sm-2 col-form-label" >會員編號:<font color=red><b>*</b></font></label>
    <div class="col-sm-10">
      <input type="TEXT" class="form-control col-sm-7" id="" placeholder="<%=memVO.getMemNo()%>" disabled="true">
    </div>
  	</div>
  	<div class="form-group  row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">會員姓名:</label>
    <div class="col-sm-10">
      <input type="TEXT" class="form-control col-sm-7" id="" placeholder="姓名"  name="memname" value="<%=memVO.getMemName()%>">
    </div>
    </div>
    <div class="form-group  row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">會員帳號:</label>
    <div class="col-sm-10">
      <input type="TEXT" class="form-control col-sm-7" id="" placeholder="帳號"  name="account"	value="<%=memVO.getMemAccount()%>">
    </div>
    </div>
    
    <div class="form-group row  ">
    <label for="inputPassword3" class="col-sm-2 col-form-label">會員密碼:</label>
    <div class="col-sm-10">
      <input type="password" class="form-control col-sm-7" id="" placeholder="密碼"  name="password"	 value="<%=memVO.getMemPassword()%>">
    </div>
    </div>
    
    <div class="form-group row  ">
    <label for="inputPassword3" class="col-sm-2 col-form-label">信用卡號:</label>
    <div class="col-sm-10">
      <input type="TEXT" class="form-control col-sm-7" id="" placeholder="信用卡號"  name="creditCardId"	 value="<%=memVO.getMemCreditCardId()%>"">
    </div>
    </div>
    
    <div class="form-group row ">
    <label for="inputPassword3" class="col-sm-2 col-form-label">手機號碼:</label>
    <div class="col-sm-10">
      <input type="TEXT" class="form-control col-sm-7" id="" placeholder="手機號碼"  name="phone"	 value="<%=memVO.getMemPhone()%>">
    </div>
    </div>
    
    <div class="form-group row  ">
    <label for="inputPassword3" class="col-sm-2 col-form-label">會員信箱:</label>
    <div class="col-sm-10">
      <input type="TEXT" class="form-control col-sm-7" id="" placeholder="會員信箱"  name="email"	 value="<%=memVO.getMemEmail()%>">
    </div>
    </div>
	
	<div class="form-group row  ">
    <label for="inputPassword3" class="col-sm-2 col-form-label">會員地址:</label>
    <div class="col-sm-10">
      <input type="TEXT" class="form-control col-sm-7" id="" placeholder="會員地址"  name="address"	 value="<%=memVO.getMemAddress()%>">
    </div>
    </div>
    
	<div class="form-group  row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">會員照片:</label>
    <div class="col-sm-10">
      <img alt="" src="<%=request.getContextPath()%>/Puppy/pic.do?memNo=${memVO.memNo}" class="preview" height="300px" width="400px">
      <input type="file"    name="mempic"	 class="upl" accept="img/*">
    </div>
    </div>
    
<!--     <div class="form-group row"> -->
<!--     <label for="inputPassword3" class="col-sm-2 col-form-label" >會員狀態:</label> -->
<!--     <div class="col-sm-10"> -->
      <input type="hidden" class="form-control col-sm-7" id="" placeholder="會員狀態"  name="status"	 value="<%=memVO.getMemStatus()%>">
<!--     </div> -->
<!--     </div> -->
<br>
<div class="form-group row ">
<label for="inputPassword3" class="col-sm-2 col-form-label"></label>
<div class="col-sm-10">
<input type="hidden" name="action" value="update">
<input type="hidden" name="memNO" value="<%=memVO.getMemNo()%>">
<input type="submit" value="送出修改" class="btn btn-primary form form-control col-sm-5">
</div>
</div>
</FORM>
	</div>
	<div class="col-1"></div>
</div>
</div>

					
<script type="text/javascript">
		$(function (){

    function format_float(num, pos)
    {
        var size = Math.pow(10, pos);
        return Math.round(num * size) / size;
    }

    function preview(input) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('.preview').attr('src', e.target.result);
                var KB = format_float(e.total / 1024, 2);
                // $('.size').text("檔案大小：" + KB + " KB");
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("body").on("change", ".upl", function (){
        preview(this);
    })
    
})

</script>


</body>
</html>