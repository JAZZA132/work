<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>

<%
	EmpVO empVO = (EmpVO) request.getAttribute("empVO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>
<html>
<head>

<%@ include file="/back-end/backEndInclude/head.jsp"%>

<style>

table {
	width:100%;
	margin-top: 5px;
	margin-bottom: 5px;
	border: 7px solid;
	border-color:rgb(100,100,100,1);
	
}
.leftmain{

float:left;
	
}
.rightmain{
margin-top: 5px;
float:left;

	border-color:rgb(100,100,100,0.2);

}

th {


	text-align:left;
	width:120px;
}

th, td {

	padding: 5px;
/* 	border: 1px solid black; */
	height:40px;
}

.mainTitle {
	letter-spacing: 8px;
	color: #42454C;
	font-weight: bold;
	font-size: 28px;
	padding-left: 20px;
}

.mainTitlehr {
/* 	border: 2px solid lightcoral; */
}
.errorMsgs{
 width:100%;
 text-align:center;
 background-color:rgba(240,50,30,0.9);
 color:white;
 box-shadow: 0px 0px 1px black;
}

.errorMsgs *{
 font-size: 14px;
}

.spinner-border{
display:none;
}

.star{
color:red;
}

.preview{
border-radius:20px;
max-height: 500px;
max-width: 660px;
}
</style>

</head>
<body>

<%@ include file="/back-end/backEndInclude/header.jsp"%>

	<span class="mainTitle">���u��ƭק�</span>

	<a href="listAllEmp.jsp">��^���u���</a>

	<hr class="mainTitlehr">


	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<div class="leftmain col-6">
	<FORM METHOD="post" ACTION="emp.do" name="form1" enctype="multipart/form-data">
		<table class="table table-striped">

			<tr>
				<th>���u�s��<font color=red></font></th>
				<td><%=empVO.getEmpID()%></td>
			</tr>
			<tr>
				<th>���u�m�W</th>
				<td><input type="TEXT" class="form-control" name="empName" size="10" maxlength="20"
					value="<%=empVO.getEmpName()%>" /></td>
			</tr>

			<tr>
				<th>�ʧO</th>
				<td>	
				<input type="radio" id="male" name="empGender" value="�k" ${(empVO.empGender=='�k')?'checked':'' }> 
				<label for="male">�k</label> 
				<input type="radio" id="female" name="empGender" value="�k"  ${(empVO.empGender=='�k')?'checked':'' }> 
				<label for="female">�k</label>
				</td>
			</tr>
			
			<tr>
				<th>Email</th>
				<td><input type="email" class="form-control" name="empAcc" size="20" maxlength="30"
					value="<%=empVO.getEmpAcc()%>" /></td>
			</tr>

			<tr>
				<th>�K�X:</th>
				<td><input type="password" class="form-control" name="empPwd" size="20"
					value="<%=empVO.getEmpPwd()%>" /></td>
			</tr>

			<tr>
				<th>�ͤ�</th>
				<td><input name="empBirth" class="form-control" id="f_date1" type="text"
					value="<%=empVO.getEmpBirth()%>" /></td>
			</tr>

<!-- 			<tr> -->
<!-- 				<th>¾��</th> -->
<!-- 				<td><input type="TEXT" class="form-control" name="empJob" size="10" maxlength="6" -->
<%-- 					value="<%=empVO.getEmpJob()%>" /></td> --%>
<!-- 			</tr> -->
			<tr>
					<th>¾��</th>
					<td>
						<!-- 					<input type="TEXT" class="form-control" name="empJob" size="20" maxlength="6" -->
						<%-- 					value="<%=(empVO == null) ? "" : empVO.getEmpJob()%>" /> --%>
						<select class="form-control" name="empJob" id="empJob">
							<option value="�����">�����</option>
							<option value="�~��" ${(empVO.empJob=='�~��')? 'selected':''}>�~��</option>
							<option value="�E�ҧU�z" ${(empVO.empJob=='�E�ҧU�z')? 'selected':''}>�E�ҧU�z</option>
							<option value="�ӫ��޲z��" ${(empVO.empJob=='�ӫ��޲z��')? 'selected':''}>�ӫ��޲z��</option>
							<option value="���]�޲z��" ${(empVO.empJob=='���]�޲z��')? 'selected':''}>���]�޲z��</option>
							<option value="���]�U�z" ${(empVO.empJob=='���]�U�z')? 'selected':''}>���]�U�z</option>
							<option value="��i�޲z��" ${(empVO.empJob=='��i�޲z��')? 'selected':''}>��i�޲z��</option>
							<option value="��i���@��" ${(empVO.empJob=='��i���@��')? 'selected':''}>��i���@��</option>
							<option value="��F�H��" ${(empVO.empJob=='��F�H��')? 'selected':''}>��F�H��</option>
							<option value="�ȪA�H��" ${(empVO.empJob=='�ȪA�H��')? 'selected':''}>�ȪA�H��</option>
							<option value="�t�κ޲z��" ${(empVO.empJob=='�t�κ޲z��')? 'selected':''}>�t�κ޲z��</option>
					</select>


					</td>
				</tr>

			<tr>
				<th>�q��</th>
				<td><input type="TEXT" class="form-control" name="empPhone" size="11" maxlength="11"
					value="<%=empVO.getEmpPhone()%>" /></td>
			</tr>
			<tr>
				<th>�a�}</th>
				<td><input type="TEXT" class="form-control" name="empAddress" size="40"
					value="<%=empVO.getEmpAddress()%>" /></td>
			</tr>

			

			<tr>
				<th>��¾��</th>
				<td><input name="hiredate" class="form-control" id="f_date2" type="text"
					value="<%=empVO.getHiredate()%>" /></td>
			</tr>

			<tr>
				<th>��¾��</th>
				<td><input name="quitdate" class="form-control" id="f_date3" type="text" autocomplete="off"
					value="<%=(empVO.getQuitdate()==null)?"" : empVO.getQuitdate()%>" /></td>
			</tr>



			<tr>
				<th>���u���A</th>
				<td><select name="empStatus" class="form-control">
