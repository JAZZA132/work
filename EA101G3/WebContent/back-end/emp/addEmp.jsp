<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="com.auth.model.*"%>
<%
	EmpVO empVO = (EmpVO) request.getAttribute("empVO");
	AuthVO authO = (AuthVO) request.getAttribute("authO");
	AuthVO authH = (AuthVO) request.getAttribute("authH");
	AuthVO authA = (AuthVO) request.getAttribute("authA");
	AuthVO authS = (AuthVO) request.getAttribute("authS");
	AuthVO authT = (AuthVO) request.getAttribute("authT");
	AuthVO authM = (AuthVO) request.getAttribute("authM");
	AuthVO authE = (AuthVO) request.getAttribute("authE");
%>


<html>
<head>
<%@ include file="/back-end/backEndInclude/head.jsp"%>


<%
	// 	String empGender = null;
	// 	try {
	// 		empGender = empVO.getEmpGender(); 
	// 	} catch (Exception e) {
	// 		empGender = "男"; //空值給男

	// 	}
%>

<style>
table {
	width: 100%;
	margin-top: 5px;
	margin-bottom: 5px;
	border: 7px solid;
	border-color: rgb(100, 100, 100, 1);
}

.leftmain {
	float: left;
}

.rightmain {
	margin-top: 5px;
	float: left;
	border-color: rgb(100, 100, 100, 0.2);
}

th {
	text-align: left;
	width: 120px;
}