�@						<option value="1" ${(empVO.empStatus=='1')? 'selected':''}>�b¾��</option>
�@						<option value="2" ${(empVO.empStatus=='2')? 'selected':''}>�𰲤�</option>
�@						<option value="3" ${(empVO.empStatus=='3')? 'selected':''}>�w��¾</option>

					</select>
					</td>
			</tr>

			<tr>
				<th>���u�Ӥ�</th>
				<td><input type="file" name="empPic" class="upl">
				</td>
			</tr>
			<tr>
					<th>�v���]�w</th>
					<td>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="optManage" id="optManage"
								value="O" ${(authO.bgFuncNo=='O')? 'checked':''}> <label class="form-check-label"
								for="optManage">���E�޲z</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="shopManage" id="shopManage"
								value="S" ${(authS.bgFuncNo=='S')? 'checked':''}> <label class="form-check-label"
								for="shopManage">�ӫ��޲z</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="hotelManage" id="hotelManage"
								value="H" ${(authH.bgFuncNo=='H')? 'checked':''}> <label class="form-check-label"
								for="hotelManage">���]�޲z</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="adopterManage"
								id="adopterManage" value="A" ${(authA.bgFuncNo=='A')? 'checked':''}> <label
								class="form-check-label" for="adopterManage">��i�޲z</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" id="memManage" name="memManage"
								value="M" ${(authM.bgFuncNo=='M')? 'checked':''}> <label class="form-check-label"
								for="memManage">�|���޲z</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="accuManage" id="accuManage"
								value="T" ${(authT.bgFuncNo=='T')? 'checked':''}> <label class="form-check-label"
								for="accuManage">�ȶD�޲z</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="empManage" id="empManage"
								value="E" ${(authE.bgFuncNo=='E')? 'checked':''}> <label class="form-check-label"
								for="empManage">���u�޲z</label>
						</div>
					</td>
				</tr>

		</table>
		<input type="hidden" name="action" value="update"> 
		<input type="hidden" name="empID" value="<%=empVO.getEmpID()%>"> 
		<button type="submit" class="btn btn-primary">�e�X�ק�</button>
	</FORM>
	
	</div>
	
	<div class="rightmain col-6">
	<div style="width:100%;text-align:center;">
						<img class="preview" style="max-height: 500px;max-width: 660px;" src="<%= request.getContextPath()%>/back-end/emp/img.do?empID=${empVO.empID}">
						</div>
					</div>
	
	
	<%@ include file="/back-end/backEndInclude/footer.jsp"%>