th, td {
	padding: 5px;
	/* 	border: 1px solid black; */
	height: 40px;
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

.errorMsgs {
	text-align: center;
	width: 100%;
	background-color: rgba(240, 50, 30, 0.9);
	color: white;
	box-shadow: 0px 0px 1px black;
}

.errorMsgs * {
	font-size: 16px;
}

.spinner-border {
	display: none;
}

.star {
	color: red;
}

.preview {
	border-radius: 20px;
}
.modal-content{
top:100px;
}
.modal-body{
	width:100%;
	letter-spacing: 5px;
	text-align:center;
	font-size:20px;
	color:teal;
}

/* footer { */
/* 	float: left; */
/* 	height: 100px; */
/* 	width: 100%; */
/* 	background: linear-gradient(yellow,red); */
/* 	color: grey; */
/* 	text-align: center; */
/* 	padding-top: 40px; */
/* 	position: absolute; */
/* 	bottom: 0; */
/* } */
</style>

</head>


<body>

	<%@ include file="/back-end/backEndInclude/header.jsp"%>

	<span class="mainTitle">員工資料新增</span>

	<a href="listAllEmp.jsp">返回員工資料</a>

	<hr class="mainTitlehr">

	<%-- 錯誤表列 --%>

	<c:if test="${not empty errorMsgs}">
		<div class="errorMsgs">
			<p>請修正以下錯誤:</p>

			<c:forEach var="message" items="${errorMsgs}">
				<p>${message}</p>
			</c:forEach>


		</div>
	</c:if>
	<div class="leftmain col-6">
		<FORM METHOD="post" ACTION="emp.do" name="form1" id="form1"
			enctype="multipart/form-data">
			<table class="table table-striped">


				<!-- 密碼不該讓管理者輸入 -->
				<!-- 			<tr> -->
				<!-- 				<th>密碼</th> -->
				<!-- 				<td><input type="password" name="empPwd" size="20" -->
				<%-- 					value="<%=(empVO == null) ? "" : empVO.getEmpPwd()%>" /></td> --%>
				<!-- 			</tr> -->


				<tr>
					<th><span class="star">*</span>員工姓名</th>
					<td><input type="TEXT" class="form-control" name="empName" id="empName"
						size="10" maxlength="20"
						value="<%=(empVO == null) ? "" : empVO.getEmpName()%>" /></td>
				</tr>

				<tr>
					<th><span class="star">*</span>性別</th>
					<td>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" id="male"
								name="empGender" value="男"
								${(empVO.empGender=='男')?'checked':'' }> <label
								for="male">男</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" id="female"
								name="empGender" value="女"
								${(empVO.empGender=='女')?'checked':'' }> <label
								for="female">女</label><br>
						</div> <!-- 欲使用下面寫法要先判斷empVO == null --> <%-- 				<input type="radio" id="male" name="empGender" value="男" <%=(empVO.getEmpGender()=="男")?"checked":""%> />  --%>
						<!-- 				<label for="male">男生</label>  --> <%-- 	<input type="radio" id="male" name="empGender" value="女" <%=(empVO.getEmpGender()=="女")?"checked":""%> />  --%>
						<!-- 				<label for="female">女</label><br> -->
					</td>
				</tr>

				<tr>
					<th><span class="star">*</span>帳號(Email)</th>
					<td><input type="email" class="form-control" name="empAcc" id="empAcc"
						size="20" maxlength="30"
						value="<%=(empVO == null) ? "" : empVO.getEmpAcc()%>" /></td>
				</tr>
				<tr>
					<th><span class="star">*</span>生日</th>
					<td><input name="empBirth" id="f_date1" class="form-control" 
						type="text" autocomplete="off"
						value="<%=(empVO == null) ? "" : ((empVO.getEmpBirth() == null) ? "" : empVO.getEmpBirth())%>" /></td>
				</tr>

				<tr>
					<th><span class="star">*</span>職位</th>
					<td>
						<!-- 					<input type="TEXT" class="form-control" name="empJob" size="20" maxlength="6" -->
						<%-- 					value="<%=(empVO == null) ? "" : empVO.getEmpJob()%>" /> --%>
						<select class="form-control" name="empJob" id="empJob">
							<option value="未選擇">未選擇</option>
							<option value="獸醫" ${(empVO.empJob=='獸醫')? 'selected':''}>獸醫</option>
							<option value="診所助理" ${(empVO.empJob=='診所助理')? 'selected':''}>診所助理</option>
							<option value="商城管理員" ${(empVO.empJob=='商城管理員')? 'selected':''}>商城管理員</option>
							<option value="旅館管理員" ${(empVO.empJob=='旅館管理員')? 'selected':''}>旅館管理員</option>
							<option value="旅館助理" ${(empVO.empJob=='旅館助理')? 'selected':''}>旅館助理</option>
							<option value="領養管理員" ${(empVO.empJob=='領養管理員')? 'selected':''}>領養管理員</option>
							<option value="領養照護員" ${(empVO.empJob=='領養照護員')? 'selected':''}>領養照護員</option>
							<option value="行政人員" ${(empVO.empJob=='行政人員')? 'selected':''}>行政人員</option>
							<option value="客服人員" ${(empVO.empJob=='客服人員')? 'selected':''}>客服人員</option>
							<option value="系統管理員" ${(empVO.empJob=='系統管理員')? 'selected':''}>系統管理員</option>
					</select>


					</td>
				</tr>

				<tr>
					<th><span class="star">*</span>電話</th>
					<td><input type="TEXT" class="form-control" name="empPhone" id="empPhone"
						size="20" maxlength="11"
						value="<%=(empVO == null) ? "" : empVO.getEmpPhone()%>" /></td>
				</tr>
				<tr>
					<th><span class="star">*</span>地址</th>
					<td><input type="TEXT" class="form-control" name="empAddress" id="empAddress"
						size="40"
						value="<%=(empVO == null) ? "" : empVO.getEmpAddress()%>" /></td>
				</tr>



				<tr>
					<th><span class="star">*</span>到職日</th>
					<td><input name="hiredate" class="form-control" id="f_date2" 
						type="text"></td>
				</tr>



				<tr>
					<th>員工狀態</th>
					<td>
						<!-- 				<input type="text" name="empStatus" size="4" --> <%-- 					value="<%=(empVO == null) ? "1" : empVO.getEmpStatus()%>" /> --%>
						<select name="empStatus" class="form-control" id="empStatus">
							<option value="1" ${(empVO.empStatus=='1')? 'selected':''}>在職中</option>
							<option value="2" ${(empVO.empStatus=='2')? 'selected':''}>休假中</option>
							<option value="3" ${(empVO.empStatus=='3')? 'selected':''}>已離職</option>

					</select>

					</td>
				</tr>

				<tr>
					<th>員工照片</th>
					<td><input type="file" name="empPic" class="upl"></td>
				</tr>
				<tr>
					<th>權限設定</th>
					<td>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="optManage" id="optManage"
								value="O" ${(authO.bgFuncNo=='O')? 'checked':''}> <label class="form-check-label"
								for="optManage">門診管理</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="shopManage" id="shopManage"
								value="S" ${(authS.bgFuncNo=='S')? 'checked':''}> <label class="form-check-label"
								for="shopManage">商城管理</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="hotelManage" id="hotelManage"
								value="H" ${(authH.bgFuncNo=='H')? 'checked':''}> <label class="form-check-label"
								for="hotelManage">旅館管理</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="adopterManage"
								id="adopterManage" value="A" ${(authA.bgFuncNo=='A')? 'checked':''}> <label
								class="form-check-label" for="adopterManage">領養管理</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" id="memManage" name="memManage"
								value="M" ${(authM.bgFuncNo=='M')? 'checked':''}> <label class="form-check-label"
								for="memManage">會員管理</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="accuManage" id="accuManage"
								value="T" ${(authT.bgFuncNo=='T')? 'checked':''}> <label class="form-check-label"
								for="accuManage">客訴管理</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="empManage" id="empManage"
								value="E" ${(authE.bgFuncNo=='E')? 'checked':''}> <label class="form-check-label"
								for="empManage">員工管理</label>
						</div>
					</td>
				</tr>



			</table>
			<br> <input type="hidden" name="action" value="insert">
			<div style="width: 100%;">
			<button style="font-size: 20px;" type="button" id="magicBtn" class="btn btn-danger">神奇小按鈕</button>
			<button type="submit" style="float: right;font-size: 20px;" class="btn btn-primary">送出新增</button>
			
			</div>
			
			
<!-- 			<button type="button" class="btn btn-primary" data-toggle="modal" -->
<!-- 				data-target="#exampleModal">Launch demo modal</button> -->
		</FORM>
	</div>
	<div class="rightmain col-6">
		<div style="width: 100%; text-align: center;">
			<img class="preview" style="max-height: 500px; max-width: 660px;"
				src="<%=request.getContextPath()%>/back-end/emp/Nodata/none.jpg">
		</div>
	</div>
	<span id="lblMsg">



	</span>


	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				
				<div class="modal-body">
				<span class="sendMsg" >系統通知</span> 
					<img
						src="https://miro.medium.com/max/882/1*9EBHIOzhE1XfMYoKz1JcsQ.gif">
						<span class="sendMsg" >正在寄送員工密碼信，請稍後...</span> 

					
				</div>

				
			</div>

		</div>
	</div>
	<%@ include file="/back-end/backEndInclude/footer.jsp"%>
</body>


<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<%
	java.sql.Date empBirth = null;
	try {
		empBirth = empVO.getEmpBirth(); //非空值存到hiredate
	} catch (Exception e) {
		empBirth = null; //空值給null

	}
%>

<%
	java.sql.Date hiredate = null;
	try {
		hiredate = empVO.getHiredate(); //非空值存到hiredate
	} catch (Exception e) {
		hiredate = new java.sql.Date(System.currentTimeMillis()); //空值給今天日期
	}
%>


<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/back-end/hospital/datetimepicker/jquery.datetimepicker.css" />
<script
	src="<%=request.getContextPath()%>/back-end/hospital/datetimpicker/jquery.js"></script>
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
                $('.size').text("檔案大小：" + KB + " KB");
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
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',          //format:'Y-m-d H:i:s',
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           startDate:	            '1980/01/01',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        $.datetimepicker.setLocale('zh');
        $('#f_date2').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=hiredate%>'
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

	$(function() {
		$(":submit").click(function() {
			$('#exampleModal').modal('show');

			$("#form1").submit();

		});
		$('#magicBtn').click(function() {
			$('#empName').val('喬巴');
			$('#male').prop('checked', true);
			$('#empAcc').val('xuanjia961121@gmail.com');
			$('#f_date1').val('1990-12-13');
			$('#empPhone').val('0912456789');
			$('#empAddress').val('中壢區中央路216巷8號');
			
			
		})
	});

	// 	        $("#send").click(function(){
	// 	        	$("#send").attr("disabled", true);
	// 	            $("#form1").submit();
	// 	        });
	
	$('#exampleModal').modal({backdrop:'static',show:false});
</script>
</html>