</body>



<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

<%
	java.sql.Date empBirth = null;
	try {
		empBirth = empVO.getEmpBirth(); //�D�ŭȦs��hiredate
	} catch (Exception e) {
		empBirth = new java.sql.Date(System.currentTimeMillis()); //�ŭȵ����Ѥ��
	}
%>

<%
	java.sql.Date hiredate = null;
	try {
		hiredate = empVO.getHiredate(); //�D�ŭȦs��hiredate
	} catch (Exception e) {
		hiredate = new java.sql.Date(System.currentTimeMillis()); //�ŭȵ����Ѥ��
	}
%>

<%
	java.sql.Date quitdate = null;
	try {
		quitdate = empVO.getQuitdate(); //�D�ŭȦs��Quitdate
	} catch (Exception e) {
		quitdate = null;
	}
%>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/back-end/hospital/datetimepicker/jquery.datetimepicker.css" />
<script
	src="<%=request.getContextPath()%>/back-end/hospital/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/back-end/hospital/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>

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
                $('.size').text("�ɮפj�p�G" + KB + " KB");
            }
 
            reader.readAsDataURL(input.files[0]);
        }
    }
 
    $("body").on("change", ".upl", function (){
        preview(this);
    })
    
})


$.datetimepicker.setLocale('zh');
$('#f_date1').datetimepicker({
   theme: '',              //theme: 'dark',
   timepicker:false,       //timepicker:true,
   step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
   format:'Y-m-d',         //format:'Y-m-d H:i:s',
   value: '<%=empBirth%>', // value:   new Date(),
   //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
   //startDate:	            '1980/01/01',  // �_�l��
   //minDate:               '-1970-01-01', // �h������(���t)���e
   //maxDate:               '+1970-01-01'  // �h������(���t)����
});

$.datetimepicker.setLocale('zh');
$('#f_date2').datetimepicker({
   theme: '',              //theme: 'dark',
   timepicker:false,       //timepicker:true,
   step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
   format:'Y-m-d',         //format:'Y-m-d H:i:s',
   value: '<%=hiredate%>', // value:   new Date(),
		//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
		//startDate:	            '2017/07/10',  // �_�l��
		//minDate:               '-1970-01-01', // �h������(���t)���e
		//maxDate:               '+1970-01-01'  // �h������(���t)����
	});
	
$.datetimepicker.setLocale('zh');
$('#f_date3').datetimepicker({
   theme: '',              //theme: 'dark',
   timepicker:false,       //timepicker:true,
   step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
   format:'Y-m-d'         //format:'Y-m-d H:i:s',
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
	//startDate:	            '2017/07/10',  // �_�l��
	//minDate:               '-1970-01-01', // �h������(���t)���e
	//maxDate:               '+1970-01-01'  // �h������(���t)����
	});

	// ----------------------------------------------------------�H�U�ΨӱƩw�L�k��ܪ����-----------------------------------------------------------

	//      1.�H�U���Y�@�Ѥ��e������L�k���
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

	//      2.�H�U���Y�@�Ѥ��᪺����L�k���
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

	//      3.�H�U����Ӥ�����~������L�k��� (�]�i���ݭn������L���)
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